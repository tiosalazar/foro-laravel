<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use App\Role;
use Zizaco\Entrust\Traits\EntrustUserTrait;
use Jenssegers\Date\Date;
use Carbon\Carbon;

class User extends Authenticatable
{
  use Notifiable,EntrustUserTrait;

  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre', 'apellido', 'cargo', 'telefono', 'email','api_token','horas_disponible','horas_gastadas', 'password', 'roles_id', 'areas_id','estado','fecha_nacimiento','img_perfil'
  ];

  /**
  * The attributes that should be hidden for arrays.
  *
  * @var array
  */
  protected $hidden = [
    'password', 'remember_token',
  ];

  public function getFechaNacimiento($fecha_nacimiento)
  {
       $fecha= new Date($fecha_nacimiento);
      return ucwords($fecha->format('M / d / Y'));
  }

  /**
  * Obtiene el Rol que esta asociado a un Usuario
  */
  public function Rol()
  {
    return $this->belongsTo('App\Role','roles_id','id');
  }

  /**
  * Obtiene el Area que esta asociada a un Usuario
  */
  public function Area()
  {
    return $this->belongsTo('App\Area','areas_id','id');
  }

  /**
  * Obtiene los Comentarios que posee el usuario
  */
  public function Comentario()
  {
    return $this->hasMany('App\Comentario','usuarios_comentario_id','id');
  }
  /**
  * Obtiene los Tareas que posee el usuario
  */
  public function Tarea()
  {
    return $this->hasMany('App\Tarea');
  }

  /**
  * Obtiene los OTS que posee el usuario
  */
  public function Ot()
  {
    return $this->hasMany('App\Ot','usuarios_id','id');
  }
  /**
  * Obtiene los Historicos que posee el usuario
  */
  public function Historico_Tarea()
  {
    return $this->hasMany('App\Historico_Tarea');
  }
  /**
  * Obtiene los Historicos de OTS que posee el usuario
  */
  public function Historico_Ot()
  {
    return $this->hasMany('App\Historico_Ot');
  }
  /**
  * Obtiene los Historicos de Equipo que posee el usuario
  */
  public function Historico_Equipo()
  {
    return $this->hasMany('App\Historico_equipo','entidad_id','id');
  }

}
