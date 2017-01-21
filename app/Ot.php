<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ot extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'valor', 'observaciones', 'fecha_inicio', 'fecha_final', 'clientes_id', 'usuarios_id','estados_id',
  ];
}
