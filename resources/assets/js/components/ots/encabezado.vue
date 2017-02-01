<template>
	<div class="box box-primary"  id="encabezado_ot">
		<div class="box-header with-border">
			<h3 class="box-title">Detalle OT</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group required ">
						<label for="num_ot" class="col-sm-4 control-label "># OT  <sup>*</sup></label>
						<div class="col-sm-8" v-bind:class="{ 'has-error': errors.has('num_ot') }">
							<input type="text"  name="num_ot" v-validate data-vv-rules="required|alpha_num|min:3" data-vv-as="# OT" v-model="num_ot" class="form-control" id="num_ot" placeholder="Numero OT">
							<span  class="help-block" v-show="errors.has('num_ot')">{{ errors.first('num_ot') }}</span>
						</div>
					</div>
					<div class="form-group required">
						<label for="cliente" class="col-sm-4 ">Cliente  <sup>*</sup> </label>
						<div class="col-sm-8" >
							<select_clientes></select_clientes>
						</div>
					</div>
					<div class="form-group required">
						<label for="name_proyecto" class="col-sm-4 ">Proyecto   <sup>*</sup></label>
						<div class="col-sm-8"  v-bind:class="{ 'has-error': errors.has('name_proyect') }">
							<input type="text" name="name_proyect" class="form-control" v-validate data-vv-rules="required|min:5" data-vv-as="Proyecto" required="required"  v-model="name_proyect" id="name_proyecto" placeholder="Nombre del Proyecto">
							<span  class="help-block" v-show="errors.has('name_proyect')">{{ errors.first('name_proyect') }}</span>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group required">
						<label for="estado" class="col-sm-4 ">Estado  <sup>*</sup></label>
						<div class="col-sm-8">
							<select_estados tipo_estado="2"   name="estado" v-validate data-vv-rules="required" data-vv-as="Estado" ></select_estados>
							<span  class="help-block" v-show="errors.has('estado')">{{ errors.first('estado') }}</span>
						</div>
					</div>
					<div class="form-group required">
						<label for="valor_total" class="col-sm-4 ">Valor Total <sup>*</sup></label>
						<div class="col-sm-8" v-bind:class="{ 'has-error': errors.has('valor_total') }">
							<input type="text" name="valor_total" v-validate data-vv-rules="required|numeric|min:4" data-vv-as="Valor Total" class="form-control" required="required"  v-model="valor_total" id="valor_total" placeholder="Valor Total">
							<span  class="help-block" v-show="errors.has('valor_total')">{{ errors.first('valor_total') }}</span>
						</div>
					</div>
					<div class="form-group required">
						<label for="horas_totales" class="col-sm-4 ">Horas Totales  <sup>*</sup></label>
						<div class="col-sm-8" v-bind:class="{ 'has-error': errors.has('horas_totales') }">
							<input type="text" class="form-control" required="required" name="horas_totales"  v-validate data-vv-rules="required|decimal:1|max:10|min:1" data-vv-as="Horas Totales" v-model="horas_totales"  id="horas_totales" placeholder="Numero de Totales">
							<span  class="help-block" v-show="errors.has('horas_totales')">{{ errors.first('horas_totales') }}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div  class="col-md-6">
					<div class="form-group required">
						<label for="ejecutivo" class="col-sm-4 ">Ejecutivo  <sup>*</sup></label>
						<div class="col-sm-8">
							<select_usuarios  area="1" ></select_usuarios>
						</div>
					</div>
				</div>
			</div>
			<div style="height:15px"></div>
			<div class="row ">
				<div class="col-md-6 col-xs-7">
					<div class="form-group col-md-6 nopadding required">
						<label for="fecha_inicio" class="col-sm-3 nopadding ">Inicio <sup>*</sup></label>
						<div class="col-sm-9">
							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<datepicker language="es" id="fecha_inicio" required="required" placeholder="Fecha de Inicio" :value="date"  :disabled="state.disabled" v-model="fecha_inicio" name="fecha_inicio" class="form-control"  format="dd-MM-yyyy"></datepicker>
							</div>
						</div>
					</div>
					<div class="form-group col-md-6 nopadding required">
						<label for="fecha_fin" class="col-sm-3 nopadding  ">Fín <sup>*</sup> </label>
						<div class="col-sm-9" v-bind:class="{ 'has-error': errors.has('fecha_fin') }">
							<div class="input-group date"  >
								<div class="input-group-addon" >
									<i class="fa fa-calendar"></i>
								</div>
								<datepicker language="es"  id="fecha_fin" required="required"  v-validate data-vv-rules="required" data-vv-as="Fecha de finalización" placeholder="Fecha fin"  :disabled="state.disabled" v-model="fecha_fin" class="form-control"  name="fecha_fin" format="dd-MM-yyyy"></datepicker>
							</div>
							<span  class="help-block" v-show="errors.has('fecha_fin')">{{ errors.first('fecha_fin') }}</span>
						</div>					
					</div>
				</div>
				<div class="col-md-6 col-xs-5">
					<div class="form-group required">
						<label for="horas_disponibles" class="col-sm-4 ">Horas Disponibles <sup>*</sup></label>
						<div class="col-sm-6">
							<input type="text" class="form-control" required="required"  id="horas_disponibles" :value="h_Disponibles" disabled placeholder="Numero de Horas Disponibles">
						</div>
					</div>
				</div>
			</div><!-- /.row -->
			<div style="height:15px"></div>
			<div class="row ">
				<div class=" pull-right  col-md-3">
					<button type="submit" @click="validateBeforeSubmit" class="btn btn-block btn-success col-sm-3">Guardar Avance</button> 
				</div>
			</div>
		</div>
	</div>
