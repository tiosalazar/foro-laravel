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


  Auth::routes();
  Route::get('/console','UserController@AgregarRoll');

 Route::group(['middleware' => 'auth'], function () {
    
    Route::get('/home', 'HomeController@index');
    Route::get('/','HomeController@index');

   //Ruta para cargar imagen de perfil
    Route::post('/usuariosuploadimagen','HomeController@SubirImagen');

    //Please do not remove this if you want adminlte:route and adminlte:link commands to works correctly.
    #adminlte_routes

    //Roles
    Route::get('/roles', function () {
      return view('admin.roles.crear_roles');
    });


    /*
     * Foro por Área
     */
    // Lista todas las áreas
    Route::get('/foro', function () {
      return view('admin.foro.general');
    })->name('foro');
    // Desarrollo
    Route::get('/foro/desarrollo', function () {
      return view('admin.foro.desarrollo');
    })->name('desarrollo');
    // Diseño
    Route::get('/foro/diseno', function () {
      return view('admin.foro.diseno');
    })->name('diseno');
    // Creatividad
    Route::get('/foro/creatividad', function () {
      return view('admin.foro.creatividad');
    })->name('creatividad');
    // Digital
    Route::get('/foro/digital', function () {
      return view('admin.foro.digital');
    })->name('digital');
    // Cuentas
    Route::get('/foro/cuentas', function () {
      return view('admin.foro.cuentas');
    })->name('cuentas');
    // Contenido
    Route::get('/foro/contenido', function () {
      return view('admin.foro.contenido');
    })->name('contenido');
    // Soporte
    Route::get('/foro/soporte', function () {
      return view('admin.foro.soporte');
    })->name('soporte');
  //OTS
    Route::get('ots/editar/{id}', ['middleware' => ['permission:editar_ots'], 'uses' => 'OtController@edit']);
    Route::get('ots/visualizar/{id}', ['middleware' => ['permission:ver_ots'], 'uses' => 'OtController@show']);
    Route::get('ots/listado', function()
    {
      if (!Auth::user()->can('ver_ots')) {return Redirect::to('home');}
      return view('admin.ots.listado_ot');
    });
    Route::get('ots/crear', function()
      {
        if (!Auth::user()->can('crear_ots')) {
          return Redirect::to('home');
        }
        return view('admin.ots.crear_ot');
      });

  Route::get('ots/exportar/{id}',['middleware' => ['permission:editar_ots'], 'uses' =>'OtController@exportarTodoslosDatos']);

  Route::get('/show_ots_tareas','OtController@showOtEnTareas');
  Route::get('/show_ots_tareas/{query}','OtController@showOtEnTareasByQuery');

  // Clientes
  Route::get('clientes/crear', function()
  {
    if (!Auth::user()->can('crear_clientes')) {
      return Redirect::to('home');
    }
    return view('admin.clientes.crear_cliente');
  });
  Route::get('clientes/listado', function()
  {
    if (!Auth::user()->can('ver_clientes')) {
      return Redirect::to('home');
    }
    return view('admin.clientes.listar_clientes');
  });
  Route::get('clientes/editar/{id}',['middleware' => ['permission:editar_clientes'], 'uses' =>  'ClienteController@getCliente']);



  // Tareas

  Route::get('/crear_tarea', function()
  {
    // check the current user
    if (!Auth::user()->can('crear_tareas')) {
      return Redirect::to('home');
    }
    return view('admin.tareas.crear_tarea');
  });

  Route::get('/listar_tareas', function () {
    return view('admin.tareas.listar_tareas');
  });

  Route::get('/years_tarea', 'TareaController@getYearTarea');
  Route::get('/all_tareas/{id}','TareaController@showAllTareas');
  Route::get('/ver_tarea/{id}','TareaController@showOneTarea');

 // Fasses Planeación
     Route::get('/list_fases',['middleware' => ['permission:ver_fases_planeacion'], 'uses' =>  'FaseController@listFases']);

  // Equipo
    Route::get('equipo/areas', function () {
     if (!Auth::user()->can('crear_areas')) {
      return Redirect::to('home');
    }
    return view('admin.areas.crear_areas');
  });

    Route::get('equipo/usuarios', function () {
      if (!Auth::user()->can('crear_usuarios')) {
        return Redirect::to('home');
      }
      return view('admin.equipo.usuarios');
    });

    Route::get('/crear_usuario', function () {
      if (!Auth::user()->can('crear_usuarios')) {
        return Redirect::to('home');
      }
      return view('admin.equipo.crear_usuario');
    });

    Route::get('equipo/directorio', function () {
      return view('admin.areas.listar_areas');
    });

    Route::get('equipo/usuarios/editar/{id}',['middleware' => ['permission:editar_usuarios'], 'uses' =>  'UserController@editar_usuario']);


 /*
 * Vista trafico
 */
  Route::get('/trafico', function () {
   if (!Auth::user()->can('ver_trafico')) {
     return Redirect::to('home');
   }
   return view('admin.trafico.trafico');
 })->name('trafico');

    //Historico Equipo
    Route::get('/years_historico_equipo', 'AreaController@getYearHistorico');

    Route::get('/historico_areas', function () {
       if (!Auth::user()->can('ver_historico_areas')) {
        return Redirect::to('home');
      }
      return view('admin.equipo.historico_equipo_area');
    });

    Route::get('/historico_usuarios', function () {
       if (!Auth::user()->can('ver_historico_usuarios')) {
        return Redirect::to('home');
      }
      return view('admin.equipo.historico_equipo_usuario');
    });

    Route::get('/historico_equipos/{id}','AreaController@historico_equipos');


  // Notificaciones
  Route::get('/notificaciones/','UserController@getNotifications');
  Route::get('/pageNotifications/','UserController@notificationsPaged');
  Route::get('/notificaciones_no_leidas/','UserController@getUnReadNotifications');
  Route::get('/leer_notificaciones/','UserController@readNotifications');
  Route::get('/listar_notificaciones/',function ($value=''){
    return view('admin.notificaciones.listar_notificaciones');
  });


  // Fases del Proyecto
  Route::get('/fases',function ($value=''){
     if (!Auth::user()->can('ver_fases_planeacion')) {
        return Redirect::to('home');
      }
    return view('admin.fases_proyecto.crear_fase');
  });


});
