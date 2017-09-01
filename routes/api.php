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

Route::resource('cal', 'gCalendarController');
Route::get('oauth', 'gCalendarController@oauth')->name('oauthCallback');

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
     Route::get('ots_datatable','OtController@datatable_index');
     Route::delete('eliminar/ot/area/{id_ot}/{id_area}', 'OtController@destroyAreaOT');
     //Compras OT
     Route::resource('compra', 'Compras_OtController');
     Route::get('compras_datatable','Compras_OtController@datatable_index');

     Route::get('select_clientes', 'ClienteController@select_clientes');

     //Permisos Roles
      Route::get('permisos','RolController@showAllPermisions');
      Route::get('permisos_role/{id}','RolController@showPermisionsbyRole');
      Route::put('permisos_role/{id}','RolController@updatePermisionsbyRole');

     Route::get('fases_x_tipo/{id}','FaseController@show_by_tipos_fase');

     Route::get('show_tareas_by_fase','TareaController@showTareasByFase');

     // Actualizar trafico
     Route::post('save_trafic/{id}', 'TareaController@saveTrafic');

     //usuarios
     Route::get('index_datatables','UserController@indexDatatables');

    // Listar todos los Estados de tareas
    Route::get('estados_x_tareas/{id}', 'EstadoController@listarEstadosTarea');

    //ruta del api todas las tareas
     Route::get('/ver_all_tareas_trafico','TareaController@getTraficoTareas');


     Route::resource('clientes_requerimiento', 'RequerimientosClientesController');

    // Agregar comentario al requerimiento
    Route::post('comentarios', 'RequerimientosClientesController@agregarComentario');
    Route::get('comentarios/{id}', 'RequerimientosClientesController@getComentario');

    //ruta del api todas las tareas de los requerimientos
     Route::get('/ver_all_tareas_requerimiento','RequerimientosClientesController@ShowDatatbleTareasRequerimiento');
      Route::get('/listar_requerimientos','RequerimientosClientesController@ShowDatatbleRequerimiento');


});
