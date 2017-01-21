<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Historico_Ot extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'fecha_final', 'usuarios_id', 'ots_id', 'ots_estados_id',
  ];
}
