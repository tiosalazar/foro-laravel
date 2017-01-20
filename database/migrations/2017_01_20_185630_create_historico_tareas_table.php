<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHistoricoTareasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historico_tareas', function (Blueprint $table) {
            $table->increments('id');
            $table->decimal('tiempo_estimado',5,3)->nullable();
            $table->decimal('tiempo_real',5,3)->nullable();
            $table->integer('comentarios_id');
            $table->integer('encargado_id')->nullable();
            $table->integer('estados_id')->nullable();
            $table->integer('usuarios_id')->unsigned();
            $table->integer('tareas_id')->unsigned();
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
        Schema::drop('historico_tareas');
    }
}
