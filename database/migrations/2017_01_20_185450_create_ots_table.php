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
            $table->string('valor',55);
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
