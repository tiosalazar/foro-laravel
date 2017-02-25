<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateComprasOtsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
         Schema::create('compras_ots', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',110)->nullable();
            $table->string('descripcion',255);
            $table->string('provedor',110);
            $table->string('valor',110);
            $table->integer('ots_id')->unsigned();
            $table->integer('areas_id')->unsigned();
            $table->integer('tipos_compras_id')->unsigned();
            $table->integer('divisas_id')->unsigned();
            $table->timestamps();

            $table->foreign('ots_id')->references('id')->on('ots')
                       ->onUpdate('cascade')->onDelete('cascade');

            $table->foreign('areas_id')->references('id')->on('areas')
                       ->onUpdate('cascade')->onDelete('cascade');

            $table->foreign('tipos_compras_id')->references('id')->on('tipos_compras')
                       ->onUpdate('cascade')->onDelete('cascade');
                       
            $table->foreign('divisas_id')->references('id')->on('divisas')
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
         Schema::drop('compras_ots');
    }
}
