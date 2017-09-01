@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

<div class="spark-screen">
	<div class="row">
	<!-- col-md-8 -->
		<div class="titulos_foro">
			<h3 class="box-title"><span class="span_descripcion1">Resumen de tareas </span><span class="span_descripcion2"> por requerimiento</span></h3>
		 </div>
		<div class="col-md-12 ">
		<div class="box box-primary collapsed-box" id="main-app">

			<div class="box-header with-border ">
				<h3 class="box-title">Información Requerimiento</h3>

				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool btn-info" data-widget="collapse"><i class="fa fa-plus"></i></button>
				</div>

			</div>

			<div class="box-body">

				 <div class="ver_solicitud_seccion spark-screen  ">
				 		 <ver_resumen_solicitud :requerimientoarray="{{$requerimientoinfo}}"></ver_resumen_solicitud>
				 		<!-- <ver_solicitud requerimientoarray="{{-- $requerimientoinfo --}}"></ver_solicitud> -->

				 </div>
			</div>
		</div>
		</div>
		<!-- col-md-8 -->
		<div class="col-md-12 ">
			<!-- box -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Listado de tareas</h3>
				</div>
				<div class="box-body table-responsive">
  <listar_solicitudes_tareas></listar_solicitudes_tareas>
				</div>
			</div>
			<!-- ./ box -->
		</div>
		<!-- ./ col-md-8 -->
	</div>
</div>
@endsection
