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
     $this->call('PermisosTableSeeder');
     $this->command->info('Permisos table seeded!');
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
   //  $this->call('OTs');
     //$this->command->info('OTs table seeded!');
     $this->call('Planeacion_tipos');
     $this->command->info('Planeacion_tipos table seeded!');
     $this->call('Planeacion_fases');
     $this->command->info('Planeacion_fases table seeded!');
      $this->call('Permission_Role');
     $this->command->info('Permisos Generados seeded!');
     $this->call('Estados_Roles');
     $this->command->info('Roles en Estados Generados seeded!');
    }
}
class RolesTableSeeder extends Seeder {

    public function run()
    {
        DB::table('roles')->delete();

        App\Role::create(array('name' => 'owner','display_name'=>'Proyect Owner','description'=>'Usuario con todos los privilegios de la aplicación' ));
        App\Role::create(array('name' => 'desarrollo','display_name'=>'Test Profile','description'=>'Usuario con Privilegios para poder testear la Aplicación' ));
        App\Role::create(array('name' => 'cuentas','display_name'=>'Cuentas','description'=>'Usuario con algunos permisos especiales, pero con restricciones' ));
        App\Role::create(array('name' => 'coordinador','display_name'=>'Coordinador','description'=>'Usuario con los permisos de asignar tareas' ));
        App\Role::create(array('name' => 'colaborador','display_name'=>'Colaborador','description'=>'Usuario sin permisos, solo puede cambiar estados de tareas' ));

    }

}
class PermisosTableSeeder extends Seeder {

