<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Historico_equipo extends Model
{
     public $table = "historico_equipos";

     protected $fillable = [
    'entidad_id', 'horas_disponibles','horas_gastadas','tipo_de_entidad','created_at',
  ];

   /**
  * Obtiene el Usuario que esta asociada a un Historico de Equipos
  */
  public function Usuario()
  {
    return $this->belongsTo('App\User','entidad_id','id');
  }
  /**
  * Obtiene el Area que esta asociada a un Historico de Ots
  */
  public function Area()
  {
    return $this->belongsTo('App\Area','entidad_id','id');
  }


}
