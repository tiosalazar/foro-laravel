<template>
	<div>

		<encabezado :horas_disponibles="h_Disponibles" :limpiar_datos="limpiarDatos"></encabezado>
		<div class="">
			<div class="col-md-12">
				<div class="separador"> </div>
			</div>
			<div style="height:22px"></div>
			<h3 class="box-title"><span class="span_descripcion1">Requerimientos y </span> <span class="span_descripcion2">Compras</span></h3>

			<div class="box-body">
				<div style="height:22px"></div>
				<!-- Mensaje de atención -->
				<div class="box">
					<div class="box-header with-border bg-aqua-active">
						<h3 class="box-title bg-aqua-active">Atención</h3>

						<div class="box-tools pull-right ">

							<button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Cerrar">
								<i class="fa fa-times" style="color:white;"></i></button>
							</div>
							<div>Si vas a aumentar las horas de algún área después de haber guardado un requerimiento, recuerda primero agregarlas en la sección <b>Detalle OT</b> → <b>Horas totales</b>  y guardar.</div>
						</div>

					</div>
					<div class="col-md-12">
						<!-- Custom Tabs -->
						<div class="nav-tabs-custom">
							<ul class="nav nav-tabs" >
								<li v-for="area in listado_areas"  :class="{'active': area.nombre==listado_areas[0].nombre } " ><a @click="tabs_areas($event,area.id)" :data-id="'tab_'+area.id" :href="'#tab_'+area.id" data-toggle="tab">{{area.nombre}}</a></li>

							</ul>
							<div class="tab-content" >
								<div class="tab-pane"  v-for="area in listado_areas" :class="{'active': area.nombre==listado_areas[0].nombre } "  :id="'tab_'+area.id">
									<div class="row"> <anadir_requerimiento :area="area.nombre" :limpiar_datos="limpiarDatos" :limpiar_datos_tabs="limpiarDatos_tabs" :id_area="area.id" :realizar_validado="validar_requerimientos" :horas_disponibles="h_Disponibles" :actualizar_reque="traer_reque" ></anadir_requerimiento></div>
									<div style="height:42px"></div>
									<div id="secion_compras">
										<div class="row">
											<div class="col-md-6">
												<h4 class="titulo_interna_ot">Compras relacionadas</h4>
											</div>
										</div>
										<div style="height:22px"></div>
										<div class="row">
											<div class="col-md-12">
												<div class="row mensaje_info" role="alert">
													<div class="col-md-2 text-center ">
														<i class="fa fa-exclamation-triangle fa-3x text-center" aria-hidden="true"></i>
													</div>
													<div class="col-md-10 letra_mediana">
														<div class="col-sm-12"> <strong >IMPORTANTE!</strong></div>
														<div class="col-sm-12">Si no desea agregar compras relacionadas, por favor deje el campo de compras vacio.</div>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div style="height:22px"></div>
											<anadir_compra  :area="area.nombre" :id_area="area.id" :limpiar_datos="limpiarDatos"  :realizar_validado="validar_compras" :limpiar_datos_tabs="limpiarDatos_tabs" ></anadir_compra>
										</div>
									</div>
									<div style="height:30px"></div>
									<div class="row">
										<div class="col-md-6 col-md-offset-3">
											<button type="button" @click="guardarDatos(area.id)" :id="'boton_guardar_area_'+area.id"  class="btn btn-block btn-success  boton_foro succes col-sm-3 disabled">Guardar Requerimiento</button>
											<button type="button" @click="borrarDatos(area.id)" :id="'boton_guardar_area_'+area.id"  class="btn btn-block btn-danger  boton_foro   error col-sm-3 ">Eliminar Área</button>

										</div>
									</div>
								</div>
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
										<textarea class="form-control" rows="8" v-model="descripcion_ot" placeholder="Deje sus Observaciones ..."></textarea>
									</div>
								</div>
							</div>
							<div style="height:30px"></div>
							<div class="row" v-if="can_save_ot==false">
								<div class="col-md-12 ot_validacion_guardar">
									<div class="row btn-danger" role="alert">
										<div class="col-md-2 text-center ">
											<i class="fa fa-exclamation-triangle fa-3x text-center" aria-hidden="true"></i>
										</div>
										<div class="col-md-10 letra_mediana">
											<div class="col-sm-12"> <strong >IMPORTANTE!</strong></div>
											<div class="col-sm-12">Debes Guardar todos los requerimientos para poder crear la OT</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class=" col-md-12 text-center">
									<div class="separador"> </div>
									<div style="height:30px"></div>
									<div class="col-md-5 col-md-offset-1" >
										<button type="button"  @click="GuardarOt"  :class="{'disabled' : !can_save }"  class="btn btn-block text-center btn-success boton_foro succes  col-sm-3">Guardar OT</button>
									</div>
									<div class="col-md-5 " >
										<button type="button"  @click="showModalBorrarOt" class="btn btn-block text-center btn-danger boton_foro error  col-sm-3">Eliminar Datos Guardados</button>
									</div>
								</div>
							</div>
							<div style="height:30px"></div>
						</div>


					</div>
					<!--Modal Cambiar de Pestaña-->
					<div class="modal editarModal" >
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">×</span></button>
										<h4 class="modal-title">Seguro que desea cambiar de pestaña</h4>
									</div>
									<div class="modal-body">
										Se perderán los cambios que no haya guardado
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-flat btn-default pull-left" data-dismiss="modal">Espera, voy a guardar</button>
										<button type="button" class="btn btn-flat btn-primary" @click="seguir">Ok, descartar cambios y continuar</button>
									</div>
								</div>
							</div>
						</div>

						<!--Modal Borrar los datos de la OT-->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">Borrar Datos almacenados de la OT</h4>
									</div>
									<div class="modal-body">
										¿ Estas seguro que deseas borrar los datos almacenados, Recuerda que esta acción no se puede deshacer ?
										<input type="hidden" name="id" id="id_cliente">
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
										<button type="button" v-on:click="BorrarOt" class="btn btn-danger">Borrar</button>
									</div>
								</div>
							</div>
						</div>

						<!--Modal Borrar Área  de la OT-->
						<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
										<h4 class="modal-title" id="myModalLabel">Borrar Área de la OT</h4>
									</div>
									<div class="modal-body">
										¿ Estas seguro que deseas borrar esta área, Recuerda que esta acción no se puede deshacer ?
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
										<button type="button" v-on:click="BorrarArea" class="btn btn-danger">Borrar</button>
									</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>

		</template>
		<script>
		import VueLocalStorage from 'vue-localstorage'
		Vue.use(VueLocalStorage);
		import VeeValidate, { Validator } from 'vee-validate';
		//Traducciones del validador
		import messages from '../../es/es';

		//Realizando los Use
		// Merge the locales.
		Validator.updateDictionary({es: { messages }});
		// Install the plugin and set the locale.
		Vue.use(VeeValidate, { locale: 'es' });
		module.exports= {
			localStorage: {
				listado_areas: {
					type: Object,
				},
				datos_encabezado: {
					type: Object,
				}
			},
			components: { VueLocalStorage,VeeValidate,Validator},
			props: ['visualizacion','arreglo_visualizar','duplicar'],
			data () {
				return {
					can_save_ot:false,
					h_Disponibles:0,
					listado_areas:[],
					horas_totales:0,
					datos_encabezado:[],
					datos_requerimiento:[],
					datos_compras:[],
					descripcion_ot:'',
					h_extra_total:0,
					message:'',
					h_area:0,
					t_extra:0,
					id_tab:'',
					area_temporal:'',
					area_actual:'',
					area_seguir:'',
					limpiarDatos:false,
					limpiarDatos_tabs:false,
					form_requerimiento_validado:false,
					validar_requerimientos:false,
					form_compras_validado: false,
					validar_compras:false,
					diabled_compras:true,
					traer_reque:false,
					primera_entrada:0,
					message:'',
					can_save:false,
					can_save_req:false,
					errors_return:{
						'nombre' : '',
						'referencia' : '',
						'valor' : '',
						'fecha_inicio' : '',
						'fecha_final' : '',
						'clientes_id' : '',
						'usuarios_id' : '',
						'estados_id' : '',
					},
					option_toast:{
						timeOut: 5000,
						"positionClass": "toast-top-center",
						"closeButton": true,
					},
				}
			},
			mounted: function () {

				if (this.visualizacion=='true' || this.duplicar=='true') {
					var bPreguntar = true;
					var salir = false;
					window.onbeforeunload = function (e)
					{
						window.localStorage.clear();
						/*var e = e || window.event,
						salir=true;
						// message = 'Seguro que quieres salir sin guardar los cambios ?';

						// For IE and Firefox prior to version 4
						if (e)
						{
						e.returnValue = true;
					}
					if (salir) {
					window.localStorage.clear(); //try this to clear all local storage
				}
				return salir;*/
			}
		}
	},
	created: function(){
		this.fetchTips();

		/*
		Escucha las horas totales emitidas por el encabezado y realiza el calculo
		*/
		this.$on('horas_totales', function(v) {
			this.horas_totales=parseFloat(v);
			var resta_anterior=0;
			resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras(this.area_temporal);
			this.h_Disponibles=parseFloat((this.horas_totales- this.h_area)-resta_anterior);
			//this.h_Disponibles += this.h_extra_total;
		});
		/*
		Escucha las horas del area actual emitidas por Añadir requerimiento y realiza el calculo
		*/
		this.$on('horas_area', function(v,h) {
			this.area_temporal=h;
			this.area_actual=h;
			this.h_area=parseFloat(v);
			//console.log("This Area :"+h);
			var resta_anterior=0;
			resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras(this.area_temporal);
			//console.log("Resta Anterio Horas AArea"+resta_anterior);
			this.h_Disponibles=parseFloat((this.horas_totales- this.h_area)-resta_anterior);
			//this.h_Disponibles += this.h_extra_total;
		});
		/*
		Escucha el arreglo completo de los datos generales de la OT
		*/
		this.$on('datos_encabezado', function(v) {
			this.datos_encabezado=v;
		});
		/*
		Escucha el arreglo completo de los datos de los requerimientos
		*/
		this.$on('datos_requerimiento', function(v,save,save_req) {
			this.datos_requerimiento=v;
			this.can_save=save;
			this.can_save_req=save_req;
		});
		/*
		Escucha las horas extra del Area a Editar
		*/
		this.$on('horas_extra_area', function(v,h) {
			this.area_temporal=h;
			this.area_actual=h;
			this.t_extra=parseFloat(v);
			var resta_anterior=0;
			resta_anterior=(!this.realizarCalculoHorasExtra())?0:this.realizarCalculoHorasExtra(this.area_temporal);
			this.h_extra_total= this.t_extra+resta_anterior;

			//resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras(this.area_temporal);
			//this.h_Disponibles=((this.horas_totales- this.h_area)-resta_anterior)+this.h_extra_total;
		});
		/*
		Escucha el arreglo completo de los datos de las compras asociadas, si las tiene
		*/
		this.$on('datos_compras', function(v,save) {
			this.diabled_compras = !this.comprobarSiGuardoCompras();
			//console.log(this.comprobarSiGuardoCompras(),'Comprobación');
			//console.log(v,'ID AREA com');
			this.can_save=save;
			//this.can_save_req=save;
			if (this.comprobarSiGuardoCompras() ==true) {
				$('#boton_guardar_area_'+v[0].id_area).removeClass('disabled');
			}
			this.datos_compras=v;
		});
		/*
		Escucha la respuesta a la validación del formulario de requerimientos
		*/
		this.$on('form_requerimiento_validado', function(v) {
			this.form_requerimiento_validado=v;
		});
		/*
		Escucha la respuesta a la validación del formulario de compras asociadas
		*/
		this.$on('form_compras_validado', function(v) {
			this.form_compras_validado=v;
		});

		this.llenarDatosSiesVisualizacion();

	},
	methods:{
		fetchTips: function(){
			//if (this.visualizacion !='true') {
			this.$http.get( window._apiURL+'listar_areas')
			.then(function(respuesta){
				this.listado_areas=respuesta.body;

				this.$localStorage.set('listado_areas',respuesta.body);
			//DSO Ajustes al guardar OT
				var total_areas  =this.listado_areas;
				var retorno=false;
				if (total_areas != null || total_areas != undefined ) {
					var size = Object.keys(total_areas).length;
					var hora_a=0;
					for (let f in total_areas) {
						let idx = Number(f)
						let p = total_areas[idx]
						hora_a=JSON.parse(this.$localStorage.get('datos_requerimiento_'+p.id));
						if( hora_a != null && hora_a != undefined &&  Object.keys(hora_a).length > 0 ){
								this.area_temporal=p.id;
								this.area_actual=p.id;
								return true;
						}
					}
					this.area_temporal=total_areas[0].id;
					this.area_actual=total_areas[0].id;
				}

			}.bind(this));

			/*}else{
			var arreglo_visualizar = JSON.parse(this.arreglo_visualizar);
			this.listado_areas=arreglo_visualizar.listado_areas;
			this.$localStorage.set('listado_areas',arreglo_visualizar.listado_areas);
		}*/
		this.datos_encabezado=this.$localStorage.get('datos_encabezado');
	},
	llenarDatosSiesVisualizacion: function(){
		if (this.visualizacion=='true') {
			var arreglo_visualizar = JSON.parse(this.arreglo_visualizar);
			var datos_encabezado= arreglo_visualizar.datos_encabezado;
			this.$localStorage.set('datos_encabezado',datos_encabezado);
			this.datos_encabezado=datos_encabezado;

			var datos_compras= arreglo_visualizar.final_com;
			this.descripcion_ot=datos_encabezado.observaciones;
			this.diabled_compras =(datos_compras.length > 0)?false:true;

			//DSO Ajustes Editar OT
			var arreglo_requerimientos=arreglo_visualizar.final_req;
			var primer_req=arreglo_requerimientos[0];
		/*	var datos=[{
				requerimientos:primer_req.requerimientos,
				horas: parseFloat(primer_req.horas),
				tiempo_extra:  primer_req.textra,
				guardado:false,
				h_pasadas: false
			}];
			this.h_area=parseFloat(primer_req.horas);
			this.t_extra=parseFloat(primer_req.textra);
			this.datos_requerimiento=datos;
			this.cambiarDatos(primer_req.area);*/

		}

	},
	setErrors:function(object) {
		this.message='';
		var that = this;
		$.each(object, function(index, value) {
			that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
			that.errors_return[index] = 'has-warning';
		});
	},
	GuardarOt: function (){
		if ( !this.validarDatos(this.datos_encabezado) ) {
			toastr.error('Error en el Detalle de la OT',"Error al guardar los datos",this.option_toast);
			return false;
		}else if(this.h_Disponibles <0){
			toastr.error("Las horas disponibles de la OT están en negativo, por favor aumentelas para continuar.","Error al guardar los datos",this.option_toast);
			return false;
		}else if(this.datos_encabezado.h_pasadas ==true){		/*Compruebo que no se haya pasado de las horas*/
			toastr.error('El Resúmen de horas no puede dar negativo',"Error al guardar los datos",this.option_toast);
			return false;
		}else if(this.comprobarDatosTodosRequerimientos()==true) {
			try {
				var datos_procesados={
					datos_encabezado:{
						nombre :this.datos_encabezado.name_proyect,
						referencia:this.datos_encabezado.num_ot,
						valor :this.datos_encabezado.valor_total,
						fee: this.datos_encabezado.fee,
						horas_totales:this.datos_encabezado.horas_totales,
						horas_disponibles:this.h_Disponibles,
						total_horas_extra:this.h_extra_total,
						observaciones:this.descripcion_ot,
						fecha_inicio: this.datos_encabezado.fecha_inicio,
						fecha_final: this.datos_encabezado.fecha_fin,
						clientes_id: this.datos_encabezado.cliente.id,
						usuarios_id:this.datos_encabezado.ejecutivo.id,
						estados_id: this.datos_encabezado.estado.id,
					},
					requerimientos: this.procesarTodosRequerimientos(),
					compras: this.procesarTodosCompras()
				};
				console.log(datos_procesados,'Datos PROCESADOS');
				return false;
				if(this.visualizacion != 'true' || this.duplicar=='true'){
					this.$http.post(window._apiURL+'ots', datos_procesados)
					.then(function(respuesta){
						console.log(respuesta);
						if (respuesta.status == '500') {
							toastr.error("Ocurrio un error  500 del sistema por favor contacte con Soporte",response.statusText,this.option_toast);
							return false;
						}else if (respuesta.status != '200') {
							if (Object.keys(respuesta.body.obj).length>0) {
								this.setErrors(respuesta.body.obj);
							}
							toastr.warning(this.message,respuesta.body.msg,this.option_toast);
						}else{
							toastr.success(respuesta.body.msg,'',this.option_toast);
							this.h_Disponibles=0;
							this.horas_totales=0;
							this.h_extra_total=0;
							this.descripcion_ot='';
							this.message='';
							this.h_area=0;
							this.id_tab='';
							this.form_requerimiento_validado=false;
							this.validar_requerimientos=false;
							this.form_compras_validado= false;
							this.validar_compras=false;
							this.limpiarDatos=true;
							this.$localStorage.remove('datos_encabezado');
							this.limpiarComprasRequerimientos();
							this.datos_requerimiento=[];
							this.datos_compras=[];
							//window.localStorage.clear(); //try this to clear all local storage
							if ( this.duplicar=='true') {
								window.localStorage.clear(); //try this to clear all local storage
								location.href=""+window._baseURL+"/ots/crear";
							}else {
								setTimeout(function () {
										//window.localStorage.clear(); //try this to clear all local storage
										location.reload(true);
								}, 500);

							}
						}
					},(response) => {
						console.log(response);
						if (response.body.error_creacion) {
							toastr.error("Ocurrio un error del sistema por favor contacte con Soporte",response.body.error,this.option_toast);
							return false;
						}
						if (Object.keys(response.body.obj).length>0) {
							this.setErrors(response.body.obj);
							toastr.error(this.message,response.body.msg,this.option_toast);
							return false;
						}
					});

				}else{

					var arreglo_visualizar = JSON.parse(this.arreglo_visualizar);
					datos_procesados.datos_encabezado.editor_id=arreglo_visualizar.editor_id;
					console.log(datos_procesados,'Entrada de Datos');


					this.$http.put(window._apiURL+'ots/'+arreglo_visualizar.datos_encabezado.id, datos_procesados)
					.then(function(respuesta){
						console.log(respuesta);
						if (respuesta.status == '500') {
							toastr.error("Ocurrio un error  500 del sistema por favor contacte con Soporte",response.statusText,this.option_toast);
							return false;
						}else if  (respuesta.status != '200') {
							if (Object.keys(respuesta.body.obj).length>0) {
								this.setErrors(respuesta.body.obj);
							}
							toastr.warning(this.message,respuesta.body.msg,this.option_toast);
						}else{
							toastr.success(respuesta.body.msg,'',this.option_toast);
							//window.localStorage.clear(); //try this to clear all local storage
							setTimeout(function () {
								location.reload(true);
							}, 500);
						}
					},(response) => {
						console.log(response);
						if (response.body.error) {
							toastr.error("Ocurrio un error del sistema por favor contacte con Soporte",response.body.error,this.option_toast);
							return false;
						}
						if (Object.keys(response.body.obj).length>0) {
							this.setErrors(response.body.obj);
						}
						toastr.error(this.message,response.body.msg,this.option_toast);
					});


				}


			} catch (e) {
				console.log(e);
				toastr.error("Revise que todos los datos esten bien, y vuelva a intentar","Error al Guardar",this.option_toast);

			}
		}
	},
	/*
	Muestra el Modal de confirmación de borrar los datos de la OT
	*/
	showModalBorrarOt:function() {
		$('#myModal').modal('show');
	},
	/*
	Borrar los datos Guardados en localStorage
	*/
	BorrarOt:function() {
		this.h_Disponibles=0;
		this.horas_totales=0;
		this.h_extra_total=0;
		this.descripcion_ot='';
		this.message='';
		this.h_area=0;
		this.id_tab='';
		this.form_requerimiento_validado=false;
		this.validar_requerimientos=false;
		this.form_compras_validado= false;
		this.validar_compras=false;
		this.limpiarDatos=true;
		this.$localStorage.remove('datos_encabezado');
		this.limpiarComprasRequerimientos();
		this.datos_requerimiento=[];
		this.datos_compras=[];
		setTimeout(function () {
			location.reload(true);
		}, 500);

	},
	/*
	realiza el calculo de lashoras por área
	*/
	realizarCalculoHoras:function (area) {
		var total_areas  =this.$localStorage.get('listado_areas');
		if (total_areas != null || total_areas != undefined ) {
			var hora_a=0;
			var total_a_restar=0;
			for (let f in total_areas) {
				let idx = Number(f)
				let p = total_areas[idx]
				if(p.id != area ){
					hora_a=JSON.parse(this.$localStorage.get('datos_requerimiento_'+p.id));
					if (hora_a !=null && hora_a[0].horas !="") {
						//console.log(hora_a[0].horas);
						total_a_restar +=parseFloat(hora_a[0].horas);
					}
				}

			}
			return total_a_restar;
		}
		return false;
	},
	/*
	realiza el calculo de las Horas Extra
	*/
	realizarCalculoHorasExtra:function (area) {
		var total_areas  =this.$localStorage.get('listado_areas');
		if (total_areas != null || total_areas != undefined ) {
			var hora_a=0;
			var total_a_restar=0;
			for (let f in total_areas) {
				let idx = Number(f)
				let p = total_areas[idx]
				if(p.id != area ){
					hora_a=JSON.parse(this.$localStorage.get('datos_requerimiento_'+p.id));
					if (hora_a !=null && hora_a[0].tiempo_extra !="") {
						total_a_restar +=parseFloat(hora_a[0].tiempo_extra);
					}
				}

			}
			return total_a_restar;
		}
		return false;
	},
	/*
	Al dar click en las tabs llama a un Modal el cual pregunta si quiere salir sin guardar.
	*/
	tabs_areas:function(e,id){
		/*if(this.primera_entrada ==0 && this.visualizacion=='true' ){//&& this.visualizacion=='true'
		this.cambiarDatos(this.area_actual);
	}*/
	this.primera_entrada +=1;
	var id_pestana=this.area_actual;
	this.area_seguir=id;
	console.log(id_pestana,'ID Pestaña Actual');
	console.log(this.id_tab,'TAB Actual');
	console.log(this.area_seguir,'ID Pestaña Seguir');
	console.log(this.area_temporal,'Area Temporal');
	this.traer_reque=!this.traer_reque;
	//this.datos_requerimiento
	//	console.log(id_pestana,'Pesta Actual');
	//if(this.visualizacion != 'true'){
		var reqActual=(JSON.parse(this.$localStorage.get('datos_requerimiento_'+id_pestana)))?JSON.parse(this.$localStorage.get('datos_requerimiento_'+id_pestana)):null;
		//  reqActual=(reqActual!= null)?reqActual:JSON.parse(this.$localStorage.get('datos_requerimiento_'+this.area_seguir));
		var reqSiguiente=(JSON.parse(this.$localStorage.get('datos_requerimiento_'+this.area_temporal)))?JSON.parse(this.$localStorage.get('datos_requerimiento_'+this.area_temporal)):null;

		console.log(this.datos_requerimiento);
		var size = Object.keys(this.datos_requerimiento).length;

		if( (reqActual == null ||  size == 0) ){
			console.log("Entre 1");
			e.stopPropagation()
			this.id_tab=id;
			$('.editarModal').modal('show');
			return true;
		}else if ( (reqActual[0].guardado != true && reqSiguiente[0].guardado !=true) && this.datos_requerimiento[0].guardado !=true) {
			console.log("Entre 2");
			e.stopPropagation()
			this.id_tab=id;
			$('.editarModal').modal('show');
			return true;
		}else if (this.can_save_req == true ) {
			console.log("Entre 3");
			e.stopPropagation()
			this.id_tab=id;
			$('.editarModal').modal('show');
			return true;
		}
		/*DSO Ajuste guardar OT*/
		else{
			this.id_tab=id;
			this.area_actual=id;
			this.area_temporal=id;
			this.cambiarDatos(this.id_tab);
		}

	//}
	/*else {
		var reqActual=(JSON.parse(this.$localStorage.get('datos_requerimiento_'+this.area_seguir)))?JSON.parse(this.$localStorage.get('datos_requerimiento_'+this.area_seguir)):null;
		var reqSiguiente=(JSON.parse(this.$localStorage.get('datos_requerimiento_'+this.area_temporal)))?JSON.parse(this.$localStorage.get('datos_requerimiento_'+this.area_temporal)):null;
		//this.datos_requerimiento=reqSiguiente;
		//console.log(this.area_seguir,"Area Actual antes de cambiar");
		// this.cambiarDatos(this.area_seguir);
		console.log(reqActual,'Req');
		console.log(reqSiguiente,'Req  SIG');
		console.log( this.datos_requerimiento,'Req ANT 1');
		//console.log(this.datos_requerimiento[0].guardado,'Req ANT');
		var size = Object.keys(this.datos_requerimiento).length;
		if (  size == 0 || reqSiguiente == null ) {

			e.stopPropagation()
			this.id_tab=id;
			$('.editarModal').modal('show');
			return true;
		}else if(reqSiguiente[0].guardado !=true || this.datos_requerimiento[0].guardado !=true  ){ //
			console.log("Entre 2");
			e.stopPropagation()
			this.id_tab=id;
			$('.editarModal').modal('show');
			return true;
		}else if (this.can_save_req == true ) {
			console.log("Entre 3");
			e.stopPropagation()
			this.id_tab=id;
			$('.editarModal').modal('show');
			return true;
		}else{
			this.id_tab=id;
			this.area_actual=id;
			this.area_temporal=id;
			this.cambiarDatos(this.id_tab);
			return true;
		}

	}*/




},
cambiarDatos:function(id){
	if(this.primera_entrada ==0 && this.visualizacion=='true' && JSON.parse(this.$localStorage.get('datos_requerimiento_'+id)) !=null ){
		var data_registro=JSON.parse(this.$localStorage.get('datos_requerimiento_'+id));
	}else{
		var data_registro=this.datos_requerimiento;
	}

	this.datos_requerimiento=JSON.parse(this.$localStorage.get('datos_requerimiento_'+id));

	var size = Object.keys(data_registro).length;
	if( (this.datos_requerimiento != undefined && this.datos_requerimiento != null) && (this.datos_requerimiento[0].guardado !=false && size > 0  && data_registro[0].guardado !=false)  ){// && this.datos_requerimiento[0].guardado !=true
		this.h_area=parseFloat(this.datos_requerimiento[0].horas);
		this.t_extra=parseFloat(this.datos_requerimiento[0].textra);
		var resta_anterior=0;
		resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras(id);
		this.h_Disponibles=parseFloat((this.horas_totales- this.h_area)-resta_anterior);
	}else {
		console.log('Entre a cambiarDatos');
		this.h_area=0;
		this.t_extra=0;
		this.limpiarDatos_tabs=!this.limpiarDatos_tabs;
		//this.area_temporal=id;
		var resta_anterior=0;
		resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras(id);
		this.h_Disponibles=parseFloat((this.horas_totales- this.h_area)-resta_anterior);
		this.datos_requerimiento=(JSON.parse(this.$localStorage.get('datos_requerimiento_'+id) != null))?JSON.parse(this.$localStorage.get('datos_requerimiento_'+id)):[];
		this.datos_compras=(JSON.parse(this.$localStorage.get('datos_compra_'+id) != null))?JSON.parse(this.$localStorage.get('datos_compra_'+id)):[];
	}

},
seguir:function(e){
	$('[data-id~="tab_'+this.id_tab+'"]').trigger('click')
	/*DSO Ajuste guardar OT*/
  console.log(this.id_tab,'Tab enviado');
	this.cambiarDatos(this.id_tab);
	//this.area_temporal=this.id_tab;
	this.area_actual=this.id_tab;
	this.primera_entrada +=1;
	setTimeout(function () {
		this.traer_reque=false;
		this.limpiarDatos_tabs=false;
	}, 2000);
  $('#boton_guardar_area_'+this.id_tab).addClass('disabled');
	$('.editarModal').modal('toggle');
},
/*
procesa los requerimientos de todas las areas y las organiza para meter en BD
*/
procesarTodosRequerimientos(){
	var total_areas  =this.$localStorage.get('listado_areas');
	var arreglo_temporal=[];
	if (total_areas != null || total_areas != undefined ) {
		var size = Object.keys(total_areas).length;
		var hora_a=0;
		var total_a_restar=0;
		for (let f in total_areas) {
			let idx = Number(f)
			let p = total_areas[idx]
			hora_a=JSON.parse(this.$localStorage.get('datos_requerimiento_'+p.id));
			if (hora_a !=null && hora_a[0].horas !="") {
				var data={
					area:p.id,
					horas:hora_a[0].horas,
					tiempo_extra:hora_a[0].tiempo_extra,
					requerimientos:hora_a[0].requerimientos
				};

				arreglo_temporal.push(data);
			}
		}
		return arreglo_temporal;

	}
},
/*
procesa las compras de todas las areas y las organiza para meter en BD
*/
procesarTodosCompras(){
	var total_areas  =this.$localStorage.get('listado_areas');
	var arreglo_temporal=[];
	if (total_areas != null || total_areas != undefined ) {
		var size = Object.keys(total_areas).length;
		var i=0;
		for (let f in total_areas) {
			let idx = Number(f)
			let p = total_areas[idx];
			var hora_a;
			hora_a=JSON.parse(this.$localStorage.get('datos_compra_'+p.id));
			if (hora_a !=null   ) {
				hora_a=hora_a[0].compras;
				for(let f in hora_a ){
					if (hora_a[i].model_desc !="" && hora_a[i].model_provedor !=""  && hora_a[i].model_valor !="") {
						var tipo_compra = hora_a[i].tipo_compra;
						var divisa = hora_a[i].divisa;
						var data={
							areas_id:p.id,
							tipos_compras_id: tipo_compra.id,
							divisas_id: divisa.id,
							descripcion:hora_a[i].model_desc,
							provedor:hora_a[i].model_provedor,
							valor:numeral(hora_a[i].model_valor).value(),
						};
						arreglo_temporal.push(data);
					}
					i++;
				}
				i=0;
			}
		}
		return arreglo_temporal;

	}
},
/*
función la cual despues de guardar limpia todos los requerimientos y compras del local.
*/
limpiarComprasRequerimientos(){
	var total_areas  =this.$localStorage.get('listado_areas');
	var arreglo_temporal=[];
	if (total_areas != null || total_areas != undefined ) {
		var size = Object.keys(total_areas).length;
		var hora_a=0;
		var total_a_restar=0;
		for (let f in total_areas) {
			let idx = Number(f)
			let p = total_areas[idx]
			this.$localStorage.remove('datos_requerimiento_'+p.id);
			this.$localStorage.remove('datos_compra_'+p.id);
		}
	}
},
/*
función la cual guarda los datos del Area actual.
*/
guardarDatos: function(id){
		this.validar_requerimientos=!this.validar_requerimientos;
	/*if(this.primera_entrada ==0 && this.visualizacion=='true'){
		this.cambiarDatos(id);
	}*/
	this.primera_entrada +=1;
	//this.cambiarDatos(id);
	var index = Object.keys(this.datos_requerimiento).length;
	var requerimientos =this.datos_requerimiento;
	if (this.h_Disponibles <0){
		toastr.error("Las horas disponibles de la OT están en negativo, por favor aumentelas para continuar.","Error al guardar los datos",this.option_toast);
		this.can_save=false;
		this.can_save_ot=false;
		var body = $("html, body");
		body.stop().animate({scrollTop:250}, '500', 'swing');
		return false;
	}

	if(this.comprobarDatosRequerimientos(requerimientos)==true) {
		this.area_temporal=id;
		requerimientos[0].guardado=true;
		console.log(requerimientos,'REQ ANTES GUARDAR');
		if(this.comprobarSiGuardoCompras() == true){
			if ( this.comprobarCompras(this.datos_compras) == true ) {
				toastr.success('Se han guardado los datos del Area seleccionada',"Datos Guadados Correctamente",this.option_toast);
				this.$localStorage.set('datos_requerimiento_'+id,JSON.stringify(requerimientos) );
				this.can_save=true;
				this.can_save_req=false;
				this.$localStorage.set('datos_compra_'+id,JSON.stringify(this.datos_compras) );
			}else {
				toastr.error("Recuerde que todos los campos son obligatorios, no puede dejar campos en blanco","Error en Compras Asociadas",this.option_toast);
				this.can_save=false;
				this.can_save_ot=false;
				return false;
			}
		}else{
			toastr.success('Se han guardado los datos del Area seleccionada',"Datos Guadados Correctamente",this.option_toast);
			this.$localStorage.set('datos_requerimiento_'+id,JSON.stringify(requerimientos) );
			this.can_save=true;
			this.can_save_ot=true;
			this.validar_requerimientos=false;
			this.can_save_req=false;
			this.form_requerimiento_validado=false;

		}
		//  this.datos_requerimiento=[];
		//this.datos_requerimiento[0].guardado=false;
		$('#boton_guardar_area_'+id).addClass('disabled');
	}
},
/*
función la cual borra los datos del Area actual.
*/
borrarDatos: function(id){
	$('#myModal2').modal('show');
	 this.area_temporal=id;
},
BorrarArea: function () {
		var arreglo_visualizar = JSON.parse(this.arreglo_visualizar);
	this.$http.delete(window._apiURL+'eliminar/ot/area/'+arreglo_visualizar.datos_encabezado.id+'/'+this.area_temporal)
	.then(function(respuesta){
		if (respuesta.status != '200') {
			if (Object.keys(respuesta.obj).length>0) {
				toastr.error("Ocurrio un error al eliminar el área consulte con soporte",respuesta.body.msg,this.option_toast);
				return false;
			}
		}else{
			toastr.success(respuesta.body.msg,'',this.option_toast);
			setTimeout(function () {
				location.reload(true);
			}, 500);
		}
		console.log(respuesta);
	}.bind(this));
},
/*
función la cual me valida el requerimiento actual, antes de guardar.
*/
comprobarDatosRequerimientos: function(arreglo){
	if( arreglo != null && arreglo != undefined ){
		var index = Object.keys(arreglo).length;
		var requerimientos =arreglo;
	}else{
		var index = Object.keys(this.datos_requerimiento).length;
		var requerimientos =this.datos_requerimiento;
	}
	if ( index == 0) {
		toastr.error("Todos los campos son obligatorios","Error al Guardar Requerimientos",this.option_toast);
		return false;
	}else if( requerimientos[0].horas ==""){
		toastr.error("Recuerde que todos los campos son obligatorios, no puede dejar campos en blanco","Error en Horas Area",this.option_toast);
		return false;
	}else if( !this.comprobarRequerimientos(requerimientos[0].requerimientos) ){
		toastr.error("Recuerde que todos los campos son obligatorios, no puede dejar campos en blanco","Error en Requerimientos",this.option_toast);
		return false;
	}else if(this.datos_encabezado.h_pasadas ==true){		/*Compruebo que no se haya pasado de las horas*/
		toastr.error('Las horas disponibles no puden ser negativas',"Error al guardar los datos",this.option_toast);
		return false;
	}else if(requerimientos[0].h_pasadas){
		toastr.error("El Resúmen de horas no puede dar negativo","Error en Requerimientos",this.option_toast);
		return false;
	}/*else if(this.form_requerimiento_validado==false){
		toastr.error("Error en los datos ingresados, por favor verifique","Error en Requerimientos",this.option_toast);
		return false;
	}*/else{
		return true;
	}

},
/*
función la cual me valida los datos de todas las areas antes de guardar
*/
comprobarDatosTodosRequerimientos: function(){
	var total_areas  =this.$localStorage.get('listado_areas');
	var retorno=false;
	if (total_areas != null || total_areas != undefined ) {
		var size = Object.keys(total_areas).length;
		var hora_a=0;
		for (let f in total_areas) {
			let idx = Number(f)
			let p = total_areas[idx]
			hora_a=JSON.parse(this.$localStorage.get('datos_requerimiento_'+p.id));
			console.log(hora_a);
			retorno=this.comprobarDatosRequerimientos(hora_a);
		}
		return retorno;
	}else{
		return retorno;
	}
},
/*
Función la cual comprueba dentro del arreglo de requerimientos que no haya ningún campo en blanco
*/
comprobarRequerimientos: function (arreglo) {
	for (let f in arreglo) {
		let idx = Number(f)
		let p = arreglo[idx]
		if (p.model_nom =="" ||  p.model_horas== "") {
			return false;
			break;
		}
	}
	return true;
},
/*
Funcion la cual comprueba al guardar el requerimiento si debe realizar las validaciones de compras asociadas
*/
comprobarSiGuardoCompras: function () {
	if (this.datos_compras ==[] || this.datos_compras[0] == null || this.datos_compras[0] == undefined ) {
		return false;
	}
	if(this.datos_compras[0].id_area != this.area_temporal){
		return false;
	}
	var compras =this.datos_compras[0].compras;
	var index = Object.keys(compras).length;
	if (index == 0) {
		return false;
	}
	for (let f in compras) {
		let idx = Number(f)
		let p = compras[idx]
		if ( (p.model_desc !="" || p.model_desc.length  >= 4 ) || (p.model_provedor != "" || p.model_provedor  >= 4 ) || (p.model_valor != ""  || p.model_valor  >= 4 )  ) {
			return true;
			break;
		}
	}
	return false;
},
/*
función la cual valida los selects de las compras asociadas.
*/
comprobarCompras: function (arreglo) {
	var compras =arreglo[0].compras;
	for (let f in compras) {
		let idx = Number(f)
		let p = compras[idx]
		if (p.divisa.nombre == "" ) {
			toastr.error("Por favor, seleccione una Divisa","Error al Guardar Compras Asociadas",this.option_toast);
			return false;
		}else if(p.tipo_compra.nombre == ""){
			toastr.error("Por favor, seleccione un tipo de compra ","Error al Guardar Compras Asociadas",this.option_toast);
			return false;
		}else if ( (p.model_desc =="" || p.model_desc.length  <= 4 ) && (p.model_provedor == "" || p.model_provedor  <= 4 ) && (p.model_valor == "" || p.model_valor  <= 4 )  ) {
			toastr.error("Todos los campos son obligatorios, recuerde que no pueden haber campos en blanco, y deben de tener más de 4 caracteres","Error al Guardar Compras Asociadas",this.option_toast);
			return false;
			break;
		}

	}
	return true;
},
/*Función la cual valida los datos del arreglo de datos, comprueba que ningun campo este vacio*/
validarDatos: function(arreglo){
	if(arreglo == null){
		return false;
	}
	for (var k in arreglo){
		if (typeof arreglo[k] == '') {
			return false;
			break;
		}
	}
	return true;
}

}
}

Vue.component('encabezado',require('./encabezado.vue'));
Vue.component('anadir_requerimiento',require('./anadir_requerimiento.vue'));
Vue.component('anadir_compra',require('./anadir_compra_asociada.vue'));
Vue.component('select_clientes', require('../herramientas/select_clientes.vue'));
Vue.component('select_usuarios', require('../herramientas/select_usuarios.vue'));
Vue.component('select_estados', require('../herramientas/select_estado.vue'));
</script>
