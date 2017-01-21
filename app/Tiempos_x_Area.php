<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tiempos_x_Area extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'tiempo_estimado', 'tiempo_real', 'tiempo_extra', 'ots_id', 'areas_id',
  ];
}
