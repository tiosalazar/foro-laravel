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
        // $fases= Planeacion_fase::all();
        // return response()->json($fases);
        try {
            $fases= DB::table('planeacion_fases')
                ->select('planeacion_fases.*', 'planeacion_tipos.nombre as nombre_tipo')
                ->join('planeacion_tipos', 'planeacion_fases.planeacion_tipos_id', '=', 'planeacion_tipos.id')
                // ->groupBy('planeacion_fases.planeacion_tipos_id')
                ->get();
            return response()->json($fases);
        }catch(Exception $e){
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'fallo_en_la_creacion',
                        'consola' =>$e,
                        // 'request' => $request->all()
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
     * Devuelve las Fases agrupadas por el Tipo.
     *
     * @return \Illuminate\Http\Response
     */
    public function listFases()
    {

        try {
            /*$fases= DB::table('planeacion_fases')
                ->select('planeacion_fases.*', 'planeacion_tipos.nombre as nombre_tipo')
                ->join('planeacion_tipos', 'planeacion_fases.planeacion_tipos_id', '=', 'planeacion_tipos.id')
                ->get();*/
            $fases = Planeacion_tipo::all();
            $output = array();
            foreach ($fases as $key => $value) {
                $output[] = array('tipo'=> $value->nombre, 'fases' => $value->Fases_planeacion);
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
}
