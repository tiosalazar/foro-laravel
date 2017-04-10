<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Compras_Ot;
use App\User;
use App\Ot;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Validator;
use Illuminate\Http\Response;
use Exception;
use Yajra\Datatables\Datatables;
use Excel;

class Compras_OtController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $compra= Compras_ot::with('ot','area','tipo_compra','divisa','estado')->get();
        return response()->json($compra);
    }
    /**
* Display a listing of the resource.
*
* @return \Illuminate\Http\Response
*/
public function datatable_index(Request $request)
{
  $output= array();

  $compra= Compras_ot::with('ot','area','tipo_compra','divisa','estado')->get();

  $output = collect($compra);
  return Datatables::of($output)
  ->addColumn('fecha_creacion', function($compra) {
    return  $compra->getFormatFecha($compra->created_at);
 })
  ->addColumn('fecha_transaccion', function($compra) {
   return $compra->getFormatFecha($compra->fecha_transaccion);
})
  ->addColumn('acciones', function($compra) {
   $ver_ot=(Auth::user()->can('ver_ots') )?'<a href="/ots/visualizar/'.$compra['ot']['id'].'" class="btn_accion estado-2-10 btn-success"  title="Ver Ot" aria-label="View"><i class="fa fa-eye" aria-hidden="true"></i></a>':'';
   $editar_compra=(Auth::user()->can('editar_compras_asociadas') )?'<a href="editar/'.$compra->id.'" title="Editar Compra asociada"  class="btn_accion btn-info" aria-label="View"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>':'';
   return $ver_ot.$editar_compra;
})
  ->make(true);

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
      $data= $request->all();
        //Validaciòn de las entradas por el metodo POST
          $compras=$data['compras'];
          foreach ($compras as $compra) {
        $vl=$this->validatorCrearCompra($compra);
        if ($vl->fails())
        {
           return response([
              'status' => Response::HTTP_BAD_REQUEST,
              'response_time' => microtime(true) - LARAVEL_START,
              'msg' => 'Error al crear la Compra',
              'error' => 'ERR_01',
               'request' => $request->all(),
              'obj' =>$vl->errors()
              ],Response::HTTP_BAD_REQUEST);
        }else
        {
           try
           {
              //Inicio una transacción por si falla algún ingreso no quede registro en ninguna tabla
              DB::beginTransaction();
              /*El siguiente for recorre el listado de compras y los agrega*/
                 $model_compras= new Compras_Ot;
                 $model_compras->fill($compra);
                 $model_compras->save();

              DB::commit();

              return response([
                 'status' => Response::HTTP_OK,
                 'response_time' => microtime(true) - LARAVEL_START,
                 'msg' => 'Se han creado las compras correctamente !!',//Mensaje a mostrar
                 'obj' =>  $model_compras
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



    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
      $compra= Compras_ot::with('ot','area','tipo_compra','divisa','estado')->where('id',$id)->get();
      return response()->json($compra);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
      $Compras_ot=Compras_ot::with('ot','area','tipo_compra','divisa','estado')->findOrFail($id);
    //   return response()->json($Compras_ot);
      $Compras_ot->Ot['usuario_nombre']= $Compras_ot->Ot->usuario->nombre;
      $Compras_ot->Ot['usuario_apellido']= $Compras_ot->Ot->usuario->apellido;
      $Compras_ot->Ot['cliente_nombre']=$Compras_ot->Ot->cliente->nombre;
      //  return response()->json($Compras_ot);
       return view('admin.compras_asociadas.formulario_compras_editar')->with('compra', $Compras_ot);
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
      $data= $request->all();
        //Validaciòn de las entradas por el metodo POST
          $compras=$data['compras'][0];
        $vl=$this->validatorCrearCompra($compras);
        if ($vl->fails())
        {
           return response([
              'status' => Response::HTTP_BAD_REQUEST,
              'response_time' => microtime(true) - LARAVEL_START,
              'msg' => 'Error al Editar la Compra',
              'error' => 'ERR_01',
               'request' => $request->all(),
              'obj' =>$vl->errors()
              ],Response::HTTP_BAD_REQUEST);
        }else
        {
           try
           {
                 $compra =Compras_Ot::findOrFail($id);
                 $compra->fill($compras);
                 $compra->save();

              return response([
                 'status' => Response::HTTP_OK,
                 'response_time' => microtime(true) - LARAVEL_START,
                 'msg' => 'Compra Editada Correactamente !!',//Mensaje a mostrar
                 'obj' =>  $compra
                 ],Response::HTTP_OK);

           }catch(Exception $e){
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
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    /*DSO 24-01-2016 Funcion para validar los campos al crear un usuario
     * entra el arreglo de datos
     * Sale un arreglo con los errores.
     */
     protected function validatorCrearCompra(array $data)
     {
        return Validator::make($data, [
           'provedor' => 'required',
           'valor' => 'required',
           'fecha_transaccion' => 'required|date',
           'descripcion' => 'required',
           'ots_id' => 'required',
           'areas_id' => 'required',
           'divisas_id' => 'required',
           'estados_id' => 'required',
           ]);
     }
}
