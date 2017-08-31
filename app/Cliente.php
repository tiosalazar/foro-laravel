<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Cliente extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'nit', 'email', 'telefono', 'nombre_contacto', 'horas_disponible', 'estado','razon_social','user_id',
  ];

  /**
  * Obtiene la OT que posee el cliente
  */
  public function OT()
  {
      return $this->hasMany('App\Ot','clientes_id','id');
  }

  /**
  * Obtiene los requerimientos que posee el cliente
  */
  public function Requerimientos_cliente()
  {
      return $this->hasMany('App\Requerimientos_cliente','clientes_id','id');
  }

  /**
  * Obtiene el usuario que posee el cliente
  */
  public function usuario()
  {
      return $this->belongsTo('App\User','user_id');
  }
}
