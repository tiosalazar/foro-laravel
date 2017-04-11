<?php


namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
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
use Carbon\Carbon;

setlocale(LC_TIME, 'es_CO');

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
         $this->middleware('auth');
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

        //Consulto el coordinador del area
        $role=Role::where('name','coordinador')->get();
        $estado=Estado::where('nombre','Espera')->get();

        $userdata= User::where('roles_id',$role[0]->id)
                    ->where('areas_id', $userauth)->get();

        //Si encuentra al encargado de area lo muestro, si no; no asignado
        if ( isset($userdata[0])) {
             $user=$userdata[0]->nombre.' '.$userdata[0]->apellido;
        }else{
            $user='No asignado';
        }

        //Condicional si es el coordinador envio todas las tareas del area
        if (Auth::user()->rol->name=='coordinador') {
         //Id area usuario logueado
          $areaauth = Auth::user()->area->id;

          //Si el estado es 7 pendiente, 5 Atencion area,2 Realizado muestro al coordinador las tareas de esa área con ese estado
          $tareas = Tarea::where([['estados_id', 5],['areas_id',$areaauth]])->orwhere([['estados_id', 7],['areas_id',$areaauth]])->orwhere([['estados_id', 2],['areas_id',$areaauth]])->get();
         

          //For each con las relaciones de las tareas con ot, id y cliente para mostrarlo en el listado del perfil
          foreach ($tareas as $key => $value) {
            $value->ot->cliente;
            $value['url']="/ver_tarea/".$value->id;
            $value->ot['cliente_inicial']=substr($value->ot->cliente->nombre, 0,1); // Devuelvo la inicial del cliente
            $value['descripcion']= strip_tags($value['descripcion']);
          
            
          }


        }else{

          //Si No es un coordinador muestro las tareas del area si el id del encargado es igual al usuario logeado
           $tareas = Tarea::where('estados_id','!=', 2)->where('estados_id','!=', 1)->where('estados_id','!=', 20)->where('encargado_id', Auth::user()->id)->get();
           
           foreach ($tareas as $key => $value) {
            $value->ot->cliente;
            $value['url']="/ver_tarea/".$value->id;
            $value->ot['cliente_inicial']=substr($value->ot->cliente->nombre, 0,1); // Devuelvo la inicial del cliente
          }


        }

        return view('adminlte::home')->with('user_encargado',$user)->with('tareas',$tareas);
        
    }

      public function SubirImagen(Request $request)
    {


       $user_actual=Auth::user()->nombre;
       $user_id_actual=Auth::user()->id;

       //Eliminar espacios del nombre
       $user_sin_espacios=str_replace(' ', '', $user_actual);

      //NOmbre
       $nombre= $user_sin_espacios.'_'.$user_id_actual;
      //Archivo
      $archivo= request()->file('image');

      if ($archivo==null) {
         return redirect('/home');
      }else{

        try {
          //Creo la imagen y la redimensiono
          $ext=$archivo->guessClientExtension();
          if (($ext!='jpg') && ($ext!='png') && ($ext!='jpeg') && ( $ext!='gif')) {
            return back()->with('error', 'No se puedo subir la imagen, formato incorrecto.');
          }
          $make_image = Image::make($archivo);
           $make_image->resize(230, 240,function ($constraint) {
            $constraint->aspectRatio();
            });
          $file = $make_image->resizeCanvas(230, 240);
          //Extension
          Log::info('Usuario: '.Auth::user()->id, array($archivo));
        } catch (Exception $e) {
          Log::error('Error al subir imagen: '.$e->getMessage());
          Log::error('Usuario: '.Auth::user()->id, array($archivo));
          return back()->with('error', 'No se puedo subir la imagen, intente de nuevo.');
        }


        if (($ext=='jpg') OR ($ext=='png') OR ($ext=='jpeg') OR( $ext=='gif') ) {

          //Guardar imagen
         $ext='png';

         //Local Descomentar el Siguiente y comentar el de producción
        //  $path = public_path("images\avatars\\");
         //para Producción descomentar el siguiente
         $path = "images/avatars/";
         $userauth = Auth::user()->id;
         $user= User::findOrFail($userauth);
         $user->fill(['img_perfil'=>'/images/avatars/'.$nombre.'.'.$ext]);
         $user->save();
         $file->save($path.$nombre.'.'.$ext);
         // $file->storeAs('/avatars/',$nombre.'.'.$ext,'public');
          return back()->with('status', 'Imagen actualizada');
        }else{
           return back()->with('error', 'No se puedo subir la imagen, formato incorrecto.');
        }

      }

    }
}
