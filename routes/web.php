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
  Route::get('/console/{id}','RolController@updatePermisionsbyRole');

  Route::resource('gcalendar', 'gCalendarController');
  Route::get('pedir', 'gCalendarController@pedir');
  Route::get('oauth', ['as' => 'oauthCallback', 'uses' => 'gCalendarController@oauth']);

  Route::group(['middleware' => ['auth','login_estado']], function () {

    Route::get('/home', ['as' => 'oauthCallback', 'uses' => 'gCalendarController@oauth']);
    Route::get('/', [ 'uses' => 'gCalendarController@oauth']);

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
    // Todas las tareas
    Route::get('/foro/visualizar/todas', function () {
      return view('admin.tareas.ver_todas_tareas');
    })->name('ver_todas_tareas');


  //OTS
    Route::get('ots/editar/{id}', ['middleware' => ['permission:editar_ots'], 'uses' => 'OtController@edit']);
    Route::get('ots/visualizar/{id}', ['middleware' => ['permission:ver_ots'], 'uses' => 'OtController@show']);
    Route::get('ots/duplicar/{id}', ['middleware' => ['permission:crear_ots'], 'uses' => 'OtController@duplicar']);

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
  Route::get('ots/exportar/tareas/{arrayots}','OtController@exportarTareasOts');

 //Exportar Datatable OTs.
  Route::get('/ots/listado/exportar/{fee}/{f_inicio}/{f_final}','OtController@exportar_listado_ots');

  Route::get('/show_ots_tareas','OtController@showOtEnTareas');
  Route::get('/show_ots_tareas_query/{query}','OtController@showOtEnTareasByQuery');


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

  Route::get('/crear_tarea/{id?}', 'TareaController@create');

  Route::get('/listar_tareas', function () {
    return view('admin.tareas.listar_tareas');
  });

  Route::get('/years_tarea', 'TareaController@getYearTarea');
  Route::get('/week_of_year', 'TareaController@getWeekYear');
  Route::get('/all_tareas/{id}','TareaController@showAllTareas');
  Route::get('/trafico','TareaController@getTrafico');

  //DSO al ver tarea, Pedir Permisos Google.
  Route::get('/ver_tarea/*', 'gCalendarController@oauthTarea');

  Route::get('/ver_tarea/{id}','TareaController@showOneTarea');

  Route::get('/comentarios/{id}','TareaController@getComments');

  // Listar Fases de  Planeación
  Route::get('/list_fases/{id}','FaseController@listFases');

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
    Route::get('/years_historico_equipo', 'AreaController@getYearHistorico');
    Route::get('/years_historico_clientes', 'ClienteController@getYearHistorico');

    Route::get('/historico_equipos/{id}',['middleware' => ['permission:ver_historico_areas'], 'uses' => 'AreaController@historico_de_equipos']);
    Route::get('/historico_clientes/{id}',['middleware' => ['permission:ver_historico_clientes'], 'uses' => 'ClienteController@historico_de_clientes']);


  // Notificaciones
  Route::get('/notificaciones/','UserController@getNotifications');
  Route::get('/pageNotifications/','UserController@notificationsPaged');
  Route::get('/notificaciones_no_leidas/','UserController@getUnReadNotifications');
  Route::get('/leer_notificaciones/','UserController@readNotifications');
  Route::get('/listar_notificaciones/',function ($value=''){
    return view('admin.notificaciones.listar_notificaciones');
  });

  // Herramientas
  Route::group(['prefix' => 'informes'], function () {
    Route::get('/', function ()    {
          // Uses Auth Middleware
    });

    // Trafico
    Route::get('trafico', function () {
       if (!Auth::user()->can('ver_trafico')) {
         return Redirect::to('home');
       }
       return view('admin.trafico.trafico');
    })->name('trafico');

    // Informe Soporte
    Route::get('soporte', function () {
       if (!Auth::user()->can('ver_informe_soporte')) {
         return Redirect::to('home');
       }
       return view('admin.soporte.informe_soporte');
    })->name('informe_soporte');

   //Exportar Datatables.

   //Exportar Informe Soporte.
    Route::get('soporte/exportar/{estado}/{fase}/{year}/{month}',['middleware' => ['permission:descargar_informe_soporte'], 'uses' => 'TareaController@exportar_informe_soporte']);

      //Historico Equipo
    Route::get('historico_areas', function () {
       if (!Auth::user()->can('ver_historico_areas')) {
        return Redirect::to('home');
      }
      return view('admin.equipo.historico_equipo_area');
    });
    // historico Usuarios
    Route::get('historico_usuarios', function () {
       if (!Auth::user()->can('ver_historico_usuarios')) {
        return Redirect::to('home');
      }
      return view('admin.equipo.historico_equipo_usuario');
    });
    // historico Clientes
    Route::get('historico_clientes', function () {
       if (!Auth::user()->can('ver_historico_clientes')) {
        return Redirect::to('home');
      }
      return view('admin.clientes.historico_clientes');
    });
  });

  // Herramientas
  Route::group(['prefix' => 'herramientas'], function () {
      Route::get('/', function ()    {
          // Uses Auth Middleware
      });

      // Divisas
      Route::get('divisas',function ($value=''){
         if (!Auth::user()->can('ver_fases_planeacion')) {
            return Redirect::to('home');
          }
        return view('admin.divisas.crear_divisa');
      });

      // Fases del Proyecto
      Route::get('/fases',function ($value=''){
         if (!Auth::user()->can('ver_fases_planeacion')) {
            return Redirect::to('home');
          }
        return view('admin.fases_proyecto.crear_fase');
      });


  });

 // Permisos
    Route::get('/permisos',function ($value=''){
       if (!Auth::user()->can('ver_permisos')) {
          return Redirect::to('home');
        }
      return view('admin.roles.permisos');
    });

// Compras Asociadas a la OT
       Route::get('/compra/listar',function ($value=''){
          if (!Auth::user()->can('ver_compras_asociadas')) {
             return Redirect::to('home');
           }
         return view('admin.compras_asociadas.listado_compras');
       });
       Route::get('/compra/crear',function ($value=''){
          if (!Auth::user()->can('crear_compras_asociadas')) {
             return Redirect::to('home');
           }
         return view('admin.compras_asociadas.formulario_compras');
       });

       Route::get('/compra/editar/{id}',['middleware' => ['permission:editar_compras_asociadas'], 'uses' => 'Compras_OtController@edit']);

   // Tipos de compra
  Route::get('/tiposcompra', function(){
   return view('admin.tipos_compras.crear_tipo_compra');
  });


});
