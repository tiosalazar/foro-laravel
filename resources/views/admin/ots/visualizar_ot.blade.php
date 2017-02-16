@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection-->

@section('main-content')
<div class="container-fluid spark-screen">
	<div class="col-md-8 col-md-offset-2">
		<span  class="span_titulo1">Resúmen  </span><span  class="span_titulo2" >de la  OT</span>
	</div>

	<div class="row Formulario_OT">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="padding_ots">
					<div class="panel-body"  >
						<div class="row desc-ot with-border">
							<div class="col-sm-6 border-right">
								<ul>
									<li><strong>Numero de OT:</strong><span> #{{$ot['referencia'] }}</span></li>
									<li><strong>Cliente:</strong><span> {{$ot['cliente']['nombre']}}</span></li>
									<li><strong>Proyecto:</strong><span> {{$ot['nombre']}}</span></li>
									<li><strong>Ejecutiva:</strong><span> {{$ot['usuario']['nombre']}}</span></li>
									<li><strong>Fecha Inicio:</strong><span> {{$ot['fecha_inicio']}}</span></li>
									<li><strong>Fecha Fin:</strong><span> {{$ot['fecha_final']}}</span></li>
									<li><strong>Valor:</strong><span> <strong>$ {{$ot['valor']}}</strong> </span></li>
								</ul>
							</div>
							<div class="col-sm-6">
								<ul>
									<div class="row">
										<div class="col-sm-6">
											<strong>Estado de OT:</strong>
											<select_estados tipo_estado="2"  :select="{{$ot['estado']}}" ></select_estados>
										</div>
									</div>
									<li><strong>Horas Totales:</strong><span> {{$ot['horas_totales']}} Horas</span></li>
									<li><strong>Horas Disponibles:</strong><span> {{$ot['horas_disponibles']}} Horas</span></li>
									<li><strong>Horas Adicionales:</strong><span> {{$ot['total_horas_extra']}} Horas</span></li>
								</ul>
							</div>
							<!-- /.col -->
						</div>
						<h3 class="box-title"><span class="span_descripcion1">Requerimientos y </span> <span class="span_descripcion2">Compras</span></h3>
						<div class="box-body">
							<div style="height:22px"></div>
							<div class="col-md-12">
								<!-- Custom Tabs -->
								<div class="nav-tabs-custom">
									<ul class="nav nav-tabs" >
										@foreach ($ot['tiempos_x_area'] as $area)
										<li class="{{{ $area['area']['nombre']=='Creatividad' ? 'active' : '' }}}" ><a  data-id="tab_{{$area['area']['id']}}" href="#tab_{{$area['area']['id']}}" data-toggle="tab">{{$area['area']['nombre']}}</a></li>
										@endforeach
									</ul>
									<div class="tab-content" >
										@foreach ($ot['tiempos_x_area'] as $area)
										<div class="tab-pane {{{ $area['area']['nombre']=='Creatividad' ? 'active' : '' }}}"  id="tab_{{$area['area']['id']}}">
											<div class="row"><div class="col-md-12">
												<div class="row">
													<div class="col-md-12 nopadding">
														<div style="height:22px;"></div>
														<div class="form-group col-md-4 col-sm-6" >
															<label for="horas_area" class="col-sm-6 nopadding"><h5>Horas de {{ $area['area']['nombre'] }}</h5> </label>
															<div class="col-sm-6">
																{{$area['tiempo_estimado_ot']}}
															</div>
														</div>
														<div class="form-group col-md-6 col-sm-6" >
															<label for="horas_area" class="col-sm-5 "><h5>Horas Gastadas {{ $area['area']['nombre'] }}</h5> </label>
															<div class="col-sm-7">
																<div class="col-sm-6">

																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="row" >
													<div class="col-md-12 nopadding">
														<div style="height:22px;"></div>
														<div class="form-group col-md-4 col-sm-6" >
															<label  class="col-sm-6 nopadding"><h5>Horas Extra {{ $area['area']['nombre'] }}</h5> </label>
															<div class="col-sm-6">
																{{$area['tiempo_extra']}}
															</div>
														</div>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														 <button type="button" class="btn btn-block text-center btn-danger boton_foro error  col-sm-3" >Solicitar Horas Extra </button>
													</div>
												</div>
												<div style="height:22px"></div>
												<div class="separador"> </div>
												<div style="height:22px"></div>
										    <div class="row">
										      <div class="col-md-12 nopadding">
														<div class="row">
															<div class="col-md-4">
																<h4 class="titulo_interna_ot">Requerimiento</h4>
															</div>
														</div>
														<div class="row">

														</div>
													</div>
												</div>
											</div>
													 </div>
											<div style="height:42px"></div>


											<div id="secion_compras">
												<div class="row">
													<div class="col-md-6">
														<h4 class="titulo_interna_ot">Compras relacionadas</h4>
													</div>
												</div>

												<div class="row">
													<div style="height:22px"></div>

												</div>
											</div>
											<div style="height:30px"></div>

										</div>
											@endforeach

										<!-- /.tab-pane -->
									</div>
									<!-- /.tab-content -->
								</div>
								<div class="formulario_ot_panel">
									<div style="height:20px"></div>
									<div class=" col-md-12">
										<h4 class="titulo_interna_ot">Observaciones</h4>
									</div>
									<div style="height:20px"></div>
									<div class="col-md-12">
										<div class="box-body">
											<div class="form-group">
											</div>
										</div>
									</div>
									<div style="height:30px"></div>
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
