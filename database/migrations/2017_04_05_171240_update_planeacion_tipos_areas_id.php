<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class UpdatePlaneacionTiposAreasId extends Migration
{
  /**
  * Run the migrations.
  *
  * @return void
  */
  public function up()
  {
    Schema::table('planeacion_tipos', function (Blueprint $table) {
      $table->integer('areas_id')->unsigned()->nullable();

      $table->foreign('areas_id')->references('id')->on('areas')
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
    Schema::table('planeacion_tipos', function (Blueprint $table) {
      $table->dropColumn('areas_id');
    });
  }
}
