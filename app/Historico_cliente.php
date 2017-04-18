<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Jenssegers\Date\Date;
use Carbon\Carbon;

class Historico_cliente extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'cliente_id','nombre', 'nit', 'email', 'telefono', 'nombre_contacto', 'horas_disponible', 'estado','razon_social','user_id',
  ];

  public function getFormatFecha($fecha_ingreso)
 {
      $fecha= new Date($fecha_ingreso);
     return ucwords($fecha->format('d-M-Y'), "-");
 }

 public function getMesActual()
{
     $fecha= new Date();
    return ucwords($fecha->format('M'));
}
public function getFormatMes($fecha_ingreso)
{
    $fecha= new Date($fecha_ingreso);
   return ucwords($fecha->format('M'));
}

  /**
  * Obtiene la OT que posee el cliente
  */
  public function OT()
  {
      return $this->hasMany('App\Ot','clientes_id','id');
  }

  /**
  * Obtiene el usuario que posee el cliente
  */
  public function usuario()
  {
      return $this->belongsTo('App\User','user_id');
  }
}
