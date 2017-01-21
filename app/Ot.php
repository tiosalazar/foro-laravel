<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ot extends Model
{
  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre', 'valor', 'observaciones', 'fecha_inicio', 'fecha_final', 'clientes_id', 'usuarios_id','estados_id',
  ];



  /**
  * Obtiene el Cliente que esta asociado a una OT
  */
  public function Cliente()
  {
    return $this->belongsTo('App\Cliente');
  }
  /**
  * Obtiene el Usuario que esta asociada a una OT
  */
  public function Usuario()
  {
    return $this->belongsTo('App\User');
  }
  /**
  * Obtiene el Estado que esta asociada a una OT
  */
  public function Estado()
  {
    return $this->belongsTo('App\Estado');
  }


  /**
  * Obtiene los Comentarios que posee el usuario
  */
  public function Tarea()
  {
    return $this->hasMany('App\Tarea');
  }
  /**
  * Obtiene los compras que posee la OT
 */
public function Compras_Ot()
  {
      return $this->hasMany('App\Compras_ot');
  }
  /**
  * Obtiene los Tiempos_x_Area que posee la OT
 */
public function Tiempos_x_Area()
  {
      return $this->hasMany('App\Tiempos_x_Area');
  }
  /**
  * Obtiene los compras que posee la OT
 */
public function Historico_Ot()
  {
      return $this->hasMany('App\Historico_Ot');
  }

}
