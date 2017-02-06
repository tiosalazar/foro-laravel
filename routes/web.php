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
    return view('vendor.adminlte.auth.login');
});


Route::get('/console','UserController@AgregarRoll');



Route::group(['middleware' => 'auth'], function () {
    //    Route::get('/link1', function ()    {
//        // Uses Auth Middleware
//    });
 

   Route::get('/','HomeController@index');

   //Ruta para cargar imagen de perfil
  Route::post('/usuariosuploadimagen','HomeController@SubirImagen');

   

    //Please do not remove this if you want adminlte:route and adminlte:link commands to works correctly.
    #adminlte_routes

    Route::get('/crear_ot', function () {
           return view('crear_ot');
    });
    // Clientes
    Route::get('/crear_cliente', function () {
           return view('admin.clientes.crear_cliente');
    });
    Route::get('/listar_clientes', function () {
           return view('admin.clientes.listar_clientes');
    });

    // Tareas
    Route::get('/crear_tarea', function () {
           return view('admin.tareas.crear_tarea');
    });

    Route::get('/usuarios', function () {
           return view('admin.equipo.usuarios');
    });

    Route::get('/crear_usuario', function () {
           return view('admin.equipo.crear_usuario');
    });
     Route::get('/roles', function () {
           return view('admin.roles.crear_roles');
    });
     Route::get('/areas', function () {
           return view('admin.areas.crear_areas');
    });

     Route::get('/listar_areas', function () {
           return view('admin.areas.listar_areas');
    });

    Route::get('editar_usuario/{id}','UserController@editar_usuario');

    

});

Route::get('/p', function () {
    return bcrypt('H1m4l4ya!');
});
