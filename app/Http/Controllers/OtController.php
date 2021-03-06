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
use Carbon\Carbon;


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

      $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->get();

      return response()->json($ots);

   }

   /**
   * Display a listing of the resource.
   *
   * @return \Illuminate\Http\Response
   */
   public function datatable_index(Request $request)
   {
      $output= array();

      $ots= Ot::orderBy('created_at', 'ASC')->get();
      $fee= $request->fee;
      $f_inicio = '';
      $f_final = '';
      if ($request->has('f_inicio')) {
         $f_inicio = $request->get('f_inicio');
      }else{
         $f_inicio = null;
      }
      if ($request->has('f_final')) {
         $f_final = $request->get('f_final');
      }else{
         $f_final = null;
      }
      if ($request->has('fee') && $fee !='all' && $f_inicio != null && $f_final != null ) {
         $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->where('fecha_inicio', '>=', $f_inicio)->where('fecha_inicio', '<=', $f_final)->where('fee', $fee )->get();
      }else if ($f_inicio != null && $f_final != null){
         $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->where('fecha_inicio', '>=', $f_inicio)->where('fecha_inicio', '<=', $f_final)->get();
      }else if ($request->has('fee') && $fee !='all' ){
         $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->where('fee', $fee )->get();
      }else{
         $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->get();
      }

      $output = collect($ots);
      return Datatables::of($output)
      ->addColumn('select', function($ots) {
        return'<div class="checkbox_ots"><div class=" <!--checkbox checkbox-success permisos_check -->" >
             <input  class="styled"  type="checkbox" id="check_'.$ots->id.'"  value="'.$ots->id.'" >
            <!-- <label  for="check_'.$ots->id.'"></label>-->
        </div></div>';
      })
      ->addColumn('fecha_inicio', function($ots) {
         return  $ots->getFormatFecha($ots->fecha_inicio);
      })
      ->addColumn('fecha_final', function($ots) {
         return $ots->getFormatFecha($ots->fecha_final);
      })
      ->addColumn('acciones', function($ots) {
         $ver_ot='<a href="visualizar/'.$ots->id.'" class="btn_accion estado-2-10 btn-success"  title="Ver Ot" aria-label="View"><i class="fa fa-eye" aria-hidden="true"></i></a>';
         $editar_ot=(Auth::user()->can('editar_ots') )?'<a href="editar/'.$ots->id.'" title="Editar Ot"  class="btn_accion btn-info" aria-label="View"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>':'';
         $exportar_ot=(Auth::user()->can('editar_ots') )?'<a href="exportar/'.$ots->id.'" title="Exportar Ot"  class="btn_accion estado-2-10" aria-label="View"><i class="fa fa-file-excel-o" aria-hidden="true"></i></a>':'';
         $eliminar_ot=(Auth::user()->can('editar_ots') )?'<a href="#" id="cli-'.$ots->id.'" title="Eliminar Ot"  class="btn_accion delete_cliente btn-danger"  data-toggle="modal" data-target="#myModal"><i class="fa fa-trash-o" aria-hidden="true"></i></a>':'';
         $duplicar_ot=(Auth::user()->can('crear_ots') && $ots->fee == 1 )?'<a href="duplicar/'.$ots->id.'" title="Duplicar Ot"  class="btn_accion btn-warning" aria-label="Duplicar"><i class="fa fa-files-o" aria-hidden="true"></i></a>':'';

         return $ver_ot.$editar_ot.$exportar_ot.$eliminar_ot.$duplicar_ot;
      })
      ->make(true);

   }
   public function exportar_listado_ots($fee,$f_inicio,$f_final){

      $output= array();
      // Si no trae el mes y año en el $request
      // tomar el mes y el año actual


      $ots= Ot::orderBy('created_at', 'ASC')->get();
      if ($fee != 'null' && $fee !='all' && $f_inicio != 'null' && $f_final != 'null') {
         $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->where('fecha_inicio', '>=', $f_inicio)->where('fecha_inicio', '<=', $f_final)->where('fee', $fee )->get();
      }else if ($f_inicio != 'null' && $f_final != 'null'){
         $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->where('fecha_inicio', '>=', $f_inicio)->where('fecha_inicio', '<=', $f_final)->get();
      }else if ($fee !='null'  && $fee !='all') {
         $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->where('fee', $fee )->get();
      }else{
         $ots = Ot::with('cliente','usuario','estado')->where('estado',1)->get();
      }

      //return response()->json($ots);

      $otsDescripcion = [];
      foreach($ots as $ot){
         array_push( $otsDescripcion, array($ot['referencia'],$ot['usuario']['nombre'].' '.$ot['usuario']['apellido'],$ot['cliente']['nombre'],
         $ot['nombre'],($ot['fee']==1)?'Fee':'Puntual',$ot->getFormatFecha($ot['fecha_inicio']),
         $ot['estados']['nombre'], number_format( $ot['horas_totales'],2,",","."),
         number_format($ot['horas_disponibles'],2,",","."),number_format( $ot['total_horas_extra'],2,",","."),
         $this->formatMoney($ot['valor'],false),$ot->getFormatFecha($ot['fecha_final'])
         ) );
      }

      // Se conviert en collection para que lo reciba el Datatable
      //$output = collect($output);

      //return response()->json($otsDescripcion);
      Excel::create( 'Listado de OTs ', function($excel) use($otsDescripcion)  {

         $excel->setTitle('Listado de OTs');
         $excel->setCreator('Gestor de proccesos')->setCompany('Himalaya');
         $excel->setDescription('Listado de OTs');
         $excel->sheet('Listado', function($sheet) use($otsDescripcion)  {

            $headings = array('#OT','Ejecutivo','Cliente','Nombre','Fee','Fecha Inicio','Estado','Horas Totales','Horas Disponibles','Horas Extra','Valor','Fecha final');
            $sheet->prependRow(1, $headings);
            $sheet->fromArray($otsDescripcion, null, 'A2', false, false);
            $sheet->setBorder('A2:L345', 'thin');


            $sheet->cells('A1:L1', function($cells) {
               $cells->setAlignment('center');
               $cells->setFont(array(
                  'family'     => 'Ubuntu',
                  'size'       => '12',
                  'bold'       =>  true
               ));
               $cells->setBackground('#002e60');
               $cells->setFontColor('#ffffff');
            });
            $sheet->setBorder('A1:L1', 'thin');

         });

      })->download('xls');

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
   * Display the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
   public function ShowOtGraficas($id)
   {
      $ot = OT::findOrFail($id);
      $ot->tiempos_x_area;
      $ot->Cliente;
      $ot->Usuario;
      $ot->tareas=Tarea::with('area','usuario','estado','usuarioencargado')->where('estados_id', 1)->where('ots_id',$ot->id)->get();
      // return response()->json($ot->tareas);

      // Initialize the array which will be passed into the Excel
      $areasArray =[];

      // Define the Excel spreadsheet headers
      $otsDescripcion = [];

      $areasEncabezado=['Áreas / Tiempos'];
      $areasEncabezado2=['Tiempo Estimado'];
      $areasEncabezado3=['Tiempo Real'];
      $areasEncabezado4=['Tiempo Extra'];
      $total_contra=0;
      $total_real=0;
      $total_extra=0;

      foreach ($ot->tiempos_x_area as  $tiempo_area) {
         array_push( $areasEncabezado,Area::findOrFail($tiempo_area['areas_id'])->nombre );
         array_push( $areasEncabezado2,number_format($tiempo_area['tiempo_estimado_ot'],2,",",".") );
         array_push( $areasEncabezado3,number_format($tiempo_area['tiempo_real'],2,",",".") );
         array_push( $areasEncabezado4,number_format($tiempo_area['tiempo_extra'],2,",",".") );
         $total_contra += $tiempo_area['tiempo_estimado_ot'];
         $total_real += $tiempo_area['tiempo_real'];
         $total_extra += $tiempo_area['tiempo_extra'];
      }
      array_push( $areasEncabezado,'TOTAL' );
      array_push( $areasEncabezado2, number_format($total_contra,2,",","."));
      array_push( $areasEncabezado3,number_format($total_real,2,",",".") );
      array_push( $areasEncabezado4,number_format($total_extra,2,",",".") );
      //return response()->json( $areasEncabezado2);
      foreach($ot->tareas as $tarea){
         array_push( $otsDescripcion, array($tarea['area']['nombre'],$tarea['nombre_tarea'],$ot->getFormatFechaShowInfo($tarea['created_at']),$ot->getFormatFechaShowInfo($tarea['fecha_entrega_cuentas']), number_format( $tarea['tiempo_estimado'],2,",","."), number_format($tarea['tiempo_real'],2,",","."), number_format( $tarea['tiempo_mapa_cliente'],2,",","."),$tarea['usuarioencargado']['nombre'].' '.$tarea['usuarioencargado']['apellido']) );
      }

      array_push($areasArray, $areasEncabezado);
      array_push($areasArray, $areasEncabezado2);
      array_push($areasArray,  $areasEncabezado3);
      array_push($areasArray,  $areasEncabezado4);

      $response =[];
      $response['destareas']=$otsDescripcion;
      $response['areasarray']=$areasArray;

      return response()->json($response);



      /*$ot=OT::findOrFail($id);
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

      return response()->json($ot);*/
      // return view('admin.ots.visualizar_ot')->with('ot', $ot)->with('listado_areas', $listado_areas);
   }


   /**
   * Show the form for editing the specified resource.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
   public function duplicar($id)
   {
      $ot=OT::findOrFail($id);
      $data=[];
      $ot->referencia='';
      $ot->fecha_final='';
      $ot->fecha_inicio='';
      $ot->estados_id='';
      $data['datos_encabezado']=$ot;

      //return response()->json($data);
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
               $array_temporal= array('model_nom'=>$value['nombre'] ,'model_horas'=>(float)$value['horas']);
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
      return view('admin.ots.duplicar_ot')->with('arregloOT', json_encode($data));
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
               $array_temporal= array('model_nom'=>$value['nombre'] ,'model_horas'=>(float)$value['horas']);
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
         //var_dump($ingreso);

         array_push($data['final_com'], $data['compras']);
      }


      //return response()->json($data['final_com']);
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
            //Inicio una transacción por si falla algún ingreso no quede registro en ninguna tabla
            DB::beginTransaction();
            //Busca la OT en la BD
            $ot=  Ot::findOrFail($id);
            $ot->fill($data['datos_encabezado']);
            $ot->save();


            $requerimientos=$data['requerimientos'];
            $debug['arreglo']=$requerimientos;
            $compras=$data['compras'];

            /*Agregar Tiempos por Area Requerimientos */
            $id_ot=$ot->id;
            $index=0;
            $tiempos_x_area= Tiempos_x_Area::where('ots_id',$id_ot)->get();
            $model_descripcion_requerimiento=  Requerimientos_Ot::where('ots_id',$id_ot)->get();
            $j=0;
            $debug['arreglo']=$model_descripcion_requerimiento;


            foreach ($requerimientos as $requerimiento) {
               if(  $index >= count($tiempos_x_area)  ){
                  break;
               }

               /*Agrego el tiempo por Area */
               $tiempos_x_area[$index]->tiempo_estimado_ot=$requerimiento['horas'];
               $tiempos_x_area[$index]->tiempo_extra=$requerimiento['tiempo_extra'];
               $tiempos_x_area[$index]->areas_id=$requerimiento['area'];
               $tiempos_x_area[$index]->save();
               /*El siguiente for recorre el listado de requerimientos y los agrega */
               for ($i=0; $i < count($requerimiento['requerimientos']) ; $i++) {
                  $arreglo=$requerimiento['requerimientos'][$i];
                  $arreglo_ingresar= array('nombre' => $arreglo['model_nom'],'horas'=> floatval($arreglo['model_horas']),'areas_id' =>$requerimiento['area'],'ots_id' =>$id_ot);
                  try {
                     $model_descripcion_requerimiento[$j]->fill( $arreglo_ingresar);
                     $model_descripcion_requerimiento[$j]->save();
                  } catch (Exception $e) {
                     $model_descripcion_requerimiento= new Requerimientos_Ot;
                     $model_descripcion_requerimiento->fill( $arreglo_ingresar);
                     $model_descripcion_requerimiento->save();
                  }
                  $j++;
               }

               unset($requerimientos[$index]);
               $index++;

            }
            /*El siguiente for recorre el listado de compras y los agrega*/
            $index=0;
            $model_compras= Compras_Ot::where('ots_id',$id_ot)->get();
            foreach ($compras as $compra) {
               if(  $index >= count($model_compras)  ){
                  $debug["sali_bien2"]='entre a salir bien Compras';
                  break;
               }
               $model_compras[$index]->fill($compra);
               $model_compras[$index]->save();
               unset($compras[$index]);
               $index++;
            }


            $debug["count_req2"]=count($requerimientos);
            /*Si el numero no concuerda es porque hay un nuevo requerimiento*/
            if( count($requerimientos) > 0 ){

               foreach ($requerimientos as $requerimiento) {
                  $tiempos_x_area= new Tiempos_x_Area;
                  /*Agrego el tiempo por Area */
                  $tiempos_x_area->tiempo_estimado_ot=$requerimiento['horas'];
                  $tiempos_x_area->tiempo_extra=$requerimiento['tiempo_extra'];
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

            }

            /*El siguiente for recorre el listado de compras y los agrega*/
            foreach ($compras as $compra) {
               $model_compras= new Compras_Ot;
               $model_compras->fill($compra);
               $model_compras->ots_id=$id_ot;
               $model_compras->save();
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
            DB::commit();

            return response([
               'status' => Response::HTTP_OK,
               'response_time' => microtime(true) - LARAVEL_START,
               'msg' => 'Se han Actualizado los datos de la OT ', //Mensaje a mostrar en el Front
               'obj' => $ot
            ],Response::HTTP_OK);

         }catch(Exception $e){
            DB::rollback();
            return response([
               'status' => Response::HTTP_BAD_REQUEST,
               'response_time' => microtime(true) - LARAVEL_START,
               'error' => 'fallo_al_actualizar',
               'consola' =>$e->getMessage(),
               'debug'=> $debug,
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
      $ot=  Ot::findOrFail($id);
      $ot->Tarea;
      if ( !isset($ot->Tarea) || empty($ot->Tarea) || $ot->Tarea == [] || count($ot->Tarea) <=0 ) {
         $ot->estado=0;
         $ot->save();
         return response([
            'status' => Response::HTTP_OK,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Se ha eliminado la OT correctamente', //Mensaje a mostrar en el Front
            'obj' => $ot
         ],Response::HTTP_OK);
      }else{
         return response([
            'status' => Response::HTTP_BAD_REQUEST,
            'response_time' => microtime(true) - LARAVEL_START,
            'error' => 'fallo_al_eliminar',
            'consola' => $ot->Tarea,
            'msg' => 'Esta OT ya tiene tareas Asignadas, por lo tanto no se puede eliminar', //Mensaje a mostrar en el Front
         ],Response::HTTP_BAD_REQUEST);

      }

   }

   /**
   * Remove the specified resource from storage.
   *
   * @param  int  $id
   * @return \Illuminate\Http\Response
   */
   public function destroyAreaOT($id,$id_area)
   {
      $area=  Tiempos_x_Area::where('ots_id',$id)->where('areas_id',$id_area)->first();
      $requerimientos=  Requerimientos_Ot::where('ots_id',$id)->where('areas_id',$id_area)->get();
      $compras=  Compras_Ot::where('ots_id',$id)->where('areas_id',$id_area)->where('compra_externa',0)->get();
      //return response()->json($requerimientos);
      try {

         foreach ($requerimientos as $requerimiento ) {
            $requerimiento->delete();
         }
         foreach ($compras as $compra ) {
            $compra->delete();
         }
         $area->delete();
         return response([
            'status' => Response::HTTP_OK,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Se ha eliminado el Área correctamente', //Mensaje a mostrar en el Front
            'obj' => $area
         ],Response::HTTP_OK);
      } catch (Exception $e) {
         return response([
            'status' => Response::HTTP_BAD_REQUEST,
            'response_time' => microtime(true) - LARAVEL_START,
            'error' => 'Fallo al eliminar',
            'consola' =>$e->getMessage(),
            'msg' => 'No se puede eliminar el Área seleccionada', //Mensaje a mostrar en el Front
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
      $ot=  Ot::with(['cliente','usuario','tiempos_x_area'])
      ->where('estado','=','1')
      ->get();
      /*$ot=OT::findOrFail($id);
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

      return response()->json($ot);*/
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
   * Función la cual se encarga de Exportar las tareas de una OT
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
      $ot->tareas=Tarea::with('area','usuario','estado','usuarioencargado')->where('estados_id', 1)->where('ots_id',$ot->id)->get();
      // return response()->json($ot->tareas);

      // Initialize the array which will be passed into the Excel
      $otsArray = [];
      $areasArray =[];

      // Define the Excel spreadsheet headers
      $otsEncabezado[] = ['OT',$ot->referencia ,'Fecha Inicio',$ot->getFormatFechaShowInfo($ot->fecha_inicio),'Horas Totales',$ot->horas_totales];
      $otsEncabezado2[] = ['Cliente',$ot->cliente['nombre'],'Fecha Final',$ot->getFormatFechaShowInfo($ot->fecha_final),'Horas Disponibles',$ot->horas_disponibles,'Horas Extra',$ot->total_horas_extra];
      $otsDescripcion = [];

      $areasEncabezado=['Áreas / Tiempos'];
      $areasEncabezado2=['Tiempo Estimado'];
      $areasEncabezado3=['Tiempo Real'];
      $areasEncabezado4=['Tiempo Extra'];
      $total_contra=0;
      $total_real=0;
      $total_extra=0;

      foreach ($ot->tiempos_x_area as  $tiempo_area) {
         array_push( $areasEncabezado,Area::findOrFail($tiempo_area['areas_id'])->nombre );
         array_push( $areasEncabezado2,number_format($tiempo_area['tiempo_estimado_ot'],2,",",".") );
         array_push( $areasEncabezado3,number_format($tiempo_area['tiempo_real'],2,",",".") );
         array_push( $areasEncabezado4,number_format($tiempo_area['tiempo_extra'],2,",",".") );
         $total_contra += $tiempo_area['tiempo_estimado_ot'];
         $total_real += $tiempo_area['tiempo_real'];
         $total_extra += $tiempo_area['tiempo_extra'];
      }
      array_push( $areasEncabezado,'TOTAL' );
      array_push( $areasEncabezado2, number_format($total_contra,2,",","."));
      array_push( $areasEncabezado3,number_format($total_real,2,",",".") );
      array_push( $areasEncabezado4,number_format($total_extra,2,",",".") );
      //return response()->json( $areasEncabezado2);
      foreach($ot->tareas as $tarea){
         array_push( $otsDescripcion, array($tarea['area']['nombre'],$tarea['nombre_tarea'],$ot->getFormatFechaShowInfo($tarea['created_at']),$ot->getFormatFechaShowInfo($tarea['fecha_entrega_cuentas']), number_format( $tarea['tiempo_estimado'],2,",","."), number_format($tarea['tiempo_real'],2,",","."), number_format( $tarea['tiempo_mapa_cliente'],2,",","."),$tarea['usuarioencargado']['nombre'].' '.$tarea['usuarioencargado']['apellido']) );
      }
      array_push($otsArray, $otsEncabezado);
      array_push($otsArray, $otsEncabezado2);
      array_push($otsArray, $otsDescripcion);
      array_push($areasArray, $areasEncabezado);
      array_push($areasArray, $areasEncabezado2);
      array_push($areasArray,  $areasEncabezado3);
      array_push($areasArray,  $areasEncabezado4);
      //     return response()->json( $ot->tareas);
      Excel::create( $ot->Cliente['nombre'].'_'.$ot->nombre.'_'.'OT_#'.$ot->referencia.'', function($excel) use($otsArray,$areasArray)  {
         // Set the spreadsheet title, creator, and description
         $excel->setTitle('Resumen de la OT ');
         $excel->setCreator('Gestor de proccesos')->setCompany('Himalaya');
         $excel->setDescription('Resumen de la OT');

         $excel->sheet('resumen', function($sheet) use($otsArray,$areasArray)  {
            $headings = array('Datos Generales de la OT');
            $sheet->prependRow(1, $headings);
            $sheet->row(2, $otsArray[0][0]);
            $sheet->row(3, $otsArray[1][0]);
            $headings = array('Resumen de Áreas de la OT ');
            $sheet->prependRow(5, $headings);
            $sheet->row(7, $areasArray[0]);
            $sheet->row(8, $areasArray[1]);
            $sheet->row(9, $areasArray[2]);
            $sheet->row(10, $areasArray[3]);
            $headings = array('Resumen de tareas de la OT ');
            $sheet->prependRow(12, $headings);
            $headings = array('ÁREA','REQUERIMIENTOS','FECHA SOLICITUD','FECHA DE ENTREGA','TIEMPO EMPLEADO','TIEMPO ESTIMADO JEFE','TIEMPO ESTIMADO MAPA DE CLIENTE','ENCARGADO');
            $sheet->prependRow(14, $headings);
            $sheet->fromArray($otsArray[2], null, 'A15', false, false);

            $sheet->cell('A1', function($cell) {
               // Set font
               $cell->setFont(array(
                  'family'     => 'Calibri',
                  'size'       => '14',
                  'bold'       =>  true
               ));
            });

            $sheet->cell('A5', function($cell) {
               // Set font
               $cell->setFont(array(
                  'family'     => 'Calibri',
                  'size'       => '14',
                  'bold'       =>  true
               ));

            });
            $sheet->cell('A7', function($cell) {
               // Set font
               $cell->setFont(array(
                  'family'     => 'Calibri',
                  'size'       => '14',
                  'bold'       =>  true
               ));
            });

            $sheet->cell('A12', function($cell) {
               // Set font
               $cell->setFont(array(
                  'family'     => 'Calibri',
                  'size'       => '14',
                  'bold'       =>  true
               ));

            });

            $sheet->cells('A2:A3', function($cells) {$cells->setFontWeight('bold');});
            $sheet->cells('B2:B3', function($cells) {$cells->setAlignment('left');});
            $sheet->cells('C2:C3', function($cells) {$cells->setFontWeight('bold');});
            $sheet->cells('D2:D3', function($cells) {$cells->setAlignment('right');});
            $sheet->cells('E2:E3', function($cells) {$cells->setFontWeight('bold');});
            $sheet->cells('F2:G3', function($cells) {$cells->setAlignment('center');});
            $sheet->cells('G2:G3', function($cells) {$cells->setFontWeight('bold');});
            $sheet->cells('H2:H3', function($cells) {$cells->setAlignment('center');});
            $sheet->cells('A14:H14', function($cells) {$cells->setFontWeight('bold');});
            $sheet->cells('A7:H7', function($cells) {$cells->setFontWeight('bold');});
            $sheet->cells('A7:A10', function($cells) {$cells->setFontWeight('bold');});

            $sheet->cells('A2:E10', function($cells) {$cells->setAlignment('center');});
            // Set border for range
            $sheet->setBorder('A14:H40', 'thin');

         });

      })->export('xls');



   }
   /**
   *
   * Función la cual se encarga de Exportar las tareas de una OT
   *
   * @param  array  $arrayots
   * @return Excel
   */
   public function exportarTareasOts($arrayots){


      $ot = new OT;
      $arrayots= $array = explode(',', $arrayots);
      $tareas=Tarea::with('area','usuario','estado','usuarioencargado','ot')->whereIn('ots_id',$arrayots)->get();
      //return response()->json($tareas);

      // Initialize the array which will be passed into the Excel
      $otsDescripcion = [];

      foreach($tareas as $tarea){
         array_push( $otsDescripcion, array($tarea['ot']['referencia'],$tarea['area']['nombre'],$tarea['nombre_tarea'],$ot->getFormatFechaShowInfo($tarea['created_at']),$ot->getFormatFechaShowInfo($tarea['fecha_entrega_cuentas']), number_format( $tarea['tiempo_estimado'],2,",","."), number_format($tarea['tiempo_real'],2,",","."), number_format( $tarea['tiempo_mapa_cliente'],2,",","."),$tarea['usuarioencargado']['nombre'].' '.$tarea['usuarioencargado']['apellido']) );
      }

      Excel::create('Resumen de Tareas', function($excel) use($otsDescripcion)  {
         // Set the spreadsheet title, creator, and description
         $excel->setTitle('Resumen de Tareas');
         $excel->setCreator('Gestor de proccesos')->setCompany('Himalaya');
         $excel->setDescription('Resumen de Tareas');

         $excel->sheet('listado de tareas', function($sheet) use($otsDescripcion)  {
            $headings = array('Resumen de tareas ');
            $sheet->prependRow(1, $headings);
            $headings = array('#OT','ÁREA','REQUERIMIENTOS','FECHA SOLICITUD','FECHA DE ENTREGA','TIEMPO EMPLEADO','TIEMPO ESTIMADO JEFE','TIEMPO ESTIMADO MAPA DE CLIENTE','ENCARGADO');
            $sheet->prependRow(3, $headings);
            $sheet->fromArray($otsDescripcion, null, 'A4', false, false);

            $sheet->cell('A1', function($cell) {
               // Set font
               $cell->setFont(array(
                  'family'     => 'Calibri',
                  'size'       => '14',
                  'bold'       =>  true
               ));
            });
            $sheet->cells('A3:I3', function($cells) {$cells->setFontWeight('bold'); $cells->setAlignment('center');});
            //$sheet->cells('A2:E10', function($cells) {$cells->setAlignment('center');});
            // Set border for range
            $sheet->setBorder('A3:I80', 'thin');

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

      //Función que consulta las ot recibe dos valores el primero referencia o nombre el segundo el query que se envia desde el componente select
      function consulta_ot($value,$consulta)
      {
         $ot = Ot::
         select('ots.id','ots.clientes_id','ots.created_at','ots.estado','ots.estados_id',
         'ots.fecha_final','ots.fecha_inicio','ots.fee','ots.nombre','ots.referencia',
         'ots.usuarios_id','clientes.nombre as cliente_nombre','users.nombre as usuario_nombre',
         'users.apellido as usuario_apellido')
         ->join('clientes','clientes.id','=','ots.clientes_id')
         ->join('users','users.id','=','ots.usuarios_id')
         ->where('ots.estados_id','8')
         ->where('ots.estado','1')
         ->Where($value, 'like', '%'.$consulta.'%')
         ->orWhere('clientes.nombre', 'like', '%'.$consulta.'%')
         ->get();

         return $ot;
      }
      if (is_numeric($query)) {
         //  $ot = Ot::with(['cliente','usuario'])->where('estados_id', 8)->where('referencia', 'like', '%'.$query.'%')->get();
         $ot=consulta_ot('referencia',$query);
      } else {
         $ot= consulta_ot('ots.nombre',$query);
         //  $ot = Ot::with(['cliente'=> function ($subquery) use ($query)
         //  {
         //    $subquery->orWhere('nombre','like','%'.$query.'%');
         //  },'usuario'])->where('estados_id', 8)->orWhere('nombre', 'like', '%'.$query.'%')->get();
      }

      /*$ot=  Ot::with(['cliente','usuario','tiempos_x_area'])
      ->get();
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
      }*/
      return response()->json($ot);
   }

   /*DSO 24-01-2016 Funcion para validar los campos al crear un usuario
   * entra el arreglo de datos
   * Sale un arreglo con los errores.
   */
   protected function validatorCrearOT(array $data)
   {
      return Validator::make($data, [
         'nombre' => 'required|min:4',
         'referencia' => 'required|unique:ots,referencia',
         'valor' => 'required|min:4',
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
         'nombre' => 'required|min:4',
         'valor' => 'required|min:4',
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
