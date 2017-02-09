<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Cliente;
use JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;
use Validator;
use Illuminate\Http\Response;
use Exception;

class ClienteController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      // $clientes = Cliente::all();
      $clientes = Cliente::where('estado', 1)->get();
      return response()->json($clientes);
    }
    /*public function index()
    {
        $clientes = Cliente::all();

        return view('listar_clientes', ['clientes' => $clientes]);
    }*/

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $cliente = new Cliente;
        $cliente->create($request->all());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $cliente = new Cliente;
        $cliente->fill($request->all());
        //Validación de las entradas por el metodo POST
        $vl=$this->validatorCrearCliente($request->all());
        if ($vl->fails()){
            // return response()->json($vl->errors());
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear el cliente',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
        }else{
            try {
                $cliente->save();
                return response([
                    'status' => Response::HTTP_OK,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'obj' => $cliente,
                    'error' => null,
                    'msg' => 'Cliente creado con exito',
                    ],Response::HTTP_OK);
            } catch (Exception $e) {
               return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'ERR_04',
                'msg' => 'excepcion, fallo la petición',
                'consola' =>$e->getMessage(),
                'obj' => $request->all()
                ],Response::HTTP_BAD_REQUEST);
           }
       }
        /*$cliente = new Cliente;
        $cliente->name = $request->name;
        $cliente->description = $request->description;
        $cliente->save();*/
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $user= Cliente::where('nit',$id)->get();
        return response()->json($user);
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
        try {       
            //Validación de las entradas por el metodo POST
            $vl=$this->validatorCrearCliente($request->all());
            if ($vl->fails()){
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al actualizar el cliente',
                    'error' => 'ERR_02',
                    'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);  
            }else{
                //Busca el cliente en la BD
                $cliente=  Cliente::findOrFail($id);
                // Si la data es valida se la asignamos al cliente
                $cliente->fill($request->all());
                // Actualizamos el cliente
                $cliente->save();
                return response([
                        'status' => Response::HTTP_OK,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'obj' => $cliente,
                        'error' => null,
                        'msg' => 'Cliente actualizado con éxito',
                    ],Response::HTTP_OK);                       
            }
        }catch(Exception $e){
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'error' => 'ERR_04',
                'msg' => 'excepcion, fallo la petición',
                'consola' =>$e->getMessage(),
                'obj' => $request->all()
                ],Response::HTTP_BAD_REQUEST);
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
        $vl= Validator::make(['id'=>$id], ['id' => 'required|integer']);
        
        try {
            //Busca el cliente en la BD
            $cliente=  Cliente::findOrFail($id);
            if ($vl->fails()) {
                return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'msg' => 'Error al eliminar el cliente',
                    'error' => 'ERR_03',
                    'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
            } else {
                $cliente->estado = 0;
                $cliente->save();
                return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'obj' => $cliente,
                            'error' => null,
                            'msg' => 'Cliente borrado con éxito',
                        ],Response::HTTP_OK);
            }
            
            
            
        } catch (Exception $e) {
            return response([
                    'status' => Response::HTTP_BAD_REQUEST,
                    'response_time' => microtime(true) - LARAVEL_START,
                    'error' => 'ERR_04',
                    'msg' => 'excepcion, fallo la petición',
                    'consola' =>$e->getMessage(),
                    'obj' => $request->all()
                ],Response::HTTP_BAD_REQUEST);
        }
    }
    /**
    *   
    *
    **/
    protected function validatorCrearCliente(array $data)
    {
        return Validator::make($data, [
            'nombre' => 'required|min:4',
            'nit' => 'required|min:4|max:45',
            // 'telefono' => 'min:4|max:45',
            // 'email' => 'email|max:155',
            'nombre_contacto' => 'min:4|max:45',
        ]);
    }
}
