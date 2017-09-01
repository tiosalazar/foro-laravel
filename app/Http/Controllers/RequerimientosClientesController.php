<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Ot;
use App\Cliente;
use App\User;
use App\Role;
use App\Tarea;
use App\Requerimientos_cliente;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;
use Yajra\Datatables\Datatables;
use Excel;
use Carbon\Carbon;


class RequerimientosClientesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $requerimiento = Ot::with('cliente','usuario','estado')->get();
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
    $vl=$this->validatorCrearOT($request->all());
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
          $requerimiento=new Requerimientos_cliente;
          $requerimiento->fill($request->all());
          $requerimiento->save();
       }catch (Exception $e)
        {
          print "something went wrong\n";
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
    public function ShowOneRequerimiento($id)
    {
        $requerimiento = Requerimientos_cliente::findOrFail($id);
        // return response()->json($requerimiento);
        return view('admin.clientes.ver_solicitud')->with('requerimientoinfo',$requerimiento);
        
    }

    /**
     * Método para listar requerimiento en el datatable
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function ShowDatatbleRequerimiento()
    {
           $Requerimientos_cliente = Requerimientos_cliente::with(['estado','usuario'=> function ($query){

               $query->addselect('*');
               $query->addselect(DB::raw('CONCAT(nombre," ",apellido) as full_name'));

             }])->get();
              // return response()->json($clientes);
              return Datatables::of($Requerimientos_cliente)
              ->addColumn('action', function($cliente_requerimiento) {
                $ver_requerimiento=(Auth::user()->hasRole('cliente')  or Auth::user()->hasRole('cuentas') )?'<a href="/ver_requerimiento'.'/'.$cliente_requerimiento->id.'" class="btn btn-primary btn-xs btn-flat btn-block usuario_edit">Ver</a>':'';
                $ver_tareas_requerimiento=(Auth::user()->hasRole('cliente') or Auth::user()->hasRole('cuentas'))?'<button type="button" id="Ver_tareas" class="btn btn-danger btn-xs btn-flat btn-block delete_cliente">Ver tareas</button>':'';
                $crear_tareas_requerimiento=(Auth::user()->hasRole('cuentas'))?'<a href="/crear_tarea_requerimiento'.'/'.$cliente_requerimiento->id.'" class="btn btn-info btn-xs btn-flat btn-block usuario_edit">Crear Tarea</a>':'';
                return $ver_requerimiento.$ver_tareas_requerimiento.$crear_tareas_requerimiento;
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

/*DSO 30-08-2017 Funcion para validar los campos al crear un requerimiento
 * entra el arreglo de datos
 * Sale un arreglo con los errores.
 */
 protected function validatorCrearRequerimiento(array $data)
 {
    return Validator::make($data, [
       'nombre' => 'required|min:4',
       'descripcion' => 'required|min:4',
       'usuarios_id' => 'required',
       'clientes_id' => 'required',
    ]);
 }
}
