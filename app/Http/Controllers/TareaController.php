<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tarea;
use App\Ot;
use App\Area;
use App\User;
use App\Role;
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

                       //Guardamos el usuario
                       $tarea->update();

                      //Respuesta 
                       $respuesta['dato']=$tarea;
                       $respuesta["error"]=0;
                       $respuesta["mensaje"]="OK"; 
                       $respuesta["msg"]="Asignado con exito";

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
        $tarea = Tarea::with(['ot.cliente','usuarioencargado','estado' => function ($query) use ($request) {
            if ($request->has('estados')) {
                $query->where('id', '=', $request->get('estados'));
            }
        },'area' => function ($query) use ($id) {
            $query->where('id', '=', $id);
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
        $lastYear = date('Y',strtotime($tarea->created_at));
        $firstYear = date('Y',strtotime($firstTarea->created_at));
        for ($i=$firstYear; $i <=  $lastYear; $i++) { 
            array_push($years, (string)$i);
        }
        return $years;
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
