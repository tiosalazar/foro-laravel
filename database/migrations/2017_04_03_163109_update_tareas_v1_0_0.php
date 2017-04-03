<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTareasV100 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('tareas', function (Blueprint $table) {
          $table->string('nombre_tarea',1024)->change();
          $table->string('enlaces_externos',2050)->change();
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::table('tareas', function (Blueprint $table) {
        $table->string('nombre_tarea',85)->change();
        $table->string('enlaces_externos',155)->change();
      });
    }
}
