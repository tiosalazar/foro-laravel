<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTraficoTareasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('trafico_tareas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre_tarea',45);
            $table->dateTime('fecha_entrega_estimada')->nullable();
            $table->string('descripcion',255);
            $table->string('enlaces_externos',150)->nullable();
            $table->decimal('tiempo_estimado',5,3)->nullable();
            $table->decimal('tiempo_real',5,3)->nullable();
            $table->dateTime('fecha_entrega_cliente');
            $table->integer('estados_id')->nullable();
            $table->integer('areas_id')->nullable();
            $table->integer('usuarios_id')->nullable();
            $table->integer('ots_id')->nullable();
            $table->integer('roles_id')->unsigned();
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
        Schema::drop('trafico_tareas');
    }
}
