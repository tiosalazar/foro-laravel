@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<div class="titulos_foro">
		<h3 class="box-title"><span class="span_descripcion1">Rol</span><span class="span_descripcion2">es</span></h3>
	 </div>
	<roles></roles>
@endsection
