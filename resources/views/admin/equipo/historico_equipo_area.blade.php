@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>

	<div class="titulos_foro">
    	<h3 class="box-title"><span class="span_descripcion1">Hist&oacute;rico</span> <span class="span_descripcion2">Equipos por Área</span></h3>
    </div>
	   <historico_equipos :area="2"></historico_equipos>
			
	</section>
@endsection
