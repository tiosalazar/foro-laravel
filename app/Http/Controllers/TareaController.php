<?php

namespace App\Http\Controllers;

use Illuminate\Notifications\Notifiable;
use App\Notifications\CrearOT;
use App\Notifications\OtSinTiempo;
use App\Notifications\TareaCreada;
use App\Notifications\TareaPendiente;
use App\Notifications\TareaProgramada;
use App\Notifications\TareaRealizada;
use App\Notifications\TareaOK;
use App\Notifications\TareaAtencionCuentas;
use App\Notifications\TareaAtencionArea;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use App\Tarea;
use App\Ot;
use App\Tiempos_x_Area;
use App\Area;
use App\User;
use App\Role;
use App\Estado;
use App\Comentario;
use App\Historico_Tarea;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Exception;
use Yajra\Datatables\Datatables;

class TareaController extends Controller
{
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
        // $tareas= Tarea::all();
        $tareas = Tarea::with('ot.cliente','estado')->get();
        /*foreach ($tareas as $key => $value) {
            $value->Ot->Cliente;
            $value->Estado;
        }*/
        // return response()->json($tareas);
        // return array('recordsTotal'=>count($tareas),'recordsFiltered'=>count($tareas),'data'=>$tareas);
        return Datatables::of($tareas)->make(true);
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

            $tarea = new Tarea;
            $tarea->fill($request->all());

            //Validación de las entradas por el metodo POST
            $vl=$this->validatorCreartarea($request->all());

