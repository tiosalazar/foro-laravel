<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Jenssegers\Date\Date;
use Carbon\Carbon;
class Compras_Ot extends Model
{

  public $table = "compras_ots";
  /**
  * The attributes that are mass assignable.
  *
  * @var array
  */
  protected $fillable = [
    'descripcion', 'provedor', 'valor', 'ots_id', 'areas_id', 'tipos_compras_id','divisas_id','transaccion','fecha_transaccion','estados_id'
  ];

  public function getFormatFecha($fecha_ingreso)
 {
      $fecha= new Date($fecha_ingreso);
     return ucwords($fecha->format('d-M-Y'),'-');
 }

  /**
  * Obtiene la OT que esta asociado a una Compra
  */
  public function Ot()
  {
    return $this->belongsTo('App\Ot','ots_id','id');
  }
  /**
  * Obtiene el Area que esta asociada a la compra
  */
  public function Area()
  {
    return $this->belongsTo('App\Area','areas_id','id');
  }
  /**
  * Obtiene el Tipo de Compra que esta asociada a la Compra
  */
  public function Tipo_Compra()
  {
    return $this->belongsTo('App\Tipos_compra','tipos_compras_id','id');
  }
  /**
  * Obtiene la Divisa que esta asociada a la Compra
  */
  public function Divisa()
  {
    return $this->belongsTo('App\Divisa','divisas_id','id');
  }
  /**
  * Obtiene el Estado que esta asociada a la Compra
  */
  public function Estado()
  {
    return $this->belongsTo('App\Estado','estados_id','id');
  }

}
