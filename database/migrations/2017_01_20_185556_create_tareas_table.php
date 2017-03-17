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
            $table->string('nombre_tarea',85);
            $table->dateTime('fecha_entrega_area')->nullable();
            $table->dateTime('fecha_entrega_cuentas')->nullable();
            $table->string('descripcion',255);
            $table->string('enlaces_externos',150)->nullable();
            $table->decimal('tiempo_estimado',15,2)->nullable();
            $table->decimal('tiempo_real',15,2)->nullable();
            $table->decimal('tiempo_mapa_cliente',15,2)->nullable();
            $table->dateTime('fecha_entrega_cliente')->nullable();
            $table->integer('estados_id')->unsigned();
            $table->integer('areas_id')->unsigned();
            $table->integer('usuarios_id')->unsigned();
            $table->integer('ots_id')->unsigned();
            $table->integer('planeacion_fases_id')->unsigned();
            $table->integer('encargado_id')->nullable();
            $table->integer('prioridad_id')->nullable();
            $table->integer('estado_trafico_id')->nullable();
            $table->integer('comentario_trafico')->nullable();
            $table->timestamps();

               $table->foreign('estados_id')->references('id')->on('estados')
                ->onUpdate('cascade')->onDelete('cascade');

                $table->foreign('usuarios_id')->references('id')->on('users')
                ->onUpdate('cascade')->onDelete('cascade');

                $table->foreign('areas_id')->references('id')->on('areas')
                ->onUpdate('cascade')->onDelete('cascade');

                $table->foreign('planeacion_fases_id')->references('id')->on('planeacion_fases')
                ->onUpdate('cascade')->onDelete('cascade');

                $table->foreign('ots_id')->references('id')->on('ots')
                ->onUpdate('cascade')->onDelete('cascade');
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
