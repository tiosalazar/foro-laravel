@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="container ver_solicitud_seccion spark-screen box">
	
		<ver_solicitud requerimientoarray="{{$requerimientoinfo}}"></ver_solicitud>	
	
</div>
@endsection