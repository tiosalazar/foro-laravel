<template>
	<div>
		<encabezado ></encabezado>
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">Requerimientos y Compras</h3>
			</div>
			<div class="box-body">
				<div class="col-md-12">
					<!-- Custom Tabs -->
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs" >
							<li v-for="area in listado_areas" :class="{'active': area.nombre=='Creatividad' } " ><a :href="'#tab_'+area.id" data-toggle="tab">{{area.nombre}}</a></li>
						</ul>
						<div class="tab-content" >
							<div class="tab-pane"  v-for="area in listado_areas" :class="{ 'active': area.nombre=='Creatividad'  }"  :id="'tab_'+area.id">
								<div class="row"> <anadir_requerimiento :area="area.nombre" :id_area="area.id"  ></anadir_requerimiento></div>
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
					h_Disponibles:50,
					h_AreaDiseno:0,
					num_ot:0,
					listado_areas:[],
					name_proyect:'',
					estado:'',
					valor_total:'',
					horas_totales:'',
					ejecutivo:'',
					fecha_fin:'',
					fecha_inicio:'',
					cliente:[],
					option_toast:{
					timeOut: 5000,
					"positionClass": "toast-top-center",
					"closeButton": true,
				     }
				}
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

			},
			methods:{
				fetchTips: function(){
					if(this.$localStorage.get('listado_areas') ==null){
						this.$http.get('api/v1/areas/')
						.then(function(respuesta){
							this.listado_areas=this.$localStorage.set('listado_areas',respuesta.body);
							console.log(respuesta.body);
						}.bind(this));
					}else{
						this.listado_areas=this.$localStorage.get('listado_areas');
					}

					/*for (let f in this.listado_areas) {
			              let idx = Number(f)
			              let p = this.listado_areas[idx]
			             this.$set(p, 'validar_area_'+p.id, 'lllll')
			             console.log(this.validar_area_17)

			            //this.$set(this.someObject, 'b', 2)
			            // Vue.set('validar_area_'+p.id,'','');
			        }*/
            
				},
				guardarDatos: function(id){	

					var data_req=this.$localStorage.get('datos_requerimiento_'+id);
					var data_compra=this.$localStorage.get('datos_compra_'+id);
					var data_req = JSON.parse(data_req);
					var data_compra = JSON.parse(data_compra);
					var arreglo_requerimientos = data_req[0].requerimientos;
					var arreglo_compras = data_compra[0].compras;
					console.log(arreglo_requerimientos);
					if (data_req == null && data_compra == null) {
						toastr.error("Todos los campos son obligatorios","Error al Guardar Requerimientos y Compras",this.option_toast);
						return false;
					}else if( data_req[0].requerimientos.model_nom == '' ){
						console.log("entro al 2");
						toastr.error("Todos los campos son obligatorios","Error al Guardar Requerimientos y Compras",this.option_toast);
						return false;

					} 

					

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
		}

		Vue.component('encabezado',require('./encabezado.vue'));
		Vue.component('anadir_requerimiento',require('./anadir_requerimiento.vue'));
		Vue.component('anadir_compra',require('./anadir_compra_asociada.vue'));
		Vue.component('select_clientes', require('../herramientas/select_clientes.vue'));
		Vue.component('select_usuarios', require('../herramientas/select_usuarios.vue'));
		Vue.component('select_estados', require('../herramientas/select_estado.vue'));
	</script>
