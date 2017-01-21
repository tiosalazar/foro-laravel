<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Estado extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'tipos_estados_id',
  ];

  /**
  * Obtiene el Tipo de Estado  que esta asociado a un Estado
  */
  public function Tipos_estado()
  {
    return $this->belongsTo('App\Tipos_estado');
  }
  /**
  * Obtiene las Tareas que posee un Estado
  */
  public function Tarea()
  {
    return $this->hasMany('App\Tarea');
  }
  /**
  * Obtiene los OTS que posee un Estado
  */
  public function Ot()
  {
    return $this->hasMany('App\Ot');
  }
  /**
  * Obtiene los Historicos que posee un Estado
  */
  public function Historico()
  {
    return $this->hasMany('App\Historico_Tarea');
  }

}
