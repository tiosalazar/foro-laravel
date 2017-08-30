@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<div class="titulos_foro">
		<h3 class="box-title"><span class="span_descripcion1">Permisos</span></h3>
	 </div>
	<asignar_roles></asignar_roles>
	
@endsection
