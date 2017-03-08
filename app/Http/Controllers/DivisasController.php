<?php

namespace App\Http\Controllers;

use App\Divisa;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;
use Carbon\Carbon;
use Lang;

class DivisasController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $divisas  = Divisa::where('estado',0)->get();
            return response()->json($divisas);
        } catch (Exception $e) {
            return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'divisas' => $divisas,
                    'error'=>$e->getMessage(),
                    'msg' => 'No se pudo traer las divisas'
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
        $vl=$this->validatorCrearDivisa($request->all());
        if ($vl->fails())
        {
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error en algunos campos',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
        }else
        {
                $divisa=new Divisa;
                $divisa->fill($request->all());
                try
                {
                 $divisa->save();
                 return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'obj' => $divisa,
                    'msg' => 'Divisa creada',
                    ],Response::HTTP_OK);
             }catch(Exception $e){
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'Fallo la creación de la divisa, comunicate con soporte',
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
        $vl=$this->validatorCrearDivisa($request->all());
        if ($vl->fails())
        {
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error en algunos campos',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
        }else
        {
                $divisa= Divisa::findOrFail($id);
                $divisa->fill($request->all());
                try
                {
                 $divisa->update();
                 return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'obj' => $divisa,
                    'msg' => 'Divisa actualizada con éxito',
                    'lang'=> Lang::get('texto_menu.crear_ot'),
                    ],Response::HTTP_OK);
             }catch(Exception $e){
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'Fallo la creación de la divisa, comunicate con soporte',
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
        $divisa= Divisa::findOrFail($id);
        $divisa->estado = 1;
        try {
            $divisa->save();
            return response([
                'status' => Response::HTTP_OK,
                'response_time' => microtime(true) - LARAVEL_START,
                'obj' => $divisa,
                'msg' => 'Divisa creada con éxito',
            ],Response::HTTP_OK);
        } catch (Exception $e) {
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'Fallo en la creacion de la divisa. Comunicate con soporte',
                'consola' =>$e->getMessage(),
                'obj' => $divisa,
                'msg' => 'Error al borrar divisa, comunicate con soporte',
            ],Response::HTTP_BAD_REQUEST);
        }
    }

    protected function validatorCrearDivisa(array $data)
    {
        return Validator::make($data, [
            'nombre' => 'required|min:4|alpha',
            'tasa_conversion' => 'numeric',
            ]);
    }
}
