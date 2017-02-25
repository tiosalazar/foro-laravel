<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComentariosTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comentarios', function (Blueprint $table) {
            $table->increments('id');
            $table->string('comentarios',500);
            $table->integer('usuarios_comentario_id')->unsigned();
            $table->integer('tareas_id')->unsigned();
            $table->integer('estados_id')->unsigned()->nullable();
            $table->timestamps();

            $table->foreign('estados_id')->references('id')->on('estados')
                 ->onUpdate('cascade')->onDelete('cascade');

                 $table->foreign('usuarios_comentario_id')->references('id')->on('users')
                 ->onUpdate('cascade')->onDelete('cascade');

                 $table->foreign('tareas_id')->references('id')->on('tareas')
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
        Schema::drop('comentarios');
    }
}
