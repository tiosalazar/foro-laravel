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

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('cors');

Route::group(['prefix' => 'v1','middleware' => 'cors'], function () {
    //    Route::resource('task', 'TasksController');

    //Please do not remove this if you want adminlte:route and adminlte:link commands to works correctly.
    #adminlte_api_routes

    //Funciones para las Canchas.
     Route::resource('clientes', 'ClienteController');
     Route::resource('usuarios', 'UserController');
     Route::resource('estados', 'EstadoController');
     Route::resource('areas', 'AreaController');
     Route::resource('roles', 'RolController');
     Route::resource('fases', 'FaseController');
     Route::resource('tareas', 'TareaController');
     // OTs
     Route::resource('ots', 'OtController');

     Route::get('tipos_compra', function (Request $request) {
                 $tipo_compra= App\Tipos_Compra::all();
              return response()->json($tipo_compra);
        });
    Route::get('divisas', function (Request $request) {
                    $divisas= App\Divisa::all();
                 return response()->json($divisas);
           });

});
