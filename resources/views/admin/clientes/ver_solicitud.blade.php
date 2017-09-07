@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="container-fluid spark-screen">
	<div class="row">
		<div class="titulos_foro">
			<section class="titulo">
				 <h3 class="box-title go-back">
					 <button type="button" name="back-btn" class="btn btn-primary btn-flat btn-back" onclick="history.go(-1);">
						 <i class="fa fa-chevron-left" aria-hidden="true"></i>
						 &nbsp;Atrás
					 </button>
              <span class="span_descripcion1"> Detalle del</span> <span class="span_descripcion2">Requerimiento</span></h3>
				 </h3>
			</section>
		</div>
		<!-- col-md-8 -->
		<div class="col-md-11 col-md-offset-1 col-lg-9 col-lg-offset-2 ">
			<!-- box -->
			<div class="box box-primary">
				<div class="box-body  table-responsive ver_solicitud_seccion spark-screen">
					<ver_solicitud requerimientoarray="{{$requerimientoinfo}}" rol_usuario_actual="{{Auth::user()->rol->name}}" id_usuario_actual="{{Auth::user()->id}}"></ver_solicitud>
				</div>
			</div>
			<!-- ./ box -->
		</div>
		<!-- ./ col-md-8 -->
	</div>
</div>
@endsection
