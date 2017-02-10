<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tiempos_x_Area extends Model
{

  public $table = "tiempos_x_area";

  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'tiempo_estimado', 'tiempo_real', 'tiempo_extra', 'ots_id', 'areas_id',
  ];

  /**
  * Obtiene la ot que esta asociado a un Tiempo por Area
  */
  public function Ots()
  {
    return $this->belongsTo('App\Ot','ots_id','id');
  }
  /**
  * Obtiene el Area que esta asociada a Tiempo
  */
  public function Area()
  {
    return $this->belongsTo('App\Area','areas_id','id');
  }
  /**
  * Obtiene el Historico_Ot que esta asociada a Tiempo
  */
  public function Historico_Ot()
  {
    return $this->hasMany('App\Historico_Ot');
  }
}
