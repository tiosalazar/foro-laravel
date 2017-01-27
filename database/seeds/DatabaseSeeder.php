<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
     $this->call('RolesTableSeeder');
     $this->command->info('Roles table seeded!');
     $this->call('AreasTableSeeder');
     $this->command->info('Areas table seeded!');
     $this->call('DivisasTableSeeder');
     $this->command->info('Divisas table seeded!');
     $this->call('Tipos_estadosTableSeeder');
     $this->command->info('Tipos de Estados table seeded!');
     $this->call('UsuariosTableSeeder');
     $this->command->info('Usuarios table seeded!');
     $this->call('ClientesTableSeeder');
     $this->command->info('Clientes table seeded!');
     $this->call('EstadosTableSeeder');
     $this->command->info('Estados table seeded!');
     $this->call('TiposComprasTableSeeder');
     $this->command->info('Tipos_Compra table seeded!');
    }
}
class RolesTableSeeder extends Seeder {

    public function run()
    {
        DB::table('roles')->delete();

        App\Role::create(array('nombre' => 'Administrador'));
        App\Role::create(array('nombre' => 'Cuentas'));
        App\Role::create(array('nombre' => 'Coordinador'));
        App\Role::create(array('nombre' => 'Esclavo') );
    }

}

class AreasTableSeeder extends Seeder {

    public function run()
    {
        DB::table('areas')->delete();
        App\Area::create(array('nombre' => 'Creatividad','extencion_tel' => '0551','estado' => '1') );
        App\Area::create(array('nombre' => 'Diseño','extencion_tel' => '0581','estado' => '1'));
        App\Area::create(array('nombre' => 'Desarrollo','extencion_tel' => '81','estado' => '1') );
        App\Area::create(array('nombre' => 'Contenidos','extencion_tel' => '0281','estado' => '1') );
        App\Area::create(array('nombre' => 'Digital Performance ','extencion_tel' => '0581','estado' => '1') );

    }

}
class DivisasTableSeeder extends Seeder {

    public function run()
    {
        DB::table('divisas')->delete();

        App\Divisa::create(array('nombre' => 'Pesos'));
        App\Divisa::create(array('nombre' => 'Dolares'));
        App\Divisa::create(array('nombre' => 'Euros'));

    }

}
class Tipos_estadosTableSeeder extends Seeder {

    public function run()
    {
        DB::table('tipos_estados')->delete();
        App\Tipos_estado::create(array('nombre' => 'Estados Tareas'));
        App\Tipos_estado::create(array('nombre' => 'Estados OT') );

    }

}
class UsuariosTableSeeder extends Seeder {

    public function run()
    {
        DB::table('users')->delete();

        App\User::create(array('nombre' => 'Desarrollo','apellido' => 'Himalaya','cargo' => 'Tester','telefono' => '1111111','email' => 'desarrollo@himalayada.com',
        'estado'=>1,'horas_disponible' => 1,'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','roles_id' => '1','areas_id' => '1'));
    }

}
class ClientesTableSeeder extends Seeder {

    public function run()
    {
        DB::table('clientes')->delete();

        App\Cliente::create(array('nombre' => 'Electrojaponesa','nit'=>'12345678','nombre_contacto' =>'Victoria','estado'=>1));
        App\Cliente::create(array('nombre' => 'Adeinco','nit'=>'12345678','nombre_contacto' =>'Pablo','estado'=>1) );
        App\Cliente::create(array('nombre' => 'Calzatodo','nit'=>'12345678','nombre_contacto' =>'Santiago','estado'=>1) );
    }

}

class EstadosTableSeeder extends Seeder {

    public function run()
    {
        DB::table('estados')->delete();

          App\Estado::create(array('nombre' => 'Realizado','tipos_estados_id'=> 1));
          App\Estado::create(array('nombre' => 'Espera','tipos_estados_id'=> 1) );
          App\Estado::create(array('nombre' => 'Atención Cuentas','tipos_estados_id'=> 1 ));
          App\Estado::create(array('nombre' => 'On Going','tipos_estados_id'=> 2) );
          App\Estado::create(array('nombre' => 'En espera','tipos_estados_id'=> 2) );
    }

}

class TiposComprasTableSeeder extends Seeder {

    public function run()
    {
        DB::table('tipos_compras')->delete();
        App\Tipos_Compra::create(array('nombre' => 'Pauta'));
        App\Tipos_Compra::create(array('nombre' => 'Hosting'));
        App\Tipos_Compra::create(array('nombre' => 'Plugin'));
        App\Tipos_Compra::create(array('nombre' => 'B. Imagenes') );
    }

}
