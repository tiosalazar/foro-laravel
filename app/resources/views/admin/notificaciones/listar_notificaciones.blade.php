@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="row">
	<!-- <clientes></clientes> -->
	<div class="titulos_foro">
	<h3 class="box-title"><span class="span_descripcion1">Hist&oacute;rico de </span> <span class="span_descripcion2">Notificaciones</span></h3>
	</div> 
	<listar_notificaciones></listar_notificaciones>
</div>



  @endsection