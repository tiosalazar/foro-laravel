<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre',
  ];

  /**
  * Obtiene el Usuario que posee el Rol
 */
  public function User()
  {
      return $this->hasMany('App\User');
  }
  /**
  * Obtiene el Trafico que posee el Rol
 */
  public function Trafico()
  {
      return $this->hasMany('App\Trafico_tarea');
  }

}
