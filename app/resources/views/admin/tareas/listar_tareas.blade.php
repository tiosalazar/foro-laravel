@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
  
	<section>
		<!-- Listar todas las tareas -->
	   <ver_tareas :area="-1" ></ver_tareas>	
	</section>
@endsection
