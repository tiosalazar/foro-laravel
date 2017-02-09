@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection



@section('main-content')
<div class="container-fluid spark-screen">
	<div class="row">
		<!-- col-md-8 -->
		<div class="col-md-8 col-md-offset-2">
			<!-- box -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Crear Cliente</h3>
				</div>
				<div class="box-body">
					<crear_cliente_form :cliente_url="{{ $cliente }}"></crear_cliente_form>
				</div>
			</div>
			<!-- ./ box -->
		</div>
		<!-- ./ col-md-8 -->
	</div>
</div>
@endsection