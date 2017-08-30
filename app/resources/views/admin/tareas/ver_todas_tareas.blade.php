@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>
		<div class="titulos_foro">
			<h3 class="box-title"><span class="span_descripcion1">Tr&aacute;fico de Tareas</span></h3>
		 </div>
	   <!-- <ver_tareas area=""></ver_tareas> -->
	   <ver_todas_tareas ></ver_todas_tareas>

	</section>
@endsection
