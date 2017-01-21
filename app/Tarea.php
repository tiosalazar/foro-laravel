<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tarea extends Model
{
  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre_tarea', 'fecha_entrega_estimada', 'descripcion', 'enlaces_externos', 'tiempo_estimado', 'tiempo_real', 'fecha_entrega_cliente', 'estados_id', 'areas_id',
    'usuarios_id', 'ots_id',
  ];


  /**
  * Obtiene el Estado que esta asociado a una Tarea
  */
  public function Estado()
  {
    return $this->belongsTo('App\Estado');
  }
  /**
  * Obtiene el Area que esta asociada la Tarea
  */
  public function Area()
  {
    return $this->belongsTo('App\Area');
  }
  /**
  * Obtiene el Usuario que esta asociada la Tarea
  */
  public function Usuario()
  {
    return $this->belongsTo('App\User');
  }
  /**
  * Obtiene la OT que esta asociada a la Tarea
  */
  public function Ot()
  {
    return $this->belongsTo('App\Ot');
  }

  /**
  * Obtiene los Comentarios que están asociados a la Tarea
  */
  public function Comentario()
  {
    return $this->hasMany('App\Comentario');
  }
  /**
  * Obtiene los Historicos que están asociados a la Tarea
  */
  public function Historico_Tarea()
  {
    return $this->hasMany('App\Historico_Tarea');
  }
}
