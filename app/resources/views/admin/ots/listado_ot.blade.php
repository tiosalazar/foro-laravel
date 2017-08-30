@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

<div class="container-fluid spark-screen">
	<div class="row">
		<div class="titulos_foro">
			<h3 class="box-title"><span class="span_descripcion1">Listado de</span> <span class="span_descripcion2"> OTs</span></h3>
		</div>
		<!-- col-md-8 -->
		<div class="col-md-12 ">
			<!-- box -->
			<div class="box box-primary">
				<div class="box-body  table-responsive">
					<listar_ots userole="{{Auth::user()->rol->name}}"></listar_ots>
				</div>
			</div>
			<!-- ./ box -->
		</div>
		<!-- ./ col-md-8 -->
	</div>
</div>
@endsection
