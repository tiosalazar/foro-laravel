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
  
  public function User()
  {
      return $this->hasMany('App\User','roles_id','id');
  }
   /**
  * Obtiene el Trafico que posee el Rol
 */
  public function Trafico()
  {
      return $this->hasMany('App\Trafico_tarea');
  }
  /**
  * Obtiene los roles asociados a un estado
  */
  public function Estados()
  {
    return $this->belongsToMany('App\Estado', 'estados_x_roles', 'roles_id', 'estados_id');
  }


    /**
     * The products that belong to the shop.
     */
    public function permission()
    {
        return $this->belongsToMany('App\Permission' , 'permission_role',  'role_id', 'permission_id' );
    }
 

}
