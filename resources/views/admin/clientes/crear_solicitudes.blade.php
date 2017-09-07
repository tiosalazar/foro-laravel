@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection-->


@section('main-content')
	<div class="container-fluid spark-screen">

	<div class="titulos_foro">
		<h3 class="box-title"><span class="span_descripcion1">Crear</span> <span class="span_descripcion2"> Requerimiento</span></h3>
	 </div>

		<div class="row Formulario_OT">
			<div class="col-md-11 col-md-offset-1 col-lg-9 col-lg-offset-2 ">
				<div class="panel panel-default">
					<div class="panel-body"  >
						<formulario_solicitudes  rol_usuario_actual="{{Auth::user()->rol->name}}"></formulario_solicitudes>
					</div>
              </div>
			</div>
		</div>
	</div>

@endsection
