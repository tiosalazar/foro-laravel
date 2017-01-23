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
						<input type="hidden" name="url_path" id="url_path" value="{{ url('/') }}">
						<div class="box box-primary">
							<div class="box-header with-border">
								<div class="row">
								<div class="col-md-6">
								<div class="form-group">
								<label for="num_ot" class="col-sm-4 "># OT : </label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="num_ot" placeholder="Numero OT">
										</div>
						   	</div>
								<div class="form-group">
									<label for="cliente" class="col-sm-4 ">Cliente : </label>
											<div class="col-sm-8" >
											<select_clientes ></select_clientes>
											</div>
							   </div>
								 <div class="form-group">
								 <label for="name_proyecto" class="col-sm-4 ">Proyecto : </label>
										 <div class="col-sm-8">
											 <input type="text" class="form-control" id="name_proyecto" placeholder="Nombre del Proyecto">
										 </div>
								 </div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									<label for="estado" class="col-sm-4 ">Estado : </label>
											<div class="col-sm-8">
												<select_estados></select_estados>
											</div>
									</div>
									<div class="form-group">
									<label for="valor_total" class="col-sm-4 ">Valor Total: </label>
											<div class="col-sm-8 ">
												<input type="text" class="form-control" id="valor_total" placeholder="Valor Total">
											</div>
									</div>
									<div class="form-group">
									<label for="horas_totales" class="col-sm-4 ">Horas Totales : </label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="horas_totales" placeholder="Numero de Totales">
											</div>
									</div>
								</div>
								</div>
									<div class="row">
											<div  class="col-md-6">
												<div class="form-group">
												<label for="ejecutivo" class="col-sm-4 ">Ejecutivo : </label>
														<div class="col-sm-8">
															<select_usuarios ></select_usuarios>
														</div>
												</div>
											</div>
									</div>
									<div class="row">
								<div class="col-md-6">
									<div class="form-group ">
									<label for="fecha_inicio" class="col-sm-2 ">Inicio: </label>
											<div class="col-sm-3">
											<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<datepicker language="es" id="fecha_inicio" class="form-control" style="max-width:150px;" format="dd-MM-yyyy"></datepicker>
										</div>
										</div>
									<label for="fecha_fin" class="col-sm-2 ">Fin: </label>
											<div class="col-sm-3">
												<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<datepicker language="es"  id="fecha_fin" class="form-control"  style="max-width:150px;"  format="dd-MM-yyyy"></datepicker>
										</div>
											</div>
									</div>
								</div>
								<div class="col-md-6 ">
									<div class="form-group ">
									<label for="horas_disponibles" class="col-sm-4 ">Horas Disponibles</label>
											<div class="col-sm-6">
												<input type="text" class="form-control" id="horas_disponibles" v-model="hDisponibles" placeholder="Numero de Horas Disponibles">
											</div>
									</div>
								</div>
							</div>
							</div>
							<div class="box box-info">
		            <div class="box-header with-border">
		              <h3 class="box-title">Detalle OT</h3>
		            </div>
		            <div class="box-body">
									<div class="col-md-12">
          <!-- Custom Tabs -->
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab_1" data-toggle="tab">Creatividad</a></li>
              <li><a href="#tab_2" data-toggle="tab">Diseño</a></li>
              <li><a href="#tab_3" data-toggle="tab">Desarrollo</a></li>
							<li><a href="#tab_3" data-toggle="tab">Contenido</a></li>
							<li><a href="#tab_3" data-toggle="tab">Digital Performance</a></li>
              <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                  Dropdown <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                  <li role="presentation" class="divider"></li>
                  <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                </ul>
              </li>
              <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="tab_1">
              <div class="row">
								  <div class="col-md-6">
										<h2>Requerimiento</h2>
									</div>
									<div class="col-md-6">
										<div class="form-group ">
										<label for="horas_area" class="col-sm-4 ">Horas Area</label>
												<div class="col-sm-4">

													<input type="text" class="form-control" id="horas_area" :value="hDisponibles"  placeholder="Numero de Horas Disponibles">
												</div>
										</div>
									</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="col-md-3">
										<button type="button"  class="btn btn-block btn-success col-sm-3">Añadir Tarea</button>
									</div>

								</div>

							</div>


              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_2">
                The European languages are members of the same family. Their separate existence is a myth.
                For science, music, sport, etc, Europe uses the same vocabulary. The languages only differ
                in their grammar, their pronunciation and their most common words. Everyone realizes why a
                new common language would be desirable: one could refuse to pay expensive translators. To
                achieve this, it would be necessary to have uniform grammar, pronunciation and more common
                words. If several languages coalesce, the grammar of the resulting language is more simple
                and regular than that of the individual languages.
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="tab_3">
                Lorem Ipsum is simply dummy text of the printing and typesetting industry.
                Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
                when an unknown printer took a galley of type and scrambled it to make a type specimen book.
                It has survived not only five centuries, but also the leap into electronic typesetting,
                remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset
                sheets containing Lorem Ipsum passages, and more recently with desktop publishing software
                like Aldus PageMaker including versions of Lorem Ipsum.
              </div>
              <!-- /.tab-pane -->
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- nav-tabs-custom -->
        </div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

@endsection
