@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection-->


@section('main-content')
	<div class="container-fluid spark-screen">
	<div class="col-md-8 col-md-offset-2">
				<span  class="span_titulo1">Crear</span><span  class="span_titulo2" > OT</span>
	</div>

		<div class="row Formulario_OT">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
				<div class="padding_ots">
					<div class="panel-body"  >
						<formulario_anadir_requerimiento></formulario_anadir_requerimiento>
					</div>
				</div>
              </div>
			</div>
		</div>
	</div>

@endsection
