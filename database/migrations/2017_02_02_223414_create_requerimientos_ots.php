<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRequerimientosOts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requerimientos_ots', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->decimal('horas',5,2);
            $table->integer('areas_id')->unsigned();
            $table->integer('ots_id')->unsigned();
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
         Schema::drop('requerimientos_ots');
    }
}
