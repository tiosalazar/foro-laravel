<?php

use Illuminate\Database\Seeder;

class ChangesAfterVersion_1 extends Seeder
{
  /**
  * Run the database seeds.
  *
  * @return void
  */
  public function run()
  {
    $this->call('Agregar_Estado_Pendiente_Coordinador');
    $this->command->info('Se le ha agregado el Estado pendiente al Rol Cordinador');
    $this->call('Modificar_Priodidades');
    $this->command->info('Se ha modificado el estado "bajo" a "Normal" ');
    $this->call('Crear_Permisos_compras');
    $this->command->info('Se han añadido los permisos correspondientes para las compras');
    $this->call('Asignar_Permisos_compras');
    $this->command->info('Se han Asignado los permisos correspondientes para las compras');
    $this->call('AgregarTipoDeEstadoTransaccion');
    $this->command->info('Se han agregado el tipo de estado Transacción');
    $this->call('AgregarEstadoTransaccion');
    $this->command->info('Se han Agregado los estados de la Transacción');

  }
}


class Agregar_Estado_Pendiente_Coordinador extends Seeder {

  public function run()
  {

    //El Rol Coordinador tiene todos los permisos
    $rol= App\Role::where('id','4')->first();
    $estados= App\Estado::where('id','7')
    ->where('tipos_estados_id','1')
    ->get();
    $rol->Estados()->saveMany($estados);

  }

}
class Modificar_Priodidades extends Seeder {

  public function run()
  {

    //El Rol Coordinador tiene todos los permisos

    $estados= App\Estado::where('id','13')->first();
    $estados->nombre="Normal";
    $estados->save();


  }

}
class Crear_Permisos_compras extends Seeder {

  public function run()
  {
    //Permisos Sobre OTS
  App\Permission::create(array('name' => 'ver_compras_asociadas','display_name'=>'Ver Compras Asociadas a la OT','description'=>'Puede Ver las Compras asociadas ' ));
  App\Permission::create(array('name' => 'crear_compras_asociadas','display_name'=>'Crear Compras Asociadas a la OT','description'=>'Puede acceder al formulario de Compras asociadas a la OT' ));
  App\Permission::create(array('name' => 'editar_compras_asociadas','display_name'=>'Editar Compras Asociadas a la OT','description'=>'Puede Editar alguna compra asociada ya creada' ));


  }

}
class Asignar_Permisos_compras extends Seeder {

  public function run()
  {

    //Permisos
    $permisos= App\Permission::where('name','ver_compras_asociadas')
                              ->orWhere('name','crear_compras_asociadas')
                              ->orWhere('name','editar_compras_asociadas')->get();
    //El Rol Desarrollo
    $rol= App\Role::where('name','desarrollo')->first();
    $rol->attachPermissions($permisos);

   //El Rol owner
    $rol= App\Role::where('name','owner')->first();
    $rol->attachPermissions($permisos);

    //El Rol Coordinador
    $rol= App\Role::where('name','coordinador')->first();
    $rol->attachPermissions($permisos);

  }

}
class AgregarTipoDeEstadoTransaccion extends Seeder {

  public function run()
  {
    App\Tipos_estado::create(array('nombre' => 'Estados Transacción') );
  }

}

class AgregarEstadoTransaccion extends Seeder {

  public function run()
  {

   App\Estado::create(array('nombre' => 'Pendiente','tipos_estados_id'=> 5 ));
   App\Estado::create(array('nombre' => 'Ok','tipos_estados_id'=> 5 ));
  }

}
