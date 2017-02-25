<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class EstadosXRolesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('estados_x_roles', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('estados_id')->unsigned();
            $table->integer('roles_id')->unsigned();

            $table->foreign('estados_id')->references('id')->on('estados')
                ->onUpdate('cascade')->onDelete('cascade');

            $table->foreign('roles_id')->references('id')->on('roles')
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
        Schema::drop('estados_x_roles');
    }
}
