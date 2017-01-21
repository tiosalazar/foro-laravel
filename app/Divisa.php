<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Divisa extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'tasa_conversion',
  ];
  /**
  * Obtiene los compras que posee la Divisa
 */
public function Compras_Ot()
  {
      return $this->hasMany('App\Compras_ot');
  }
}
