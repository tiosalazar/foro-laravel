<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateComprasOtNuevoestado extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('compras_ots', function (Blueprint $table) {
          $table->integer('creador_id')->unsigned()->nullable();
          $table->tinyInteger('compra_externa')->default(0);

          $table->foreign('creador_id')->references('id')->on('users')
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
      Schema::table("compras_ots", function (Blueprint $table) {
        $table->dropColumn('creador_id');
        $table->dropColumn('compra_externa');
      });
    }
}
