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
use Zizaco\Entrust\Traits\EntrustUserTrait;

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
      //  $user =  User::findOrfail(1);
        // role attach alias
        //$user->attachRole(2); // parameter can be an Role object, array, or id

        // or eloquent's original technique
        //$user->roles()->attach(2); // id only

       // var_dump($user->role());
       // $rol = Role::findOrfail(12);
       //var_dump($rol->User);
      //  var_dump($user);
        return view('adminlte::home');
    }
}