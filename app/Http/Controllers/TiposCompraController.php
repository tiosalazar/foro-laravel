<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Foundation\Validation\ValidatesRequests;
use App\Tipos_compra;
use Validator;
use Illuminate\Http\Response;


class TiposCompraController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
         $tipo_compra= Tipos_compra::where('estado',1)->get();
         return response()->json($tipo_compra);
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
       
        $vl=$this->validarCampos($request->all());
        if ($vl->fails()) {
             return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear el usuario',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);        
         }else{
                $tipos_compra = new  Tipos_compra;
                $tipos_compra->fill($request->all());
            try {

                $tipos_compra->save();
                 return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'tipos_compra' => $tipos_compra,
                    'msg' => 'Creado con éxito',
                    'request' => $request->all()
                ],Response::HTTP_OK);  
                
            } catch (Exception $e) {
                 return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'Falla al ingresar datos',
                    'consola' =>$e,
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
        $vl=$this->validarCampos($request->all());
        if ($vl->fails()) {
             return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear el usuario',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);        
         }else{
                $tipos_compra=Tipos_compra::findOrFail($id);
                $tipos_compra->fill($request->all());
            try {

                $tipos_compra->update();
                 return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'tipos_compra' => $tipos_compra,
                    'msg' => 'Editado con éxito',
                    'request' => $request->all()
                ],Response::HTTP_OK);  
                
            } catch (Exception $e) {
                 return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'Falla al al editar',
                    'consola' =>$e,
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
             //Validaciòn de las entradas por el metodo POST
        try{
            $tipos_compra = Tipos_compra::findOrFail($id);
            $tipos_compra->estado=0;
            $tipos_compra->save();
              return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'tipos_compra' => $tipos_compra,
                    'msg' => 'Eliminado con éxito',
                    'request' => $id
                ],Response::HTTP_OK); 
        }catch(Exception $e){
           return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'Error al eliminar',
                    'consola' =>$e,
                    'request' => $id
                ],Response::HTTP_BAD_REQUEST);

        }
    }

    /*DSO 24-01-2016 Funcion para validar los campos al crear un tipo de compra
    * entra el arreglo de datos
    * Sale un arreglo con los errores.
    */
   protected function validarCampos(array $data)
    {
        return Validator::make($data, [
                'nombre' => 'required|min:4|max:45'
        ]);
    }
}
