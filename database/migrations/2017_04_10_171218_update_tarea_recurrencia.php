<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateTareaRecurrencia extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('tareas', function (Blueprint $table) {
        $table->tinyInteger('recurrente')->nullable();
        $table->timestamp('fecha_inicio_recurrencia')->nullable();
        $table->timestamp('fecha_final_recurrencia')->nullable();
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
        $table->dropColumn('recurrente');
        $table->dropColumn('fecha_inicio_recurrencia');
        $table->dropColumn('fecha_final_recurrencia');
      });
    }
}
