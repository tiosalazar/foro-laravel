@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>
		<!-- Listar todas las tareas -->
	   	<ver_tareas :area="{{Auth::user()->areas_id}}" ></ver_tareas>
			
	</section>
@endsection
