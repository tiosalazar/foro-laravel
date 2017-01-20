<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTareasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tareas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre_tarea',45);
            $table->dateTime('fecha_entrega_estimada')->nullable();
            $table->string('descripcion',255);
            $table->string('enlaces_externos',150)->nullable();
            $table->decimal('tiempo_estimado',5,3)->nullable();
            $table->decimal('tiempo_real',5,3)->nullable();
            $table->dateTime('fecha_entrega_cliente');
            $table->integer('estados_id')->unsigned();
            $table->integer('areas_id')->unsigned();
            $table->integer('usuarios_id')->unsigned();
            $table->integer('ots_id')->unsigned();
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
        Schema::drop('tareas');
    }
}
