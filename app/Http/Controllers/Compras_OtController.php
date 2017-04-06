<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Compras_ot;
use App\User;
use App\Ot;
use Illuminate\Support\Facades\Auth;
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
   $ver_ot='<a href="/ots/visualizar/'.$compra['ot']['id'].'" class="btn_accion estado-2-10 btn-success"  title="Ver Ot" aria-label="View"><i class="fa fa-eye" aria-hidden="true"></i></a>';
   $editar_compra=(Auth::user()->can('editar_ots') )?'<a href="editar/'.$compra->id.'" title="Editar Compra asociada"  class="btn_accion btn-info" aria-label="View"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a>':'';
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
        //
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
       
        return response()->json($Compras_ot);



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
}
