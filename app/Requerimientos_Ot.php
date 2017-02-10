<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Requerimientos_Ot extends Model
{

  public $table = "requerimientos_ots";
     /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'horas','areas_id', 'ots_id',
  ];

  /**
  * Obtiene la Ot que posee un Requerimiento
  */
  public function Ot()
  {
    return $this->belongsTo('App\Ot','ots_id','id');
  }
}
