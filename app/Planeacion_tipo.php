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
      'nombre', 'descripcion',
  ];

  /**
  * Obtiene la Fase de Planeacion que posee un Tipo de fase
  */
  public function Fases_planeacion()
  {
    return $this->hasMany('App\Planeacion_fase');
  }
}
