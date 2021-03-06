<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHistoricoOtsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historicos_ots', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('ots_id')->unsigned();
            $table->string('nombre',115);
            $table->string('referencia',255);
            $table->string('valor',85);
            $table->tinyInteger('fee');
            $table->decimal('horas_totales',15,2);
            $table->decimal('horas_disponibles',15,2);
            $table->decimal('total_horas_extra',15,2)->nullable();
            $table->string('observaciones',255)->nullable();
            $table->string('requerimientos_ot',2050);
            $table->string('compras_ot',2050);
            $table->dateTime('fecha_inicio');
            $table->dateTime('fecha_final');
            $table->integer('clientes_id')->unsigned();
            $table->integer('usuarios_id')->unsigned();
            $table->integer('estados_id')->unsigned();
            $table->integer('editor_id')->unsigned();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('historicos_ots');
    }
}
