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
        return response()->json($requerimiento);
        // return view('admin.clientes.ver_solicitud')->with('requerimientoinfo',$requerimiento);
        
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