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
            $table->string('nombre',115);
            $table->string('referencia',255);
            $table->string('valor',55);
            $table->tinyInteger('fee');
            $table->decimal('horas_totales',15,2);
            $table->decimal('horas_disponibles',15,2);
            $table->decimal('total_horas_extra',15,2)->nullable();
            $table->string('observaciones',500)->nullable();
            $table->dateTime('fecha_inicio');
            $table->dateTime('fecha_final');
            $table->tinyInteger('estado')->default(1);
            $table->integer('clientes_id')->unsigned();
            $table->integer('usuarios_id')->unsigned();
            $table->integer('estados_id')->unsigned();
            $table->timestamps();

            $table->foreign('estados_id')->references('id')->on('estados')
            ->onUpdate('cascade')->onDelete('cascade');

            $table->foreign('clientes_id')->references('id')->on('clientes')
            ->onUpdate('cascade')->onDelete('cascade');

            $table->foreign('usuarios_id')->references('id')->on('users')
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
        Schema::drop('ots');
    }
}
