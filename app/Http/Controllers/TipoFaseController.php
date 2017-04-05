<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Planeacion_tipo;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\Response;
use Exception;
use Validator;
use App\Area;

class TipoFaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $tipo_fase=Planeacion_tipo::with('Area_planeacion')->where('estado','!=','1')->get();
        return response()->json($tipo_fase);
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
        $vl=$this->validatorCrearTipoFase($request->all());
        if ($vl->fails())
        {
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear el Tipo de Fase del Proyecto',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
        }else
        {
            $fase=new Planeacion_tipo;
            $fase->fill($request->all());
            try
            {
             $fase->save();
             return response([
                'status' => Response::HTTP_OK,
                'response_time' => microtime(true) - LARAVEL_START,
                'obj' => $fase,
                'area' => $fase->Area_planeacion,
                'msg' => 'Tipo de Fase del Proyecto creada con éxito',
                ],Response::HTTP_OK);
         }catch(Exception $e){
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'Fallo en la creacion de la Tipo de Fase del proyecto. Comunicate con soporte',
                'consola' =>$e->getMessage(),
                'obj' => [],
                'request' => $request->all()
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
        $fase= Planeacion_tipo::where('id',$id)->get();
        return response()->json($fase);
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
        $vl=$this->validatorCrearTipoFase($request->all());
        if ($vl->fails())
        {
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear el Tipo de Fase del Proyecto',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
        }else
        {
            $fase= Planeacion_tipo::findOrFail($id);
            $fase->fill($request->all());
            try
            {
             $fase->update();
             return response([
                'status' => Response::HTTP_OK,
                'response_time' => microtime(true) - LARAVEL_START,
                'obj' => $fase,
                'msg' => 'Tipo de Fase del Proyecto creada con éxito',
                ],Response::HTTP_OK);
         }catch(Exception $e){
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'Fallo en la creacion de la Tipo de Fase del proyecto. Comunicate con soporte',
                'consola' =>$e->getMessage(),
                'obj' => [],
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
        try {
            $fase= Planeacion_tipo::findOrFail($id);
            $fase->estado = 1;
            $fase->save();
            return response([
                'status' => Response::HTTP_OK,
                'response_time' => microtime(true) - LARAVEL_START,
                'obj' => $fase,
                'msg' => 'Tipo de Fase del Proyecto borrada con éxito',
                ],Response::HTTP_OK);
        } catch (Exception $e) {
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'Fallo en la creacion de la Tipo de Fase del proyecto. Comunicate con soporte',
                'consola' =>$e->getMessage(),
                'obj' => [],
                'request' => $request->all()
                ],Response::HTTP_BAD_REQUEST);
        }
    }

    protected function validatorCrearTipoFase(array $data)
    {
        return Validator::make($data, [
            'nombre' => 'required|min:4',
            ]);
    }
}
