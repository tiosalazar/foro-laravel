<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('nombre',45);
            $table->string('apellido',45);
            $table->string('cargo',55);
            $table->string('telefono',45);
            $table->string('email',85)->unique();
            $table->decimal('horas_disponible',15,3);
            $table->string('password');
            $table->rememberToken();
            $table->integer('roles_id')->unsigned();
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
        Schema::drop('users');
    }
}
