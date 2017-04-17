<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateHistoricoCliente extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('historico_clientes', function (Blueprint $table) {
        $table->increments('id');
        $table->integer('cliente_id')->unsigned()->nullable();
        $table->string('nombre',115);
        $table->string('nit',45);
        $table->string('email',115)->nullable();
        $table->string('telefono',45)->nullable();
        $table->string('nombre_contacto',45)->nullable();
        $table->string('razon_social', 255)->nullable();
        $table->integer('user_id')->unsigned()->nullable();
        $table->tinyInteger('estado')->default(1);
        $table->timestamps();

        $table->foreign('cliente_id')->references('id')->on('clientes')
        ->onUpdate('cascade')->onDelete('cascade');
        $table->foreign('user_id')->references('id')->on('users')
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
      Schema::drop('historico_clientes');
    }
}
