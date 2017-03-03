<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDivisasTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('divisas', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->decimal('tasa_conversion',15,2)->nullable();
            $table->tinyInteger('estado')->default(0);
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
        Schema::drop('divisas');
    }
}
