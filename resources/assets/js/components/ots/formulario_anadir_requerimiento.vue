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
									<div class="col-md-6">
										<h2>Compras relacionadas</h2>
									</div>
								</div>
								<div class="row"><anadir_compra  :area="area.nombre" :id_area="area.id"  ></anadir_compra> </div>
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
								<textarea class="form-control" rows="3" placeholder="Si tiene alguna observación puede colocarla, de lo contrario puede dejarlo en blanco"></textarea>
							</div>
						</div>
					</div>
					<div style="height:30px"></div>
					<div class="row">
						<div class="text-center">
							<button type="button" class="btn btn-block text-center btn-success col-sm-3">Guardar OT</button>
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
					datos_requerimiento:[],
					datos_compras:[],
					h_area:0,
					id_tab:'',
					form_requerimiento_validado:false,
					validar_requerimientos:false,
					option_toast:{
					timeOut: 5000,
					"positionClass": "toast-top-center",
					"closeButton": true,
				     },
				}
			},
			watch:{

			},
			computed: {
				htotales:function(){
					return this.$localStorage.get('horas_totales')
				},
				validar:function(){
					return this.area;
				}

			},
			created: function(){
				this.fetchTips();
				this.$on('horas_totales', function(v) {
		            this.horas_totales=parseInt(v);
		            var resta_anterior=0;
		            resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras();
		            console.log(resta_anterior);
		            this.h_Disponibles=(this.horas_totales- this.h_area)-resta_anterior;
		          });
				this.$on('horas_area', function(v) {
                     /* var total= horas_disponibles-this.nhoras;
                    this.$localStorage.set('h_Disponibles',total);*/
				   this.h_area=parseInt(v); 
				      var resta_anterior=0;
		            resta_anterior=(!this.realizarCalculoHoras())?0:this.realizarCalculoHoras();
		            console.log(resta_anterior);
		            this.h_Disponibles=(this.horas_totales- this.h_area)-resta_anterior;
		          });
				this.$on('datos_requerimiento', function(v) {
		           this.datos_requerimiento=v;
		          });
				this.$on('datos_compras', function(v) {
		            this.datos_compras=v;
		            console.log(this.datos_compras);
		          });
			  this.$on('form_requerimiento_validado', function(v) {
		            this.form_requerimiento_validado=v;
		          });	
			},
			methods:{
				fetchTips: function(){
					//if(this.$localStorage.get('listado_areas') ==null){
						this.$http.get('api/v1/areas/')
						.then(function(respuesta){
							this.listado_areas=respuesta.body;
							this.$localStorage.set('listado_areas',respuesta.body);
							//console.log(respuesta.body);
						}.bind(this));
					/*}else{
						this.listado_areas=this.$localStorage.get('listado_areas');
					}*/

					/*for (let f in this.listado_areas) {
			              let idx = Number(f)
			              let p = this.listado_areas[idx]
			             this.$set(p, 'validar_area_'+p.id, 'lllll')
			             console.log(this.validar_area_17)

			            //this.$set(this.someObject, 'b', 2)
			            // Vue.set('validar_area_'+p.id,'','');
			        }*/

				},
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
					//var total=	this.horas_totales -total_a_restar;
					return total_a_restar;
					//this.h_pasadas= (this.$localStorage.get('h_Disponibles') > total)?true:false;
				} 

				return false;	
			   },
					tabs_areas:function(e,id){
						e.stopPropagation()
						this.id_tab=id;
						$('.editarModal').modal('show');
					},				
			          seguir:function(e){
			          	console.log("entre : "+this.id_tab);
			          	$('[data-id~="tab_'+this.id_tab+'"]').trigger('click')
			            $('.editarModal').modal('toggle');
			          },
				guardarDatos: function(id){

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
					}else{
						console.log("entro a guardar");
						  this.validar_requerimientos=true;
	                   // if(this.form_requerimiento_validado ==true ){
							toastr.success('Se han guardado los datos del Area seleccionada',"Datos Guadados Correctamente",this.option_toast);
							this.$localStorage.set('datos_requerimiento_'+id,JSON.stringify(requerimientos) );
							   this.validar_requerimientos=false;
						//}
					}
				


					/*var data_req=this.$localStorage.get('datos_requerimiento_'+id);
					var data_compra=this.$localStorage.get('datos_compra_'+id);
					var data_req = JSON.parse(data_req);
					var data_compra = JSON.parse(data_compra);
					var arreglo_requerimientos = data_req[0].requerimientos;
					var arreglo_compras = data_compra[0].compras;
				//	console.log(arreglo_requerimientos[0].model_nom);
					if (data_req == null && data_compra == null) {
						toastr.error("Todos los campos son obligatorios","Error al Guardar Requerimientos y Compras",this.option_toast);
						return false;
					}else if( !this.comprobarRequerimientos(arreglo_requerimientos) ){
						toastr.error("Recuerde que todos los campos son obligatorios, no puede dejar campos en blanco","Error en Requerimientos",this.option_toast);
						return false;
					}else if( !this.comprobarCompras(arreglo_compras) ){
							toastr.error("Recuerde que todos los campos son obligatorios, no puede dejar campos en blanco","Error en Compras Relacionadas",this.option_toast);
							return false;
					}else{
						toastr.success('Se han guardado los datos del Area seleccionada',"Datos Guadados Correctamente",this.option_toast);
						console.log(data_req);
						console.log(data_compra);
					}*/


					},
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
					comprobarCompras: function (arreglo) {
						for (let f in arreglo) {
				              let idx = Number(f)
				              let p = arreglo[idx]
											if (p.model_desc =="" || p.model_provedor== "" || p.model_valor== "" ) {
												return false;
												break;
											}
				        }
									return true;
					}
				/*	else if( arreglo_requerimientos.model_nom == '' && arreglo_requerimientos.model_horas == 0){
						console.log("entro al 2");
						toastr.error("Todos los campos son obligatorios","Error al Guardar Requerimientos y Compras",this.option_toast);
						return false;

					}*/



					/*if (arreglo_requerimientos.length > 0 && arreglo_compras.length > 0) {

						console.log("Vamos por buen camino");

					} else {
						console.log("ERROR");
						toastr.error("Todos los campos son obligatorios","Error al Guardar",this.option_toast);
					}*/


					/*
					//console.log(id);
					this.$emit('validar_requerimiento',id);
					var nombre= 'cosa'+id;
					this.nombre=true;*/


			}
		}

		Vue.component('encabezado',require('./encabezado.vue'));
		Vue.component('anadir_requerimiento',require('./anadir_requerimiento.vue'));
		Vue.component('anadir_compra',require('./anadir_compra_asociada.vue'));
		Vue.component('select_clientes', require('../herramientas/select_clientes.vue'));
		Vue.component('select_usuarios', require('../herramientas/select_usuarios.vue'));
		Vue.component('select_estados', require('../herramientas/select_estado.vue'));
	</script>
