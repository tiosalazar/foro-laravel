<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Planeacion_fase;
use App\Planeacion_tipo;
use Illuminate\Support\Facades\DB;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;

class FaseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $fases= DB::table('planeacion_fases')
            ->select('planeacion_fases.*', 'planeacion_tipos.nombre as nombre_tipo')
            ->join('planeacion_tipos', 'planeacion_fases.planeacion_tipos_id', '=', 'planeacion_tipos.id')
            ->get();
            return response()->json($fases);
        }catch(Exception $e){
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'fallo_en_la_creacion',
                'consola' =>$e->getMessage(),
                ],Response::HTTP_BAD_REQUEST);
        }
        
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
        $vl=$this->validatorCrearFase($request->all());
        if ($vl->fails())
        {
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear la Fase del Proyecto',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
        }else
        {
            $fase=new Planeacion_fase;
            $fase->fill($request->all());
            try
            {
             $fase->save();
             return response([
                'status' => Response::HTTP_OK,
                'response_time' => microtime(true) - LARAVEL_START,
                'obj' => $fase,
                'msg' => 'Fase del Proyecto creada con éxito',
                ],Response::HTTP_OK);
         }catch(Exception $e){
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'Fallo en la creacion de la Fase del proyecto. Comunicate con soporte',
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
        $fase= Fase::where('tipos_estados_id',$id)->get();
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
        $vl=$this->validatorCrearFase($request->all());
        if ($vl->fails())
        {
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear la Fase del Proyecto',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
        }else
        {
            $fase= Planeacion_fase::findOrFail($id);
            $fase->fill($request->all());
            try
            {
             $fase->update();
             return response([
                'status' => Response::HTTP_OK,
                'response_time' => microtime(true) - LARAVEL_START,
                'obj' => $fase,
                'msg' => 'Fase del Proyecto creada con éxito',
                ],Response::HTTP_OK);
         }catch(Exception $e){
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'Fallo en la creacion de la Fase del proyecto. Comunicate con soporte',
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
        $fase= Planeacion_fase::findOrFail($id);
        $fase->estado = 1;
        $fase->save();
        return response([
            'status' => Response::HTTP_OK,
            'response_time' => microtime(true) - LARAVEL_START,
            'obj' => $fase,
            'msg' => 'Fase del Proyecto borrada con éxito',
            ],Response::HTTP_OK);
    }

    /**
     * Devuelve las Fases agrupadas por el Tipo.
     *
     * @return \Illuminate\Http\Response
     */
    public function listFases()
    {

        try {
            $fases = Planeacion_tipo::with(['fases_planeacion'=> function ($query) {
                $query->where('estado', '!=', '1');
            }])->get();
            $output = array();
            foreach ($fases as $key => $value) {
                $output[] = array('tipo'=> $value->nombre, 'fases' => $value->fases_planeacion,'tipo_array' => $value);
            }
            return response()->json($output);
        }catch(Exception $e){
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'fallo_en_la_creacion',
                'consola' =>$e,
                ],Response::HTTP_BAD_REQUEST);
        }
    }
    protected function validatorCrearFase(array $data)
    {
        return Validator::make($data, [
            'nombre' => 'required|min:4',
            'planeacion_tipos_id' => 'required|numeric',
            ]);
    }
}
