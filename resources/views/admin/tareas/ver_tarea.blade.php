@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>
	   <ver_tarea arraytarea="{{$tareainfo}}" id_usuario_actual="{{Auth::user()->id}}"></ver_tarea>			
	</section>
@endsection