<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateComentariosV150 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('comentarios', function (Blueprint $table) {
        $table->integer('requerimientos_clientes_id')->unsigned()->nullable();
        $table->integer('tareas_id')->change()->unsigned()->nullable();

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
      Schema::table("comentarios", function (Blueprint $table) {
          $table->dropColumn('requerimientos_clientes_id');
          $table->integer('tareas_id')->unsigned()->change();
      });
    }
}
