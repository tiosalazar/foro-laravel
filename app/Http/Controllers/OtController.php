<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ot;
use App\Cliente;
use App\User;
use App\Tiempos_x_Area;
use App\Requerimientos_Ot;
use App\Compras_Ot;
use App\Area;
use App\Role;
use App\Tarea;
use Illuminate\Support\Facades\Auth;
use App\Historico_Ot;
use Illuminate\Support\Facades\DB;
use App\Notifications\OtTiempoExtra;
use App\Notifications\OtTiempoExtraAprobado;
use App\Notifications\OtCreada;
use App\Notifications\OtCambioEstado;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;
use Yajra\Datatables\Datatables;
use Excel;

class OtController extends Controller
{




   /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
   public function index()
   {
      $ots= Ot::orderBy('created_at', 'ASC')->get();

      $ots = Ot::with('cliente','usuario','estado')->get();

      return Datatables::of( $ots)
      ->addColumn('fecha_inicio', function($ots) {
        return  $ots->getFormatFecha($ots->fecha_inicio);
     })
      ->addColumn('fecha_final', function($ots) {
       return $ots->getFormatFecha($ots->fecha_final); 
    })
      ->addColumn('acciones', function($ots) {
       $ver_ot='<a href="visualizar/'.$ots->id.'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit"   aria-label="View">Ver OT</a>';
       $editar_ot=(Auth::user()->can('editar_ots') )?'<a href="editar/'.$ots->id.'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit" aria-label="View">Editar OT</a>':'';
       return $ver_ot.$editar_ot;
    })
      ->make(true);

   }


   /**
   * Show the form for creating a new resource.
   *
   * @return \Illuminate\Http\Response
   */
   public function create()
   {
      //
   }

   /**
   * Store a newly created resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @return \Illuminate\Http\Response
   */
   public function store(Request $request)
   {
      $respuesta=[];
      //Validaciòn de las entradas por el metodo POST
      $data= $request->all();

      $vl=$this->validatorCrearOT($data['datos_encabezado']);
      if ($vl->fails())
      {
         return response([
            'status' => Response::HTTP_BAD_REQUEST,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Error al crear la OT',
            'error' => 'ERR_01',
            'obj' =>$vl->errors()
            ],Response::HTTP_BAD_REQUEST);
      }else
      {
         try
         {
            //Inicio una transacción por si falla algún ingreso no quede registro en ninguna tabla
            DB::beginTransaction();
            $ot=new Ot;
            $ot->fill($data['datos_encabezado']);
            $ot->save();

            $requerimientos=$data['requerimientos'];
            $compras=$data['compras'];

            /*Agregar Tiempos por Area Requerimientos */
            $id_ot=$ot->id;
            $index=0;
            foreach ($requerimientos as $requerimiento) {
               $tiempos_x_area= new Tiempos_x_Area;
               /*Agrego el tiempo por Area */
               $tiempos_x_area->tiempo_estimado_ot=$requerimiento['horas'];
               $tiempos_x_area->ots_id=$id_ot;
               $tiempos_x_area->areas_id=$requerimiento['area'];
               $tiempos_x_area->save();
               /*El siguiente for recorre el listado de requerimientos y los agrega */
               for ($i=0; $i < count($requerimiento['requerimientos']) ; $i++) {
                  $model_descripcion_requerimiento= new Requerimientos_Ot;
                  $arreglo=$requerimiento['requerimientos'][$i];
                  $arreglo_ingresar= array('nombre' => $arreglo['model_nom'],'horas'=> $arreglo['model_horas'],'areas_id'=>$requerimiento['area'],'ots_id'=>$id_ot);
                  $model_descripcion_requerimiento->fill( $arreglo_ingresar);
                  $model_descripcion_requerimiento->save();
               }

            }
            /*El siguiente for recorre el listado de compras y los agrega*/
            foreach ($compras as $compra) {
               $model_compras= new Compras_Ot;
               $model_compras->fill($compra);
               $model_compras->ots_id=$id_ot;
               $model_compras->save();
            }
            DB::commit();
            
            //Notificar al usuario Owner cuando se cree una OT
            $maker=Auth::user();
            $Rol=Role::where('name','owner')->first();
            $owner=User::where('roles_id',$Rol->id)->first();
            $owner->notify(new OtCreada($maker,$ot));

            return response([
               'status' => Response::HTTP_OK,
               'response_time' => microtime(true) - LARAVEL_START,
               'msg' => 'La OT ha sido creada con exito !! ',//Mensaje a mostrar
               'obj' => $ot
               ],Response::HTTP_OK);

         }catch(Exception $e){
            DB::rollback();
            return response([
               'status' => Response::HTTP_BAD_REQUEST,
               'response_time' => microtime(true) - LARAVEL_START,
               'error_creacion' => 'fallo_en_la_creacion',
               'consola' =>$e->getMessage(),
               'request' => $request->all()
               ],Response::HTTP_BAD_REQUEST);
         }
      }

   }

