<?php

use Illuminate\Database\Seeder;

class ChangesAfterVersion_1_1 extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

    $this->call('Crear_Permisos_Informe_Soporte');
    $this->command->info('Se ha Creado el permiso Informe de Soporte');

    $this->call('Asignar_Permisos_Informe_Soporte');
    $this->command->info('Se ha Asignado  el permiso Informe de Soporte');

    }
}

class Crear_Permisos_Informe_Soporte extends Seeder {

  public function run()
  {
    //Permisos Sobre OTS
  App\Permission::create(array('name' => 'ver_informe_soporte','display_name'=>'Ver informe de Soporte','description'=>'Puede Ver el informe de soporte' ));
  App\Permission::create(array('name' => 'descargar_informe_soporte','display_name'=>'Descargar informe Soporte','description'=>'Puede descargar el informe de soporte' ));


  }

}
class Asignar_Permisos_Informe_Soporte extends Seeder {

  public function run()
  {

    //Permisos
    $permisos= App\Permission::where('name','ver_informe_soporte')
                              ->orWhere('name','descargar_informe_soporte')->get();
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
