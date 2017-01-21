<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Historico_Ot extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'fecha_final', 'usuarios_id', 'ots_id', 'ots_estados_id',
  ];

  /**
  * Obtiene el Usuario que esta asociada a un Historico de Ots
  */
  public function Usuario()
  {
    return $this->belongsTo('App\User');
  }
  /**
  * Obtiene lA OT que esta asociada a un Historico de Ots
  */
  public function Ot()
  {
    return $this->belongsTo('App\Ot');
  }
  /**
  * Obtiene El Tiempos_x_Area que esta asociada a un Historico de Ots
  */
  public function Tiempos_x_Area()
  {
    return $this->belongsTo('App\Tiempos_x_Area');
  }
}