   /**
   * Display the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
   public function show($id)
   {
      $ot=OT::findOrFail($id);
      $ot->fecha_final=$ot->getFormatFechaShow($ot->fecha_final);
      $ot->fecha_inicio= $ot->getFormatFechaShow( $ot->fecha_inicio);
      $ot->valor=$this->formatMoney($ot->valor,false);
      $ot->Tiempos_x_Area;
      $ot->Usuario;
      $ot->Cliente;
      $ot->Estado;
      $ot->Requerimiento_Ot;
      $ot->Compras_Ot;
      $listado_areas=[];
      foreach ($ot->Tiempos_x_Area as  $value) {
         array_push($listado_areas, $value->Area);
      }

      $array_temporal=[];
      $ingreso=[];
      foreach ($ot->Compras_Ot as  $value) {
         $compra =Compras_Ot::findOrFail($value['id']);
         $compra->Tipo_Compra;
         $compra->Divisa;
         $array_temporal= array('areas_id'=>$value['areas_id'],'tipo_compra'=>array('id'=>$compra->Tipo_Compra['id'], 'nombre'=>$compra->Tipo_Compra['nombre']),'descripcion' => $value['descripcion'],
            'provedor'=> $value['provedor'] , 'valor'=>  $this->formatMoney($value['valor'],false), 'divisa'=>array('id'=>$compra->Divisa['id'], 'nombre'=>$compra->Divisa['nombre']));
         array_push($ingreso,$array_temporal);
      }

      $ot->Compras_Ot= $ingreso;

      //return response()->json( $ot);
      return view('admin.ots.visualizar_ot')->with('ot', $ot)->with('listado_areas', $listado_areas);
   }
   /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
   public function edit($id)
   {
      $ot=OT::findOrFail($id);
      $data=[];
      $data['datos_encabezado']=$ot;
      $data['datos_encabezado']['cliente']=$ot->cliente;
      $data['datos_encabezado']['ejecutivo']=$ot->Usuario;
      $data['datos_encabezado']['estado']=$ot->Estado;
      $data['editor_id']=Auth::user()->id;
      $data['compras']=[];
      $data['final_req']=[];
      $data['final_com']=[];
      $array_temporal=[];
      $data['listado_areas']=[];
      $data['requerimientos']['requerimientos']=[];
      // $requerimientos= $ot->Requerimiento_Ot;
      foreach ($ot->Tiempos_x_Area as  $value) {
         $area_actual=$value['areas_id'];
         array_push($data['listado_areas'], $value->Area);
         $data['requerimientos']['area']=$value['areas_id'];
         $data['requerimientos']['textra']=$value['tiempo_extra'];
         $data['requerimientos']['horas']=$value['tiempo_estimado_ot'];
         $array_temporal=[];
         $ingreso=[];
         foreach ($ot->Requerimiento_Ot as  $value) {
            if ($value['areas_id'] ==  $area_actual ) {
               $array_temporal= array('model_nom'=>$value['nombre'] ,'model_horas'=>(int)$value['horas']);
               //$data['requerimientos']['requerimientos']=json_encode($array_temporal);
               array_push($ingreso,$array_temporal);
               $data['requerimientos']['requerimientos']=$ingreso;
               /// array_push($data['requerimientos']['requerimientos'], json_encode($array_temporal));
            }

         }
         array_push($data['final_req'], $data['requerimientos']);
         $array_temporal=[];
         $ingreso=[];
         foreach ($ot->Compras_Ot as  $value) {
            if ($value['areas_id'] ==  $area_actual ) {
               $data['compras']['area']=$value['areas_id'];
               $compra =Compras_Ot::findOrFail($value['id']);
               $compra->Tipo_Compra;
               $compra->Divisa;

               // $array_temporal['area']=$value['areas_id'];
               $array_temporal= array('tipo_compra'=>array('id'=>$compra->Tipo_Compra['id'], 'nombre'=>$compra->Tipo_Compra['nombre']),'model_desc' => $value['descripcion'],
                  'model_provedor'=> $value['provedor'] , 'model_valor'=>  $value['valor'], 'divisa'=>array('id'=>$compra->Divisa['id'], 'nombre'=>$compra->Divisa['nombre']));
               array_push($ingreso,$array_temporal);
               $data['compras']['compras']=$ingreso;
               //array_push($data['compras'],  $array_temporal);
            }
         }


      }
      array_push($data['final_com'], $data['compras']);
      return view('admin.ots.editar_ot')->with('arregloOT', json_encode($data));
   }

   /**
   * Update the specified resource in storage.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
   public function update(Request $request, $id)
   {

      $respuesta=[];
      //Validaciòn de las entradas por el metodo POST
      $data= $request->all();

      $vl=$this->validatorEditarOT($data['datos_encabezado']);
      if ($vl->fails())
      {
         return response([
            'status' => Response::HTTP_BAD_REQUEST,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Error al actualizar la OT',
            'error' => 'ERR_01',
            'obj' =>$vl->errors()
            ],Response::HTTP_BAD_REQUEST);
      }else
      {

         try
         {
            //Busca el usuario en la BD
            $ot=  Ot::findOrFail($id);
            $ot->fill($data['datos_encabezado']);
            $ot->save();


            $requerimientos=$data['requerimientos'];
            $compras=$data['compras'];

            /*Agregar Tiempos por Area Requerimientos */
            $id_ot=$ot->id;
            $index=0;
            $tiempos_x_area= Tiempos_x_Area::where('ots_id',$id_ot)->get();
            $model_descripcion_requerimiento=  Requerimientos_Ot::where('ots_id',$id_ot)->get();
            $j=0;
            foreach ($requerimientos as $requerimiento) {
               /*Agrego el tiempo por Area */
               $tiempos_x_area[$index]->tiempo_estimado_ot=$requerimiento['horas'];
               $tiempos_x_area[$index]->tiempo_extra=$requerimiento['tiempo_extra'];
               $tiempos_x_area[$index]->areas_id=$requerimiento['area'];
               $tiempos_x_area[$index]->save();
               /*El siguiente for recorre el listado de requerimientos y los agrega */
               for ($i=0; $i < count($requerimiento['requerimientos']) ; $i++) {
                  $arreglo=$requerimiento['requerimientos'][$i];
                  $arreglo_ingresar= array('nombre' => $arreglo['model_nom'],'horas'=> $arreglo['model_horas']);
                  $model_descripcion_requerimiento[$j]->fill( $arreglo_ingresar);
                  $model_descripcion_requerimiento[$j]->save();
                  $j++;
               }

               $index++;

            }
            /*El siguiente for recorre el listado de compras y los agrega*/
            $index=0;
            $model_compras= Compras_Ot::where('ots_id',$id_ot)->get();
            foreach ($compras as $compra) {
               $model_compras[$index]->fill($compra);
               $model_compras[$index]->save();
               $index++;
            }

