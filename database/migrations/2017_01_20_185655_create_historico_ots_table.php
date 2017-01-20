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
            $table->dateTime('fecha_final')->nullable();
            $table->integer('usuarios_id')->unsigned();
            $table->integer('ots_id')->unsigned();
            $table->integer('ots_estados_id')->unsigned();
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
