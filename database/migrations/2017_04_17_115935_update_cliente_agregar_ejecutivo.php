<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateClienteAgregarEjecutivo extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('clientes', function (Blueprint $table) {
        $table->integer('user_id')->unsigned()->nullable();

        $table->foreign('user_id')->references('id')->on('users')
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
      Schema::table('clientes', function (Blueprint $table) {
        $table->dropColumn('user_id');
      });
    }
}
