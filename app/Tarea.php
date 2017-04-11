<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Jenssegers\Date\Date;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;

class Tarea extends Model
{
  use SoftDeletes;

  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre_tarea', 'fecha_entrega_area','fecha_entrega_cuentas','tiempo_mapa_cliente', 'descripcion', 'enlaces_externos', 'tiempo_estimado', 'tiempo_real', 'fecha_entrega_cliente', 'estados_id', 'areas_id',
    'usuarios_id', 'ots_id', 'planeacion_fases_id', 'encargado_id','prioridad_id','fecha_inicio_recurrencia', 'fecha_final_recurrencia','recurrente',
  ];
  /**
  * The attributes that should be mutated to dates.
  *
  * @var array
  */
  protected $dates = ['deleted_at'];

  public function getFormatFecha($fecha_ingreso)
 {
      $fecha= new Date($fecha_ingreso);
     return ucwords($fecha->format('d-M-Y'));
 }
  /**
  * Obtiene el Estado que esta asociado a una Tarea
  */
  public function Estado()
  {
    return $this->belongsTo('App\Estado','estados_id','id');
  }
  /**
  * Obtiene el Estado que esta asociado a una Tarea
  */
  public function Estado_prioridad()
  {
    return $this->belongsTo('App\Estado','prioridad_id','id');
  }
  /**
  * Obtiene el Area que esta asociada la Tarea
  */
  public function Area()
  {
    return $this->belongsTo('App\Area','areas_id','id');
  }
  /**
  * Obtiene el Usuario que esta asociada la Tarea
  */
  public function Usuario()
  {
    return $this->belongsTo('App\User','usuarios_id','id');
  }
  /**
  /**
  * Obtiene el Usuario encargado
  */
  public function Usuarioencargado()
  {
    return $this->belongsTo('App\User','encargado_id','id');
  }
  /**
  * Obtiene la OT que esta asociada a la Tarea
  */
  public function Ot()
  {
    return $this->belongsTo('App\Ot','ots_id','id');
  }
  /**
  * Obtiene la Fase de Planeacion que esta asociado a una Tarea
  */
  public function Planeacion_fase()
  {
    return $this->belongsTo('App\Planeacion_fase','planeacion_fases_id','id');
  }

  /**
  * Obtiene los Comentarios que están asociados a la Tarea
  */
  public function Comentario()
  {
    return $this->hasMany('App\Comentario','tareas_id','id');
  }
  /**
  * Obtiene los Historicos que están asociados a la Tarea
  */
  public function Historico_Tarea()
  {
    return $this->hasMany('App\Historico_Tarea');
  }
}
