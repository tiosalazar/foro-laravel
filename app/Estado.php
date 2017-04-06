<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Estado extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'tipos_estados_id',
  ];

  /**
  * Obtiene el Tipo de Estado  que esta asociado a un Estado
  */
  public function Tipos_estado()
  {
    return $this->belongsTo('App\Tipos_estado','tipos_estados_id','id');
  }
  /**
  * Obtiene las Tareas que posee un Estado
  */
  public function Tarea()
  {
    return $this->hasMany('App\Tarea','estados_id','id');
  }
  /**
  * Obtiene las tareas que poseen cierta prioridad
  */
  public function PrioridadTarea()
  {
    return $this->hasMany('App\Tarea','prioridad_id','id');
  }
  /**
  * Obtiene los OTS que posee un Estado
  */
  public function Ot()
  {
    return $this->hasMany('App\Ot','estados_id','id');
  }
  /**
  * Obtiene los Historicos que posee un Estado
  */
  public function Historico()
  {
    return $this->hasMany('App\Historico_Tarea');
  }
   /**
  * Obtiene los comentarios de tareas asociados a un estado
  */
  public function Comentarios()
  {
    return $this->hasMany('App\Comentario','estados_id','id');
  }

  /**
  * Obtiene los roles asociados a un estado
  */
  public function Roles()
  {
    return $this->belongsToMany('App\Role', 'estados_x_roles', 'estados_id', 'roles_id');
  }
  /**
  * Obtiene las Compras que posee un Estado
  */
  public function Compras()
  {
    return $this->hasMany('App\Compras_ot','estados_id','id');
  }

}
