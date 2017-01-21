<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comentario extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'comentarios', 'usuarios_id', 'tareas_id',
  ];
}
