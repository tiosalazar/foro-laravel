<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Jenssegers\Date\Date;
use Carbon\Carbon;

class Ot extends Model
{


  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre','referencia','fee','horas_totales','horas_disponibles','total_horas_extra','valor', 'observaciones', 'fecha_inicio', 'fecha_final','estado','clientes_id', 'usuarios_id','estados_id',
  ];

   public function getFormatFecha($fecha_ingreso)
  {
       $fecha= new Date($fecha_ingreso);
      return ucwords($fecha->format('d-M-Y'), "-");
  }
  public function getFormatFechaShow($fecha_ingreso)
  {
       $fecha= new Date($fecha_ingreso);
      return ucwords($fecha->format('d | M | Y '));
  }
  public function getFormatFechaShowInfo($fecha_ingreso)
  {
       $fecha= new Date($fecha_ingreso);
      return $fecha->format('d-M-Y ');
  }


  /**
  * Obtiene el Cliente que esta asociado a una OT
  */
  public function Cliente()
  {
    return $this->belongsTo('App\Cliente','clientes_id','id');
  }
  /**
  * Obtiene el Usuario que esta asociada a una OT
  */
  public function Usuario()
  {
    return $this->belongsTo('App\User','usuarios_id','id');
  }
  /**
  * Obtiene el Estado que esta asociada a una OT
  */
  public function Estado()
  {
    return $this->belongsTo('App\Estado','estados_id','id');
  }
  /**
  * Obtiene el Estado que esta asociada a una OT
  */
  public function Estados()
  {
    return $this->belongsTo('App\Estado','estados_id','id');
  }

  /**
  * Obtiene los Comentarios que posee el usuario
  */
  public function Tarea()
  {
    return $this->hasMany('App\Tarea','ots_id','id');
  }
  /**
  * Obtiene los compras que posee la OT
 */
public function Compras_Ot()
  {
      return $this->hasMany('App\Compras_Ot','ots_id','id');
  }
  /**
  * Obtiene los Tiempos_x_Area que posee la OT
 */
public function Tiempos_x_Area()
  {
      return $this->hasMany('App\Tiempos_x_Area','ots_id','id');
  }
  /**
  * Obtiene los compras que posee la OT
 */
public function Historico_Ot()
  {
      return $this->hasMany('App\Historico_Ot');
  }
   /**
  * Obtiene los requerimientos que posee la OT
 */
public function Requerimiento_Ot()
  {
      return $this->hasMany('App\Requerimientos_Ot','ots_id','id');
  }

}
