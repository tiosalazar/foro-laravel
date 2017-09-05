@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="row">

<div class="ver_solicitud_seccion spark-screen box col-md-8 col-md-offset-2">
		<ver_solicitud requerimientoarray="{{$requerimientoinfo}}" rol_usuario_actual="{{Auth::user()->rol->name}}" id_usuario_actual="{{Auth::user()->id}}"></ver_solicitud>	
		<!-- <ver_solicitud requerimientoarray="{{-- $requerimientoinfo --}}"></ver_solicitud> -->
	
</div>
</div>
@endsection