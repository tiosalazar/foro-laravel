<?php

use Illuminate\Database\Seeder;

class ChangesAfterVersion_1_3 extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      $this->call('Crear_Permisos_Historico_Clientes');
      $this->command->info('Se ha Creado el permiso Historico de clientes');
      //
      $this->call('Asignar_Permisos_Historico_Clientes');
      $this->command->info('Se ha Asignado  el permiso Historico de clientes');

      $this->call('Crear_Permisos_Borrar_Cliente');
      $this->command->info('Se ha Creado el permiso Borrar cliente');

      $this->call('Asignar_Permisos_Borrar_Cliente');
      $this->command->info('Se ha Asignado  el permiso Borrar cliente');
    }
}
class Crear_Permisos_Historico_Clientes extends Seeder {

  public function run()
  {
    //Permisos Sobre OTS
  App\Permission::create(array('name' => 'ver_historico_clientes','display_name'=>'Ver historico de clientes','description'=>'Puede Ver el informe del historial de clientes' ));

  }

}
class Asignar_Permisos_Historico_Clientes extends Seeder {

  public function run()
  {

    //Permisos
    $permisos= App\Permission::where('name','ver_historico_clientes')->get();
    //El Rol Desarrollo
    $rol= App\Role::where('name','desarrollo')->first();
    $rol->attachPermissions($permisos);

   //El Rol owner
    $rol= App\Role::where('name','owner')->first();
    $rol->attachPermissions($permisos);

    //El Rol Coordinador
    //$rol= App\Role::where('name','coordinador')->first();
    //$rol->attachPermissions($permisos);

  }

}
class Crear_Permisos_Borrar_Cliente extends Seeder {

  public function run()
  {
    //Permisos Sobre OTS
  App\Permission::create(array('name' => 'borrar_clientes','display_name'=>'Borrar cliente','description'=>'Puede borrar un cliente' ));

  }

}
class Asignar_Permisos_Borrar_Cliente extends Seeder {

  public function run()
  {

    //Permisos
    $permisos= App\Permission::where('name','borrar_clientes')->get();
    //El Rol Desarrollo
    $rol= App\Role::where('name','desarrollo')->first();
    $rol->attachPermissions($permisos);

   //El Rol owner
    $rol= App\Role::where('name','owner')->first();
    $rol->attachPermissions($permisos);

    //El Rol Coordinador
    //$rol= App\Role::where('name','coordinador')->first();
    //$rol->attachPermissions($permisos);

  }

}
