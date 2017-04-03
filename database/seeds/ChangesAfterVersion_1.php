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
