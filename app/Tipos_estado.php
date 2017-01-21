<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tipos_estado extends Model
{
  /**
   * The attributes that are mass assignable.
   *
   * @var array
   */
  protected $fillable = [
      'nombre', 'descripcion',
  ];

  /**
  * Obtiene los Estados que posee un Tipo de estado
  */
  public function Tarea()
  {
    return $this->hasMany('App\Estado');
  }
}
