@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection-->


@section('main-content')
	<div class="container-fluid spark-screen">

	<div class="titulos_foro">
		<h3 class="box-title"><span class="span_descripcion1">Crear</span> <span class="span_descripcion2"> Solicitud</span></h3>
	 </div>

		<div class="row Formulario_OT">
			<div class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2 ">
				<div class="panel panel-default">
				<div class="padding_ots">
					<div class="panel-body"  >
						<formulario_solicitudes></formulario_solicitudes>
					</div>
				</div>
              </div>
			</div>
		</div>
	</div>

@endsection
