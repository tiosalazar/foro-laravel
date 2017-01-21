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
}
