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
      'nombre', 'nit', 'email', 'telefono', 'nombre_contacto', 'horas_disponible', 'estado',
  ];

  /**
  * Obtiene la OT que posee el cliente
 */
  public function OT()
  {
      return $this->hasMany('App\Ot');
  }
}
