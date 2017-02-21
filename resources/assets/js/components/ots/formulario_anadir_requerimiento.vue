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
				<div class="col-md-12">
					<!-- Custom Tabs -->
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs" >
							<li v-for="area in listado_areas"  :class="{'active': area.nombre=='Creatividad' } " ><a @click="tabs_areas($event,area.id)" :data-id="'tab_'+area.id" :href="'#tab_'+area.id" data-toggle="tab">{{area.nombre}}</a></li>
						</ul>
						<div class="tab-content" >
							<div class="tab-pane"  v-for="area in listado_areas" :class="{ 'active': area.nombre=='Creatividad'  }"  :id="'tab_'+area.id">
								<div class="row"> <anadir_requerimiento :area="area.nombre" :limpiar_datos="limpiarDatos" :id_area="area.id" :realizar_validado="validar_requerimientos" :horas_disponibles="h_Disponibles" ></anadir_requerimiento></div>
								<div style="height:42px"></div>
								<div id="secion_compras">
									<div class="row">
										<div class="col-md-6">
											<h4 class="titulo_interna_ot">Compras relacionadas</h4>
										</div>
									</div>
									<div style="height:22px"></div>
									<div class="row"  v-show="visualizacion != 'true'">
										<div class="col-md-12">
											<div class="col-md-12 mensaje_info" role="alert">
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
										<anadir_compra  :area="area.nombre" :id_area="area.id" :limpiar_datos="limpiarDatos"  :realizar_validado="validar_compras" ></anadir_compra>
									</div>
								</div>
								<div style="height:30px"></div>
								<div class="row">
									<div class="col-md-4 col-md-offset-4">
										<button type="button" @click="guardarDatos(area.id)" class="btn btn-block btn-success  boton_foro succes col-sm-3">Guardar Requerimiento</button>
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
						<div class="row">
							<div class=" col-md-12 text-center">
								<div class="separador"> </div>
								<div style="height:30px"></div>
								<div class="col-md-4 col-md-offset-4" >
									<button type="button"  @click="GuardarOt"  :class="{'disabled' : !can_save }"  class="btn btn-block text-center btn-success boton_foro succes  col-sm-3">Guardar OT</button>
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
									<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Espera!! voy a guardar</button>
									<button type="button" class="btn btn-primary" @click="seguir">Ok, quiero continuar</button>
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
				}
			},
			components: { VueLocalStorage,VeeValidate,Validator},
			props: ['visualizacion','arreglo_visualizar'],
			data () {
				return {
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
					limpiarDatos:false,
					form_requerimiento_validado:false,
					validar_requerimientos:false,
					form_compras_validado: false,
					validar_compras:false,
					diabled_compras:true,
					message:'',
					can_save:false,
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

				if (this.visualizacion=='true') {
					var bPreguntar = true;
					var salir = false;
					window.onbeforeunload = function (e)
					{
						var e = e || window.event,
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
						return salir;
					}
				}
			},
			created: function(){
				this.fetchTips();
				this.llenarDatosSiesVisualizacion();

				/*
				Escucha las horas totales emitidas por el encabezado y realiza el calculo
				*/
				this.$on('horas_totales', function(v) {
					this.horas_totales=parseInt(v);
					//console.log("Horas totales : "+this.horas_totales);
					var resta_anterior=0;
					resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras(this.area_temporal);
					//console.log("Horas totales Resta : "+resta_anterior);
					this.h_Disponibles=(this.horas_totales- this.h_area)-resta_anterior;
					//this.h_Disponibles += this.h_extra_total;
				});
				/*
				Escucha las horas del area actual emitidas por Añadir requerimiento y realiza el calculo
				*/
				this.$on('horas_area', function(v,h) {
					this.area_temporal=h;
					this.h_area=parseInt(v);
					//console.log("This Area :"+h);
					var resta_anterior=0;
					resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras(this.area_temporal);
					//console.log("Resta Anterio Horas AArea"+resta_anterior);
					this.h_Disponibles=(this.horas_totales- this.h_area)-resta_anterior;
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
				this.$on('datos_requerimiento', function(v,save) {
					this.datos_requerimiento=v;
					this.can_save=save;
					console.log(save);
				});
				/*
				Escucha las horas extra del Area a Editar
				*/
				this.$on('horas_extra_area', function(v,h) {
					this.area_temporal=h;
					this.t_extra=parseInt(v);
					var resta_anterior=0;
					resta_anterior=(!this.realizarCalculoHorasExtra())?0:this.realizarCalculoHorasExtra(this.area_temporal);
					this.h_extra_total= this.t_extra+resta_anterior;

					//resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras(this.area_temporal);
					//this.h_Disponibles=((this.horas_totales- this.h_area)-resta_anterior)+this.h_extra_total;
				});
				/*
				Escucha el arreglo completo de los datos de las compras asociadas, si las tiene
				*/
				this.$on('datos_compras', function(v) {
					this.diabled_compras = !this.comprobarSiGuardoCompras();
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

			},
			methods:{
				fetchTips: function(){
					if (this.visualizacion !='true') {
						//if(this.$localStorage.get('listado_areas') ==null){
						this.$http.get( window._apiURL+'areas')
						.then(function(respuesta){
							this.listado_areas=respuesta.body;
							this.$localStorage.set('listado_areas',respuesta.body);
							//console.log(respuesta.body);
						}.bind(this));

					}else{
						var arreglo_visualizar = JSON.parse(this.arreglo_visualizar);
						this.listado_areas=arreglo_visualizar.listado_areas;
						this.$localStorage.set('listado_areas',arreglo_visualizar.listado_areas);
					}
					/*}else{
					this.listado_areas=this.$localStorage.get('listado_areas');
				}*/

				this.datos_encabezado=this.$localStorage.get('datos_encabezado');
			},
			llenarDatosSiesVisualizacion: function(){
				if (this.visualizacion=='true') {
					var arreglo_visualizar = JSON.parse(this.arreglo_visualizar);
					var datos_encabezado= arreglo_visualizar.datos_encabezado;
					this.descripcion_ot=datos_encabezado.observaciones;
					/*this.datos_encabezado=arreglo_visualizar.datos_encabezado;
					this.datos_requerimiento=arreglo_visualizar.requerimientos;
					this.datos_compras=arreglo_visualizar.compras;*/
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
						console.log(datos_procesados);

						if(this.visualizacion != 'true'){
							this.$http.post(window._apiURL+'ots', datos_procesados)
							.then(function(respuesta){
								console.log(respuesta);
								if (respuesta.status != '200') {
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
								}
							},(response) => {
								console.log(response);
								if (response.body.error_creacion) {
									toastr.error("Ocurrio un error del sistema por favor contacte con Soporte",response.body.error,this.option_toast);
									return false;
								}
								if (Object.keys(response.body.obj).length>0) {
									this.setErrors(response.body.obj);
									console.log(response);
									toastr.error(this.message,response.body.msg,this.option_toast);
									return false;
								}
							});
						}else{
							var arreglo_visualizar = JSON.parse(this.arreglo_visualizar);
							datos_procesados.datos_encabezado.editor_id=arreglo_visualizar.editor_id;
							console.log(datos_procesados);
							this.$http.put(window._apiURL+'ots/'+arreglo_visualizar.datos_encabezado.id, datos_procesados)
							.then(function(respuesta){
								console.log(respuesta);
								if (respuesta.status != '200') {
									if (Object.keys(respuesta.body.obj).length>0) {
										this.setErrors(respuesta.body.obj);
									}
									toastr.warning(this.message,respuesta.body.msg,this.option_toast);
								}else{
									toastr.success(respuesta.body.msg,'',this.option_toast);
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
			limpiarFechas:function(fecha){
				if (fecha != null && fecha != undefined && fecha != '' && this.validarFormatoFecha(fecha) ==false ) {

					var fecha1=String(fecha);
					//console.log(fecha1);
					//fecha1=fecha1.toISOString();
					var arreglo_nuevo=fecha1.split("T");
					return arreglo_nuevo[0];
				}else{
					return fecha;
				}
			},
			validarFormatoFecha:function(campo) {
				var campo2 = campo;
				var RegExPattern = /^\d{1,2}\-\d{1,2}\-\d{2,4}$/;
				if ((String(campo2).match(RegExPattern)) && ( String(campo2) !='')) {
					return true;
				} else {
					return false;
				}
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
								total_a_restar +=parseInt(hora_a[0].horas);
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
								total_a_restar +=parseInt(hora_a[0].tiempo_extra);
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
				e.stopPropagation()
				this.id_tab=id;
				$('.editarModal').modal('show');
			},
			seguir:function(e){
				$('[data-id~="tab_'+this.id_tab+'"]').trigger('click')
				$('.editarModal').modal('toggle');
			},
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
							//total_a_restar +=parseInt(hora_a[0].horas);
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
										valor:hora_a[i].model_valor,
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
			guardarDatos: function(id){
				var index = Object.keys(this.datos_requerimiento).length;
				var requerimientos =this.datos_requerimiento;
				if(this.comprobarDatosRequerimientos()==true) {
					this.area_temporal=id;
					if(this.comprobarSiGuardoCompras() == true){
						//this.validar_compras=true;
						//this.validar_requerimientos=true;
						if ( this.comprobarCompras(this.datos_compras) == true ) {
							// if(this.form_requerimiento_validado ==true ){
							toastr.success('Se han guardado los datos del Area seleccionada',"Datos Guadados Correctamente",this.option_toast);
							this.$localStorage.set('datos_requerimiento_'+id,JSON.stringify(requerimientos) );
							//this.validar_requerimientos=false;
							//}
					        this.can_save=true;
							this.$localStorage.set('datos_compra_'+id,JSON.stringify(this.datos_compras) );
						}

					}else{
						//	this.validar_requerimientos=true;
						toastr.success('Se han guardado los datos del Area seleccionada',"Datos Guadados Correctamente",this.option_toast);
						this.$localStorage.set('datos_requerimiento_'+id,JSON.stringify(requerimientos) );
						this.can_save=true;
						//	this.validar_requerimientos=false;
					}

				}

			},
			comprobarDatosRequerimientos: function(arreglo){
				console.log(arreglo);
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
				}else{
					return true;
				}

			},
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
					if ( (p.model_desc !="" || p.model_desc.length  >= 4 ) || (p.model_provedor != "" || p.model_desc.model_provedor  >= 4 ) || (p.model_valor != ""  || p.model_desc.model_valor  >= 4 )  ) {
						return true;
						break;
					}
				}
				return false;
			},
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
					}else if ( (p.model_desc =="" || p.model_desc.length  <= 4 ) && (p.model_provedor == "" || p.model_desc.model_provedor  <= 4 ) && (p.model_valor == "" || p.model_desc.model_valor  <= 4 )  ) {
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