            //Guardar el Historico
            $historico= new Historico_Ot;
            $historico->fill($data['datos_encabezado']);
            $historico->ots_id=$id_ot;
            $historico->requerimientos_ot=json_encode($data['requerimientos']);
            $historico->compras_ot=json_encode($compras);
            $historico->save();



            //Notificar a la ejecutiva cuando se modifique su tarea
            $maker=Auth::user();
            $user= User::findOrFail($ot->usuarios_id);
            $user->notify(new OtTiempoExtraAprobado($maker,$ot));


            return response([
               'status' => Response::HTTP_OK,
               'response_time' => microtime(true) - LARAVEL_START,
               'msg' => 'Se han Actualizado los datos de la OT ', //Mensaje a mostrar en el Front
               'obj' => $ot
               ],Response::HTTP_OK);

         }catch(Exception $e){
            // DB::rollback();
            return response([
               'status' => Response::HTTP_BAD_REQUEST,
               'response_time' => microtime(true) - LARAVEL_START,
               'error' => 'fallo_al_actualizar',
               'consola' =>$e->getMessage(),
               'request' =>$request->all()
               ],Response::HTTP_BAD_REQUEST);
         }

      }


   }

   /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
   public function destroy($id)
   {
      //
   }


   /**
   * Función la cual se encarga de actualizar el estado de la OT, de la vista visualizar
   * Guarda el cambio en el historial de modificaciones
   * Notifica al usuario owner cuando se cambia el estado.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
   public function updateEstadoOT(Request $request, $id)
   {
      try
      {
         $ot=  Ot::findOrFail($id);
         $ot->estados_id= $request[0];
         $ot->save();


         //Guardar el Historico
         $historico= new Historico_Ot;
         $historico->fill( $ot->toArray());
         $historico->ots_id=$ot->id;
         $ot->Tiempos_x_Area;
         $ot->Requerimiento_Ot;
         $ot->Compras_Ot;
         $historico->editor_id= Auth::guard('api')->user()->id;

         $data['compras']=[];
         $data['final_req']=[];
         $data['final_com']=[];
         $array_temporal=[];
         $data['listado_areas']=[];
         $data['requerimientos']['requerimientos']=[];
         // $requerimientos= $ot->Requerimiento_Ot;
         foreach ($ot->Tiempos_x_Area as  $value) {
            $area_actual=$value['areas_id'];
            array_push($data['listado_areas'], $value->Area);
            $data['requerimientos']['area']=$value['areas_id'];
            $data['requerimientos']['textra']=$value['tiempo_extra'];
            $data['requerimientos']['horas']=$value['tiempo_estimado_ot'];
            $array_temporal=[];
            $ingreso=[];
            foreach ($ot->Requerimiento_Ot as  $value) {
               if ($value['areas_id'] ==  $area_actual ) {
                  $array_temporal= array('model_nom'=>$value['nombre'] ,'model_horas'=>(int)$value['horas']);
                  //$data['requerimientos']['requerimientos']=json_encode($array_temporal);
                  array_push($ingreso,$array_temporal);
                  $data['requerimientos']['requerimientos']=$ingreso;
                  /// array_push($data['requerimientos']['requerimientos'], json_encode($array_temporal));
               }

            }
            array_push($data['final_req'], $data['requerimientos']);
            $array_temporal=[];
            $ingreso=[];
            foreach ($ot->Compras_Ot as  $value) {
               if ($value['areas_id'] ==  $area_actual ) {
                  $data['compras']['area']=$value['areas_id'];
                  $compra =Compras_Ot::findOrFail($value['id']);
                  $compra->Tipo_Compra;
                  $compra->Divisa;

                  // $array_temporal['area']=$value['areas_id'];
                  $array_temporal= array('tipo_compra'=>array('id'=>$compra->Tipo_Compra['id'], 'nombre'=>$compra->Tipo_Compra['nombre']),'model_desc' => $value['descripcion'],
                     'model_provedor'=> $value['provedor'] , 'model_valor'=>  $value['valor'], 'divisa'=>array('id'=>$compra->Divisa['id'], 'nombre'=>$compra->Divisa['nombre']));
                  array_push($ingreso,$array_temporal);
                  $data['compras']['compras']=$ingreso;
                  //array_push($data['compras'],  $array_temporal);
               }
            }

         }
         array_push($data['final_com'], $data['compras']);
         $historico->requerimientos_ot=json_encode($data['final_req']);
         $historico->compras_ot=json_encode($data['final_com']);
         $historico->save();

         //Notificar al usuario owner cuando cambian el estado de una OT
            $maker=Auth::user();
            $Rol=Role::where('name','owner')->first();
            $owner=User::where('roles_id',$Rol->id)->first();
            $owner->notify(new OtCambioEstado($maker,$ot));


         return response([
            'status' => Response::HTTP_OK,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Se ha Actualizado el estado de la ot con Exito',//Mensaje a mostrar en el Front
            'obj' =>$ot
            ],Response::HTTP_OK);

      }catch(Exception $e){
         return response([
            'status' => Response::HTTP_BAD_REQUEST,
            'response_time' => microtime(true) - LARAVEL_START,
            'error' => 'fallo_en_la_actualizacion',
            'consola' =>$e->getMessage(),
            'request' => $request->all()
            ],Response::HTTP_BAD_REQUEST);
      }

   }

   /**
   *
   **/
   public function showOtEnTareas()
   {
      // Muestra todas las Ot con el cliente
      // y usuario que la creó
      $ot=  Ot::with(['cliente','usuario'])
      ->get();
      return response()->json($ot);
   }
   /**
   *
   **/
   public function solicitarHoras(Request $request)
   {
      // Muestra todas las Ot con el cliente
      // y usuario que la creó
      try {
         $ot= OT::findOrFail($request->id);
          //Notificar al usuario owner cuando solicitan horas extra para una OT
         $maker=Auth::user();
         $Rol=Role::where('name','owner')->first();
         $owner=User::where('roles_id',$Rol->id)->first();
         $owner->notify(new OtTiempoExtra($maker,$ot,$request->horas_adicionales,$request->area_nombre));

         return response([
            'status' => Response::HTTP_OK,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Se ha Notificado correctamente',
            'obj' =>$ot
            ],Response::HTTP_OK);
      } catch (Exception $e) {
         return response([
            'status' => Response::HTTP_BAD_REQUEST,
            'response_time' => microtime(true) - LARAVEL_START,
            'error' => 'fallo_en_la_notificacion',
            'consola' =>$e->getMessage(),
            'request' => $request->all()
            ],Response::HTTP_BAD_REQUEST);
      }

   }

     /**
   * Función la cual se encarga de actualizar el estado de la OT, de la vista visualizar
   * Guarda el cambio en el historial de modificaciones
   * Notifica al usuario owner cuando se cambia el estado.
   *
   * @param  \Illuminate\Http\Request  $request
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
     public function exportarTodoslosDatos(Request $request, $id){

          $ot = OT::findOrFail($id);
          $ot->tiempos_x_area;
          $ot->Cliente;
          $ot->Usuario;
          $ot->tareas=Tarea::with('area','usuario','estado')->where('estados_id', 1)->get();
        // return response()->json($ot);

       // Initialize the array which will be passed into the Excel
       // generator.
       $otsArray = []; 

       // Define the Excel spreadsheet headers
       $otsArray[] = ['OT', 'CLIENTE','ÁREA','HORAS ÁREA','ENCARGADO','REQUERIMIENTOS','FECHA DE ENTREGA EJECUTIVA','TIEMPO REAL','TIEMPO ESTIMADO JEFE','TIEMPO ESTIMADO MAPA DE CLIENTE'];

       //var_dump($ot->toArray());

       // $otsArray['OT']='hola';
       // var_dump( $otsArray);

     //  OT / CLIENTE / ÁREA / HORAS ÁREA / ENCARGADO / REQUERIMIENTOS / FECHA DE ENTREGA EJECUTIVA / TIEMPO REAL /  TIEMPO ESTIMADO JEFE / TIEMPO ESTIMADO MAPA DE CLIENTE / 
    

 
     $otsArray = User::select('id', 'nombre', 'email', 'created_at')->get();
         Excel::create('Resumen_OT', function($excel) use($otsArray)  {
            // Set the spreadsheet title, creator, and description
              $excel->setTitle('Resumen de la OT ');
              $excel->setCreator('Gestor de proccesos')->setCompany('Himalaya');
              $excel->setDescription('Resumen de la OT');
    
               $excel->sheet('resumen', function($sheet) use($otsArray)  {
    
                 $headings = array('date start', 'date end', 'status condition', 'security', 'company');
                 $sheet->prependRow(1, $headings);
                 //  $sheet->fromArray($ot);
                   $sheet->fromArray('jode', null, 'A1', false, false);
    
               });
           })->export('xls');



     }

   /**
   *
   **/
   public function showOtEnTareasByQuery($query)
   {
      // Si empieza con valor numerico buscar por referencia
      // de lo contrario por nombre
      if (is_numeric($query)) {
         $ot = Ot::with(['cliente','usuario'])->where('estados_id', 8)->where('referencia', 'like', '%'.$query.'%')->get();
      } else {
         $ot = Ot::with(['cliente','usuario'])->where('estados_id', 8)->where('nombre', 'like', '%'.$query.'%')->get();
      }
      return response()->json($ot);
   }

   /*DSO 24-01-2016 Funcion para validar los campos al crear un usuario
   * entra el arreglo de datos
   * Sale un arreglo con los errores.
   */
   protected function validatorCrearOT(array $data)
   {
      return Validator::make($data, [
         'nombre' => 'required|min:4|max:45',
         'referencia' => 'required|unique:ots,referencia',
         'valor' => 'required|min:4|max:45',
         'fecha_inicio' => 'required|date',
         'fecha_final' => 'required|date',
         'clientes_id' => 'required',
         'usuarios_id' => 'required',
         'estados_id' => 'required',
         ]);
   }
   /*DSO 24-01-2016 Funcion para validar los campos al crear un usuario
   * entra el arreglo de datos
   * Sale un arreglo con los errores.
   */
   protected function validatorEditarOT(array $data)
   {
      return Validator::make($data, [
         'nombre' => 'required|min:4|max:45',
         'valor' => 'required|min:4|max:45',
         'fecha_inicio' => 'required|date',
         'fecha_final' => 'required|date',
         'clientes_id' => 'required',
         'usuarios_id' => 'required',
         'estados_id' => 'required',
         ]);
   }

   public function formatMoney($number, $fractional=false) {
      if ($fractional) {
         $number = sprintf('%.2f', $number);
      }
      while (true) {
         $replaced = preg_replace('/(-?\d+)(\d\d\d)/', '$1,$2', $number);
         if ($replaced != $number) {
            $number = $replaced;
         } else {
            break;
         }
      }
      return $number;
   }
}
