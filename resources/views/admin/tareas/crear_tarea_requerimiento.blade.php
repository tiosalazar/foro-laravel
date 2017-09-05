@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	<section>
	
		<div class="row">
			  <section class="titulo">
			    <h3 class="box-title"><span class="span_descripcion1">Crear</span> <span class="span_descripcion2">Tarea</span></h3>
			  </section>
				<div class="col-md-8 col-md-offset-2">
					<div class="box box-widget tarea">
		        <div class="box-header with-border">
		          <h3 class="box-title">Especificación de la tarea</h3>
		        </div>
		        <!-- /.box-header -->

		       <tarea_requerimiento :id_user="{{Auth::user()->id }}" :requerimiento_id="{{$requerimiento_cliente}}" :area="{{$area}}" ></tarea_requerimiento>
		      </div>
		    </div>
		  </div>
	 
	</section>
@endsection
