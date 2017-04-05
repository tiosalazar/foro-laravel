<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Planeacion_tipo extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'descripcion', 'estado','areas_id'
  ];

  /**
  * Obtiene la Fase de Planeacion que posee un Tipo de fase
  */
  public function Fases_planeacion()
  {
    return $this->hasMany('App\Planeacion_fase','planeacion_tipos_id','id');
  }
  /**
  * Obtiene el Tipo de Planeacion que esta asociado a una Fase de Planeación
  */
  public function Area_planeacion()
  {
    return $this->belongsTo('App\Area','areas_id','id');
  }
}
