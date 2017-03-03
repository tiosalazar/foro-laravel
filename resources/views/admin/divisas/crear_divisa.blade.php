@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

<div class="">
	<div class="row">
		<div class="titulos_foro">
			<h3 class="box-title"><span class="span_descripcion1">Divisas</span></h3>
		 </div>
		<div class="col-md-8 col-md-offset-2">
		<div class="box box-primary">
			<div class="box-body">
				<div class="col-md-6 "> 
					<h3 class="box-title">Crear</h3>
					<!-- /.box-header -->
					<crear_divisa></crear_divisa>
				</div>

				<div class="col-md-6 "> 
					<h3 class="box-title">Editar</h3>
					<!-- /.box-header -->
					<editar_divisa></editar_divisa>
				</div>
			</div>
		</div>
		</div>
	</div>
	@endsection
