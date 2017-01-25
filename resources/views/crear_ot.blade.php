@extends('adminlte::layouts.app')

@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
	<div class="container-fluid spark-screen">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-heading">Home</div>

					<div class="panel-body"  >
						<formulario_anadir_requerimiento></formulario_anadir_requerimiento>
					</div>
				</div>
			</div>
		</div>
	</div>

@endsection
