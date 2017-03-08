<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Role;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Http\Response;
use Exception;
use App\Permission;



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
               // return response()->json($request->all());
            return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear el Rol',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);
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
                            'obj' => $roles,
                            'msg' => 'Rol creado con exito',
                        ],Response::HTTP_OK);
                }catch(Exception $e){
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'Fallo en la creacion del Rol',
                        'consola' =>$e->getMessage(),
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
                    $vl=$this->validatorUpdateRol($request->all());
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
                               $respuesta["id"]=$id;
                               $respuesta["nombre"]=$request->all();
                               $respuesta["error"]=0;
                               $respuesta["mensaje"]="OK";
                               $respuesta["msg"]="Editado con exito";

                             }
                    }catch(Exception $e){
                       $respuesta["error"]="rol_no_encontrado";
                       $respuesta["codigo_error"]="UC_Update_dontfind";
                       $respuesta["mensaje"]="Rol no encontrado";
                       $respuesta["consola"]=$e;
                       $respuesta["msg"]="Fallo al editar";
                       $respuesta["request"]=$request->all();

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

    }

    /*
    *DSO 07-03-2017
    * Listartodos los permisos permisos
    * @return \Illuminate\Http\Response
    */
    public function showAllPermisions()
    {
        $permisos= Permission::all();
        return response()->json($permisos);

    }

    /*
    *DSO 07-03-2017
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function showPermisionsbyRole($id)
    {
        
       $role=Role::findOrFail($id);    
       return response()->json($role->perms);

    }
    /*
    *DSO 07-03-2017
    * @param  \Illuminate\Http\Request  $request
    * @param  int  $id
    * @return \Illuminate\Http\Response
    */
    public function updatePermisionsbyRole(Request $request, $id)
    {
                       
        try {
             $role=Role::findOrFail($id);
             //$permisos2=["id"=> 21,"id"=> 22,"id"=> 23];  
             // $role->perms()->sync( $request->data ); 
             $arraypermisos = array();
             $dato=$request->all();
             foreach ($dato as $key => $value) {
                 array_push($arraypermisos,$value);
             }
             $role->perms()->sync( $arraypermisos);                      
              return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'obj' => $role,
                            'msg' => 'Se han actualizado correctamente los permisos del Rol '.$role->display_name,
                        ],Response::HTTP_OK);

        }catch(Exception $e){
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'Fallo en la asigación de permisos al Rol '.$role->display_name,
                        'consola' =>$e->getMessage(),
                        'request' => $request->all(),
                        'id'=>$id,
                    ],Response::HTTP_BAD_REQUEST);
               }
    }

   /*DSO 24-01-2016 Funcion para validar los campos al ingreso de un usuario
    * entra el arreglo de datos
    * Sale un arreglo con los errores.
    */
   protected function validatorCrearRol(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|min:4',
            'display_name' => 'required|min:4',
        ]);
    }
    /*DSO 24-01-2016 Funcion para validar los campos al ingreso de un usuario
     * entra el arreglo de datos
     * Sale un arreglo con los errores.
     */
    protected function validatorUpdateRol(array $data)
     {
         return Validator::make($data, [
             'display_name' => 'required|min:4',
         ]);
     }
}
