<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Tarea;
use App\Ot;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;

class TareaController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tareas= Tarea::all();
        foreach ($tareas as $key => $value) {
            $value->Ot->Cliente;
            $value->Estado;
        }
        // return response()->json($tareas);
        return array('recordsTotal'=>count($tareas),'recordsFiltered'=>count($tareas),'data'=>$tareas);
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
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
    *
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
            'planeacion_fases_id' => 'required',
        ]);
    }
}
