<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTareasV132 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('tareas', function (Blueprint $table) {
        $table->string('id_evento',502)->nullable();
        $table->string('fecha_inicio_programar',502)->nullable();
        $table->string('fecha_fin_programar',502)->nullable();
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
        $table->dropColumn('id_evento');
        $table->dropColumn('fecha_inicio_programar');
        $table->dropColumn('fecha_fin_programar');
      });
    }
}
