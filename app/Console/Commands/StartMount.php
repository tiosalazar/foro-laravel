<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use App\Area;
use App\Tarea;
use App\Role;
use App\Historico_equipo;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
use Jenssegers\Date\Date;
use Illuminate\Support\Facades\DB;
class StartMount extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'users:refrescarHoras';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Reinicia las estadisticas de horas gastadas del usuario y las areas';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {

        $users=User::all();
        foreach ($users as $user) {
            $Historico_equipo=new Historico_equipo;
            $Historico_equipo->entidad_id=$user->id;
            $Historico_equipo->horas_disponibles=$user->horas_disponible;
            $Historico_equipo->horas_gastadas=$user->horas_gastadas;
            $Historico_equipo->tipo_de_entidad=1;//Referencia a que la entidad va a ser Usuarios
            $Historico_equipo->save();
       //log::info("Historico usuarios Guargado");
            $user->horas_gastadas=0;
            $user->save();
        }
        log::info("Se han restablecido las horas gastadas de todos los usuarios");
        $areas=Area::all();
        foreach ($areas as $area) {
            $Historico_equipo=new Historico_equipo;
            $Historico_equipo->entidad_id=$area->id;
            $horas_totales=$area->User->sum('horas_disponible');
            $Historico_equipo->horas_disponibles= $horas_totales;
            $Historico_equipo->horas_gastadas=$area->horas_consumidas;
            $Historico_equipo->tipo_de_entidad=2;//Referencia a que la entidad va a ser Usuarios
            $Historico_equipo->save();

            $area->horas_consumidas=0;
            $area->save();
        }
        log::info("Se han restablecido las horas gastadas de todas las areas");

        // Crear tareas recurrentes
        $now = Carbon::now();
        // DB::enableQueryLog();
        $tareas_recurrentes = Tarea::where('recurrente',1)->where('fecha_inicio_recurrencia', '>=', $now->toDateTimeString())->where('fecha_final_recurrencia', '>=', $now->toDateTimeString())->get();
        $tareas_recurrentes = $tareas_recurrentes->toArray();
        foreach ($tareas_recurrentes as $tarea) {
          $now = Carbon::now();
          $asignar_fecha = null;
          $dia=null;
          $fecha_create=null;

          //id Rol coordinador
          $role=Role::where('name','coordinador')->first();
          // log::info("rol",[$role->id,$tarea['areas_id']]);
          //Coordinador con con el area enviada en el request
          $coorArea= User::where('roles_id',$role->id)->where('areas_id', $tarea['areas_id'])->first();

          // Fecha tarea formateada
          $new_tarea = new Tarea;
          $new_tarea->fill($tarea);

          $fecha_create= new Date($new_tarea->create_at);
          $dia = $fecha_create->day;

          $asignar_fecha = $now->addDays(abs($dia-1));

          $new_tarea->nombre_tarea = $new_tarea->nombre_tarea . ' | Rec - '.$fecha_create->format('M') . ' - '. $now->year;
          $new_tarea->recurrente = 0;
          $new_tarea->fecha_entrega_area = null;
          $new_tarea->fecha_entrega_cuentas = null;
          $new_tarea->tiempo_estimado = null;
          $new_tarea->tiempo_real = null;
          $new_tarea->tiempo_mapa_cliente = null;
          $new_tarea->fecha_entrega_cliente = null;
          $new_tarea->estados_id = 7;
          $new_tarea->encargado_id = $coorArea->id;//----------------
          $new_tarea->estado_trafico_id = null;
          $new_tarea->comentario_trafico = null;
          $new_tarea->created_at = $asignar_fecha;
          $new_tarea->save();
          $asignar_fecha->subDays($dia);
        }
        // $queries = DB::getQueryLog();
        log::info("Se han creado las tareas recurrentes");
    }
}
