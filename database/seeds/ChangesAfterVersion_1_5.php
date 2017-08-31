<?php

use Illuminate\Database\Seeder;

class ChangesAfterVersion_1_5 extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      $this->call('Crear_Rol_Cliente');
      $this->command->info('Se ha creado el rol de Cliente ');
      $this->call('Crear_Permisos_Clientes');
      $this->command->info('Se han creado los permisos para clientes ');
      $this->call('Asignar_Permisos_Clientes');
      $this->command->info('Se han asignado los permisos para clientes ');
      $this->call('Tipos_Estados_Clientes');
      $this->command->info('Se ha creado el tipo de estado para los clientes');
      $this->call('EstadosTableClientes');
      $this->command->info('Se han creado los estados para los clientes');
      $this->call('AreasTableClientes');
      $this->command->info('Se ha creado el área de clientes');



    }
}
class Crear_Rol_Cliente extends Seeder {

    public function run()
    {
        App\Role::create(array('name' => 'cliente','display_name'=>'Cliente','description'=>'Usuario con con privilegios para crear requerimientos' ));
    }

}

class Crear_Permisos_Clientes extends Seeder {

  public function run()
  {
    //Permisos Sobre OTS
  App\Permission::create(array('name' => 'crear_requerimientos','display_name'=>'Ver Formulario de añadir requerimientos','description'=>'Puede Ver el formulario en donde se ingresan los requerimientos al sistema' ));
  App\Permission::create(array('name' => 'ver_listado_requerimientos','display_name'=>'Ver listado de requerimientos solicitados','description'=>'Puede el listado de requerimientos creados' ));

  }

}


class Asignar_Permisos_Clientes extends Seeder {

  public function run()
  {

    //Permisos
    $permisos= App\Permission::where('name','crear_requerimientos')->orWhere('name','ver_listado_requerimientos')->get();

    $rol= App\Role::where('name','cliente')->first();
    $rol->attachPermissions($permisos);

    //El Rol Desarrollo
    $rol= App\Role::where('name','desarrollo')->first();
    $rol->attachPermissions($permisos);

   //El Rol owner
    $rol= App\Role::where('name','owner')->first();
    $rol->attachPermissions($permisos);


  }

}

class Tipos_Estados_Clientes extends Seeder {

    public function run()
    {
        App\Tipos_estado::create(array('nombre' => 'Estados Clientes'));
    }

}

class EstadosTableClientes extends Seeder {

    public function run()
    {
          App\Estado::create(array('nombre' => 'En espera','tipos_estados_id'=> 6));
          App\Estado::create(array('nombre' => 'Atención cliente','tipos_estados_id'=> 6));
          App\Estado::create(array('nombre' => 'Archivado','tipos_estados_id'=> 6));

    }

}

class AreasTableClientes extends Seeder {

    public function run()
    {
        App\Area::create(array('nombre' => 'Clientes','extencion_tel' => '0000','estado' => '0') );
    }

}
