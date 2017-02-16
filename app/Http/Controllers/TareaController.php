<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tarea;
use App\Ot;
use App\Area;
use App\User;
use App\Role;
use App\Comentario;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;
use Yajra\Datatables\Datatables;

class TareaController extends Controller
{
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
                    $tarea->save();
                    return response([
                        'status' => Response::HTTP_OK,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'obj' => $tarea,
                        'error' => null,
                        'msg' => 'Tarea creada con exito',
                        ],Response::HTTP_OK);
                } catch (Exception $e) {
                   return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'ERR_04',
                    'msg' => 'excepcion, fallo la petición',
                    'consola' =>$e->getMessage(),
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
                    //Busca el usuario en la BD
                       $tarea=Tarea::findOrFail($id);

                       //Asigna los nuevo datos
                       $tarea->fill($request->all());

                       //Guardamos la tarea
                       $tarea->update();

                       //Guardamos el comentario
                       $comentario = new Comentario;
                       $comentario->fill($request->all());
                       $comentario->save();
                       
                      

                      //Respuesta 
                       $respuesta['dato']=$tarea;
                       $respuesta['user_coment']='';
    
                       $respuesta["error"]=0;
                       $respuesta["mensaje"]="OK"; 
                       $respuesta["msg"]="Asignado con exito";
                       foreach ($tarea->comentario as $key => $value) {
                            if ($value->user->id==$request->usuarios_id) {
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
                       $respuesta["consola"]=$e;
                       $respuesta["msg"]="Error  datos incorrectos";
                       $respuesta["request"]=$tarea;
                       $respuesta["obj"]=$vl->errors();
                        
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
     * Mostrar todas las tareas con Datatable.
     *
     * @return \Illuminate\Http\Response
     */
    public function showAllTareas($id,Request $request)
    {
        $output= array();

        $tarea = Tarea::with(['ot.cliente','estado' => function ($query) use ($request) {
            if ($request->has('nombre_tarea')) {
                // $query->where('nombre_tarea', 'like', "%{$request->get('nombre_tarea')}%");
                $query->where('id', '=', $request->get('nombre_tarea'));
            }
        },'area' => function ($query) use ($id) {
            $query->where('id', '=', $id);
        }])->get();

        // selecciona solos los que tiene el area especifico
        foreach ($tarea as $key => $value) {
            if ($value->area && $value->ot->cliente && $value->estado ) {
                array_push($output, $value);
            }
        }
        $output = collect($output);
        return Datatables::of($output)
        ->editColumn('created_at', function ($user) {
                return $user->updated_at->format('d-M-Y');
            })
        /*->filterColumn('created_at', function ($query, $keyword) {
                $query->whereRaw("DATE_FORMAT(created_at,'%d-%M-%Y') like ?", ["%$keyword%"]);
            })*/
        /*->filter(function ($query) use ($request) {
                if ($request->has('nombre_tarea')) {
                    $query->where('nombre_tarea', 'like', "%{$request->get('nombre_tarea')}%");
                }

                // if ($request->has('email')) {
                //     $query->where('email', 'like', "%{$request->get('email')}%");
                // }
            })*/
        ->make(true);
        // return $output;

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
    *   Metodos del Foro - Listar por Áreas
    **/

    public function showDesarrollo()
    {
        $lista_tareas = Tarea::with(['area' => function ($query) {
            $query->where('nombre', 'like', '%desarrollo%');
        }])->get();

        return Datatables::of($lista_tareas)->make(true);
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
