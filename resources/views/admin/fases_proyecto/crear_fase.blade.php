@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

<div class="">
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
		<div class="box box-primary">
			<div class="box-header with-border">
				<h2>Crear</h2>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
					</button>
				</div>
			</div>
			<div class="box-body">
				<div class="col-md-6 "> 
					<h3 class="box-title">Fases del Proyecto</h3>
					<!-- /.box-header -->
					<crear_fase></crear_fase>
				</div>

				<div class="col-md-6 "> 
					<h3 class="box-title">Tipos de Fase</h3>
					<!-- /.box-header -->
					<crear_tipos_fase></crear_tipos_fase>
				</div>
			</div>
		</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
		<div class="box box-success">
			<div class="box-header with-border">
				<h2>Editar</h2>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
					</button>
				</div>
			</div>

			<div class="box-body">
				<div class="col-md-6 "> 
					<h3 class="box-title">Fases del Proyecto</h3>
					<!-- /.box-header -->
					<editar_fase></editar_fase>
				</div>

				<div class="col-md-6 "> 
					<h3 class="box-title">Tipos de Fase</h3>
					<!-- /.box-header -->
					<editar_tipo_fase></editar_tipo_fase>
				</div>
			</div>
		</div>
		</div>
	</div>
	@endsection
