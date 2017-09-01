<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Requerimientos_cliente extends Model
{
    public $table = "requerimientos_clientes";

    /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
    protected $fillable = [
       'nombre', 'descripcion','fecha_ideal_entrega', 'estados_id','clientes_id','encargado_id','usuarios_id','ots_id','prioridad_id'
    ];


    /**
    * Obtiene el Estado que esta asociado a una Tarea
    */
    public function Estado()
    {
      return $this->belongsTo('App\Estado','estados_id','id');
    }
    /**
      * Obtiene el Estado que esta asociado a una Tarea
      */
      public function Estado_prioridad()
      {
        return $this->belongsTo('App\Estado','prioridad_id','id');
      }
    /**
    * Obtiene el Usuario que esta asociada al Requerimiento solicitado
    */
    public function Usuario()
    {
      return $this->belongsTo('App\User','usuarios_id','id');
    }
    /**
    * Obtiene el Usuario encargado
    */
    public function Usuarioencargado()
    {
      return $this->belongsTo('App\User','encargado_id','id');
    }
    /**
    * Obtiene la OT que esta asociada al Requerimiento solicitado
    */
    public function Ot()
    {
      return $this->hasMany('App\Ot','ots_id','id');
    }
    /**
    * Obtiene el cliente  que esta asociada al Requerimiento solicitado
    */
    public function Cliente()
    {
      return $this->belongsTo('App\Cliente','clientes_id','id');
    }

    /**
    * Obtiene los Comentarios que están asociados al Requerimiento solicitado
    */
    public function Comentario()
    {
      return $this->hasMany('App\Comentario','requerimientos_clientes_id','id');
    }
    /**
    * Obtiene las Tareas que están asociados al Requerimiento solicitado
    */
    public function Tarea()
    {
      return $this->hasMany('App\Tarea','requerimientos_clientes_id','id');
    }


}
