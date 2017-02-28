<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tipos_compra extends Model
{
   public $table = "tipos_compras";
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
      return $this->hasMany('App\Compras_Ot','tipos_compras_id','id');
  }
}
