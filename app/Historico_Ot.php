<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Historico_Ot extends Model
{

    public $table = "historicos_ots";
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
    'requerimientos_ot', 'compras_ot','nombre','referencia','fee','horas_totales','horas_disponibles','total_horas_extra','valor', 'observaciones', 'fecha_inicio', 'fecha_final', 'clientes_id', 'usuarios_id','estados_id','editor_id', 'ots_id',
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
