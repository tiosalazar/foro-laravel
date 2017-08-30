@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')

	<section>
	 <div class="titulos_foro">
	  <h3 class="box-title"><span class="span_descripcion1">Informe</span> <span class="span_descripcion2">Soporte</span></h3>
     @if(Auth::user()->can('descargar_informe_soporte'))
	  <!--<div class="col-md-3 pull-right">
	  	 <a type="button" href="{{url('/informes/soporte/exportar')}}"  class="btn btn-block boton_foro btn-success succes pull-right">Exportar Datos</a>
	  </div>-->
	 <div style="height: 22px;"></div>
	  @endif
	 </div>
        <div class="clearfix"></div>
	   <informe_soporte :area="4" :tipo_fase="10"></informe_soporte>

	</section>
@endsection
