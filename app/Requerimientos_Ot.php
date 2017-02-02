<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Requerimientos_Ot extends Model
{
     /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'horas', 'ots_id',
  ];

  /**
  * Obtiene la Ot que posee un Requerimiento
  */
  public function Ot()
  {
    return $this->belongsTo('App\Ot');
  }
}
