<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdateRequerimientosOtsV100 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::table('requerimientos_ots', function (Blueprint $table) {
          $table->string('nombre',255)->change();
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::table('requerimientos_ots', function (Blueprint $table) {
          $table->string('nombre',55)->change();
      });
    }
}
