@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>

	<div class="titulos_foro">
    	<h3 class="box-title"><span class="span_descripcion1">Foro</span> <span class="span_descripcion2">Diseño</span></h3>
   @if(Auth::user()->can('crear_tareas'))
	  <div class="col-md-3 pull-right"> 
	  	 <a type="button" href="{{url('/crear_tarea')}}"  class="btn btn-block boton_foro btn-success succes pull-right">Crear Tarea</a>
	  </div>
	 <div style="height: 22px;"></div>
	  @endif
	 </div>
        <div class="clearfix"></div>
	   <ver_tareas :area="2"></ver_tareas>
			
	</section>
@endsection
