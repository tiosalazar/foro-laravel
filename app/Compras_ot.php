<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Compras_ot extends Model
{
  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'nombre', 'descripcion', 'provedor', 'valor', 'ots_id', 'areas_id', 'tipos_compras_id','divisas_id',
  ];

  /**
  * Obtiene la OT que esta asociado a una Compra
  */
  public function Ot()
  {
    return $this->belongsTo('App\Ot');
  }
  /**
  * Obtiene el Area que esta asociada a la compra
  */
  public function Area()
  {
    return $this->belongsTo('App\Area');
  }
  /**
  * Obtiene el Tipo de Compra que esta asociada a la Compra
  */
  public function Tipo_Compra()
  {
    return $this->belongsTo('App\Tipos_Compra');
  }
  /**
  * Obtiene la Divisa que esta asociada a la Compra
  */
  public function Divisa()
  {
    return $this->belongsTo('App\Divisa');
  }

}
