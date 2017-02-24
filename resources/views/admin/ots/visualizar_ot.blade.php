@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
{{ trans('adminlte_lang::message.home') }}
@endsection-->

@section('main-content')
<div class="container-fluid spark-screen">
	<div class="col-md-8 col-md-offset-2">
		<span  class="span_titulo1">Resúmen  </span><span  class="span_titulo2" >de la  OT</span>
	</div>

	<div class="row Formulario_OT" id="formulario_ot_actualizacion">
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-default">
				<div class="padding_ots">
					<div class="panel-body"  >
						<div class="row desc-ot with-border">
							<div class="col-sm-6 ">
								<ul>
									<li><strong>Número de OT:</strong><span> #{{$ot['referencia'] }}</span></li>
									<li><strong>Cliente:</strong><span> {{$ot['cliente']['nombre']}}</span></li>
									<li><strong>Proyecto:</strong><span> {{$ot['nombre']}}</span></li>
									<li><strong>Ejecutiva:</strong><span> {{$ot['usuario']['nombre']}} {{$ot['usuario']['apellido']}}</span></li>
									<li><strong>Fecha Inicio:</strong><span> {{$ot['fecha_inicio']}}</span></li>
									<li><strong>Fecha Fin:</strong><span> {{$ot['fecha_final']}}</span></li>
									<li><strong>Valor:</strong><span> <span class="campo_fecha">  ${{$ot['valor']}}</span> </li>
								</ul>
							</div>
							<div class="col-sm-6 border-left">
								<ul>
									@if(Auth::user()->hasRole('cuentas') )
									<div class="row">
										<div class="col-sm-6">
											<strong>Estado de OT:</strong>
											<div style="height:12px"></div>
											<select_estados tipo_estado="2" cambiar_estado="{{$ot['id']}}" :select="{{$ot['estado']}}" ></select_estados>
										</div>
									</div>
									@else
									<li><strong>Estado de OT:</strong><span> {{$ot['estado']['nombre']}}</span></li>
									@endif
									<li><strong>Horas totales:</strong><span> {{$ot['horas_totales']}} Horas</span></li>
									<li><strong>Horas disponibles:</strong><span> {{$ot['horas_disponibles']}} Horas</span></li>
									<li><strong>Horas adicionales:</strong><span> {{$ot['total_horas_extra']}} Horas</span></li>
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
										<li class="{{{ $area['area']['nombre']==$ot['tiempos_x_area'][0]['area']['nombre'] ? 'active' : '' }}}" ><a  data-id="tab_{{$area['area']['id']}}" href="#tab_{{$area['area']['id']}}" data-toggle="tab">{{$area['area']['nombre']}}</a></li>
										@endforeach
									</ul>
									<div class="tab-content" >
										@foreach ($ot['tiempos_x_area'] as $area)
										<div class="{{{ $area['area']['nombre']==$ot['tiempos_x_area'][0]['area']['nombre'] ? 'active' : '' }}}"  id="tab_{{$area['area']['id']}}">
											<div class="row"><div class="col-md-12">
												<div class="row desc-ot with-border">
													<div class="col-sm-6 ">
														<ul>
															<div class="row">
																<div class="form-group col-md-4 col-sm-6" ><li><strong>Horas  {{ $area['area']['nombre'] }}: </strong></li> </div>
																<div class="form-group col-md-6 detalle_horas col-sm-6"><li><span> {{$area['tiempo_estimado_ot']}} Horas</span></li> </div>
															</div>
															<div class="row">
																<div class="form-group col-md-4 col-sm-6" ><li><strong>Horas Adicionales: </strong></li></div>
																<div class="form-group col-md-6 detalle_horas col-sm-6"><li><span>{{$area['tiempo_extra']}} Horas</span> </li></div>
															</div>
														</ul>
													</div>
													<div class="col-sm-6 border-left">
														<ul>
															<div class="row">
																<div class="form-group col-md-4 col-sm-6" ><li><strong>Horas Gastadas: </strong></li></div>
																<div class="form-group col-md-6 detalle_horas col-sm-6"><li> <div class="@if($area['tiempo_real']+$area['tiempo_extra']>$area['tiempo_estimado_ot']) campo rojo
																@elseif($area['tiempo_real']+$area['tiempo_extra'] >=$area['tiempo_estimado_ot']*0.8)campo amarillo
																@else campo verde @endif">
																	<span>{{ $area['tiempo_real']+$area['tiempo_extra']  }}   Horas</span>
																</div></li></div>
															</div>
														</ul>
													</div>
													@if(Auth::user()->hasRole('cuentas') )
													<!-- /.col -->
													<div class="row">
														<div class="col-md-12">
															<button type="button" onclick="abriModal('{{ $area["area"]["nombre"] }}')" class="btn btn-block text-center btn-danger boton_foro error  col-sm-3" >Solicitar Horas Extra </button>
														</div>
													</div>
													@endif
												</div>

												<div class="row desc-ot {{{ $ot['compras_ot'] !='[]' ? 'with-border' : '' }}}">
													<div class="col-md-12 nopadding">
														<div class="row">
															<div class="col-md-4">
																<h4 class="titulo_interna_ot">Requerimiento</h4>
															</div>
														</div>
														<div class="row  ">
															<div class="col-md-12">
																@foreach ($ot['requerimiento_ot'] as $requerimiento)
																@if( $area['area']['id']==$requerimiento['areas_id'] )
																<div class="listado_requerimientos_resumen">
																	<ul>
																		<li><strong>Requerimiento No 1:</strong></li>
																		<li><span> {{$requerimiento['nombre'] }}</span></li>
																		<li><strong>Hora Requerimiento No 1:</strong></li>
																		<li><span> {{$requerimiento['horas'] }} Horas</span></li>
																	</ul>
																</div>
																@endif
																@endforeach
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
										@if( $ot['compras_ot'] != '[]' )
										<div class="row desc-ot">
											<div class="col-md-12 nopadding">
												<div class="row">
													<div class="col-md-4">
														<h4 class="titulo_interna_ot">Compras relacionadas</h4>
													</div>
												</div>
												<div class="row">
													<div class="col-md-12">
														@foreach ($ot['Compras_Ot'] as $compra)
														@if( $area['area']['id']==$compra['areas_id'] )
														<div class="listado_requerimientos_resumen">
															<ul>
																<li><strong>Item:</strong></li>
																<li><span> {{$compra['tipo_compra']['nombre'] }}</span></li>
																<li><strong>Descripción:</strong></li>
																<li><span> {{$compra['descripcion'] }}</span></li>
																<li><strong>Provedor:</strong></li>
																<li><span> {{$compra['provedor'] }}</span></li>
																<li><strong>Moneda:</strong></li>
																<li><span> {{$compra['divisa']['nombre'] }}</span></li>
																<li><strong>Valor:</strong></li>
																<li><span> <span class="campo_fecha"> ${{$compra['valor'] }} </span></li>
															</ul>
														</div>
														@endif
														@endforeach
													</div>
												</div>
											</div>
										</div>
										@endif
									</div><!-- /.tab-pane -->
									@endforeach
								</div>
								<!-- /.tab-content -->
							</div>
							<div class="formulario_ot_panel">
								<div class="row">
									<div class="col-md-12 ">
										<div style="height:20px"></div>
										<div class="col-md-12 ">
											<div class="row">
												<div class="col-md-4">
													<h4 class="titulo_interna_ot">Observaciones</h4>
												</div>
											</div>
											<div style="height:20px"></div>
											<div class="col-md-12">
												<div class="box-body">
													<div class="form-group">
														{{ $ot['observaciones'] }}
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

		<!--Modal Cambiar de Pestaña-->
		<div class="modal editarModal modal_personalizado" >
			<div class="modal-dialog">
				<div class="modal-content">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span></button>
					<div class="contenido_modal">
						<div class="desc_modal">
							¿Cuantas Horas adicionales necesita el Area de <span id="nombre_area" class="font-info"></span> para la<span class="font-info"> OT #{{$ot['referencia'] }}  {{$ot['nombre']}} ? </span>
						</div>
						<form action="" name="solicitarHoras">
						<div class="form-group col-sm-6 col-sm-offset-3 col-xs-offset-3 ">
							<input type="text"  class="form-control" required="required" pattern="^([0-9].[0-9]|[0-9]*){1,10}$" title="Ejemplo... 10 ó 10.5"  placeholder="No horas adicionales" name="horas_adicionales">
                         <input type="hidden" name="id" value="{{$ot['id']}}" />
                         <input type="hidden" name="area_nombre" value="" />
						</div>
						<div class="row">
							<div class="col-sm-4 col-sm-offset-4 col-xs-offset-4 col-xs-6 col-xs-4">
								<div style="height:20px"></div>
								<div class="text-center" >
								<button  type="submit" class="btn btn-block text-center  boton_foro succes  col-sm-3" > Enviar</button>
								</div>
							</div>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>



	</div>
</div>

</div>
@endsection

<script type="text/javascript">

	function abriModal(nombre) {
		$('#nombre_area').text(nombre);
		$('input[name=area_nombre]').val(nombre);
		$('.editarModal').modal('show');

		var form = $('form[name=solicitarHoras]');
		form.submit( function (e) {
			 e.preventDefault();

			 $.ajax({
				   url: window._apiURL+"solicitarHoras",
					 data:form.serialize(),
					 'type': 'POST',
					 'beforeSend': function (request) {
							 request.setRequestHeader("Authorization", 'Bearer '+Laravel.api_token);
					 }
				 }).done(function(data) {
					 	toastr.success(data.msg,'',{timeOut: 5000,"positionClass": "toast-top-center","closeButton": true});
						$('form[name=solicitarHoras]')[0].reset();
						$('.editarModal').modal('toggle');
           console.log(data);
					 return true;
				 })
				 .fail(function(data) {
					 	toastr.error('se ha presentado un error en el sistema por favor contacte a soporte',data.error,{timeOut: 5000,"positionClass": "toast-top-center","closeButton": true});
			     console.log(data);
			  });

		});
	}

</script>
