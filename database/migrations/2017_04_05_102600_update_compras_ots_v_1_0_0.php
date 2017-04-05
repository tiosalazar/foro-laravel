<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateComprasOtsV100 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('compras_ots', function (Blueprint $table) {
          $table->string('transaccion',500)->nullable();
          $table->dateTime('fecha_transaccion')->nullable();
          $table->integer('estados_id')->unsigned()->nullable();

      });
    }
    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::table('compras_ots', function (Blueprint $table) {
         $table->dropColumn(['transaccion','fecha_transaccion','estados_id']);
      });
    }
}
