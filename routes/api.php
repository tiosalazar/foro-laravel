<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Route::group(['prefix' => 'v1','middleware' => 'auth:api'], function () {

    //Please do not remove this if you want adminlte:route and adminlte:link commands to works correctly.
    #adminlte_api_routes

     Route::resource('clientes', 'ClienteController');
     Route::resource('usuarios', 'UserController');
     Route::resource('estados', 'EstadoController');
     Route::resource('areas', 'AreaController');
     Route::resource('listar_areas', 'AreaController@index_areas');
     Route::resource('usuarios_tarea', 'UserController@UsuariosArea');
     Route::resource('roles', 'RolController');
     Route::resource('fases', 'FaseController');
     Route::resource('tipos_compra', 'TiposCompraController');
     Route::resource('tipos_fase', 'TipoFaseController');
     Route::resource('tareas', 'TareaController');
     Route::resource('divisas', 'DivisasController');
     // OTs
     Route::resource('ots', 'OtController');
     Route::put('actualizar_estado_ot/{id}', 'OtController@updateEstadoOT');
     Route::post('solicitarHoras', 'OtController@solicitarHoras');
     
    Route::get('select_clientes', 'ClienteController@select_clientes');

    //Permisos Roles
     Route::get('permisos','RolController@showAllPermisions');
     Route::get('permisos_role/{id}','RolController@showPermisionsbyRole');
     Route::put('permisos_role/{id}','RolController@updatePermisionsbyRole');


});
