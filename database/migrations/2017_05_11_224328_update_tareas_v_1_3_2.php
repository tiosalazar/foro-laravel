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
        $table->string('id_evento')->nullable();
        $table->dateTime('fecha_inicio_programar')->nullable();
        $table->dateTime('fecha_fin_programar')->nullable();
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
