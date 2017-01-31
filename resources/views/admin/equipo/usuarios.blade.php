@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

		<div class="container-fluid spark-screen">
	<div class="row">
		<!-- col-md-8 -->
		<div class="col-md-12 ">
			<!-- box -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Listado de Usuarios</h3>
				</div>
				<div class="box-body">
					{{-- <crear_cliente_form></crear_cliente_form> --}}
				</div>
			</div>
			<!-- ./ box -->
		</div>
		<!-- ./ col-md-8 -->
	</div>
</div>
@endsection
