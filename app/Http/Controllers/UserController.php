<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use App\Http\Requests\StoreUsers;
use Illuminate\Http\Response;
use Exception;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      // $user= User::where('estado',1)->get();
       $user = User::
            select('users.id','users.nombre','users.apellido','users.cargo','users.telefono','users.email','users.horas_disponible','roles.nombre as roles_id','areas.nombre as areas_id','users.estado','areas.id as id_area','roles.id as id_rol')->join('roles','roles.id','=','users.roles_id')->join('areas','areas.id','=','users.areas_id')->get();
      // return response()->json($user);
      return array('recordsTotal'=>count($user),'recordsFiltered'=>count($user),'data'=>$user);
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

     $respuesta=[];
       //Validaciòn de las entradas por el metodo POST
        $vl=$this->validarCamposUsuario($request->all());
      if ($vl->fails())
         {
               // return  response()->json( $vl->errors(),Response::HTTP_BAD_REQUEST); 
                return response([
                'status' => Response::HTTP_BAD_REQUEST,
                'response_time' => microtime(true) - LARAVEL_START,
                'msg' => 'Error al crear el usuario',
                'error' => 'ERR_01',
                'obj' =>$vl->errors()
                ],Response::HTTP_BAD_REQUEST);        
         }else
             {        
                $user=new User;  
                $user->fill($request->all());
                //Se encripta la contraseña del usuario.
                $user->password=bcrypt($request->password);
                try 
                {
                    $user->remember_token = str_random(60);
                    $user->save();
                      return response([
                            'status' => Response::HTTP_OK,
                            'response_time' => microtime(true) - LARAVEL_START,
                            'usuario' => $user,
                            'msg' => 'Usuario creado con éxito',
                            'request' => $request->all()
                        ],Response::HTTP_OK);
                }catch(Exception $e){
                    return response([
                        'status' => Response::HTTP_BAD_REQUEST,
                        'response_time' => microtime(true) - LARAVEL_START,
                        'error' => 'fallo_el_registro',
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
        $user= User::where('roles_id',$id)->get();
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
        $user = User::findOrFail($id);
         return response()->json($user);
        // return view('admin.equipo.editar_usuarios', array('usuarios' =>$user);
    }

     /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function editar_usuario($id)
    {
         // Retorno consulta de join con la tabla areeas y roles para traer los nombres
         $user = User::
            select('users.id','users.nombre','users.apellido','users.cargo','users.telefono','users.email','users.horas_disponible','roles.nombre as roles_id','areas.nombre as areas_id','users.estado','areas.id as id_area','roles.id as id_rol')->join('roles','roles.id','=','users.roles_id')->join('areas','areas.id','=','users.areas_id')->findOrFail($id);
         //return response()->json($user);
         return view('admin.equipo.editar_usuario')->with('usuarioslist',$user);
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
                    $vl=$this->validatorUpdateUsuario($request->all());
                         if ($vl->fails())
                            {
                               return response()->json($vl->errors());        
                            }else
                                {
                                //Busca el usuario en la BD
                                 $user=  User::findOrFail($id);
                                // Si la data es valida se la asignamos al usuario
                                $user->fill($request->all());
                                // Guardamos el usuario
                                $user->update();
                               $respuesta["error"]=0;
                               $respuesta["mensaje"]="OK";                        
                             }
                    }catch(Exception $e){
                       $respuesta["error"]="usuario_no_encontrado";
                       $respuesta["codigo_error"]="UC_Update_dontfind";
                       $respuesta["mensaje"]="Usuario no encontrado";
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
        $user = User::findOrFail($id);
        $user->estado=0;
        $user->save();
        return response()->json($user);
    }

     /*DSO 24-01-2016 Funcion para validar los campos al crear un usuario 
    * entra el arreglo de datos
    * Sale un arreglo con los errores.
    */   
   protected function validarCamposUsuario(array $data)
    {
        return Validator::make($data, [
                'nombre' => 'required|min:4|max:45',
                'apellido' => 'required|min:4|max:45',
                'cargo' => 'required|min:4|max:45',
                'email' => 'required|email|max:155|unique:users,email',
                'horas_disponible' => 'required',
                'password' => 'required',
                'roles_id' => 'required',
                'areas_id' => 'required'
        ]);
    }
    
    /*DSO 24-01-2016 Funcion para validar los campos al ingreso de un usuario 
    * entra el arreglo de datos
    * Sale un arreglo con los errores.
    */   
   protected function validatorIngresoUsuario(array $data)
    {
        return Validator::make($data, [
            'email' => 'required|email|max:255',
            'password' => 'required|min:6',
        ]);
    }
    
     /*DSO 24-01-2016 Funcion para validar los campos al actualizar un usuario 
    * entra el arreglo de datos
    * Sale un arreglo con los errores.
    */ 
    protected function validatorUpdateUsuario(array $data)
    {
       return Validator::make($data, [
                'nombre' => 'required|min:4|max:45',
                'apellido' => 'required|min:4|max:45',
                'cargo' => 'required|min:4|max:45',
                'email' => 'required|email|max:155|unique:users,email',
                'roles_id' => 'required',
                'areas_id' => 'required'
        ]);
    }
}
