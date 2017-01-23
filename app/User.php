<?php

namespace App;
use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
  use HasApiTokens,Notifiable;

  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre', 'apellido', 'cargo', 'telefono', 'email', 'horas_disponible', 'password', 'roles_id', 'areas_id',
  ];

  /**
  * The attributes that should be hidden for arrays.
  *
  * @var array
  */
  protected $hidden = [
    'password', 'remember_token',
  ];


  /**
  * Obtiene el Rol que esta asociado a un Usuario
  */
  public function Rol()
  {
    return $this->belongsTo('App\Role');
  }
  /**
  * Obtiene el Area que esta asociada a un Usuario
  */
  public function Area()
  {
    return $this->belongsTo('App\Area');
  }

  /**
  * Obtiene los Comentarios que posee el usuario
  */
  public function Comentario()
  {
    return $this->hasMany('App\Comentario');
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
    return $this->hasMany('App\Ot');
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

}
