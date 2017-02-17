@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<notificacion :id="{{Auth::user()->id }}" ></notificacion>
	<section>
	   <tarea :id_user="{{Auth::user()->id }}"></tarea>
			
	</section>
@endsection
