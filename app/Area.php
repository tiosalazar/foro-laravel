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
    'nombre', 'extencion_tel','horas_consumidas','estado',
  ];

  /**
  * Obtiene los  Usuarios que posee el Area
  */
  public function User()
  {
    return $this->hasMany('App\User','areas_id','id');
  }
  /**
  * Obtiene las Tareas que posee un Area
  */
  public function Tarea()
  {
    return $this->hasMany('App\Tarea','areas_id','id');
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
    return $this->hasMany('App\Tiempos_x_Area','areas_id','id');
  }
  /**
  * Obtiene los Historicos de Equipo que posee el Area
  */
  public function Historico_Equipo()
  {
    return $this->hasMany('App\Historico_equipo','entidad_id','id');
  }
}
