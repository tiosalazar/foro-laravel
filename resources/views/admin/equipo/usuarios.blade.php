@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

<div class="spark-screen">
	<div class="row">
	<!-- col-md-8 -->
		<div class="titulos_foro">
			<h3 class="box-title"><span class="span_descripcion1">Usuarios</span></h3>
		 </div>
		<div class="col-md-12 ">
		<div class="box box-primary collapsed-box" id="main-app">
           
			<div class="box-header with-border ">
				<h3 class="box-title">Crear nuevo</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool btn-info" data-widget="collapse"><i class="fa fa-plus"></i></button>
				</div>

			</div>

			<div class="box-body">
             <form_usuarios titulor="Crear Usuario" comando="1" visualizar="1" ></form_usuarios>
			</div>
		</div>
		</div>
		<!-- col-md-8 -->
		<div class="col-md-12 ">
			<!-- box -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Listado</h3>
				</div>
				<div class="box-body table-responsive">
					<list_usuarios></list_usuarios>
				</div>
			</div>
			<!-- ./ box -->
		</div>
		<!-- ./ col-md-8 -->
	</div>
</div>
@endsection

