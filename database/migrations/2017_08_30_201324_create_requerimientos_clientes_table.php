<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRequerimientosClientesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('requerimientos_clientes', function (Blueprint $table) {
        $table->increments('id');
        $table->string('nombre',215);
        $table->longText('descripcion');
        $table->longText('archivos_adjuntos')->nullable();
        $table->dateTime('fecha_ideal_entrega')->nullable();
        $table->integer('estados_id')->unsigned();
        $table->integer('prioridad_id')->unsigned();
        $table->integer('clientes_id')->unsigned();
        $table->integer('encargado_id')->nullable();
        $table->integer('usuarios_id')->unsigned();
        $table->integer('ots_id')->nullable();
        $table->timestamps();
      /*  $table->dropSoftDeletes();*/

        $table->foreign('estados_id')->references('id')->on('estados')
         ->onUpdate('cascade')->onDelete('cascade');

         $table->foreign('usuarios_id')->references('id')->on('users')
         ->onUpdate('cascade')->onDelete('cascade');

         $table->foreign('clientes_id')->references('id')->on('clientes')
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
      Schema::drop('requerimientos_clientes');
    }
}
