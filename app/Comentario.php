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
      'comentarios', 'usuarios_comentario_id', 'tareas_id', 'estados_id','requerimientos_clientes_id'
  ];
  /**
  * Obtiene el Usuario que esta asociado a un comentario
  */
  public function User()
    {
        return $this->belongsTo('App\User','usuarios_comentario_id','id');
    }
    /**
    * Obtiene la tarea a la que esta asociada el comentario
    */
  public function Tarea()
    {
       return $this->belongsTo('App\Tarea','tareas_id','id');
    }
    /**
    * Obtiene el requerimiento a la que esta asociada el comentario
    */
  public function Requerimientos_cliente()
    {
       return $this->belongsTo('App\Requerimientos_cliente','requerimientos_clientes_id','id');
    }
    /**
    * Obtiene los Historicos que estan asociados a un Comentario
    */
    public function Historico()
    {
      return $this->hasOne('App\Historico_Tarea');
    }
    /**
    * Obtiene los estados refente a cada tarea
    */
    public function Estados()
    {
      return $this->belongsTo('App\Estado','estados_id','id');
    }
}
