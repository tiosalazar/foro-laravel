<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateOtsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('ots', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('referencia',255);
            $table->string('valor',55);
            $table->tinyInteger('fee');
            $table->decimal('horas_totales',5,2);
            $table->decimal('horas_disponibles',5,2);
            $table->decimal('total_horas_extra',5,2)->nullable();
            $table->string('observaciones',255)->nullable();
            $table->dateTime('fecha_inicio');
            $table->dateTime('fecha_final');
            $table->integer('clientes_id')->unsigned();
            $table->integer('usuarios_id')->unsigned();
            $table->integer('estados_id')->unsigned();
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
        Schema::drop('ots');
    }
}
