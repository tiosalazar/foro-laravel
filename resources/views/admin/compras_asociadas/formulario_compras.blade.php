@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="row">
  <section class="titulo">
    <h3 class="box-title"><span class="span_descripcion1">Crear</span> <span class="span_descripcion2">Compras Asociadas</span></h3>
  </section>
		<div class="col-md-8 col-md-offset-2">
			<div class="box box-widget tarea">
        <div class="box-header with-border">
          <h3 class="box-title">Especificación de la compra</h3>
        </div>
        <!-- /.box-header -->
        <compras_asociadas_crear></compras_asociadas_crear>
      </div>
    </div>
  </div>
@endsection
