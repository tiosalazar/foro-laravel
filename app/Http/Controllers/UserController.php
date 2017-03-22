<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Role;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use App\Http\Requests\StoreUsers;
use Illuminate\Http\Response;
use Exception;
use Illuminate\Support\Facades\Auth;
use Yajra\Datatables\Datatables;
use Carbon\Carbon;


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
            select('users.id','users.nombre','users.apellido','users.cargo','users.telefono','users.email','users.img_perfil','users.horas_disponible','users.horas_gastadas','roles.display_name as roles_id','areas.nombre as areas_id','users.estado','areas.id as id_area','roles.id as id_rol')->join('roles','roles.id','=','users.roles_id')->join('areas','areas.id','=','users.areas_id')->where('users.estado','1')->get();
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
                    $user->api_token=str_random(60);

                    $user->save();
                    $user->attachRole($request->roles_id);
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
    public function show($nombre_rol)
    {
        $ejecutivos= Role::where('name',$nombre_rol)->first();
        $user= User::where('roles_id', $ejecutivos->id)->where('estado',1)->get();
        return response()->json($user);
    }

     /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function UsuariosArea($id)
    {
        $output=array();
        $users= User::with(['roles'=> function ($query)
        {
            $query->where('name','colaborador')->orWhere('name','coordinador');
        },'area'=>function ($query) use($id)
        {
            $query->where('id',$id);
        }])->where('estado',1)
        ->get();
        // Validar sólo los que tengan area y rol
        foreach ($users as $key => $user) {
            if (!is_null($user->area)&& !is_null($user->roles)) {
                array_push($output, $user);
            }
        }
        return response()->json($output);
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
            select('users.id','users.nombre','users.apellido','users.cargo','users.telefono','users.fecha_nacimiento','users.email','users.horas_disponible','roles.display_name as id_rol','areas.nombre as id_area','users.estado','areas.id as areas_id','roles.id as roles_id')->join('roles','roles.id','=','users.roles_id')->join('areas','areas.id','=','users.areas_id')->findOrFail($id);
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
                                $userpass=$user->password;

                               
                                // Si la data es valida se la asignamos al usuario
                                $user->fill($request->all());

                                if ($request->has('password') && !is_null($request->password)) {
                                  //Encriptamos la contraeña
                                  $user->password=bcrypt($request->password);
                                }                               
                                   

                                // Guardamos el usuario
                                $respuesta["obj"]=$request;
                                $user->save();
                                $respuesta["msg"]='Editado con exito';

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

        $respuesta=[];

            //Validaciòn de las entradas por el metodo POST
        try{
            $user = User::findOrFail($id);
              $user->estado=0;
              $user->save();
              $respuesta["msg"]='Eliminado con exito';
              $respuesta["error"]=0;
              $respuesta["mensaje"]="OK";
              $respuesta["obj"]=$user;
        }catch(Exception $e){
            $respuesta["msg"]='Error al eliminar el usuario o no encontrado';
            $respuesta["error"]='Error';
            $respuesta["mensaje"]="Fail";
            $respuesta["obj"]=$user;

        }
                // $user = User::findOrFail($id);

                //  if ($user->fails()){
                //         return response()->json($user->errors());

                //     }else{
                //         $user->estado=0;
                //         $user->save();
                //         $respuesta["msg"]='Eliminado con exito';
                //         $respuesta["error"]=0;
                //         $respuesta["mensaje"]="OK";
                //         $respuesta["obj"]=$user;
                //      }


        return response()->json($respuesta);
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
                'email' => 'required|email|max:155',
                'roles_id' => 'required',
                'areas_id' => 'required'
        ]);
    }

    public function Debug()
   {
       var_dump('holip');
   }

     public function AgregarRoll()
    {
       // $user =  User::find(1)->roles;

        $user =  User::find(1);
        //$role_id= Role::where('name','owner')->first();

       // $user->roles()->attach($role_id);
        // role attach alias
        //$user->attachRole(2); // parameter can be an Role object, array, or id

        // or eloquent's original technique
        //$user->roles()->attach(2); // id only

        //var_dump($user->role());
       // $rol = Role::findOrfail(12);
       //var_dump($rol->User);
        var_dump($user->can('crear_usuarios') );
        //return view('adminlte::home',array('usuario' =>$user));
    }
    /**
     * Devuelve las notificaciones para llenar un Datatable
     * @return Datatable
     */
    public function getNotifications()
    {
        $user = User::findOrFail(Auth::id());

        $notifications = $user->notifications;

        return Datatables::of($notifications)->make(true);

    }
    /**
     * Paginar las notificaciones en el Header
     * @return JSON Array
     */
    public function notificationsPaged()
    {
        $user = User::findOrFail(Auth::id());

        $notifications = $user->notifications()->paginate(4);

        $today = Carbon::now();
        foreach ($notifications as $key => $notify) {
            $notify->time_ago = $today->diffForHumans($notify->created_at);    
        }
        return response()->json($notifications);
    }
    /**
     * Obtiene el total de las notificaciones no leidas
     * @return JSON Array
     */
    public function getUnReadNotifications()
    {
        $user = User::findOrFail(Auth::id());

        $notifications = $user->unreadNotifications;

        $total =$notifications->count();
        return response()->json($total);
    }
    /**
     * Agregar un read_at a las notificaciones no leidas
     * y las pone como 'vistas'
     * @return void
     */
    public function readNotifications()
    {
        $user = User::findOrFail(Auth::id());

        $notifications = $user->unreadNotifications->markAsRead();
    }
    public function listNotifications()
    {
        $user = User::findOrFail(Auth::id());

        $notifications = $user->notifications;

        
    }




}