</template>

<script>
        /*DSO 26-01-2017
          Realizo los Required
          */
          import Datepicker from 'vuejs-datepicker';
          import VueLocalStorage from 'vue-localstorage'

          import VeeValidate, { Validator } from 'vee-validate';
		//Traducciones del validador
		import messages from '../../es/es';

       //Realizando los Use

       //Uso LocalStorage para gardar la data.
       Vue.use(VueLocalStorage);		
		// Merge the locales.
		Validator.updateDictionary({es: { messages }});
		// Install the plugin and set the locale.
		Vue.use(VeeValidate, { locale: 'es' });

		module.exports= {
			components: {Datepicker,VueLocalStorage,VeeValidate,Validator},
			localStorage: {
				clientes: {
					type: Object,
				},
				ejecutivo_seleccionado: {
					type: Object,
				},
				estado_ot: {
					type: Object,
				},
				num_ot: {
					type: Number
				},
				h_Disponibles: {
					type: Number
				},
				name_proyect: {
					type: String
				},
				valor_total: {
					type: String
				},
				horas_totales:{
					type: String
				}
			},
			data () {
				return {
					fecha_inicio:'',
					cliente:'',
					ejecutivo:'',
					htotal:'',
					estado:'',
					num_ot:'',
					name_proyect:'',
					valor_total:'',
					horas_totales:'',
					fecha_fin:'',
					message :'',
					option_toast:{
						timeOut: 5000,
						"positionClass": "toast-top-center",
						"closeButton": true,
					},
					formSubmitted: false,
					state: {
						disabled: {
								        to: new Date(), // Disable all dates up to specific date
								      //  from: new Date(2017,5,2), // Disable all dates after specific date
								        days: [0] // Disable Saturday's and Sunday's
								    }
								}
							}
						},
						computed:{
				h_Disponibles:function(){

					this.horas_totales - this.$localStorage.get('htotales');

					return this.$localStorage.get('num_ot')
				},/*
				name_proyect:function(){
					return this.$localStorage.get('name_proyect')
				},
				valor_total:function(){
					return this.$localStorage.get('valor_total')
				},
				horas_totales:function(){
					return this.$localStorage.get('horas_totales')
				},
				fecha_fin:function(){
					return this.$localStorage.get('fecha_fin')
				},*/
				date: function () {
					/*
					var today = new Date();
					var dd = today.getDate();
					var mm = today.getMonth()+1; //January is 0!

					var yyyy = today.getFullYear();
					if(dd<10){
					    dd='0'+dd;
					} 
					if(mm<10){
					    mm='0'+mm;
					} 
					var today = dd+'-'+mm+'-'+yyyy;*/
					return new Date()
				}
			},
			methods:{
                fetchTips: function(){
				this.num_ot=this.$localStorage.get('num_ot');
				this.name_proyect= this.$localStorage.get('name_proyect');
				this.valor_total	= this.$localStorage.get('valor_total');
				this.horas_totales= this.$localStorage.get('horas_totales');
				this.fecha_fin= this.$localStorage.get('fecha_fin');

			},

					/*let lsValue = this.$localStorage.get('someObject')
						 this.$localStorage.set('someBoolean', true)
						 this.$localStorage.remove('stringOne')*/
						 validateBeforeSubmit(e) {

						 	this.$validator.validateAll();
						 	if (!this.errors.any()) {
						 		if(this.$localStorage.get('clientes') == null){
						 			toastr.error('No se olvide de elegir al cliente',"Error al guardar los datos",this.option_toast);
						 		}else if(this.$localStorage.get('estado_ot') == null){
						 			toastr.error('No se Olvide elegir el estado de la OT',"Error al guardar los datos",this.option_toast);
						 		}else if(this.$localStorage.get('ejecutivo_seleccionado') == null){
						 			toastr.error('No se Olvide de elegir a quien esta asignado',"Error al guardar los datos",this.option_toast);
						 		}else{
						 		toastr.success('Puede seguir Editando la OT o Regresar más tarde para Continuar con la edición',"Datos Guadados Correctamente",this.option_toast);
						 		this.$localStorage.set('num_ot',this.num_ot);
						 		this.$localStorage.set('name_proyect',this.name_proyect);
						 		this.$localStorage.set('valor_total',this.valor_total);
						 		this.$localStorage.set('horas_totales',this.horas_totales);
						 		this.$localStorage.set('fecha_fin',this.fecha_fin);
						 		}
			            //this.submitForm()
			        }
			        
			    },
			    submitForm(){
			    	this.formSubmitted = true
			    }

			}
		}
	</script>
