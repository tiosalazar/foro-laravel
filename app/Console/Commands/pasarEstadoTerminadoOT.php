<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;
use App\Ot;
use App\Estado;

class pasarEstadoTerminadoOT extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'ots:pasarTerminado';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Cambia el estado de las OT a terminado si la fecha fin es menor a la actual.';

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
       $estado=Estado::where('nombre','On Going')->first();
       //Obtengo las ot donde la fecha fin sea menor que la actual
       $ots= Ot::where('estados_id',$estado->id)
                ->where('fecha_final', '<',date('Y-m-d'))->get();

        foreach ($ots as $ot) {
                    $ot->estados_id=10; //10 ID del estado "Terminado" el cual se encuentra en la tabla estados
                    $ot->save();
                 }


    }
}
