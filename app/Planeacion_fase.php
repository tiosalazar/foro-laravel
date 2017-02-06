<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Planeacion_fase extends Model
{
  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre',
  ];

  /**
  * Obtiene el Tipo de Planeacion que esta asociado a una Fase de Planeación
  */
  public function Tipos_planeacion()
  {
    return $this->belongsTo('App\Planeacion_tipo','planeacion_tipos_id','id');
  }
  /**
  * Obtiene las Tareas que posee un Estado
  */
  public function Tarea()
  {
    return $this->hasMany('App\Tarea');
  }
}
