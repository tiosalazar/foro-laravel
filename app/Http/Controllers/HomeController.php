<?php

/*
 * Taken from
 * https://github.com/laravel/framework/blob/5.3/src/Illuminate/Auth/Console/stubs/make/controllers/HomeController.stub
 */

namespace App\Http\Controllers;

use App\Http\Requests;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\User;
use App\Role;
use Validator;
use Zizaco\Entrust\Traits\EntrustUserTrait;
use Illuminate\Support\Facades\Input;
use Intervention\Image\ImageManager;
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
    
    
        $userauth = Auth::user()->area->id;
      
        $role=Role::where('name','coordinador')->get();
        $userdata= User::where('roles_id',$role[0]->id)
                    ->where('areas_id', $userauth)->get();
       
        if ( isset($userdata[0])) {
             $user=$userdata[0]->nombre;
        }else{
            $user='No asignado';
        }

        return view('adminlte::home')->with('user_encargado',$user);
    }

      public function SubirImagen(Request $request)
    {

      $user_actual=Auth::user()->nombre;
      $user_id_actual=Auth::user()->id;
      //NOmbre
      $nombre= $user_actual. $user_id_actual;
      //Archivo
      $file= request()->file('image');
      //Extension
      $ext=$file->guessClientExtension();

      if ($ext=='jpg' OR $ext=='png' OR $ext=='jpeg' OR $ext=='gif' ) {
        //Guardar imagen
       $ext='png';
       $file->storeAs('/avatars/',$nombre.'.'.$ext,'public');
       return back(); 
      }else{
        
         return back(); 
      }

       // $path=public_path('uploads/'.$nombre);
       // $url='/uploads/'.$nombre;
       // $image=Image::make($file->getRealPatch());
       // $image->save($path);
       // return back(); 
       // return '<img> srce="'.$url.'"/> ';

      

    }
}