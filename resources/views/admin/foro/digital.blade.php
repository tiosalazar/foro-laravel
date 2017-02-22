@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>
	<div class="titulos_foro">
		 <h3 class="box-title"><span class="span_descripcion1">Foro</span> <span class="span_descripcion2">Digital</span></h3>
    </div>
	   <ver_tareas :area="5"></ver_tareas>	
	</section>
@endsection
