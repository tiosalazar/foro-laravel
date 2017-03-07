<?php

namespace App;

use Zizaco\Entrust\EntrustPermission;

class Permission extends EntrustPermission
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
     * The products that belong to the shop.
     */
    public function role()
    {
        return $this->belongsToMany('App\Role' , 'permission_role', 'role_id','permission_id');
    }

}
