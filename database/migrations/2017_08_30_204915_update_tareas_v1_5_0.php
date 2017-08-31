<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTareasV150 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('tareas', function (Blueprint $table) {
          $table->integer('requerimientos_clientes_id')->unsigned()->nullable();
          $table->tinyInteger('mostrar_cliente')->default(1);

          $table->foreign('requerimientos_clientes_id')->references('id')->on('requerimientos_clientes')
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
      Schema::table("tareas", function (Blueprint $table) {
            $table->dropColumn('requerimientos_clientes_id');
            $table->dropColumn('mostrar_cliente');
        });
    }
}
