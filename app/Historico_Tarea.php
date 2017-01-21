<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Historico_Tarea extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'tiempo_estimado', 'tiempo_real', 'comentarios_id', 'encargado_id', 'estados_id', 'usuarios_id', 'tareas_id',
  ];
}
