<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre', 'extencion_tel', 'estado',
  ];

  /**
  * Obtiene los  Usuarios que posee el Area
  */
  public function User()
  {
    return $this->hasMany('App\User');
  }
  /**
  * Obtiene las Tareas que posee un Area
  */
  public function Tarea()
  {
    return $this->hasMany('App\Tarea');
  }
  /**
  * Obtiene los compras que posee el Area
  */
  public function Compras_Ot()
  {
    return $this->hasMany('App\Compras_ot');
  }
  /**
  * Obtiene los Tiempos que posee el Area
  */
  public function Tiempos_x_Area()
  {
    return $this->hasMany('App\Tiempos_x_Area');
  }
}
