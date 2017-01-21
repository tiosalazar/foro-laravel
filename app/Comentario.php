<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comentario extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'comentarios', 'usuarios_id', 'tareas_id',
  ];
  /**
  * Obtiene el Usuario que esta asociado a un comentario
  */
  public function User()
    {
        return $this->belongsTo('App\User');
    }
    /**
    * Obtiene la tarea a la que esta asociada el comentario
    */
  public function Tarea()
    {
       return $this->belongsTo('App\Tarea');
    }
    /**
    * Obtiene los Historicos que estan asociados a un Comentario
    */
    public function Historico()
    {
      return $this->hasOne('App\Historico_Tarea');
    }
}
