@extends('adminlte::layouts.app')

@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection


@section('main-content')
<div class="container-fluid spark-screen">
	<div class="row">
		<!-- col-md-8 -->
		<div class="col-md-8 col-md-offset-2">
			<!-- box -->
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Crear Cliente</h3>
				</div>
				<form>
					<!-- box-body -->
					<div class="box-body">
						<div class="form-group">
							<label for="nombre">Nombre</label>
							<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre">
						</div>
						<div class="form-group">
							<label for="nit">NIT</label>
							<input type="text" class="form-control" id="nit" name="nit" placeholder="NIT">
						</div>
						<div class="form-group">
							<label for="email">Correo Electronico</label>
							<input type="email" class="form-control" id="email" name="email" placeholder="Correo Electronico">
						</div>
						<div class="form-group">
							<label for="telefono">Teléfono</label>
							<input type="number" class="form-control" id="telefono" name="telefono" placeholder="Teléfono">
						</div>
						<div class="form-group">
							<label for="nombre_contacto">Nombre de Contacto</label>
							<input type="text" class="form-control" id="nombre_contacto" name="nombre_contacto" placeholder="Nombre de Contacto">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</div>
					<!-- ./ box-body -->
				</form>
			</div>
			<!-- ./ box -->
		</div>
		<!-- ./ col-md-8 -->
	</div>
</div>
@endsection