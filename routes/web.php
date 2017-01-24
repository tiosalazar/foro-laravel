<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::group(['middleware' => 'auth'], function () {
    //    Route::get('/link1', function ()    {
//        // Uses Auth Middleware
//    });

    //Please do not remove this if you want adminlte:route and adminlte:link commands to works correctly.
    #adminlte_routes

    Route::get('/crear_ot', function () {
           return view('crear_ot');
    });

    Route::get('/usuarios', function () {
           return view('admin.usuarios.usuarios');
    });

    Route::get('/crear_usuario', function () {
           return view('admin.usuarios.crear_usuario');
    });
     Route::get('/roles', function () {
           return view('admin.usuarios.crear_roles');
    });
      Route::get('/areas', function () {
           return view('admin.usuarios.crear_areas');
    });

});

Route::get('/p', function () {
    return bcrypt('H1m4l4ya!');
});
