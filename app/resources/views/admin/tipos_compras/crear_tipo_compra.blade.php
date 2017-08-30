@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

<div class="">

	<div class="row">
		<div class="titulos_foro">
			<h3 class="box-title"><span class="span_descripcion1">Tipos</span> <span class="span_descripcion2">de compra</span></h3>
		 </div>
		<div class="col-md-8 col-md-offset-2">
		<div class="box box-success">
			<div class="box-body">
				<div class="col-md-6 tipos_compra_form1">
					<h3 class="box-title">Crear</h3>
					<!-- /.box-header -->
					<tipos_compra_crear></tipos_compra_crear>
				</div>
				
				<div class="col-md-6 tipos_compra_form2">
					<h3 class="box-title">Editar</h3>
					<!-- /.box-header -->
					<tipos_compra_editar></tipos_compra_editar>
				</div>
			</div>
		</div>
		</div>
	</div>
	@endsection
