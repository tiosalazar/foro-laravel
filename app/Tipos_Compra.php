<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tipos_Compra extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre',
  ];
  /**
  * Obtiene los compras que posee El Tipo de Compra
 */
public function Compras_Ot()
  {
      return $this->hasMany('App\Compras_ot');
  }
}
