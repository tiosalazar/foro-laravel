@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>
	   <ver_tareas :area="4"></ver_tareas>
			
	</section>
@endsection