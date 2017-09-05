@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	<section>
	
	   <tarea :id_user="{{Auth::user()->id }}" :area="{{$area}}"></tarea>
	  
	</section>
@endsection
