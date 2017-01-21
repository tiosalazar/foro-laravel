<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trafico_tarea extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre_tarea', 'fecha_entrega_estimada', 'descripcion', 'enlaces_externos', 'tiempo_estimado', 'tiempo_real', 'fecha_entrega_cliente', 'estados_id', 'areas_id',
       'usuarios_id', 'ots_id', 'roles_id',
  ];


    /**
    * Obtiene el Rol que esta asociado a un Trafico
    */
    public function Rol()
    {
      return $this->belongsTo('App\Role');
    }
}
