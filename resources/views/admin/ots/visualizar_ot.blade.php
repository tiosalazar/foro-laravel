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
									<li><strong>Numero de OT:</strong><span> #{{$ot['referencia'] }}</span></li>
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
								@if(Auth::user()->hasRole('desarrollo') )
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
										<li class="{{{ $area['area']['nombre']=='Creatividad' ? 'active' : '' }}}" ><a  data-id="tab_{{$area['area']['id']}}" href="#tab_{{$area['area']['id']}}" data-toggle="tab">{{$area['area']['nombre']}}</a></li>
										@endforeach
									</ul>
									<div class="tab-content" >
										@foreach ($ot['tiempos_x_area'] as $area)
										<div class="tab-pane {{{ $area['area']['nombre']=='Creatividad' ? 'active' : '' }}}"  id="tab_{{$area['area']['id']}}">
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
																<div class="form-group col-md-6 detalle_horas col-sm-6"><li><span> {{$area['tiempo_extra']}} Horas</span></li></div>
															</div>
														</ul>
													</div>
													@if(Auth::user()->hasRole('desarrollo') )
													<!-- /.col -->
													<div class="row">
														<div class="col-md-12">
															<button type="button" onclick="abriModal()" class="btn btn-block text-center btn-danger boton_foro error  col-sm-3" >Solicitar Horas Extra </button>
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
												 	@foreach ($ot['compras_ot'] as $compra)
														@if( $area['area']['id']==compra['areas_id'] )
															<div class="listado_requerimientos_resumen">
															  <ul>
																<li><strong>Item:</strong></li>
																<li><span> {{compra['tipos_compras_id'] }}</span></li>
																<li><strong>Descripción:</strong></li>
																<li><span> {{compra['descripcion'] }}</span></li>
																<li><strong>Provedor:</strong></li>
																<li><span> {{compra['provedor'] }}</span></li>
																<li><strong>Moneda:</strong></li>
																<li><span> {{compra['divisas_id'] }}</span></li>
																<li><strong>Valor:</strong></li>
																<li><span> {{compra['valor'] }} </span></li>
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
	<!-- Modal-->
	<div class="modal">
	  <div class="col-md-12">
	    <div class="contenido_modal">
	       <div class="desc_modal">
	           ¿Cuantas Horas adicionales necesita el Area de  para la<span> OT #  </span>
	       </div>
	       <div>
	       	 <input type="text" name="horas_adicionales">
	       	 <button> Enviar</button>
	       </div>
	    	
	    </div>
	  	
	  </div>

	  <!--Modal Cambiar de Pestaña-->
				<div class="modal editarModal" >
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span></button>
								</div>
								<div class="modal-body">
									  ¿Cuantas Horas adicionales necesita el Area de  para la<span> OT #  </span>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-primary" >Enviar</button>
								</div>
							</div>
						</div>
					</div>
	      
		

	</div>
</div>




</div>
@endsection

<script>
$(document).ready(function(){
function abriModal() {
		$('.editarModal').modal('show');
	    console.log("entrooo2");
}

});
</script>

