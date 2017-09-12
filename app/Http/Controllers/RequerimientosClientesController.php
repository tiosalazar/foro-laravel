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
use App\Notifications\RequerimientoCreado;
use App\Notifications\RequerimientoAtencionCliente;
use App\Notifications\RequerimientoComentado;
use App\Notifications\RequerimientoAcetado;
use App\Notifications\RequerimientoFinalizado;
use App\Notifications\RequerimientoNoAdmitido;
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
            $encargado->notify(new RequerimientoCreado($maker,$requerimiento));

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
                 'consolita'=>$maker,
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
      public function ShowDatatbleTareasRequerimiento(Request $request,$id)
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
          },'ot.cliente','usuario'=> function ($query){

         $query->addselect('*');
         $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

       },'usuarioencargado'=> function ($query){

         $query->addselect('*');
         $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

       },'estado' => function ($query) use ($request,$_estadosPermitidos) {
              if ($request->has('estados')) {
                  $query->whereIn('id',$request->get('estados'));
              }else {
                  $query->whereIn('id',$_estadosPermitidos);
              }

          }])
          ->where('requerimientos_clientes_id', $id)
          ->whereYear('created_at', $year)
          ->whereMonth('created_at', $month)
          ->get();

         // return $tarea;

          // selecciona solos los que tiene el area especifico
          foreach ($tarea as $key => $value) {
              if ($value->area && $value->ot && $value->ot->cliente && $value->estado && $value->usuario) {
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
      ->addColumn('encargado', function ($tarea) {
            return $tarea->usuarioencargado->full_name;
      })
       ->addColumn('ejecutivo', function ($tarea) {
            return $tarea->usuario->full_name;
      })
      ->addColumn('prioridad', function ($tarea) {
          return '<span class="label label-estado estado-'.$tarea->Estado_prioridad->tipos_estados_id.'-'.$tarea->Estado_prioridad->id.' ">'.$tarea->Estado_prioridad->nombre.'</span>';
      })
      ->addColumn('estado', function ($tarea) {
          return '<span class="label label-estado estado-'.$tarea->estado->tipos_estados_id.'-'.$tarea->estado->id.' ">'.$tarea->estado->nombre.'</span>';
      })
      ->addColumn('actions', function ($tarea) {
          // $editar_ot=(Auth::user()->can('editar_ots') )?'<a href="editar/'.$tarea->id.'" title="Editar Ot"  class="btn-info btn-flat btn-block" aria-label="View"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>':'';
          $editar_ot= '';
          if (
              (Auth::user()->can('borrar_tarea') && Auth::user()->id  == $tarea->usuarios_id && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
              || (Auth::user()->hasRole('owner') && ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
              || (Auth::user()->hasRole('desarrollo')&& ($tarea->estados_id ==4 || $tarea->estados_id==5 || $tarea->estados_id==6 || $tarea->estados_id==7 ) )
              )
              {
                  $editar_ot='<a href="#" id="cli-'.$tarea->id.'" title="Borrar tarea"  class="delete_cliente btn-danger btn-flat btn-block" aria-label="Borrar" data-toggle="modal" data-target="#myModal"><i class="fa fa-trash" aria-hidden="true"></i>
              </a>';
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
        // $requerimiento = Requerimientos_cliente::findOrFail($id);
        $requerimiento = Requerimientos_cliente::with(['estado','estado_prioridad'])->where('id',$id)->get();
        $requerimiento[0]['descripcion'] = strip_tags($requerimiento[0]['descripcion'] );
        $req= new Requerimientos_cliente;
        $requerimiento[0]['fecha_ideal_entrega']=$req->getFormatFecha($requerimiento[0]['fecha_ideal_entrega']);
        // $requerimiento->estado_prioridad;
       //  return response()->json($requerimiento);
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
        $requerimiento = Requerimientos_cliente::with(['estado','estado_prioridad'])->where('id',$id)->get();
        //$requerimiento->estado_prioridad;
        // return response()->json($requerimiento);
        return view('admin.clientes.ver_solicitud_tareas')->with('requerimientoinfo',$requerimiento[0]);

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

        if ( Auth::user()->hasRole('desarrollo') || Auth::user()->hasRole('owner')) {


           $Requerimientos_cliente = Requerimientos_cliente::with(['estado' => function ($query) use ($request) {
                 if ($request->has('estados')) {
                     $query->whereIn('id',$request->get('estados'));
                 }
             },'usuario','prioridad','usuarioencargado'=> function ($query){

               $query->addselect('*');
               $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

             }])->whereYear('created_at', $year)
                 ->whereMonth('created_at', $month)
                 ->get();
        }else{


             $id_user_actual = Auth::id();

                 $Requerimientos_cliente = Requerimientos_cliente::with(['estado' => function ($query) use ($request) {
                       if ($request->has('estados')) {
                           $query->whereIn('id',$request->get('estados'));
                       }
                   },'usuario','estado_prioridad','usuarioencargado'=> function ($query){

                     $query->addselect('*');
                     $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

                   }])->whereYear('created_at', $year)
                       ->whereMonth('created_at', $month)
                         ->where('usuarios_id', '=', $id_user_actual)
                         ->orWhere('encargado_id','=', $id_user_actual)
                       ->get();

        }





              // return response()->json($clientes);
              foreach($Requerimientos_cliente as $value){
                  $value->descripcion = substr($value->descripcion, 0, 120);
                  $value->descripcion = $value->descripcion."...";
              }

              // selecciona solos los que tiene el area especifico
                foreach ($Requerimientos_cliente as $key => $value) {

                      // Mostramos solo los 11 primeros caracteres por ejemplo: "En un lugar"
                        if ($value->estado && $value->usuario) {
                           array_push($output, $value);

                        }
                }
                $output = collect($output);

              return Datatables::of($output)
              ->addColumn('action', function($cliente_requerimiento) {

                 $ver_requerimiento=(Auth::user()->hasRole('cliente') || Auth::user()->hasRole('cuentas') || Auth::user()->hasRole('owner') || Auth::user()->hasRole('desarrollo'))?'<a href="/solicitud/ver'.'/'.$cliente_requerimiento->id.'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit">Ver</a>':'';
                 $ver_tareas_requerimiento=(Auth::user()->hasRole('cliente') || Auth::user()->hasRole('cuentas') || Auth::user()->hasRole('owner') || Auth::user()->hasRole('desarrollo'))?'<a href="/solicitud/tareas'.'/'.$cliente_requerimiento->id.'"  id="Ver_tareas" class="btn btn-danger btn-xs btn-flat btn-block delete_cliente">Ver tareas</a>':'';

                $crear_tareas_requerimiento=(Auth::user()->hasRole('cuentas') || Auth::user()->hasRole('owner') || Auth::user()->hasRole('desarrollo'))?'<a href="/crear_tarea_requerimiento'.'/'.$cliente_requerimiento->id.'" class="btn btn-info btn-xs btn-flat btn-block usuario_edit">Crear Tarea</a>':'';

                return $ver_requerimiento.$ver_tareas_requerimiento.$crear_tareas_requerimiento;
              })
              ->addColumn('estado', function ($cliente_requerimiento) {
                  return '<span class="label label-estado estado-'. $cliente_requerimiento->estado->tipos_estados_id.'-'. $cliente_requerimiento->estado->id.' ">'. $cliente_requerimiento->estado->nombre.'</span>';
              })
                ->addColumn('prioridad', function ($cliente_requerimiento) {
                    return '<span class="label label-estado estado-'.$cliente_requerimiento->estado_prioridad->tipos_estados_id.'-'.$cliente_requerimiento->estado_prioridad->id.' ">'.$cliente_requerimiento->estado_prioridad->nombre.'</span>';
                })
                ->addColumn('created_at', function ($cliente_requerimiento) {
                  return (!is_null($cliente_requerimiento->created_at)) ? $cliente_requerimiento->getFormatFechaSolicitud( $cliente_requerimiento->created_at) : 'No definida' ;
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
        $requerimiento = Requerimientos_cliente::findOrFail($id);
        $requerimiento->estados_id = $request->estados_id;
        $requerimiento->encargado_id = $requerimiento->usuarios_id;
        $requerimiento->save();
        return response()->json($requerimiento);
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
 * Trae Comentario al Requerimiento
 */
public function getComentario(Request $request, $id)
{
  $comentarios = Comentario::with(['user','estados'])->where('requerimientos_clientes_id',$id)->get();
   return response()->json($comentarios);
}
/**
 * Agregar Comentario al Requerimiento
 */
public function agregarComentario(Request $request)
{
  $requerimiento = Requerimientos_cliente::findOrFail($request->requerimientos_clientes_id);
  $requerimiento->cliente;

  //Guardamos el comentario
  $comentario = new Comentario;
  $comentario->fill($request->all());
  $comentario->save();
  //notificación

  if ($request->is_comment==1) {
    $ejecutiva=$requerimiento->cliente->user_id;
  $requerimiento->encargado_id= ( Auth::user()->hasRole('cuentas'))?$requerimiento->usuarios_id:$ejecutiva ;
  // return response()->json($cliente);
    $encargado= User::findOrFail($requerimiento->encargado_id);
    $maker = User::findOrFail($request->usuarios_comentario_id);
    $encargado->notify(new RequerimientoComentado($maker,$requerimiento,$comentario));
  }else {
    switch ($comentario->estados_id) {
      /*
         24 Aceptado
         25 Atención cliente
         26 No admitido
         27 Finalizado
      */
      case 24:
      $encargado= User::findOrFail($requerimiento->usuarios_id);
       $maker = User::findOrFail($request->usuarios_comentario_id);
      $encargado->notify(new RequerimientoAcetado($maker,$requerimiento));
        break;
      case 25:
      $encargado= User::findOrFail($requerimiento->encargado_id);
      $maker = User::findOrFail($request->usuarios_comentario_id);
      $encargado->notify(new RequerimientoAtencionCliente($maker,$requerimiento));
        break;
      case 26:
      $encargado= User::findOrFail($requerimiento->usuarios_id);
       $maker = User::findOrFail($request->usuarios_comentario_id);
      $encargado->notify(new RequerimientoNoAdmitido($maker,$requerimiento));
        break;
      case 27:
      $encargado= User::findOrFail($requerimiento->usuarios_id);
       $maker = User::findOrFail($request->usuarios_comentario_id);
      $encargado->notify(new RequerimientoFinalizado($maker,$requerimiento));
          break;

      default:
        # code...
        break;
    }
  }



  //Respuesta
        $respuesta['user_coment']='';
        $respuesta["error"]=0;
        $respuesta["mensaje"]="OK";
        $respuesta["msg"]="Comentario agregado con exito";
        foreach ($requerimiento->comentario as $key => $value) {
            if ($value->user->id==$request->usuarios_comentario_id) {
                $respuesta['user_coment']=$value;
                $value->estados;
            }


        }
         return response()->json($respuesta);
}

/*DSO 01-09-2017 Metodo para el select de requerimientos en crear tarea
 */
   public function showRequerimientosEnTareas()
   {
      // Muestra todos los requerimientos

        $requerimientos_list=  Requerimientos_cliente::with(['cliente','usuario'])->get();
        foreach ($requerimientos_list as $key => $requerimiento_list) {
          $requerimiento_list['cliente_nombre']=$requerimiento_list['cliente']['nombre'];
        }

      return response()->json($requerimientos_list);
   }

   public function showRequerimientosEnTareasByQuery($query)
   {
      // Si empieza con valor numerico buscar por referencia
      // de lo contrario por nombre

      //Función que consulta las ot recibe dos valores el primero referencia o nombre el segundo el query que se envia desde el componente select
      function consulta_requerimiento($value,$consulta)
      {
         $requerimientos = Requerimientos_cliente::
         select('requerimientos_clientes.id','requerimientos_clientes.clientes_id','requerimientos_clientes.created_at','requerimientos_clientes.estados_id','requerimientos_clientes.nombre','requerimientos_clientes.descripcion',
         'requerimientos_clientes.usuarios_id','clientes.nombre as cliente_nombre','users.nombre as usuario_nombre',
         'users.apellido as usuario_apellido')
         ->join('clientes','clientes.id','=','requerimientos_clientes.clientes_id')
         ->join('users','users.id','=','requerimientos_clientes.usuarios_id')
         ->where('requerimientos_clientes.estados_id','24')
         ->Where($value, 'like', '%'.$consulta.'%')
         ->orWhere('clientes.nombre', 'like', '%'.$consulta.'%')
         ->get();

         return $requerimientos;
      }
      if (is_numeric($query)) {
         //  $ot = Ot::with(['cliente','usuario'])->where('estados_id', 8)->where('referencia', 'like', '%'.$query.'%')->get();
         $requerimientos=consulta_requerimiento('id',$query);
      } else {
         $requerimientos= consulta_requerimiento('requerimientos_clientes.nombre',$query);
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
      return response()->json($requerimientos);
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