            if ($vl->fails()){
                // return response()->json($vl->errors());
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al crear la tarea',
                    'error' => 'ERR_01',
                    'obj' =>$vl->errors()
                    ],Response::HTTP_BAD_REQUEST);
            }else{
                try {
                    // Obtengo las horas de la OT
                    // segun el area correspondiente a la Tarea
                    $horas_area = Tiempos_x_Area::with('area','ots')
                    ->where('ots_id',$tarea->ots_id)
                    ->where('areas_id',$tarea->areas_id)
                    ->first();
                    $admins='';

                    // Validar si tiene horas suficientes para hacer la Tarea
                    if (!is_null($horas_area->tiempo_estimado_ot) &&
                        $horas_area->tiempo_estimado_ot >= $horas_area->tiempo_real) {

                        $tarea->save();
                        $maker = User::findOrFail($request->usuarios_id);
                        User::find($tarea->encargado_id)->notify(new TareaCreada($maker,$tarea));

                        return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'obj' => $tarea,
                            'horas_area ' => $horas_area,
                            'error' => null,
                            'msg' => 'Tarea creada con exito',
                            ],Response::HTTP_OK);
                    } else {
                        // Enviar notificacion a los Project Owner
                        // cuando el tiempo se haya acabado para un Área en la OT
                        $admins = User::where('roles_id',1)->get();
                        $maker = User::findOrFail($tarea->usuarios_id);
                        foreach ($admins as $key => $admin) {
                            $admin->notify(new OtSinTiempo($maker,$horas_area->ots));
                        }
                        return response([
                            'status' => Response::HTTP_BAD_REQUEST,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'obj' => [],
                            'horas_area ' => $horas_area,
                            'error' => 'ERR_04',
                            'msg' => 'No tienes tiempo suficiente para esta tarea.',
                            ],Response::HTTP_BAD_REQUEST);
                    }



                } catch (Exception $e) {
                   return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'ERR_04',
                    'msg' => 'excepcion, fallo la petición',
                    'consola' =>$e->getMessage(),
                    'admins' =>$admins,
                    'obj' =>[]
                    ],Response::HTTP_BAD_REQUEST);
               }
           }

       }else{

             return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'ERR_04',
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

           $tarea=Tarea::findOrFail($id);

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
            $data['editor_id']=Auth::user()->id;
            $tarea_historico->fill($data);
            $tarea_historico->save();

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
        // Es una actualziacion de la tarea
        }else{

            $vl=$this->validatorAsignarTarea($request->all());
            if ($vl->fails()) {
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
                            $makerBefore = User::findOrFail($request->encargado_id);

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
                            }else if($tarea->estados_id == 4){
                                $tarea->encargado_id = $tarea->usuarios_id;
                            }else if($tarea->estados_id == 1){
                                // Tarea OK, guardar horas en usuario->horas gastadas
                                // y en Area->horas gastadas
                                
                                $colaborador = User::findOrFail($tarea->encargado_id);
                                $colaborador->horas_gastadas = $tarea->tiempo_real;

                                $area = Area::findOrFail($tarea->areas_id);
                                $area->horas_consumidas +=$tarea->tiempo_real;

                                $colaborador->update();
                                $area->update();
                            }


                            // Si la tarea se Realizo (2)
                            // sume Horas Reales en Tiempos_x_area
                            if ($tarea->estados_id == 2) {
                                $horas_area = Tiempos_x_Area::where('ots_id',$tarea->ots_id)
                                ->where('areas_id',$tarea->areas_id)
                                ->first();

                                if (!is_null($tarea->tiempo_real) && $tarea->tiempo_real !=0) {
                                    // $horas_area->increment('tiempo_real',$tarea->tiempo_real);

                                    if ( $horas_area->tiempo_real + $tarea->tiempo_real > $horas_area->tiempo_estimado_ot) {
                                        User::findOrFail($tarea->usuarios_id)
                                        ->notify(new OtSinTiempo($makerBefore,$horas_area->ots));
                                    }
                                    $horas_area->tiempo_real +=$tarea->tiempo_real;
                                    $horas_area->save();
                                }else{
                                    return response([
                                        'status' => Response::HTTP_BAD_REQUEST,
                                        'response_time' => microtime(true) - LARAVEL_START,
                                        'msg' => 'Tiempo real vacio o nulo',
                                        'error' => 'ERR_06',
                                        'obj' =>$vl->errors(),
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



                            /**
                             *
                             * Recibe el estado de la tarea y envia la notificacion
                             * al usuario correspondiente
                             *
                             * 1 - OK
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
                                    User::findOrFail($tarea->usuarios_id)
                                    ->notify(new TareaOK($makerBefore,$tarea));
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
                                    break;
                                case '4':
                                    // Enviar notificacion al nuevo encargado
                                    User::findOrFail($tarea->usuarios_id)
                                    ->notify(new TareaAtencionCuentas($makerBefore,$tarea));
                                    break;
                                case '5':
                                    // Enviar notificacion al nuevo encargado
                                    User::findOrFail($tarea->encargado_id)
                                    ->notify(new TareaAtencionArea($makerBefore,$tarea));
                                    break;
                                case '7':
                                    // Creador de la solicitud - Ejecutiva
                                    $maker = User::findOrFail($tarea->usuarios_id);

                                    // Enviar notificacion al nuevo encargado
                                    User::findOrFail($tarea->encargado_id)->notify(new TareaPendiente($maker,$tarea));
                                    break;

                                default:
                                    return response([
                                        'status' => Response::HTTP_BAD_REQUEST,
                                        'response_time' => microtime(true) - LARAVEL_START,
                                        'msg' => 'Error al actualizar la tarea. No se envio la notificacion',
                                        'error' => 'ERR_05',
                                        'obj' =>$vl->errors(),
                                        'tarea' =>$tarea,
                                        // 'tarea_historico' =>$tarea_historico,
                                        'request' =>$request,
                                        ],Response::HTTP_BAD_REQUEST);
                                    break;
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
                           // $respuesta["horas"]=$horas_area;
                           foreach ($tarea->comentario as $key => $value) {
                                if ($value->user->id==$request->usuarios_comentario_id) {
                                    $respuesta['user_coment']=$value;

                                    $value->estados;
                                }



                            }



                        }

                    catch(Exception $e)
                    {
                       $respuesta["error"]="Error datos incorrectos";
                       $respuesta["codigo_error"]="Error con la tarea";
                       $respuesta["mensaje"]="Error con la tarea";
                       // $respuesta["tarea_historico"]=$tarea_historico;
                       $respuesta["consola"]=$e->getMessage();
                       $respuesta["msg"]="Error  datos incorrectos";
                       $respuesta["request"]=$request->all();
                       $respuesta["obj"]=$vl->errors();

                    }

                }
            }

         return response()->json($respuesta);
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
        if ($request->has('year')) {
            $year = $request->get('year');
        }else{
            $year = date('Y');
        }
        if ($request->has('month')) {
            $month = $request->get('month');
        }else{
            $month = date('m');
        }
        $tarea = Tarea::with(['ot.cliente','usuarioencargado','estado' => function ($query) use ($request,$id) {
            if ($request->has('estados')) {
                $query->where('id', '=', $request->get('estados'));
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
            if ($value->area && $value->ot->cliente && $value->estado ) {
                array_push($output, $value);
            }
        }
        // Se conviert en collection para que lo reciba el Datatable
        $output = collect($output);
        return Datatables::of($output)
        ->editColumn('created_at', function ($tarea) {
                return $tarea->created_at->format('d-M-Y');
            })
        ->make(true);

    }

    public function showOneTarea($id)
    {
        $tarea = Tarea::findOrFail($id);
        $tarea->ot->cliente;
        $tarea->estado;
        $tarea->estado_prioridad;
        $tarea->planeacion_fase;
        $tarea->area;
        $tarea->usuario;
        $tarea->usuarioencargado;
        foreach ($tarea->comentario as $key => $value) {
            $value->user;
            $value->estados;
        }


        // return respo nse()->json($tarea);
        return view('admin.tareas.ver_tarea')->with('tareainfo',$tarea);
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
        $lastYear = date('Y',strtotime($tarea->created_at));
        $firstYear = date('Y',strtotime($firstTarea->created_at));
        for ($i=$firstYear; $i <=  $lastYear; $i++) {
            array_push($years, (string)$i);
        }
        return $years;
      }
      return [];
    }

    /**
    * Validar Crear Tarea
    **/
    protected function validatorCrearTarea(array $data)
    {
        return Validator::make($data, [
            'nombre_tarea' => 'required|min:4',
            'descripcion' => 'required|min:4',
            'enlaces_externos' => 'min:4',
            'tiempo_estimado' => 'min:4|numeric',
            'tiempo_real' => 'min:4|numeric',
            'tiempo_mapa_cliente' => 'min:1|numeric',
            'estados_id' => 'required',
            'areas_id' => 'required',
            'usuarios_id' => 'required',
            'ots_id' => 'required',
            'encargado_id' => 'required',
            'planeacion_fases_id' => 'required',
        ]);
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
        ]);
    }
}
