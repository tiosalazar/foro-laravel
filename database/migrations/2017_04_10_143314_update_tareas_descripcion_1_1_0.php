<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTareasDescripcion110 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('tareas', function (Blueprint $table) {
        $table->longText('descripcion')->change();
        $table->longText('enlaces_externos')->change()->nullable();

      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      $table->string('descripcion',2024)->change();
      $table->string('enlaces_externos',2050)->change()->nullable();
    }
}
