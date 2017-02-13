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
   
   //OTS
    Route::get('/crear_ot', function () {
           return view('admin.ots.crear_ot');
    });
    Route::get('/editar_ot/{id}','OtController@show');

    Route::get('/listar_ot', function () {
           return view('admin.ots.listado_ot');
    });

    Route::get('/show_ots_tareas','OtController@showOtEnTareas');
    Route::get('/show_ots_tareas/{query}','OtController@showOtEnTareasByQuery');

    // Clientes
    Route::get('/crear_cliente', function () {
           return view('admin.clientes.crear_cliente');
    });
    Route::get('/listar_clientes', function () {
           return view('admin.clientes.listar_clientes');
    });
    Route::get('/editar_cliente/{id}', 'ClienteController@getCliente');

    // Tareas
    Route::get('/crear_tarea', function () {
           return view('admin.tareas.crear_tarea');
    });
    Route::get('/listar_tareas', function () {
           return view('admin.tareas.listar_tareas');
    });
    Route::get('/all_tareas/{id}','TareaController@showAllTareas');
    Route::get('/ver_tarea/{id}','TareaController@showOneTarea');

    Route::get('/list_fases','FaseController@listFases');

    // Usuarios

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
