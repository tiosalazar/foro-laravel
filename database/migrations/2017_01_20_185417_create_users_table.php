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
            $table->string('cargo',85);
            $table->string('telefono',45)->nullable();
            $table->string('email',85)->unique();
            $table->tinyInteger('estado')->default(1);
            $table->decimal('horas_disponible',15,2);
            $table->decimal('horas_gastadas',15,2)->default(0);
            $table->string('api_token', 60)->unique();
            $table->string('password');
            $table->rememberToken();
            $table->date('fecha_nacimiento');
            $table->string('img_perfil',300)->nullable();
            $table->integer('roles_id')->unsigned();
            $table->integer('areas_id')->unsigned();
            $table->timestamps();

            /*$table->foreign('roles_id')->references('id')->on('roles')
                ->onUpdate('cascade')->onDelete('cascade');*/

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
        Schema::drop('users');
    }
}
