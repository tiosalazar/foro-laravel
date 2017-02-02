<?php

namespace App;

//use Illuminate\Database\Eloquent\Model;
use Zizaco\Entrust\EntrustRole;
class Role extends EntrustRole
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'name','display_name','description',
  ];

  /**
  * Obtiene el Usuario que posee el Rol
 */
  /*
  public function User()
  {
      return $this->hasMany('App\User','id');
  }
   /**
  * Obtiene el Trafico que posee el Rol
 */
  public function Trafico()
  {
      return $this->hasMany('App\Trafico_tarea');
  }

}