    public function run()
    {
        DB::table('permissions')->delete();
          //Permisos Sobre OTS
        App\Permission::create(array('name' => 'ver_ots','display_name'=>'Ver OTS','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'crear_ots','display_name'=>'Crear OTS','description'=>'Puede Crear' ));
        App\Permission::create(array('name' => 'editar_ots','display_name'=>'Editar OTS','description'=>'Puede Editar' ));
         //Permisos Sobre Clientes
        App\Permission::create(array('name' => 'ver_clientes','display_name'=>'Ver Clientes','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'crear_clientes','display_name'=>'Crear Clientes','description'=>'Puede Crear' ));
        App\Permission::create(array('name' => 'editar_clientes','display_name'=>'Editar Clientes','description'=>'Puede Editar' ));
         //Permisos Sobre Usuarios
        App\Permission::create(array('name' => 'ver_listado_usuarios','display_name'=>'Ver Listado de Usuarios','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'crear_usuarios','display_name'=>'Crear Usuarios','description'=>'Puede Crear' ));
        App\Permission::create(array('name' => 'editar_usuarios','display_name'=>'Editar Usuarios','description'=>'Puede Editar' ));
         //Permisos Sobre Foros
        App\Permission::create(array('name' => 'ver_foro_creatividad','display_name'=>'Ver Foro de Creatividad','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'ver_foro_diseno','display_name'=>'Ver Foro de Diseño','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'ver_foro_desarrollo','display_name'=>'Ver Foro de Desarrollo','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'ver_foro_contenidos','display_name'=>'Ver Foro de Contenidos','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'ver_foro_digital','display_name'=>'Ver Foro de Digital','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'ver_foro_soporte','display_name'=>'Ver Foro de Soporte','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'ver_foro_colaborador','display_name'=>'Ver Foro Colaborador','description'=>'Muestra el foro dependiendo del area del colaborador' ));
        //Permisos Sobre Areas
        App\Permission::create(array('name' => 'ver_listado_areas','display_name'=>'Ver Areas','description'=>'Puede Ver' ));
        App\Permission::create(array('name' => 'crear_areas','display_name'=>'Crear Areas','description'=>'Puede crear' ));
        App\Permission::create(array('name' => 'editar_areas','display_name'=>'Editar Areas','description'=>'Puede Editar' ));
        //Permisos Sobre Tareas
        App\Permission::create(array('name' => 'crear_tareas','display_name'=>'Crear Tareas','description'=>'Puede crear' ));
        App\Permission::create(array('name' => 'editar_tareas','display_name'=>'Editar Tareas','description'=>'Puede Editar' ));
        //Permisos sobre Roles
        App\Permission::create(array('name' => 'ver_roles','display_name'=>'Ver y editar Roles','description'=>'Puede crear y editar los Roles de la Aplicación' ));
        //Permisos sobre Trafico
        App\Permission::create(array('name' => 'ver_trafico','display_name'=>'Tráfico','description'=>'Puede ver la vista de trafico' ));
        //Permisos sobre Historico Areas
        App\Permission::create(array('name' => 'ver_historico_areas','display_name'=>'Historico Áreas','description'=>'Puede ver el Historico de áreas' ));
        //Permisos sobre Historico Usuarios
        App\Permission::create(array('name' => 'ver_historico_usuarios','display_name'=>'Historico Usuarios','description'=>'Puede ver el Historico de usuarios' ));
        //Permisos sobre Fases Planeación
        App\Permission::create(array('name' => 'ver_fases_planeacion','display_name'=>'Fases Planeación','description'=>'Puede ver las fases de planeación' ));

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
        App\Area::create(array('nombre' => 'Digital Performance','extencion_tel' => '0581','estado' => '1') );
        App\Area::create(array('nombre' => 'Cuentas','extencion_tel' => '0581','estado' => '1') );
        App\Area::create(array('nombre' => 'Soporte','extencion_tel' => '07881','estado' => '1') );

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
        App\Tipos_estado::create(array('nombre' => 'Prioridad Tarea') );

    }

}
class UsuariosTableSeeder extends Seeder {

    public function run()
    {
        DB::table('users')->delete();
        $rol= App\Role::where('name','owner')->first();
        $area= App\Area::where('nombre','Cuentas')->first();
        App\User::create(array('nombre' => 'Maria Isabel','apellido' => 'Himalaya','cargo' => 'Proyect Owner','telefono' => '1111111','email' => 'owner@himalayada.com',
        'estado'=>1,'horas_disponible' => 120,'api_token'=> str_random(60),'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','fecha_nacimiento' => '2017-01-01','roles_id' => $rol['id'],'areas_id' =>$area['id']));
        $user =   App\User::where('email','owner@himalayada.com')->first();
        $user->attachRole($rol);

        $rol= App\Role::where('name','desarrollo')->first();
        $area= App\Area::where('nombre','Desarrollo')->first();
        App\User::create(array('nombre' => 'Desarrollo','apellido' => 'Himalaya','cargo' => 'Tester','telefono' => '1111111','email' => 'desarrollo@himalayada.com',
        'estado'=>1,'horas_disponible' => 1,'api_token'=> str_random(60),'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','fecha_nacimiento' => '2017-01-01','roles_id' => $rol['id'],'areas_id' =>$area['id']));
        $user =   App\User::where('email','desarrollo@himalayada.com')->first();
        $user->attachRole($rol);

        $rol= App\Role::where('name','cuentas')->first();
        $area= App\Area::where('nombre','Cuentas')->first();
        App\User::create(array('nombre' => 'Ejecutiva 1','apellido' => 'Himalaya','cargo' => 'Ejecutiva','telefono' => '22222222','email' => 'ejecutiva@himalayada.com',
        'estado'=>1,'horas_disponible' => 1,'api_token'=> str_random(60),'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','fecha_nacimiento' => '2017-01-01','roles_id' => $rol['id'],'areas_id' => $area['id']));
        $user =   App\User::where('email','ejecutiva@himalayada.com')->first();
        $user->attachRole($rol);

        $rol= App\Role::where('name','cuentas')->first();
        $area= App\Area::where('nombre','Cuentas')->first();
        App\User::create(array('nombre' => 'Ejecutiva 2','apellido' => 'Himalaya 2','cargo' => 'Ejecutiva 2','telefono' => '445548751','email' => 'ejecutiva2@himalayada.com',
        'estado'=>1,'horas_disponible' => 40,'api_token'=> str_random(60),'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','fecha_nacimiento' => '2017-01-01','roles_id' => $rol['id'],'areas_id' => $area['id']));
        $user =   App\User::where('email','ejecutiva2@himalayada.com')->first();
        $user->attachRole($rol);


        $rol= App\Role::where('name','coordinador')->first();
        $area= App\Area::where('nombre','Diseño')->first();
        App\User::create(array('nombre' => 'Coordinador 1','apellido' => 'Himalaya','cargo' => 'Coordinador Diseño','telefono' => '22222222','email' => 'coordinador1@himalayada.com',
        'estado'=>1,'horas_disponible' => 1,'api_token'=>str_random(60),'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','fecha_nacimiento' => '2017-01-01','roles_id' => $rol['id'],'areas_id' => $area['id']));
        $user =   App\User::where('email','coordinador1@himalayada.com')->first();
        $user->attachRole($rol);

          $rol= App\Role::where('name','coordinador')->first();
        $area= App\Area::where('nombre','Desarrollo')->first();
        App\User::create(array('nombre' => 'Coordinador 2','apellido' => 'Area Desarrollo','cargo' => 'Coordinador Desarrollo','telefono' => '22222222','email' => 'coordinador2@himalayada.com',
        'estado'=>1,'horas_disponible' => 120,'api_token'=>str_random(60),'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','fecha_nacimiento' => '2017-01-01','roles_id' => $rol['id'],'areas_id' => $area['id']));
        $user =   App\User::where('email','coordinador2@himalayada.com')->first();
        $user->attachRole($rol);

        $rol= App\Role::where('name','colaborador')->first();
        $area= App\Area::where('nombre','Diseño')->first();
        App\User::create(array('nombre' => 'Colaborador 1','apellido' => 'Himalaya','cargo' => 'Colaborador Diseño','telefono' => '22222222','email' => 'colaborador1@himalayada.com',
        'estado'=>1,'horas_disponible' => 1,'api_token'=>str_random(60) ,'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','fecha_nacimiento' => '2017-01-01','roles_id' => $rol['id'],'areas_id' => $area['id']));
        $user =   App\User::where('email','colaborador1@himalayada.com')->first();
        $user->attachRole($rol);

         $rol= App\Role::where('name','colaborador')->first();
        $area= App\Area::where('nombre','Desarrollo')->first();
        App\User::create(array('nombre' => 'Colaborador 2','apellido' => 'Himalaya','cargo' => 'Colaborador Desarrollo','telefono' => '22222222','email' => 'colaborador2@himalayada.com',
        'estado'=>1,'horas_disponible' => 1,'api_token'=>str_random(60) ,'password' => '$2y$10$lfVPsPgKJ2UB/KlvTu/jOukCtlyMM9ItCeXVJPWcm34YwNh0hMboG','fecha_nacimiento' => '2017-01-01','roles_id' => $rol['id'],'areas_id' => $area['id']));
        $user =   App\User::where('email','colaborador2@himalayada.com')->first();
        $user->attachRole($rol);


    }

}
class ClientesTableSeeder extends Seeder {

    public function run()
    {
        DB::table('clientes')->delete();

        App\Cliente::create(array('nombre' => 'Electrojaponesa','nit'=>'12345678','nombre_contacto' =>'Victoria','estado'=>1));
        App\Cliente::create(array('nombre' => 'Adeinco','nit'=>'12345678','nombre_contacto' =>'Pablo','estado'=>1) );
        App\Cliente::create(array('nombre' => 'Calzatodo','nit'=>'12345678','nombre_contacto' =>'Santiago','estado'=>1) );
        App\Cliente::create(array('nombre' => 'Himalaya','nit'=>'87654321','nombre_contacto' =>'M. Isabel','estado'=>1) );
    }

}

class EstadosTableSeeder extends Seeder {

    public function run()
    {
        DB::table('estados')->delete();

          App\Estado::create(array('nombre' => 'OK','tipos_estados_id'=> 1));
          App\Estado::create(array('nombre' => 'Realizado','tipos_estados_id'=> 1));
          App\Estado::create(array('nombre' => 'Programado','tipos_estados_id'=> 1));
          App\Estado::create(array('nombre' => 'Atención Cuentas','tipos_estados_id'=> 1 ));
          App\Estado::create(array('nombre' => 'Atención Área','tipos_estados_id'=> 1 ));
          App\Estado::create(array('nombre' => 'Espera','tipos_estados_id'=> 1) );
          App\Estado::create(array('nombre' => 'Pendiente','tipos_estados_id'=> 1 ));

          App\Estado::create(array('nombre' => 'On Going','tipos_estados_id'=> 2) );
          App\Estado::create(array('nombre' => 'En espera','tipos_estados_id'=> 2) );
          App\Estado::create(array('nombre' => 'Terminado','tipos_estados_id'=> 2) );

          App\Estado::create(array('nombre' => 'Alta','tipos_estados_id'=> 3) );
          App\Estado::create(array('nombre' => 'Media','tipos_estados_id'=> 3) );
          App\Estado::create(array('nombre' => 'Baja','tipos_estados_id'=> 3) );
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

class OTs extends Seeder {

    public function run()
    {
        DB::table('ots')->delete();
        App\OT::create(array('nombre' => 'Himalaya Pag. Web','referencia'=>'567','fee'=>1,'horas_totales'=>10,'valor'=>'10000000','fecha_inicio' =>'2017-01-30 12:55:22','fecha_final'=>'2017-03-30 12:55:22', 'clientes_id' => '4', 'usuarios_id' => '2', 'estados_id' => '4'));
    }

}
class Planeacion_tipos extends Seeder {

    public function run()
    {
        DB::table('planeacion_tipos')->delete();
        App\Planeacion_tipo::create(array('nombre' => 'Planeacion'));
        App\Planeacion_tipo::create(array('nombre' => 'Desarrollo'));
        App\Planeacion_tipo::create(array('nombre' => 'Calidad'));
        App\Planeacion_tipo::create(array('nombre' => 'Publicacion'));
    }

}

class Planeacion_fases extends Seeder {

    public function run()
    {
        DB::table('planeacion_fases')->delete();
        App\Planeacion_fase::create(array('nombre' => 'Levantamiento Requerimientos','planeacion_tipos_id' => 1));
        App\Planeacion_fase::create(array('nombre' => 'Desarrollo/Maquetado','planeacion_tipos_id' =>2));
        App\Planeacion_fase::create(array('nombre' => 'Calidad y pruebas Desarrollo','planeacion_tipos_id' => 3));
        App\Planeacion_fase::create(array('nombre' => 'Publicacion','planeacion_tipos_id' => 4));
    }

}


class Permission_Role extends Seeder {

    public function run()
    {
        DB::table('permission_role')->delete();


         //El Rol Desarrollo tiene todos los permisos
         $rol= App\Role::where('name','desarrollo')->first();
         $permisos= App\Permission::all();
         $rol->attachPermissions($permisos);
        //El Rol owner tiene todos los permisos
         $rol= App\Role::where('name','owner')->first();
         $rol->attachPermissions($permisos);
        //El Rol cuentas tiene todos los permisos
         $rol= App\Role::where('name','cuentas')->first();
         $permisos= App\Permission::where('name','ver_ots')
                                   ->orWhere('name','crear_ots')
                                   ->orWhere('name','ver_clientes')
                                   ->orWhere('name','crear_tareas')
                                   ->orWhere('name','ver_listado_areas')
                                   ->orWhere('name','ver_foro_creatividad')
                                   ->orWhere('name','ver_foro_desarrollo')
                                   ->orWhere('name','ver_foro_diseno')
                                   ->orWhere('name','ver_foro_contenidos')
                                   ->orWhere('name','ver_foro_soporte')
                                   ->orWhere('name','ver_foro_digital')
                                   ->orWhere('name','crear_clientes')
                                   ->orWhere('name','editar_clientes')->get();
         //El Rol Coordinador
         $rol->attachPermissions($permisos);
         $rol= App\Role::where('name','coordinador')->first();
         $permisos= App\Permission::where('name','ver_ots')
                                   ->orWhere('name','ver_clientes')
                                   ->orWhere('name','ver_listado_areas')
                                   ->orWhere('name','ver_foro_creatividad')
                                   ->orWhere('name','ver_foro_desarrollo')
                                   ->orWhere('name','ver_foro_diseno')
                                   ->orWhere('name','ver_foro_contenidos')
                                   ->orWhere('name','ver_foro_soporte')
                                   ->orWhere('name','ver_foro_digital')
                                   ->orWhere('name','editar_tareas')
                                   ->get();
        //El Rol Colaborador
         $rol->attachPermissions($permisos);
         $rol= App\Role::where('name','colaborador')->first();
         $permisos= App\Permission::where('name','ver_listado_areas')
                                   ->orWhere('name','ver_foro_colaborador')
                                   ->orWhere('name','editar_tareas')
                                   ->get();
         $rol->attachPermissions($permisos);

    }

}
class Estados_Roles extends Seeder {

  public function run()
  {
    DB::table('estados_x_roles')->delete();

    //El Rol Owner tiene todos los permisos
    $rol= App\Role::where('id','1')
                    ->first();
    $estados= App\Estado::where('tipos_estados_id','1')->get();
    $rol->Estados()->saveMany($estados);

    //El Rol Desarrollo tiene todos los permisos
    $rol= App\Role::where('id','2')->first();
    $rol->Estados()->saveMany($estados);

    //El Rol Cuentas tiene todos los permisos
    $rol= App\Role::where('id','3')->first();
    $estados= App\Estado::where('id','5')
                          ->where('tipos_estados_id','1')
                          ->orWhere('id','6')
                          ->orWhere('id','7')
                          ->get();
    $rol->Estados()->saveMany($estados);

    //El Rol Coordinador tiene todos los permisos
    $rol= App\Role::where('id','4')->first();
    $estados= App\Estado::where('id','1')
                          ->where('tipos_estados_id','1')
                          ->orWhere('id','2')
                          ->orWhere('id','3')
                          ->orWhere('id','4')
                          ->get();
    $rol->Estados()->saveMany($estados);

    //El Rol Colaborador tiene todos los permisos
    $rol= App\Role::where('id','5')->first();
    $estados= App\Estado::where('id','2')
                          ->where('tipos_estados_id','1')
                          ->orWhere('id','5')
                          ->get();
    $rol->Estados()->saveMany($estados);

  }

}
