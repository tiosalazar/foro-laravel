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
}
