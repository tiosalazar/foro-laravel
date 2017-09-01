<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ot;
use App\Cliente;
use App\User;
use App\Role;
use App\Tarea;
use App\Comentario;
use App\Requerimientos_cliente;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Validation\ValidatesRequests;
use App\Notifications\RequerimientoCerado;
use Validator;
use Illuminate\Http\Response;
use Exception;
use Yajra\Datatables\Datatables;
use Excel;
use Carbon\Carbon;
use Jenssegers\Date\Date;


class RequerimientosClientesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $requerimiento = Requerimientos_cliente::with('cliente','usuario','estado')->get();
        return response()->json($requerimiento);
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
    $vl=$this->validatorCrearRequerimiento($request->all());
    if ($vl->fails())
    {
       return response([
          'status' => Response::HTTP_BAD_REQUEST,
          'response_time' => microtime(true) - LARAVEL_START,
          'msg' => 'Error al crear el Requerimiento',
          'error' => 'ERR_01',
          'obj' =>$vl->errors()
       ],Response::HTTP_BAD_REQUEST);
    }else
    {
       try
       {
          //Inicio una transacción por si falla algún ingreso no quede registro en ninguna tabla
          DB::beginTransaction();
          $requerimiento=new Requerimientos_cliente;
          $requerimiento->fill($request->all());
          $requerimiento->estados_id=23; //ID estado en revisión. cambiar si es necesario.

          //usuario Logueado
          $maker=Auth::user();
          $requerimiento->usuarios_id=$maker->id;

          if (Auth::user()->hasRole('cliente')) {
              $cliente= Cliente::findOrFail($maker->clientes_id);
              $requerimiento->clientes_id=$cliente->id;
              $requerimiento->encargado_id=$cliente->user_id;
          }


          $requerimiento->save();


          //Notificar al usuario Owner cuando se cree una OT

            $encargado= User::findOrFail($requerimiento->encargado_id);
            $encargado->notify(new RequerimientoCerado($encargado,$requerimiento));

              DB::commit();
              return response([
                 'status' => Response::HTTP_OK,
                 'response_time' => microtime(true) - LARAVEL_START,
                 'msg' => 'El Requerimiento ha sido creada con exito !! ',//Mensaje a mostrar
                 'obj' => $requerimiento
              ],Response::HTTP_OK);
       }catch (Exception $e)
        {
            DB::rollback();
              return response([
                 'status' => Response::HTTP_BAD_REQUEST,
                 'response_time' => microtime(true) - LARAVEL_START,
                 'consola' =>$e->getMessage(),
                 'request' => $request->all(),
                 'error' => config('constants.ERR_04'),
                 'msg' => 'Ocurrio un error, por favor comunicate con soporte',
                 'consola' =>$e->getMessage(),
                 'obj' =>[]
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

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function ShowDatatbleTareasRequerimiento(Request $request)
    {
        $output= array();
        // Si no trae el mes y año en el $request
        // tomar el mes y el año actual
        $year = '';
        $month = '';
        $now = Carbon::now();
        /*
         3 - Programado
         7 - Pendiente
         20  - Entregado
         22  - Finalizado

        */
        $_estadosPermitidos= array(3,7,20,22);
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

     },'estado' => function ($query) use ($request) {
            if ($request->has('estados')) {
                $query->whereIn('id',$request->get('estados'));
            }else {
                $query->whereIn('id', '=',$_estadosPermitidos);
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
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function ShowOneRequerimiento($id)
    {
        $requerimiento = Requerimientos_cliente::findOrFail($id);
        $requerimiento->estado_prioridad;
    //return response()->json($requerimiento);
        return view('admin.clientes.ver_solicitud')->with('requerimientoinfo',$requerimiento);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function ShowOneRequerimientoTareas($id)
    {
        $requerimiento = Requerimientos_cliente::findOrFail($id);
        $requerimiento->estado_prioridad;
        // return response()->json($requerimiento);
        return view('admin.clientes.ver_solicitud_tareas')->with('requerimientoinfo',$requerimiento);

    }

    /**
     * Método para listar requerimiento en el datatable
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function ShowDatatbleRequerimiento(Request $request)
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
           $Requerimientos_cliente = Requerimientos_cliente::with(['estado' => function ($query) use ($request) {
                 if ($request->has('estados')) {
                     $query->whereIn('id',$request->get('estados'));
                 }
             },'usuario','usuarioencargado'=> function ($query){

               $query->addselect('*');
               $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

             }])->whereYear('created_at', $year)
                 ->whereMonth('created_at', $month)
                 ->get();

              // return response()->json($clientes);
                $output = collect($Requerimientos_cliente);
              return Datatables::of($output)
              ->addColumn('action', function($cliente_requerimiento) {
                $ver_requerimiento=(Auth::user()->hasRole('cliente'))?'<a href="/solicitud/ver'.'/'.$cliente_requerimiento->id.'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit">Ver</a>':'';
                $ver_tareas_requerimiento=(Auth::user()->hasRole('cliente'))?'<a href="/solicitud/tareas'.'/'.$cliente_requerimiento->id.'"  id="Ver_tareas" class="btn btn-danger btn-xs btn-flat btn-block delete_cliente">Ver tareas</a>':'';
                $crear_tareas_requerimiento=(Auth::user()->hasRole('cliente'))?'<button type="button" id="Ver_tareas" class="btn btn-info btn-xs btn-flat btn-block delete_cliente">Crear Tareas</button>':'';
                return $ver_requerimiento.$ver_tareas_requerimiento.$crear_tareas_requerimiento;
              })
              ->addColumn('estado', function ($cliente_requerimiento) {
                  return '<span class="label label-estado estado-'. $cliente_requerimiento->estado->tipos_estados_id.'-'. $cliente_requerimiento->estado->id.' ">'. $cliente_requerimiento->estado->nombre.'</span>';
              })
              ->addColumn('fecha_ideal_entrega', function ($cliente_requerimiento) {
                  return (!is_null($cliente_requerimiento->fecha_ideal_entrega)) ? $cliente_requerimiento->getFormatFecha( $cliente_requerimiento->fecha_ideal_entrega) : 'No definida' ;
              })


              // ->addColumn('ejecutivo', function($cliente) {
              //   $crear_tarea=(Auth::user()->hasRole('cuentas'))?'<a href="#" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit">Crear Tarea</a>':'';
              //    return $crear_tarea;
              // })
              ->make(true);

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
        //
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
 * Agregar Comentario al Requerimiento
 */
public function agregarComentario(Request $request)
{
  //Guardamos el comentario
  $comentario = new Comentario;
  $comentario->fill($request->all());
  $comentario->save();
}

/*DSO 30-08-2017 Funcion para validar los campos al crear un requerimiento
 * entra el arreglo de datos
 * Sale un arreglo con los errores.
 */
 protected function validatorCrearRequerimiento(array $data)
 {
    return Validator::make($data, [
       'nombre' => 'required|min:4',
       'descripcion' => 'required|min:4',
       'prioridad_id' => 'required',
    ]);
 }
}
