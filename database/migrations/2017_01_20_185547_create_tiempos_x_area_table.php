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
            $table->decimal('tiempo_estimado_jefe',15,2)->nullable();
            $table->decimal('tiempo_estimado_ot',15,2);
            $table->decimal('tiempo_real',15,2)->nullable();
            $table->decimal('tiempo_extra',15,2)->default(0);
            $table->integer('ots_id')->unsigned();
            $table->integer('areas_id')->unsigned();
            $table->timestamps();

            $table->foreign('ots_id')->references('id')->on('ots')
            ->onUpdate('cascade')->onDelete('cascade');

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
        Schema::drop('tiempos_x_area');
    }
}
