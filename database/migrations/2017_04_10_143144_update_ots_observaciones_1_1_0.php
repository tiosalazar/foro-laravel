<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateOtsObservaciones110 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('ots', function (Blueprint $table) {
        $table->longText('observaciones')->change()->nullable();
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::table('ots', function (Blueprint $table) {
        $table->string('observaciones', 500)->change()->nullable();
      });
    }
}
