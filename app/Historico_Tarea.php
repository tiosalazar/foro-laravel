<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Historico_Tarea extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'tiempo_estimado', 'tiempo_real', 'comentarios_id', 'encargado_id', 'estados_id', 'usuarios_id', 'tareas_id',
  ];

  /**
  * Obtiene el Usuario que esta asociado a un Historico
  */
  public function Usuario()
  {
    return $this->belongsTo('App\User');
  }
  /**
  * Obtiene el Area que esta asociada a un Historico
  */
  public function Tarea()
  {
    return $this->belongsTo('App\Tarea');
  }
  /**
  * Obtiene el Estado que esta asociado a un Historico
  */
  public function Estado()
  {
    return $this->belongsTo('App\Estado');
  }
  /**
  * Obtiene el Area que esta asociada a un Historico
  */
  public function Comentario()
  {
    return $this->belongsTo('App\Comentario');
  }

}
