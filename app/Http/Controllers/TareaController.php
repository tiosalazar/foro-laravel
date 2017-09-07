<?php

namespace App\Http\Controllers;

use Illuminate\Notifications\Notifiable;
use App\Notifications\CrearOT;
use App\Notifications\OtSinTiempo;
use App\Notifications\OtExcedeTiempo;
use App\Notifications\TareaCreada;
use App\Notifications\TareaPendiente;
use App\Notifications\TareaProgramada;
use App\Notifications\TareaRealizada;
use App\Notifications\TareaEntregada;
use App\Notifications\TareaOk;
use App\Notifications\TareaAtencionCuentas;
use App\Notifications\TareaAtencionArea;
use App\Notifications\ComentarioNuevoTarea;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use App\Tarea;
use App\Ot;
use App\Tiempos_x_Area;
use App\Area;
use App\User;
use App\Historico_equipo;
use App\Role;
use App\Estado;
use App\Comentario;
use App\Historico_Tarea;
use App\Planeacion_fase;
use App\Planeacion_tipo;
use App\Requerimientos_cliente;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Exception;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;
use Jenssegers\Date\Date;
use Illuminate\Support\Facades\Log;
use Excel;
use Google_Client;
use Google_Service_Calendar;
use Google_Service_Calendar_Event;
use Google_Service_Calendar_EventDateTime;
use App\Http\Traits\gCalendarTrait;


class TareaController extends Controller
{
    use gCalendarTrait;
    //+protected $client;
    /*public function __construct()
    {
    $this->middleware('auth');
}*/
/**
* Display a listing of the resource.
*
* @return \Illuminate\Http\Response
*/
public function index()
{
    $output = collect();
    $tareas = Tarea::with(['ot'=> function ($query) {
        $query->where('estado', 1);
    },'ot.cliente' ,'estado'])->get();
    foreach ($tareas as $key => $value) {
        if (!is_null($value->ot)) {
            array_push($output, $value);
        }
    }
    return Datatables::of($output)->make(true);
}
public function calendarConsole()
{
    //$calendar =new gCalendarController();
      $calendarClient = $this->getClientGoogle();
      var_dump($calendarClient);
    //var_dump($calendar->returnClient());


}
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id=null)
    {
      if (!Auth::user()->can('crear_tareas')) {
          return redirect("/home");
      }
      if (!is_null($id) && is_numeric($id)) {
        $area = Area::findOrFail($id);
        return view('admin.tareas.crear_tarea')->with('area',$area);
      }
      return view('admin.tareas.crear_tarea')->with('area',0);

    }

     public function create_requerimiento($id)
    { 

      if (!Auth::user()->can('crear_tareas')) {
          return redirect("/home");
      }
      // if (!is_null($id) && is_numeric($id)) {
      //   $area = Area::findOrFail($id);
      //   return view('admin.tareas.crear_tarea')->with('area',$area);
      // }
      // return view('admin.tareas.crear_tarea')->with('area',0);
     
      $requerimientos_cliente = Requerimientos_cliente::findOrFail($id);
      $area=['id'=> 0];
      $area1=json_encode($area);
      $requerimiento_client=json_encode($requerimientos_cliente);
      return view('admin.tareas.crear_tarea_requerimiento')->with('requerimiento_cliente',$requerimiento_client)->with('area',$area1);
    }

/**
* Store a newly created resource in storage.
*
* @param  \Illuminate\Http\Request  $request
* @return \Illuminate\Http\Response
*/
public function store(Request $request)
{

    //id Rol coordinador
    $role=Role::where('name','coordinador')->get();

    //Coordinador con con el area enviada en el request
    $userdata= User::where('roles_id',$role[0]->id)
    ->where('areas_id', $request->areas_id)->get();

    if ($userdata!=null and isset($userdata[0])) {

            //Id del usuario
            $idusuario=$userdata[0]->id;

            //Agrego al request el id
            $request['encargado_id']=$idusuario;
             DB::beginTransaction();
            $tarea = new Tarea;
            $tarea->fill($request->all());

            //Validación de las entradas por el metodo POST
            $vl=$this->validatorCreartarea($request->all());

            if ($vl->fails()){
                // return response()->json($vl->errors());
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al crear la tarea, campos invalidos',
                    'error' => config('constants.ERR_01'),
                    'obj' =>$vl->errors()
                    ],Response::HTTP_BAD_REQUEST);
            }else{
                //Inicio una transacción por si falla algún ingreso no quede registro en ninguna tabla

                try {

                    // Obtengo las horas de la OT
                    // segun el area correspondiente a la Tarea
                    $horas_area = Tiempos_x_Area::with('area','ots')
                    ->where('ots_id',$tarea->ots_id)
                    ->where('areas_id',$tarea->areas_id)
                    ->first();
                    $admins='';

                    if (is_null($horas_area)) {
                        return response([
                            'status' => Response::HTTP_BAD_REQUEST,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'error' => config('constants.ERR_02'),
                            'msg' => 'Ot no posee tiempo en esta area',
                            'obj' =>[]
                            ],Response::HTTP_BAD_REQUEST);
                    }

                    // Validar si tiene horas suficientes para hacer la Tarea
                    if (!is_null($horas_area->tiempo_estimado_ot) &&
                        $horas_area->tiempo_estimado_ot + $horas_area->tiempo_extra > $horas_area->tiempo_real) {
                        $tarea->save();
                        if(count($request->arreglo_tareas_extra) <=0 and $request->arreglo_tareas_extra == null ){
                            DB::commit();
                            $maker = User::findOrFail($request->usuarios_id);
                            User::find($tarea->encargado_id)->notify(new TareaCreada($maker,$tarea));
                        return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'obj' => $tarea,
                            'request' => $request->all(),
                            'horas_area ' => $horas_area,
                            'error' => null,
                            'msg' => 'Tarea creada con exito',
                            ],Response::HTTP_OK);
                        }
                    } else {
                        // Enviar notificacion a los Project Owner
                        // cuando el tiempo se haya acabado para un Área en la OT
                        $admins = User::where('roles_id',1)->get();
                        $maker = User::findOrFail($tarea->usuarios_id);
                        foreach ($admins as $key => $admin) {
                            $admin->notify(new OtSinTiempo($maker,$horas_area));
                        }
                        return response([
                            'status' => Response::HTTP_BAD_REQUEST,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'obj' => [],
                            'horas_area ' => $horas_area,
                            // 'error' => 'ERR_04',
                            'error' => config('constants.ERR_02'),
                            'msg' => 'No tienes tiempo suficiente para esta tarea.',
                            ],Response::HTTP_BAD_REQUEST);
                    }

            } catch (Exception $e) {
                  DB::rollback();
               return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => config('constants.ERR_04'),
                'msg' => 'Ocurrio un error, por favor comunicate con soporte',
                'consola' =>$e->getMessage(),
                'obj' =>[]
                ],Response::HTTP_BAD_REQUEST);
           }
       }

       //DSO Guardar tareas Extra
       $count=1;
       $arrayIngresadas=[];
       foreach ($request->arreglo_tareas_extra as $tarea_extra) {
           $New_tarea = new Tarea;
           $userdata= User::where('roles_id',$role[0]->id)
           ->where('areas_id', $tarea_extra['areas_id'])->get();

           $tarea_extra['encargado_id']=$userdata[0]->id;
           $New_tarea->fill($tarea_extra);


           $vl=$this->validatorCreartarea($tarea_extra);
           if ($vl->fails()){
               // return response()->json($vl->errors());
                 DB::rollback();
               return response([
                   'status' => Response::HTTP_BAD_REQUEST,
                   'response_time' => microtime(true) - LARAVEL_START,
                   'msg' => 'Error al crear la tarea No '.$count.', campos invalidos',
                   'error' => config('constants.ERR_01'),
                   'obj' =>$vl->errors(),
                   'consola' => $New_tarea
                   ],Response::HTTP_BAD_REQUEST);
           }else{
               try {
                   // Obtengo las horas de la OT
                   // segun el area correspondiente a la Tarea
                   $horas_area = Tiempos_x_Area::with('area','ots')
                   ->where('ots_id',$New_tarea->ots_id)
                   ->where('areas_id',$New_tarea->areas_id)
                   ->first();
                   $admins='';

                   if (is_null($horas_area)) {
                         DB::rollback();
                       return response([
                           'status' => Response::HTTP_BAD_REQUEST,
                           'response_time' => microtime(true) - LARAVEL_START,
                           'error' => config('constants.ERR_02'),
                           'msg' => 'Ot no posee tiempo en esta area'.' - Tarea No '.$count,
                           'obj' =>[]
                           ],Response::HTTP_BAD_REQUEST);
                   }

                   // Validar si tiene horas suficientes para hacer la Tarea
                   if (!is_null($horas_area->tiempo_estimado_ot) &&
                       $horas_area->tiempo_estimado_ot + $horas_area->tiempo_extra > $horas_area->tiempo_real) {
                       $New_tarea->save();
                       array_push($arrayIngresadas,$New_tarea);
                       $count++;
                   } else {
                       // Enviar notificacion a los Project Owner
                       // cuando el tiempo se haya acabado para un Área en la OT
                       $admins = User::where('roles_id',1)->get();
                       $maker = User::findOrFail($tarea->usuarios_id);
                       foreach ($admins as $key => $admin) {
                           $admin->notify(new OtSinTiempo($maker,$horas_area));
                       }
                        DB::rollback();
                       return response([
                           'status' => Response::HTTP_BAD_REQUEST,
                           'response_time' => microtime(true) - LARAVEL_START,
                           'obj' => [],
                           'horas_area ' => $horas_area,
                           // 'error' => 'ERR_04',
                           'error' => config('constants.ERR_02'),
                           'msg' => 'No tienes tiempo suficiente para crear la tarea No '.$count,
                           ],Response::HTTP_BAD_REQUEST);
                           $count++;
                   }
             } catch (Exception $e) {
               DB::rollback();
            return response([
             'status' => Response::HTTP_BAD_REQUEST,
             'response_time' => microtime(true) - LARAVEL_START,
             'error' => config('constants.ERR_04'),
             'msg' => 'Ocurrio un error, por favor comunicate con soporte',
             'consola' =>$e->getMessage(),
             'obj' =>[]
             ],Response::HTTP_BAD_REQUEST);
        }



       }
   }
   DB::commit();
   if(count($request->arreglo_tareas_extra) > 0 and $request->arreglo_tareas_extra != null ){
       $maker = User::findOrFail($request->usuarios_id);
       User::find($tarea->encargado_id)->notify(new TareaCreada($maker,$tarea));
       foreach ($arrayIngresadas as $Tingreso) {
           User::find($Tingreso['encargado_id'])->notify(new TareaCreada($maker,$Tingreso));
       }
   return response([
       'status' => Response::HTTP_OK,
       'response_time' => microtime(true) - LARAVEL_START,
       'obj' => $tarea,
       'request' => $request->all(),
       'horas_area ' => $horas_area,
       'error' => null,
       'msg' => 'Tareas creadas con exito',
       ],Response::HTTP_OK);
   }


   }else{
        return response([
            'status' => Response::HTTP_BAD_REQUEST,
            'response_time' => microtime(true) - LARAVEL_START,
            'error' => config('constants.ERR_05'),
            'msg' => 'Coordinador no asignado',
            // 'consola' =>$e->getMessage(),
            'obj' =>[]
        ],Response::HTTP_BAD_REQUEST);

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
    // $tarea = Tarea::findOrFail($id);
    return Datatables::of(Tarea::query())->make(true);

}

