@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

<div class="">
	<div class="row">
		<div class="titulos_foro">
			<h3 class="box-title"><span class="span_descripcion1">Fase del</span> <span class="span_descripcion2">Proyecto</span></h3>
		 </div>
		<div class="col-md-8 col-md-offset-2">
		<div class="box box-primary">
			<div class="box-body">
				<div class="col-md-6 "> 
					<h3 class="box-title">Crear Fases</h3>
					<!-- /.box-header -->
					<crear_fase></crear_fase>
				</div>
				
				<div class="col-md-6 "> 
					<h3 class="box-title">Editar Fases</h3>
					<!-- /.box-header -->
					<editar_fase></editar_fase>
				</div>
				
			</div>
		</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
		<div class="box box-success">
			<div class="box-body">
				
				<div class="col-md-6 "> 
					<h3 class="box-title">Crear Tipos de Fase</h3>
					<!-- /.box-header -->
					<crear_tipos_fase></crear_tipos_fase>
				</div>
				
				<div class="col-md-6 "> 
					<h3 class="box-title">Editar Tipos de Fase</h3>
					<!-- /.box-header -->
					<editar_tipo_fase></editar_tipo_fase>
				</div>
			</div>
		</div>
		</div>
	</div>
	@endsection
