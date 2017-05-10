<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
class Requerimientos_Ot extends Model
{
  use SoftDeletes;
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
  * The attributes that should be mutated to dates.
  *
  * @var array
  */
  protected $dates = ['deleted_at'];
  /**
  * Obtiene la Ot que posee un Requerimiento
  */
  public function Ot()
  {
    return $this->belongsTo('App\Ot','ots_id','id');
  }
}
