@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

<div class="">
	
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
		<div class="box box-success">
			<div class="box-header with-border">
				<h3>Tipos de compra</h3>
				<div class="box-tools pull-right">
					<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
					</button>
				</div>
			</div>

			<div class="box-body">
				<div class="col-md-6 "> 
					<h3 class="box-title">Crear</h3>
					<!-- /.box-header -->
					<tipos_compra_crear></tipos_compra_crear>
				</div>

				<div class="col-md-6 "> 
					<h3 class="box-title">Editar</h3>
					<!-- /.box-header -->
					<tipos_compra_editar></tipos_compra_editar>
				</div>
			</div>
		</div>
		</div>
	</div>
	@endsection
