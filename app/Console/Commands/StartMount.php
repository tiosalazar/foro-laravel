<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use App\Area;
use App\Tarea;
use App\Historico_equipo;
use Illuminate\Support\Facades\Log;
use Carbon\Carbon;
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
        $tareas_recurrentes = Tarea::where('recurrente',1)->where('fecha_final_recurrencia', '>=', $now->toDateTimeString())->get();
        $tareas_recurrentes = $tareas_recurrentes->toArray();
        foreach ($tareas_recurrentes as $tarea) {
          $new_tarea = new Tarea;
          $new_tarea->fill(($tarea));
          $new_tarea->nombre_tarea = $new_tarea->nombre_tarea . ' | Rec - '.$now->month . ' - '. $now->year;
          $new_tarea->recurrente = 0;
          $new_tarea->save();
        }
        log::info("Se han creado las tareas recurrentes");
    }
}
