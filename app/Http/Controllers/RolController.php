<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;




class RolController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       $roles= Role::all();
      return response()->json($roles);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
       
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
         $respuesta=[];
       //Validaciòn de las entradas por el metodo POST
        $vl=$this->validatorCrearRol($request->all());
      if ($vl->fails())
         {
               return response()->json($request->all());        
         }else
             {        
                    $roles=new Role;  
                    $roles->fill($request->all());
                try 
                {
                     $roles->save();
                      return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'rol' => $roles
                        ],Response::HTTP_OK);
                }catch(Exception $e){
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'fallo_en_la_creacion',
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
        $rol = Role::findOrFail($id);
        return response()->json($rol);
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
          $respuesta=[];
                    try 
                    {       
                    //Validaciòn de las entradas por el metodo POST
                    $vl=$this->validatorCrearRol($request->all());
                         if ($vl->fails())
                            {
                               return response()->json($vl->errors());        
                            }else
                                {
                                //Busca el usuario en la BD
                                 $rol=  Role::findOrFail($id);
                                // Si la data es valida se la asignamos al usuario
                                $rol->fill($request->all());
                                // Guardamos el usuario
                                $rol->update();
                               $respuesta["error"]=0;
                               $respuesta["mensaje"]="OK";                        
                             }
                    }catch(Exception $e){
                       $respuesta["error"]="rol_no_encontrado";
                       $respuesta["codigo_error"]="UC_Update_dontfind";
                       $respuesta["mensaje"]="Rol no encontrado";
                       $respuesta["consola"]=$e;
                   }
        return response()->json($respuesta);
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

   /*DSO 24-01-2016 Funcion para validar los campos al ingreso de un usuario 
    * entra el arreglo de datos
    * Sale un arreglo con los errores.
    */   
   protected function validatorCrearRol(array $data)
    {
        return Validator::make($data, [
            'nombre' => 'required|min:4',
        ]);
    }
}