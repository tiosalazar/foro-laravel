<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\User;
use App\Area;
use Illuminate\Support\Facades\Log;

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
            $user->horas_gastadas=0;
            $user->save();
        }
        log::info("Se han restablecido las horas gastadas de todos los usuarios");
        $areas=Area::all();
        foreach ($areas as $area) {
            $area->horas_consumidas=0;
            $area->save();
        }
        log::info("Se han restablecido las horas gastadas de todas las areas");
    }
}
