@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection



@section('main-content')
<div class="container-fluid spark-screen">
	<div class="row">
		<div class="titulos_foro">
		 	@if( Request::is('clientes/editar/*') != 1)
		 	<h3 class="box-title"><span class="span_descripcion1">Crear</span> <span class="span_descripcion2"> Cliente</span></h3>
			@else
				<h3 class="box-title"><span class="span_descripcion1">Editar</span> <span class="span_descripcion2"> Cliente</span></h3>
			@endif
		 </div>
		<!-- col-md-8 -->
		<div class="col-md-8 col-md-offset-2">
			<!-- box -->
			<div class="box box-primary">
				<div class="box-body">
					<crear_cliente_form :cliente_url="{{ $cliente }}" editar="1"></crear_cliente_form>
				</div>
			</div>
			<!-- ./ box -->
		</div>
		<!-- ./ col-md-8 -->
	</div>
</div>
@endsection