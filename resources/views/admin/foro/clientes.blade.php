@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>
		<!-- Listar todas las tareas -->
	   	<ver_tareas_by_cliente :area="{{Auth::user()->clientes_id}}" ></ver_tareas_by_cliente>
			
	</section>
@endsection
