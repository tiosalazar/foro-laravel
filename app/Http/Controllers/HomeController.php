<?php


namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Role;
use App\Tarea;
use App\Area;
use App\Estado;
use Validator;
use Zizaco\Entrust\Traits\EntrustUserTrait;
use Illuminate\Support\Facades\Input;
use Intervention\Image\ImageManagerStatic as Image;
use Storage;




/**
 * Class HomeController
 * @package App\Http\Controllers
 */
class HomeController extends Controller
{
     use EntrustUserTrait;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        // $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return Response
     */
    public function index()
    {

        //Id del area del usuario conectado
        $userauth = Auth::user()->area->id;

        $role=Role::where('name','coordinador')->get();
        $estado=Estado::where('nombre','Espera')->get();

        $userdata= User::where('roles_id',$role[0]->id)
                    ->where('areas_id', $userauth)->get();

        if ( isset($userdata[0])) {
             $user=$userdata[0]->nombre;
        }else{
            $user='No asignado';
        }

        //Condicional si es el coordinador envio todas las tareas del area
        if (Auth::user()->rol->name=='coordinador') {
          $tareas = Tarea::where('areas_id', $userauth)->get();
        }else{
           $tareas = Tarea::where('areas_id', $userauth)->where('estados_id', $estado)->get();
        }

        return view('adminlte::home')->with('user_encargado',$user)->with('tareas',$tareas);
    }

      public function SubirImagen(Request $request)
    {


       $user_actual=Auth::user()->nombre;
       $user_id_actual=Auth::user()->id;
      //NOmbre
       $nombre= $user_actual. $user_id_actual;
      //Archivo
      $archivo= request()->file('image');
      //Creo la imagen y la redimensiono
      $make_image = Image::make($archivo);
       $make_image->resize(230, 240,function ($constraint) {
        $constraint->aspectRatio();
        });
      $file = $make_image->resizeCanvas(230, 240);
      //Extension
      $ext=$archivo->guessClientExtension();

      if (($ext=='jpg') OR ($ext=='png') OR ($ext=='jpeg') OR( $ext=='gif') ) {
        //Guardar imagen
       $ext='png';

       $path = public_path("images\avatars\\");
       $userauth = Auth::user()->id;
       $user= User::findOrFail($userauth);
       $user->fill(['img_perfil'=>'/images/avatars/'.$nombre.'.'.$ext]);
       $user->save();
       $file->save($path.$nombre.'.'.$ext);
       // $file->storeAs('/avatars/',$nombre.'.'.$ext,'public');
        return back();
      }else{

         return back();
      }

    }
}
