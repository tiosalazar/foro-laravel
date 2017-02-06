<template>
	<div>
		<encabezado :horas_disponibles="h_Disponibles"></encabezado>
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Requerimientos y Compras</h3>
			</div>
			<div class="box-body">
				<div class="col-md-12">
					<!-- Custom Tabs -->
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs" >
							<li v-for="area in listado_areas"  :class="{'active': area.nombre=='Creatividad' } " ><a @click="tabs_areas($event,area.id)" :data-id="'tab_'+area.id" :href="'#tab_'+area.id" data-toggle="tab">{{area.nombre}}</a></li>
						</ul>
						<div class="tab-content" >
							<div class="tab-pane"  v-for="area in listado_areas" :class="{ 'active': area.nombre=='Creatividad'  }"  :id="'tab_'+area.id">
								<div class="row"> <anadir_requerimiento :area="area.nombre" :id_area="area.id" :realizar_validado="validar_requerimientos" :horas_disponibles="h_Disponibles" ></anadir_requerimiento></div>
								<div class="row">
									<div class="col-md-12">
										<div style="height:25px;"></div>
										<div class="alert bg-light-blue disabled color-palette alert-dismissible" role="alert">
											<strong>Importante!</strong> Si no desea agregar compras relacionadas, por favor deje el campo de compras vacio. </div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-6">
											<h2>Compras relacionadas</h2>
										</div>
									</div>
									<div class="row">
										<anadir_compra  :area="area.nombre" :id_area="area.id"  :realizar_validado="validar_compras" ></anadir_compra> </div>
										<div style="height:30px"></div>
										<div class="row">
											<div class=" pull-right  col-md-3">
												<button type="button" @click="guardarDatos(area.id)" class="btn btn-block btn-success col-sm-3">Guardar</button>
											</div>
										</div>
									</div>
									<!-- /.tab-pane -->
								</div>
								<!-- /.tab-content -->
							</div>
							<div style="height:20px"></div>
							<div class="box box-primary">
								<div class="box-header with-border">
									<h3 class="box-title">Observaciones</h3>
								</div>
								<div class="box-body">
									<div class="form-group">
										<textarea class="form-control" rows="3" v-model="descripcion_ot" placeholder="Si tiene alguna observación puede colocarla, de lo contrario puede dejarlo en blanco"></textarea>
									</div>
								</div>
							</div>
							<div style="height:30px"></div>
							<div class="row">
								<div class="text-center">
									<button type="button"  @click="GuardarOt" class="btn btn-block text-center btn-success col-sm-3">Guardar OT</button>
								</div>
							</div>
						</div>
						<!--Modal -->
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
			data () {
				return {
					h_Disponibles:0,
					listado_areas:[],
					horas_totales:0,
					datos_encabezado:[],
					datos_requerimiento:[],
					datos_requerimientos_final:[],
					datos_compras:[],
					descripcion_ot:'',
					h_area:0,
					id_tab:'',
					form_requerimiento_validado:false,
					validar_requerimientos:false,
					form_compras_validado: false,
					validar_compras:false,
					option_toast:{
						timeOut: 5000,
						"positionClass": "toast-top-center",
						"closeButton": true,
					},
				}
			},
			created: function(){
				this.fetchTips();
				/*
        Escucha las horas totales emitidas por el encabezado y realiza el calculo
        */
        this.$on('horas_totales', function(v) {
        	this.horas_totales=parseInt(v);
        	var resta_anterior=0;
        	resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras();
        	this.h_Disponibles=(this.horas_totales- this.h_area)-resta_anterior;
        });
				/*
        Escucha las horas del area actual emitidas por Añadir requerimiento y realiza el calculo
        */
        this.$on('horas_area', function(v) {
        	this.h_area=parseInt(v);
        	var resta_anterior=0;
        	resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras();
        	this.h_Disponibles=(this.horas_totales- this.h_area)-resta_anterior;
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
				this.$on('datos_requerimiento', function(v) {
					this.datos_requerimiento=v;
				});
				/*
				Escucha el arreglo completo de los datos de las compras asociadas, si las tiene
				*/
				this.$on('datos_compras', function(v) {
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
					//if(this.$localStorage.get('listado_areas') ==null){
						this.$http.get('/api/v1/areas/')
						.then(function(respuesta){
							this.listado_areas=respuesta.body;
							this.$localStorage.set('listado_areas',respuesta.body);
						//console.log(respuesta.body);
					}.bind(this));
					/*}else{
					this.listado_areas=this.$localStorage.get('listado_areas');
				}*/

				this.datos_encabezado=this.$localStorage.get('datos_encabezado');
			},
			GuardarOt: function (){
				if ( !this.validarDatos(this.datos_encabezado) ) {
					toastr.error('Error en el Detalle de la OT',"Error al guardar los datos",this.option_toast);
					return false;
				}else if(this.datos_encabezado.h_pasadas ==true){		/*Compruebo que no se haya pasado de las horas*/
					toastr.error('El Resúmen de horas no puede dar negativo',"Error al guardar los datos",this.option_toast);
					return false;
				}else if(this.comprobarDatosRequerimientos()==true) {
					console.log("Pase todas las pruebas");
					try {

						var datos_procesados={

							datos_encabezado:{
							nombre :this.datos_encabezado.name_proyect,
							referencia:this.datos_encabezado.num_ot,
							valor :this.datos_encabezado.valor_total,
							observaciones:this.descripcion_ot,
							fecha_inicio:this.limpiarFechas(this.datos_encabezado.fecha_inicio),
							fecha_final:this.limpiarFechas(this.datos_encabezado.fecha_fin),
							clientes_id: this.datos_encabezado.cliente.id,
							usuarios_id:this.datos_encabezado.ejecutivo.id,
							estados_id: this.datos_encabezado.estado.id,
						    },
							requerimientos: this.procesarTodosRequerimientos()
						};

						console.log("Entro al Try");

						this.$http.post('/api/v1/ots', datos_procesados)
						.then(function(respuesta){
							console.log(respuesta);

						});



					} catch (e) {
						console.log("Error");
						console.log(e);
					}

				}

			},
			limpiarFechas:function(fecha){
				var fecha1=fecha;
				var arreglo_nuevo=fecha1.split("T");
				return arreglo_nuevo[0];

			},
		/*
         realiza el calculo de lashoras por área
         */
         realizarCalculoHoras:function () {
         	var total_areas  =this.$localStorage.get('listado_areas');
         	if (total_areas != null || total_areas != undefined ) {
         		var size = Object.keys(total_areas).length;
         		var hora_a=0;
         		var total_a_restar=0;
         		for (let f in total_areas) {
         			let idx = Number(f)
         			let p = total_areas[idx]
         			hora_a=JSON.parse(this.$localStorage.get('datos_requerimiento_'+p.id));
         			if (hora_a !=null && hora_a[0].horas !="") {
         				total_a_restar +=parseInt(hora_a[0].horas);
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
         					requerimientos:hora_a[0].requerimientos  
         				};

         			arreglo_temporal.push(data);	
         			}
         		}
         		return arreglo_temporal;
         		
         	}  
     },
     guardarDatos: function(id){
     	var index = Object.keys(this.datos_requerimiento).length;
     	var requerimientos =this.datos_requerimiento;
     	if(this.comprobarDatosRequerimientos()==true) {

     		if(this.comprobarSiGuardoCompras() == true){
     			this.validar_compras=true;	
     			this.validar_requerimientos=true;	
     			var compras =this.datos_compras[0].compras;
     			if ( this.comprobarCompras(compras) == true ) {
					// if(this.form_requerimiento_validado ==true ){
						toastr.success('Se han guardado los datos del Area seleccionada',"Datos Guadados Correctamente",this.option_toast);
						this.$localStorage.set('datos_requerimiento_'+id,JSON.stringify(requerimientos) );
						this.validar_requerimientos=false;
				//}
				this.$localStorage.set('datos_compra_'+id,JSON.stringify(this.datos_compras) );
			}	

		}else{
			this.validar_requerimientos=true;
			toastr.success('Se han guardado los datos del Area seleccionada',"Datos Guadados Correctamente",this.option_toast);
			this.$localStorage.set('datos_requerimiento_'+id,JSON.stringify(requerimientos) );
			this.validar_requerimientos=false;	
		}

	}

},
comprobarDatosRequerimientos: function(){
	var index = Object.keys(this.datos_requerimiento).length;
	var requerimientos =this.datos_requerimiento;
	if ( index == 0) {
		toastr.error("Todos los campos son obligatorios","Error al Guardar Requerimientos",this.option_toast);
		return false;
	}else if( requerimientos[0].horas ==""){
		toastr.error("Recuerde que todos los campos son obligatorios, no puede dejar campos en blanco","Error en Horas Area",this.option_toast);
		return false;
	}else if( !this.comprobarRequerimientos(requerimientos[0].requerimientos) ){
		toastr.error("Recuerde que todos los campos son obligatorios, no puede dejar campos en blanco","Error en Requerimientos",this.option_toast);
		return false;
	}else if(requerimientos[0].h_pasadas){
		toastr.error("El Resúmen de horas no puede dar negativo","Error en Requerimientos",this.option_toast);
		return false;
	}else{
		return true;
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
      return true;
  	}
  	var compras =this.datos_compras[0].compras;
  	var index = Object.keys(compras).length;
  	if (index == 0) {
  		return true;
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
  	for (let f in arreglo) {
  		let idx = Number(f)
  		let p = arreglo[idx]
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
