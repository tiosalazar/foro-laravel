<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTiemposXAreaTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tiempos_x_area', function (Blueprint $table) {
            $table->increments('id');
            $table->decimal('tiempo_estimado',5,3);
            $table->decimal('tiempo_real',5,3);
            $table->decimal('tiempo_extra',5,3)->nullable();
            $table->integer('ots_id')->unsigned();
            $table->integer('areas_id')->unsigned();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('tiempos_x_area');
    }
}