/**
* Show the form for editing the specified resource.
*
* @param  int  $id
* @return \Illuminate\Http\Response
*/
public function edit($id)
{
    //
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

    // Valida si es un comentario
    if($request->is_comment==1){
         DB::beginTransaction();

        $tarea=Tarea::findOrFail($id);

        $comentario = new Comentario;
        $comentario->fill($request->all());
        try {
            $comentario->save();
            $maker = User::findOrFail($comentario->usuarios_comentario_id);
            User::findOrFail($tarea->encargado_id)
            ->notify(new ComentarioNuevoTarea($maker,$tarea,$comentario));
            DB::commit();
        } catch (Exception $e) {
            DB::rollback();
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'No se pudo guardar el comentario',
                'error' => config('constants.ERR_04'),
                'obj' =>[],
                'consola' =>$e->getMessage(),
                'comentario' =>$comentario,
                'tarea' =>$tarea,
                'request' =>$request,
            ],Response::HTTP_BAD_REQUEST);
        }

        //Guardar en el historial
        $tarea_historico = new Historico_Tarea;
        $data['tiempo_estimado']=$tarea->tiempo_estimado;
        $data['tiempo_real']=$tarea->tiempo_real;
        $data['comentarios_id']=$comentario->id;
        $data['encargado_id']=$tarea->encargado_id;
        $data['estados_id']=$tarea->estados_id;
        $data['usuarios_id']=$tarea->usuarios_id;
        $data['tareas_id']=$tarea->id;
        $data['fecha_entrega_area']=$tarea->fecha_entrega_area;
        $data['fecha_entrega_cuentas']=$tarea->fecha_entrega_cuentas;
        $data['editor_id']=Auth::user()->id;
        $tarea_historico->fill($data);
        try {
            $tarea_historico->save();
            DB::commit();
        } catch (Exception $e) {
            DB::rollback();
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'No se pudo guardar el Historico',
                'error' => config('constants.ERR_04'),
                'consola' =>$e->getMessage(),
                'obj' =>[],
                'tarea_historico' =>$tarea_historico,
            ],Response::HTTP_BAD_REQUEST);
        }

        //Respuesta
        $respuesta['dato']=$tarea;
        $respuesta['user_coment']='';
        $respuesta["error"]=0;
        $respuesta["mensaje"]="OK";
        $respuesta["msg"]="Comentario agregado con exito";
        foreach ($tarea->comentario as $key => $value) {
            if ($value->user->id==$request->usuarios_comentario_id) {
                $respuesta['user_coment']=$value;
                $value->estados;
            }


        }
        DB::commit();
        return response([
            'status' => Response::HTTP_OK,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Comentario agregado con exito',
            'mensaje' => "OK",
            'error' => 0,
            'tarea' =>$tarea,
            'dato' =>$tarea,
            'user_coment' =>$respuesta['user_coment'],
        ],Response::HTTP_OK);


        // Es una actualziacion de la tarea
    }else{
        if (!($request->estados_id == 4 || $request->estados_id == 5|| $request->estados_id == 6 || $request->estados_id == 7)) {
            $vl=$this->validatorAsignarTarea($request->all());
        }else{
            $vl=$this->validatorAtenciones($request->all());
        }

        if ($vl->fails() ) {
            $respuesta["error"]="Datos Incompletos";
            $respuesta["codigo_error"]="Error con los datos";
            $respuesta["mensaje"]="Error con los datos";
            $respuesta["status"]= Response::HTTP_BAD_REQUEST;
            $respuesta["msg"]="Datos Incompletos";
            $respuesta["obj"]=$vl->errors();
            $respuesta["request"]=$request;
        }else{

            try
            {
                //Busca la Tarea en la BD
                $tarea=Tarea::findOrFail($id);

                // Encargado antes de actualizar la tarea
                $makerBefore = User::findOrFail($tarea->encargado_id);

                //Asigna los nuevo datos
                $tarea->fill($request->all());



                // Si el estado es Pendiente (7)
                // Poner como encargado el coordinado del Área
                $encargado_area = '';
                if ($tarea->estados_id == 7 || $tarea->estados_id == 5) {

                    $encargado_area= User::where('roles_id',4)
                    ->where('areas_id', $tarea->areas_id)
                    ->first();
                    $tarea->encargado_id = $encargado_area->id;


                }else
                // Atención Cuentas (4)
                if($tarea->estados_id == 4){
                    $tarea->encargado_id = $tarea->usuarios_id;
                }else
                // Tarea OK
                if($tarea->estados_id == 1){
                    try {
                      // Validar la fecha de la Tarea
                      // para restar tiempo del mes correspondiente
                      $now = Carbon::now();
                      // DB::enableQueryLog();

                      // Obtener la fecha de la tarea cuando fue realizada realizada
                      // Se busca en los Historicos de Tarea el ultimo estado realizado
                      $tarea_realizada = Historico_Tarea::where('tareas_id',$tarea->id)->where('estados_id',2)->orderBy('created_at', 'desc')->first();
                      // Se formatea la fecha
                      $fecha_tarea = new Date($tarea_realizada->created_at);
                      if ($fecha_tarea->month == $now->month ) {
                        // Restar horas normalmente

                        // Tarea OK, guardar horas en usuario->horas gastadas
                        // y en Area->horas gastadas

                        $colaborador = User::findOrFail($tarea->encargado_id);
                        $colaborador->horas_gastadas += $tarea->tiempo_real;

                        $area = Area::findOrFail($tarea->areas_id);
                        $area->horas_consumidas +=$tarea->tiempo_real;

                        $colaborador->update();
                        $area->update();


                      } else {
                        // Restar horas al mes correspondiente
                        $colaborador = User::findOrFail($tarea->encargado_id);
                        $Historico_equipo = Historico_equipo::where('entidad_id',$tarea->encargado_id)
                        ->where('tipo_de_entidad',1)
                        ->whereYear('created_at', $fecha_tarea->year)
                        ->whereMonth('created_at', $fecha_tarea->month+1)
                        ->first();

                        // Usuario en el historico
                        $Historico_equipo->horas_gastadas += $tarea->tiempo_real;
                        $Historico_equipo->update();

                        // Restar horas al Área correspondiente
                        // Área en el historico
                        $Historico_equipo = Historico_equipo::where('entidad_id',$tarea->areas_id)
                        ->where('tipo_de_entidad',2)
                        ->whereYear('created_at', $fecha_tarea->year)
                        ->whereMonth('created_at', $fecha_tarea->month+1)
                        ->first();

                        $Historico_equipo->horas_gastadas += $tarea->tiempo_real;
                        $Historico_equipo->update();
                        // $queries = DB::getQueryLog();
                        // log::info("-- query",[ $queries]);

                      }
                        // Sume Horas Reales en Tiempos_x_area
                        $horas_area = Tiempos_x_Area::where('ots_id',$tarea->ots_id)
                        ->where('areas_id',$tarea->areas_id)
                        ->first();

                        if (!is_null($tarea->tiempo_real) && $tarea->tiempo_real >=0) {

                            if ( $horas_area->tiempo_real + $tarea->tiempo_real > $horas_area->tiempo_estimado_ot) {
                                $area = Area::findOrFail($tarea->areas_id);
                                User::findOrFail($tarea->usuarios_id)
                                ->notify(new OtExcedeTiempo($makerBefore,$horas_area->ots,$area));
                            }
                            $horas_area->tiempo_real +=$tarea->tiempo_real;
                            $horas_area->save();
                        }else{
                            DB::rollback();
                            return response([
                                'status' => Response::HTTP_BAD_REQUEST,
                                'response_time' => microtime(true) - LARAVEL_START,
                                'msg' => 'Tiempo real es vacio o nulo',
                                'error' => config('constants.ERR_06'),
                                'tarea' =>$tarea,
                            ],Response::HTTP_BAD_REQUEST);
                        }

                    } catch (Exception $e) {
                        DB::rollback();
                        return response([
                            'status' => Response::HTTP_BAD_REQUEST,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'msg' => 'No se guardaron correctamente las horas.',
                            'error' => config('constants.ERR_04'),
                            'consola' =>$e->getMessage(),
                            'tarea' =>$tarea,
                        ],Response::HTTP_BAD_REQUEST);
                    }

                }

                //Guardamos la tarea
               $tarea->update();

                //Guardamos el comentario
                $comentario = new Comentario;
                $comentario->fill($request->all());
                $comentario->save();


                //Guardar en el historial
                $tarea_historico = new Historico_Tarea;
                $data['tiempo_estimado']=$tarea->tiempo_estimado;
                $data['tiempo_real']=$tarea->tiempo_real;
                $data['comentarios_id']=$comentario->id;
                $data['encargado_id']=$tarea->encargado_id;
                $data['estados_id']=$tarea->estados_id;
                $data['usuarios_id']=$tarea->usuarios_id;
                $data['tareas_id']=$tarea->id;

                //Guarda en Historico la fecha entrega area y cuentas si el estado es programado, si no pone null
                if($tarea->estados_id==3){
                    $data['fecha_entrega_area']=$request->fecha_entrega_area;
                    $data['fecha_entrega_cuentas']=$request->fecha_entrega_cuentas;
                }else{
                    $data['fecha_entrega_area']=null;
                    $data['fecha_entrega_cuentas']=null;
                }
                $data['editor_id']=Auth::user()->id;
                $tarea_historico->fill($data);
                $tarea_historico->save();

                //Respuesta
                $respuesta['dato']=$tarea;
                $respuesta['user_coment']='';
                $respuesta['historico']=$comentario->id;
                $respuesta["error"]=0;
                $respuesta["mensaje"]="OK";
                $respuesta["msg"]="Asignado con exito";
                $respuesta["usuario"]=$encargado_area;
                $respuesta["tarea_historico"]=$tarea_historico;

                // $respuesta["horas"]=$horas_area;
                foreach ($tarea->comentario as $key => $value) {
                    if ($value->user->id==$request->usuarios_comentario_id) {
                        $respuesta['user_coment']=$value;
                        $value->estados;
                    }
                }



                /**
                *
                * Recibe el estado de la tarea y envia la notificacion
                * al usuario correspondiente
                *
                * 1 - OK
                * 20 - Entregado
                * 2 - Realizada
                * 3 - Programada
                * 4 - Atencion Cuentas
                * 5 - Atencion Area
                * 6 - Espera
                * 7 - Pendiente
                */
                switch ($tarea->estados_id) {
                    case '1':
                    // Enviar notificacion al nuevo encargado
                    // $encargado_area= User::where('roles_id',4)
                    // ->where('areas_id', $tarea->areas_id)
                    // ->first();
                    // User::findOrFail($tarea->usuarios_id)
                    // ->notify(new TareaOk($encargado_area,$tarea));
                    break;
                    case '2':
                    $encargado_area= User::where('roles_id',4)
                    ->where('areas_id', $tarea->areas_id)
                    ->first();
                    // Enviar notificacion al nuevo encargado
                    User::findOrFail($encargado_area->id)
                    ->notify(new TareaRealizada($makerBefore,$tarea));
                    break;
                    case '3':
                    // Enviar notificacion al nuevo encargado
                    User::findOrFail($tarea->encargado_id)
                    ->notify(new TareaProgramada($makerBefore,$tarea));

                    $email=  User::findOrFail($tarea->encargado_id);
                    //Programar en Calendar
                    $calendar= array();
                    $fechas =$request->datos_fechas[0];
                    if($fechas['fin_programada']['time'] !="" && $fechas['inicio_programada']['time'] != "") {
                        try {
                            $calendar =$this->programarCalendar(Auth::user(),$tarea['nombre_tarea'],strip_tags($tarea['descripcion']),$request->datos_fechas,$email->email);
                            $tarea->id_evento=json_encode($calendar[0]);
                            $tarea->fecha_inicio_programar=json_encode($calendar[1]);
                            $tarea->fecha_fin_programar=json_encode($calendar[2]);
                            // return $tarea;
                            $tarea->save();
                            //DB::commit();
                        } catch (Exception $e) {
                            DB::rollback();
                            return response([
                                'status' => Response::HTTP_BAD_REQUEST,
                                'response_time' => microtime(true) - LARAVEL_START,
                                'msg' => 'Error al actualizar la tarea. No se pudo programar en el calendar.',
                                'error' => config('constants.ERR_04'),
                                'tarea' =>$tarea,
                                'consola' =>$e->getMessage(),
                                'calendar' =>$calendar,
                            ],Response::HTTP_BAD_REQUEST);
                        }
                    }
                    break;
                    case '4':
                    // Enviar notificacion al nuevo encargado
                    User::findOrFail($tarea->usuarios_id)
                    ->notify(new TareaAtencionCuentas($makerBefore,$tarea));
                    break;
                    case '5':
                    // Enviar notificacion al nuevo encargado
                    $sender = User::findOrFail(Auth::user()->id);
                    User::findOrFail($tarea->encargado_id)
                    ->notify(new TareaAtencionArea($sender,$tarea));
                    break;
                    case '6':
                      // En Espera
                    break;
                    case '7':
                    // Creador de la solicitud - Ejecutiva
                    $maker = User::findOrFail($tarea->usuarios_id);

                    // Enviar notificacion al nuevo encargado
                    User::findOrFail($tarea->encargado_id)->notify(new TareaPendiente($maker,$tarea));
                    break;

                    case '20':
                    // Entregado
                    $encargado_area= User::where('roles_id',4)
                    ->where('areas_id', $tarea->areas_id)
                    ->first();
                    // Enviar notificacion al nuevo encargado
                    User::findOrFail($tarea->usuarios_id)
                    ->notify(new TareaEntregada($encargado_area,$tarea));
                    break;

                    default:
                    DB::rollback();
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'msg' => 'Error al actualizar la tarea. No se envio la notificación',
                        'error' => config('constants.ERR_04'),
                        'tarea' =>$tarea,
                        'request' =>$request,
                    ],Response::HTTP_BAD_REQUEST);
                    break;
                }
                DB::commit();
            }catch(Exception $e){
                DB::rollback();
                $respuesta["error"]="Error datos incorrectos";
                $respuesta["codigo_error"]="Error con la tarea";
                $respuesta["mensaje"]="Error con la tarea";
                $respuesta['error'] = config('constants.ERR_04');
                // $respuesta["tarea_historico"]=$tarea_historico;
                $respuesta["consola"]=$e->getMessage();
                $respuesta["msg"]="Error  datos incorrectos";
                $respuesta["request"]=$request->all();
                $respuesta["ids"]=Auth::user()->id;


        }
    }
    return response()->json($respuesta);
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
    try {
        $tarea = Tarea::find($id);

        $tarea->delete();
        return response([
            'status' => Response::HTTP_OK,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Tarea eliminada con exito.',
            'tarea' =>$tarea,
        ],Response::HTTP_OK);
    } catch (Exception $e) {
        return response([
            'status' => Response::HTTP_BAD_REQUEST,
            'response_time' => microtime(true) - LARAVEL_START,
            'msg' => 'Error al eliminar la tarea.',
            'error' => config('constants.ERR_04'),
            'consola' =>$e->getMessage(),
            'tarea' =>$tarea,
            'request' =>$request,
        ],Response::HTTP_BAD_REQUEST);
    }

}
/**
* Mostrar todas las tareas de un Área con Datatable.
*
* @param  int  $id [Área]
* @param  \Illuminate\Http\Request  $request
* @return \Illuminate\Http\Response
*/
public function showAllTareas($id,Request $request)
{
    $output= array();
    // Si no trae el mes y año en el $request
    // tomar el mes y el año actual
    $year = '';
    $month = '';
    $now = Carbon::now();
    if ($request->has('year')) {
        $year = $request->get('year');
    }else{
        $year = $now->year;
    }
    if ($request->has('month')) {
        $month = $request->get('month');
    }else{
        $month = $now->month;
    }
    $tarea = Tarea::with(['ot' => function ($query) {
        // Tareas activas
        $query->where('estado', 1);
    },'ot.cliente','usuarioencargado'=> function ($query){

   $query->addselect('*');
   $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

 },'estado' => function ($query) use ($request,$id) {
        if ($request->has('estados')) {
            $query->whereIn('id',$request->get('estados'));
        }
        if($id == -1){
            $estado_programado= Estado::where('nombre','Programado')->first();
            $query->where('id', '=', $estado_programado->id);
        }
    },'area' => function ($query) use ($id) {
        if($id != -1){
            $query->where('id', '=', $id);
        }
    }])
    ->whereYear('created_at', $year)
    ->whereMonth('created_at', $month)
    ->get();

    // selecciona solos los que tiene el area especifico
    foreach ($tarea as $key => $value) {
        if ($value->area && $value->ot && $value->ot->cliente && $value->estado ) {
            array_push($output, $value);
        }
    }
    // Se conviert en collection para que lo reciba el Datatable
    $output = collect($output);
    return Datatables::of($output)
    ->editColumn('created_at', function ($tarea) {
        return $tarea->getFormatFecha($tarea->created_at);
    })
    ->editColumn('ot.referencia', function ($tarea) {
          return '<span title="'.$tarea->ot->nombre.' " >'.$tarea->ot->referencia.'</span>';
    })
    ->editColumn('fecha_entrega_cuentas', function ($tarea) {
        return (!is_null($tarea->fecha_entrega_cuentas)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_cuentas) : 'No definida' ;
    })
    ->editColumn('fecha_entrega_cliente', function ($tarea) {
        return (!is_null($tarea->fecha_entrega_cliente)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_cliente) : 'No definida' ;
    })
    ->addColumn('encargado', function ($tarea) {
          return $tarea->usuarioencargado->full_name;
    })
    ->addColumn('prioridad', function ($tarea) {
        return '<span class="label label-estado estado-'.$tarea->Estado_prioridad->tipos_estados_id.'-'.$tarea->Estado_prioridad->id.' ">'.$tarea->Estado_prioridad->nombre.'</span>';
    })
    ->addColumn('estado', function ($tarea) {
        return '<span class="label label-estado estado-'.$tarea->estado->tipos_estados_id.'-'.$tarea->estado->id.' ">'.$tarea->estado->nombre.'</span>';
    })
    ->addColumn('acciones', function ($tarea) {
        // $editar_ot=(Auth::user()->can('editar_ots') )?'<a href="editar/'.$tarea->id.'" title="Editar Ot"  class="btn-info btn-flat btn-block" aria-label="View"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>':'';
        $editar_ot= '';
        if (
            (Auth::user()->can('borrar_tarea') && Auth::user()->id  == $tarea->usuarios_id && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
            || (Auth::user()->hasRole('owner') && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
            || (Auth::user()->hasRole('desarrollo')&& ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
            )
            {
                $editar_ot='<a href="#" id="cli-'.$tarea->id.'" title="Borrar tarea"  class="delete_cliente btn-danger btn-flat btn-block" aria-label="Borrar" data-toggle="modal" data-target="#myModal"><i class="fa fa-trash" aria-hidden="true"></i></a>';
            }
            $ver_tarea = '<a href="'.url('/').'/ver_tarea/'.$tarea->id.'" title="Ver Tarea" class="btn btn-primary btn-xs btn-flat btn-block" aria-label="View"><i class="fa fa-eye" aria-hidden="true"></i></a>';
            return $ver_tarea.$editar_ot;
        })
        ->make(true);

    }

    /**
* Mostrar todas las tareas de un Área con Datatable.
*
* @param  int  $id [Área]
* @param  \Illuminate\Http\Request  $request
* @return \Illuminate\Http\Response
*/
public function showAllTareasbyCliente($id,Request $request)
{
    $output= array();
    // Si no trae el mes y año en el $request
    // tomar el mes y el año actual
    $year = '';
    $month = '';
    $now = Carbon::now();
    if ($request->has('year')) {
        $year = $request->get('year');
    }else{
        $year = $now->year;
    }
    if ($request->has('month')) {
        $month = $request->get('month');
    }else{
        $month = $now->month;
    }
    $tarea = Tarea::with(['ot' => function ($query) {
        // Tareas activas
        $query->where('estado', 1);
    },'ot.cliente','usuarioencargado'=> function ($query){

   $query->addselect('*');
   $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

 },'estado' => function ($query) use ($request,$id) {
        if ($request->has('estados')) {
            $query->whereIn('id',$request->get('estados'));
        }
        if($id == -1){
            $estado_programado= Estado::where('nombre','Programado')->first();
            $query->where('id', '=', $estado_programado->id);
        }
    },'area','requerimientos_cliente' => function ($query) use ($id) {
        if($id != -1){
            $query->where('usuarios_id', $id);
        }
    }])
    ->whereYear('created_at', $year)
    ->whereMonth('created_at', $month)
    ->get();

    // selecciona solos los que tiene el area especifico
    foreach ($tarea as $key => $value) {
        if ($value->area && $value->ot && $value->ot->cliente && $value->estado ) {
            if ( !is_null(Auth::user()->clientes_id) && Auth::user()->clientes_id == $value->ot->cliente->user_id) {
              array_push($output, $value);
            }
        }
    }
    // Se conviert en collection para que lo reciba el Datatable
    $output = collect($output);
    return Datatables::of($output)
    ->editColumn('created_at', function ($tarea) {
        return $tarea->getFormatFecha($tarea->created_at);
    })
    ->editColumn('ot.referencia', function ($tarea) {
          return '<span title="'.$tarea->ot->nombre.' " >'.$tarea->ot->referencia.'</span>';
    })
    // ->editColumn('fecha_entrega_cuentas', function ($tarea) {
    //     return (!is_null($tarea->fecha_entrega_cuentas)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_cuentas) : 'No definida' ;
    // })
    // ->editColumn('fecha_entrega_cliente', function ($tarea) {
    //     return (!is_null($tarea->fecha_entrega_cliente)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_cliente) : 'No definida' ;
    // })
    ->editColumn('updated_at', function ($tarea) {
        return $tarea->getFormatFecha($tarea->updated_at);
    })
    ->addColumn('encargado', function ($tarea) {
          return $tarea->usuarioencargado->full_name;
    })
    ->addColumn('prioridad', function ($tarea) {
        return '<span class="label label-estado estado-'.$tarea->Estado_prioridad->tipos_estados_id.'-'.$tarea->Estado_prioridad->id.' ">'.$tarea->Estado_prioridad->nombre.'</span>';
    })
    ->addColumn('estado', function ($tarea) {
        return '<span class="label label-estado estado-'.$tarea->estado->tipos_estados_id.'-'.$tarea->estado->id.' ">'.$tarea->estado->nombre.'</span>';
    })
    ->addColumn('acciones', function ($tarea) {
        // $editar_ot=(Auth::user()->can('editar_ots') )?'<a href="editar/'.$tarea->id.'" title="Editar Ot"  class="btn-info btn-flat btn-block" aria-label="View"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>':'';
        $editar_ot= '';
        if (
            (Auth::user()->can('borrar_tarea') && Auth::user()->id  == $tarea->usuarios_id && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
            || (Auth::user()->hasRole('owner') && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
            || (Auth::user()->hasRole('desarrollo')&& ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
            )
            {
                $editar_ot='<a href="#" id="cli-'.$tarea->id.'" title="Borrar tarea"  class="delete_cliente btn-danger btn-flat btn-block" aria-label="Borrar" data-toggle="modal" data-target="#myModal"><i class="fa fa-trash" aria-hidden="true"></i></a>';
            }
            $ver_tarea = '<a href="'.url('/').'/ver_tarea/'.$tarea->id.'" title="Ver Tarea" class="btn btn-primary btn-xs btn-flat btn-block" aria-label="View"><i class="fa fa-eye" aria-hidden="true"></i></a>';
            return $ver_tarea.$editar_ot;
        })
        ->make(true);

      

    }
    /**
    * Mostrar todas las tareas de un Área con Datatable.
    *
    * @param  int  $id [Área]
    * @param  \Illuminate\Http\Request  $request
    * @return \Illuminate\Http\Response
    */
    public function showTareasByFase(Request $request)
    {
        $output= array();
        /*$tarea= Tarea::all()->where('planeacion_fases_id',19);
        return response()->json($tarea);
        */
        // Si no trae el mes y año en el $request
        // tomar el mes y el año actual
        $year = '';
        $month = '';
        $fase ='';
        $now = Carbon::now();
        if ($request->has('year')) {
            $year = $request->get('year');
        }else{
            $year = $now->year;
        }
        if ($request->has('month')) {
            $month = $request->get('month');
        }else{
            $month = $now->month;
        }
        if($request->has('fases')){
            $fases = array($request->get('fases'));
        }else {
            $fases= Planeacion_fase::where('planeacion_tipos_id',10) ->select('id')->get();
            //return response()->json($fases);
            //$fases =  array( 18,19 );
        }
        $id=-1;
        $tarea = Tarea::with(['ot' => function ($query) {
            // Tareas activas
            $query->where('estado', 1);
        },'ot.cliente','usuarioencargado'=> function ($query){

       $query->addselect('*');
       $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

     },'estado' => function ($query) use ($request,$id) {
            if ($request->has('estados')) {
                $query->whereIn('id', $request->get('estados'));
            }/*else
            if($id == -1){
                $estado_programado= Estado::where('nombre','Pendiente')->first();
                $query->where('id', '=', 7);
            }*/

        },'planeacion_fase'])
        ->whereIn('planeacion_fases_id',$fases )
        ->whereYear('created_at', $year)
        ->whereMonth('created_at', $month)
        ->get();

        // selecciona solos los que tiene el area especifico
        foreach ($tarea as $key => $value) {
            if ($value->area && $value->ot && $value->ot->cliente && $value->estado ) {
                array_push($output, $value);
            }
        }
        // Se conviert en collection para que lo reciba el Datatable
        $output = collect($output);
        return Datatables::of($output)
        ->editColumn('created_at', function ($tarea) {
            return  $tarea->getFormatFecha($tarea->created_at);
        })
        ->addColumn('fases', function ($tarea) {
            return $tarea->planeacion_fase->nombre;
        })
        ->editColumn('fecha_entrega_cuentas', function ($tarea) {
            return (!is_null($tarea->fecha_entrega_cuentas)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_cuentas) : 'No definida' ;
        })
        ->editColumn('fecha_entrega_cliente', function ($tarea) {
            return (!is_null($tarea->fecha_entrega_cliente)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_cliente) : 'No definida' ;
        })
        ->editColumn('tiempo_real', function ($tarea) {
            return (!is_null($tarea->tiempo_real)) ? $tarea->tiempo_real : 'No definido' ;
        })
        ->addColumn('encargado', function ($tarea) {
            return $tarea->usuarioencargado->full_name;
        })
        ->addColumn('prioridad', function ($tarea) {
            return '<span class="label label-estado estado-'.$tarea->Estado_prioridad->tipos_estados_id.'-'.$tarea->Estado_prioridad->id.' ">'.$tarea->Estado_prioridad->nombre.'</span>';
        })
        ->addColumn('estado', function ($tarea) {
            return '<span class="label label-estado estado-'.$tarea->estado->tipos_estados_id.'-'.$tarea->estado->id.' ">'.$tarea->estado->nombre.'</span>';
        })
        ->addColumn('acciones', function ($tarea) {
            // $editar_ot=(Auth::user()->can('editar_ots') )?'<a href="editar/'.$tarea->id.'" title="Editar Ot"  class="btn-info btn-flat btn-block" aria-label="View"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>':'';
            $editar_ot= '';
            if (
                (Auth::user()->can('borrar_tarea') && Auth::user()->id  == $tarea->usuarios_id && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
                || (Auth::user()->hasRole('owner') && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
                || (Auth::user()->hasRole('desarrollo')&& ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
                )
                {
                    $editar_ot='<a href="#" id="cli-'.$tarea->id.'" title="Borrar tarea"  class="delete_cliente btn-danger btn-flat btn-block" aria-label="Borrar" data-toggle="modal" data-target="#myModal"><i class="fa fa-trash" aria-hidden="true"></i></a>';
                }
                $ver_tarea = '<a href="'.url('/').'/ver_tarea/'.$tarea->id.'" title="Ver Tarea" class="btn btn-primary btn-xs btn-flat btn-block" aria-label="View"><i class="fa fa-eye" aria-hidden="true"></i></a>';
                return $ver_tarea.$editar_ot;
            })
            ->make(true);

        }

        public function exportar_informe_soporte($estado,$fase,$year,$month){

            $output= array();
            /*$tarea= Tarea::all()->where('planeacion_fases_id',19);
            return response()->json($tarea);
            */
            // Si no trae el mes y año en el $request
            // tomar el mes y el año actual

            $now = Carbon::now();

            if ($year =='null') {
                $year = $now->year;
            }
            if ($month =='null') {
                $month = $now->month;
            }
            if($fase != 'null'){
                $fases = array($fase);
            }else {
                $fases= Planeacion_fase::where('planeacion_tipos_id',10) ->select('id')->get();
            }
            $id=-1;
            $tarea = Tarea::with(['ot' => function ($query) {
                // Tareas activas
                $query->where('estado', 1);
            },'ot.cliente','usuarioencargado','estado' => function ($query) use ($estado,$id) {
                if ($estado !='null') {
                  $estado = explode(',',$estado);
                    $query->whereIn('id',$estado);
                }/*else if($id == -1)
                {
                    $estado_programado= Estado::where('nombre','Pendiente')->first();
                    $query->where('id', '=', 7);
                }*/

            },'planeacion_fase'])
            ->whereIn('planeacion_fases_id',$fases )
            ->whereYear('created_at', $year)
            ->whereMonth('created_at', $month)
            ->get();

            // selecciona solos los que tiene el area especifico
            foreach ($tarea as $key => $value) {
                if ($value->area && $value->ot && $value->ot->cliente && $value->estado ) {
                    array_push($output, $value);
                }
            }
            $tareasDescripcion = [];
            foreach($output as $tarea){
                array_push( $tareasDescripcion, array($tarea['ot']['referencia'],$tarea['ot']['cliente']['nombre'],
                $tarea['nombre_tarea'], $tarea['planeacion_fase']['nombre'],$tarea->getFormatFecha($tarea['created_at']),
                $tarea->getFormatFecha($tarea['fecha_entrega_cuentas']),
                $tarea['usuarioencargado']['nombre'].' '.$tarea['usuarioencargado']['apellido'],
                number_format( $tarea['tiempo_estimado'],2,",","."),
                number_format($tarea['tiempo_real'],2,",","."),
                number_format( $tarea['tiempo_mapa_cliente'],2,",","."),
                $tarea['estado']['nombre']

                ) );
            }
            // Se conviert en collection para que lo reciba el Datatable
            //$output = collect($output);

            //return response()->json($tareasDescripcion);
            Excel::create( 'Informe Soporte -Mes '.$tarea->getFormatMes('1997-'.$month.'-18').' -Año '.$year, function($excel) use($tareasDescripcion)  {

                $excel->setTitle('Informe Soporte');
                $excel->setCreator('Gestor de proccesos')->setCompany('Himalaya');
                $excel->setDescription('Informe Soporte');
                $excel->sheet('Informe', function($sheet) use($tareasDescripcion)  {

                $headings = array('OT','Cliente','Requerimiento','Fase','Fecha de solicitud','Fecha de entrega cuentas','Encargado','Tiempo Estimado','Tiempo Real','Tiempo Mapa Cliente','Estado');
                $sheet->prependRow(1, $headings);
                $sheet->fromArray($tareasDescripcion, null, 'A2', false, false);
                $sheet->setBorder('A2:K15', 'thin');


                    $sheet->cells('A1:K1', function($cells) {
                        $cells->setAlignment('center');
                        $cells->setFont(array(
                            'family'     => 'Ubuntu',
                            'size'       => '12',
                            'bold'       =>  true
                        ));
                        $cells->setBackground('#002e60');
                        $cells->setFontColor('#ffffff');
                    });
                    $sheet->setBorder('A1:K1', 'thin');

            });

        })->download('xls');



        }


        public function showOneTarea($id)
        {
            $tarea = Tarea::with(['ot.cliente','ot.usuario', 'estado', 'estado_prioridad','planeacion_fase','area','usuario','usuarioencargado'])->where('id',$id)->first();

            $descripcion=$tarea->descripcion;
            $comentario=$tarea->comentario;

            $tarea->descripcion="";
            $tarea->comentario="";

            $tarea->fecha_inicio_programar=json_decode($tarea->fecha_inicio_programar);
            $tarea->fecha_fin_programar=json_decode($tarea->fecha_fin_programar);
            //return response()->json($tarea);
            return view('admin.tareas.ver_tarea')->with('tareainfo',$tarea)->with('desctarea',$descripcion);
        }

        public function getComments($id)
        {
          $comentarios = Comentario::with(['user','estados'])->where('tareas_id',$id)->get();
          return ($comentarios);
        }

        /**
        * Traer la primera tarea
        **/
        public function getFirstTarea()
        {
            $tarea = Tarea::orderBy('created_at')->first();
            return $tarea;
        }

        /**
        * Traer años de las tareas
        **/
        public function getYearTarea()
        {
            $years = array();
            $firstTarea = $this->getFirstTarea();
            $tarea = Tarea::orderBy('created_at', 'desc')->first();
            if($tarea != null ){
                $lastYear = Carbon::instance($tarea->created_at)->year;
                $firstYear = Carbon::instance($firstTarea->created_at)->year;
                for ($i=$firstYear; $i <=  $lastYear; $i++) {
                    array_push($years, (string)$i);
                }
                return $years;
            }
            return [];
        }
        /**
        * Traer semanas del año
        **/
        public function getWeekYear()
        {
            $week = array();
            $current_week = Carbon::now()->weekOfYear;
            for ($i=1; $i <=  $current_week; $i++) {
                array_push($week, (string)$i);
            }
            return $week;
            // $start = Carbon::now()->startOfWeek();
            // $end = Carbon::now()->endOfWeek();
            // return [$start->format('y-m-d : H-m-s'),$end->format('y-m-d  H-m-s')];
        }
        public function getTrafico(Request $request)
    {

      $output= array();
      // Si no trae fecha de inicio y f_final
      // toma la semana actual
      $f_inicio = '';
      $f_final = '';
      $now = Carbon::now();
      if ($request->has('f_inicio')) {
          $f_inicio = $request->get('f_inicio');
      }else{
          $f_inicio = $now->startOfWeek()->format('y-m-d H-m-s');
      }
      if ($request->has('f_final')) {
          $f_final = $request->get('f_final');
      }else{
          $f_final = $now->endOfWeek()->format('y-m-d H-m-s');
      }
      $tarea = Tarea::with(['ot' => function ($query) {
          // Tareas activas
          $query->where('estado', 1);
      },'ot.cliente','usuarioencargado' => function ($query){

        $query->addselect('*');
        $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

      },'estado' => function ($query) {
          $query->where('id', '=',3)->orWhere('id', '=', 2)->orWhere('id', '=',1)->orWhere('id', '=',20);
      },'area','usuario'])
      ->whereBetween('fecha_entrega_cuentas',array($f_inicio,$f_final));

      if($request->get('estados')) {
        $tarea->where('estado_trafico_id',$request->get('estados'));
      }
       $tarea=$tarea->get();

      // selecciona solos los que tiene el area especifico
      foreach ($tarea as $key => $value) {
          if (!is_null($value->area) && !is_null($value->ot) && !is_null($value->ot->cliente) && !is_null($value->estado) ) {
              array_push($output, $value);
          }
      }
      // Se conviert en collection para que lo reciba el Datatable
      $output = collect($output);
      return Datatables::of($output)
      ->addColumn('ejecutivo', function ($tarea) {
        return $tarea->usuario->nombre[0].$tarea->usuario->apellido[0];
      })
      ->addColumn('encargado', function ($tarea) {
        return $tarea->usuarioencargado->full_name;
      })
      ->addColumn('estado', function ($tarea) {
        return '<span class="label label-estado estado-'.$tarea->estado->tipos_estados_id.'-'.$tarea->estado->id.' ">'.$tarea->estado->nombre.'</span>';
      })
      ->addColumn('estados_trafico', function ($tarea) {
          // Llenar select con estados del trafico
          $options ='<option value="" >Seleccione un estado</option>';
          $estados = Estado::where('tipos_estados_id',4)->get();
          foreach ($estados as $key => $value) {
            // seleccionar valor de la BD
            $selected = ($tarea->estado_trafico_id == $value->id) ? "selected" :"";
            $options .= '<option value="'.$value->id.'" '.$selected.'>'.$value->nombre.'</option>';
          }
          $select = '<select name="estados_trafico'.$tarea->id.'" id="estados_trafico'.$tarea->id.'" class="form-control">'.$options.'</select>';
          return $select;
      })
      ->addColumn('comentario', function ($tarea) {
        return '<textarea id="comentario'.$tarea->id.'" class="form-control" rows="4" cols="40">'.$tarea->comentario_trafico.'</textarea>';
      })
      ->addColumn('actions', function ($tarea) {
        // Permisos para acciones de trafico
        $ver_tarea = (Auth::user()->can('ver_trafico') )?'<a href="'.url('/').'/ver_tarea/'.$tarea->id.'" class="btn btn-primary btn-xs btn-flat btn_accion" aria-label="Ver Tarea" title="Ver Tarea"><i class="fa fa-file-text" aria-hidden="true"></i></a>':'';
        $ver_ot = (Auth::user()->can('ver_ots') )?'<a href="'.url('/').'/ots/visualizar/'.$tarea->ot->id.'" class="btn btn-primary btn-xs btn-flat btn_accion" aria-label="Ver OT"  title="Ver OT"><i class="fa fa-eye" aria-hidden="true"></i></a>':'';
        $guardar_tarea = (Auth::user()->can('editar_trafico') )?'<button id="'.$tarea->id.'" class="save_trafic btn btn-success btn-default btn-block btn-flat" aria-label="Guardar"  title="Guardar"><i class="fa fa-floppy-o" aria-hidden="true"></i></button>':'';
        return $ver_tarea.$ver_ot.$guardar_tarea;
      })
      ->editColumn('created_at', function ($tarea) {
          return $tarea->created_at->format('d-M-Y');
      })
      ->editColumn('fecha_entrega_area', function ($tarea) {
          return (!is_null($tarea->fecha_entrega_area)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_area) : 'No definida' ;
      })
      ->editColumn('fecha_entrega_cuentas', function ($tarea) {
          return (!is_null($tarea->fecha_entrega_cuentas)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_cuentas) : 'No definida' ;
      })
      // ->filterColumn('usuarioencargado.nombre', function ($query, $keyword) {
      //   $query->whereRaw("CONCAT(usuarioencargado.nombre,' ',usuarioencargado.apellido) like ?", ["%{$keyword}%"]);
      // })
      ->make(true);
    }

         public function ActualizarFechaRealTarea(Request $request, $id)
            {
              $tarea  = Tarea::findOrFail($id);
                if ($request->has('fecha_entrega_cliente_real')) {
                $tarea->fecha_entrega_cliente_real = $request->input('fecha_entrega_cliente_real');
               }
              try {
                $tarea->save();
                return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Tarea actualizada.',
                    'tarea' =>$tarea,
                    ],Response::HTTP_OK);
              } catch (Exception $e) {
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al actualizar la tarea.',
                    'error' => config('constants.ERR_04'),
                    'consola' =>$e->getMessage(),
                    'tarea' =>$tarea,
                    'request' =>$request,
                    ],Response::HTTP_BAD_REQUEST);
              }

            }
    public function getTraficoTareas(Request $request)
    {

    $output= array();
    // Si no trae fecha de inicio y f_final
    // toma la semana actual
    $f_inicio = '';
    $f_final = '';
    $now = Carbon::now();
    if ($request->has('f_inicio')) {
      $f_inicio = $request->get('f_inicio');
    }else{
      $f_inicio = $now->startOfWeek()->format('y-m-d H-m-s');
    }
    if ($request->has('f_final')) {
      $f_final = $request->get('f_final');
    }else{
      $f_final = $now->endOfWeek()->format('y-m-d H-m-s');
    }
    $tarea = Tarea::with(['ot' => function ($query) {
      // Tareas activas
      $query->where('estado', 1);
    },'ot.cliente','usuarioencargado' => function ($query){
    $query->addselect('*');
    $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));
    },'estado' => function ($query) use ($request) {
           if ($request->has('estados')) {
               $query->where('id',5);
           }
       },'area','usuario'])
    ->whereBetween('created_at',array($f_inicio,$f_final))
    ->get();

    // selecciona solos los que tiene el area especifico
    foreach ($tarea as $key => $value) {
      if (!is_null($value->area) && !is_null($value->ot) && !is_null($value->ot->cliente) && !is_null($value->estado) ) {
          array_push($output, $value);
      }
    }
    // Se conviert en collection para que lo reciba el Datatable
    $output = collect($output);
    return Datatables::of($output)
    ->addColumn('ejecutivo', function ($tarea) {
    return $tarea->usuario->nombre[0].$tarea->usuario->apellido[0];
    })
    ->addColumn('encargado', function ($tarea) {
    return $tarea->usuarioencargado->full_name;
    })
    ->addColumn('estado', function ($tarea) {
    return '<span class="label label-estado estado-'.$tarea->estado->tipos_estados_id.'-'.$tarea->estado->id.' ">'.$tarea->estado->nombre.'</span>';
    })
    ->addColumn('actions', function ($tarea) {
    // Permisos para acciones de trafico
    $editar_ot='';
    if (
        (Auth::user()->can('borrar_tarea') && Auth::user()->id  == $tarea->usuarios_id && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
        || (Auth::user()->hasRole('owner') && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
        || (Auth::user()->hasRole('desarrollo')&& ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
        )
        {
            $editar_ot='<a href="#" id="cli-'.$tarea->id.'" title="Borrar tarea"  class="delete_cliente btn-danger btn-flat btn-block" aria-label="Borrar" data-toggle="modal" data-target="#myModal"><i class="fa fa-trash" aria-hidden="true"></i></a>';
        }
    $ver_tarea = (Auth::user()->can('ver_trafico') )?'<a href="'.url('/').'/ver_tarea/'.$tarea->id.'" class="btn btn-primary btn-xs btn-flat btn_accion" aria-label="Ver Tarea" title="Ver Tarea"><i class="fa fa-file-text" aria-hidden="true"></i></a>':'';
    $ver_ot = (Auth::user()->can('ver_ots') )?'<a href="'.url('/').'/ots/visualizar/'.$tarea->ot->id.'" class="btn btn-primary btn-xs btn-flat btn_accion" aria-label="Ver OT"  title="Ver OT"><i class="fa fa-eye" aria-hidden="true"></i></a>':'';
    return $ver_tarea.$ver_ot.$editar_ot;
    })
    ->editColumn('created_at', function ($tarea) {
      return $tarea->created_at->format('d-M-Y');
    })
    ->editColumn('fecha_entrega_area', function ($tarea) {
      return (!is_null($tarea->fecha_entrega_area)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_area) : 'No definida' ;
    })
    ->editColumn('fecha_entrega_cuentas', function ($tarea) {
      return (!is_null($tarea->fecha_entrega_cuentas)) ? $tarea->getFormatFecha( $tarea->fecha_entrega_cuentas) : 'No definida' ;
    })
    // ->filterColumn('usuarioencargado.nombre', function ($query, $keyword) {
    //   $query->whereRaw("CONCAT(usuarioencargado.nombre,' ',usuarioencargado.apellido) like ?", ["%{$keyword}%"]);
    // })
    ->make(true);
    }


            /**
             * Actualizar campos de Trafico.
             *
             * @param  \Illuminate\Http\Request  $request
             * @param  int  $id
             * @return \Illuminate\Http\Response
             */
            public function saveTrafic(Request $request, $id)
            {
              $tarea  = Tarea::findOrFail($id);
              if ($request->has('comentario')) {
                $tarea->comentario_trafico = $request->input('comentario');
              }
              if ($request->has('estado_trafico')) {
                $tarea->estado_trafico_id = $request->input('estado_trafico');
              }
              try {
                $tarea->save();
                return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Tarea actualizada.',
                    'tarea' =>$tarea,
                    ],Response::HTTP_OK);
              } catch (Exception $e) {
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al actualizar la tarea.',
                    'error' => config('constants.ERR_04'),
                    'consola' =>$e->getMessage(),
                    'tarea' =>$tarea,
                    'request' =>$request,
                    ],Response::HTTP_BAD_REQUEST);
              }

            } 



         



        /**
        * Validar Crear Tarea
        **/
        protected function validatorCrearTarea(array $data)
        {
            return Validator::make($data, [
                'nombre_tarea' => 'required|min:4',
                'descripcion' => 'required|min:4',
                'enlaces_externos' => 'nullable|min:4',
                'tiempo_estimado' => 'min:4|numeric',
                'tiempo_real' => 'min:4|numeric',
                'tiempo_mapa_cliente' => 'nullable|numeric',
                'estados_id' => 'required',
                'areas_id' => 'required',
                'usuarios_id' => 'required',
                'ots_id' => 'required',
                'encargado_id' => 'required',
                'planeacion_fases_id' => 'required',
                'prioridad_id' => 'required',
            ], $this->messages());
        }

        /**
        * Validar Asignar tarea
        **/
        protected function validatorAsignarTarea(array $data)
        {
            return Validator::make($data, [
                'encargado_id' => 'required',
                'estados_id' => 'required',
                'tiempo_estimado' => 'required',
                'fecha_entrega_area' => 'required',
                'fecha_entrega_cuentas' => 'required',
            ],$this->messages());
        }
        /**
        * Validar Asignar tarea
        **/
        protected function validatorAtenciones(array $data)
        {
            return Validator::make($data, [
                'estados_id' => 'required',
                'comentarios' => 'required',
            ],$this->messages());
        }
        /**
        * Mensajes validacion Crear Tarea.
        *
        * @return array
        */
        public function messages()
        {
            return [
                'required' => 'El campo <b> :attribute </b> es requerido.',
                'min' => 'El campo <b> :attribute </b> debe tener minimo 3 caracteres.',
                'numeric' => 'El campo <b> :attribute </b> debe ser numerico.',
            ];
        }

        public function programarCalendar($user,$summary,$description,$fechas,$email)
          {
              $retorno_ids =array();
              $retorno_fechas_inicio =array();
              $retorno_fechas_final =array();
              $retorno_final= array();

              session_start();
              if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
                  $calendarClient = $this->getClientGoogle($user);
                  $service = new Google_Service_Calendar($calendarClient);
                //  $calendarId = 'primary';
                  $calendarId = $email;
                  foreach ($fechas as $fecha) {
                    $event = new Google_Service_Calendar_Event([
                        'summary' => $summary,
                        'description' => $description,
                        'start' => ['dateTime' => $fecha['inicio_programada']['time'], 'timeZone' => 'America/Bogota'],
                        'end' => ['dateTime' =>  $fecha['fin_programada']['time'], 'timeZone' => 'America/Bogota'],
                        'reminders' => ['useDefault' => true],
                        /* 'attendees' => array(
                           array('email' => $email),
                            array('email' => 'aborrero@himalayada.com'),
                       ),*/
                    ]);
                    $results = $service->events->insert($calendarId, $event);
                    if (!$results) {
                      return response([
                          'status' => Response::HTTP_BAD_REQUEST,
                          'response_time' => microtime(true) - LARAVEL_START,
                          'msg' => 'Error al actualizar la tarea. No se pudo programar en el calendar.',
                          'error' => 'Ocurrio un error del calendar',
                          'consola' =>$calendarClient,
                          'calendar' =>$results,
                      ],Response::HTTP_BAD_REQUEST);
                       //return 'No se pudo crear el evento, por favor intente de nuevo';
                      //  return response()->json(['status' => 'error', 'message' => 'Something went wrong']);
                    }else{
                       array_push($retorno_ids,$results['id']);
                       array_push($retorno_fechas_inicio,$fecha['inicio_programada']['time']);
                       array_push($retorno_fechas_final,$fecha['fin_programada']['time']);
                    }
                  }
                  array_push($retorno_final,$retorno_ids);
                  array_push($retorno_final,$retorno_fechas_inicio);
                  array_push($retorno_final,$retorno_fechas_final);

                   return $retorno_final;
                  //return 'Se ha creado el evento correctamente';
                //  return response()->json(['status' => 'success', 'message' => 'Event Created']);
              } else {
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al actualizar la tarea. No se pudo programar en el calendar.',
                    'error' => 'Error en Sessión',
                ],Response::HTTP_BAD_REQUEST);
                //return 'No posee el api de google';
                //  return redirect()->route('oauthCallback');
              }

          }



    }
