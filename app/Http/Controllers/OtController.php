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
use Illuminate\Support\Facades\DB;

use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;

class OtController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $ots= Ot::all();
         $data=[];
         foreach ( $ots as $key =>  $ot) {
            $ot->Cliente;
             $ot->Usuario;
             $ot->Estado;
            array_push($data, $ot);

         }

        return array('recordsTotal'=>count($data),'recordsFiltered'=>count($data),'data'=>$data);
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
                return response()->json($vl->errors());
         }else
             {
                try
                {
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
                      return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'msg' => 'La OT ha sido creada con exito !! ',
                            'obj' => $ot
                        ],Response::HTTP_OK);

                }catch(Exception $e){
                     DB::rollback();
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'fallo_en_la_creacion',
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

    // return response()->json( $ot);
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
           foreach ($ot->Requerimiento_Ot as  $value) {
               if ($value['areas_id'] ==  $area_actual ) {
                   $array_temporal= array('model_nom'=>$value['nombre'] ,'model_horas'=>(int)$value['horas']);
                   $data['requerimientos']['requerimientos']=json_encode($array_temporal);
                 /// array_push($data['requerimientos']['requerimientos'], json_encode($array_temporal));
               }
          }
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

           array_push($data['final_req'], $data['requerimientos']);
           array_push($data['final_com'], $data['compras']);
        }


       //var_dump( $data['final_com']);
       //  return response()->json( $data['final_com']);


       //var_dump($data);
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

        $vl=$this->validatorCrearOT($data['datos_encabezado']);
      if ($vl->fails())
         {
                return response()->json($vl->errors());
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
                      return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'msg' => 'Se han Actualizado los datos de la OT ',
                            'obj' => $ot
                        ],Response::HTTP_OK);

                }catch(Exception $e){
                    // DB::rollback();
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'fallo_en_la_creacion',
                        'consola' =>$e->getMessage(),
                        'request' => $request->all()
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
    *
    **/
    public function showOtEnTareas()
    {
        $ot= DB::table('ots')
            ->join('clientes', 'ots.clientes_id', '=', 'clientes.id')
            ->join('users', 'ots.usuarios_id', '=', 'users.id')
            ->select('ots.*', 'clientes.nombre as nombre_cli', 'users.nombre as nombre_ej')
            ->get();
        return response()->json($ot);
    }

    /**
    *
    **/
    public function showOtEnTareasByQuery($query)
    {
        if (is_numeric($query)) {
            $ot = Ot::with(['cliente','usuario'])->where('referencia', 'like', '%'.$query.'%')->get();
        } else {
            $ot = Ot::with(['cliente','usuario'])->where('nombre', 'like', '%'.$query.'%')->get();
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
                'referencia' => 'required',
                'valor' => 'required|min:4|max:45',
                'fecha_inicio' => 'required|date',
                'fecha_final' => 'required|date',
                'clientes_id' => 'required',
                'usuarios_id' => 'required',
                'estados_id' => 'required',
        ]);
    }
}
