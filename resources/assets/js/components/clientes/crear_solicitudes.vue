<!--
	Nombre de solicitud
	descripcion	
	archivos	(rutas)
	fecha_ideal_entrega (date)
	estados (int)
	cliente	(int)
	creado      -| (timestamp)
	actualizado -| (timestamp)

	
	*pendiente
		encargado NULL (int)

		(usuarios_id) (int)
		

		fecha deseada de entrega, bloquear domingos, festivos y sabados

-->
<template>
	<form role="form" name="crear_solicitudes" class="crear_solicitudes">
		<div class="box-body">
			<div class="row">
				<div class="col-sm-12 col-md-6">
					<div class="form-group required" v-bind:class="[errors_return.nombre_solicitud,{ 'has-error': errors.has('nombre_solicitud') }]">
						<label for="nombre_solicitud"><sup>*</sup> Nombre de la Solicitud </label>
						<input id="nombre_solicitud" type="text" class="form-control" name="nombre_solicitud" v-validate data-vv-rules="required|min:4" required="required" v-model="solicitud.nombre_solicitud">
						<span class="help-block" v-show="errors.has('nombre_solicitud')">
							{{ errors.first('nombre_solicitud') }}
						</span>
					</div>
				</div>

				<div class="col-md-4 col-sm-6">
					<label>Fecha entrega deseada</label>
					<div class="input-group date" >
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<datepicker language="es"  id="fecha_deseada_entrega" placeholder="Fecha entrega" class="form-control" name="fecha_deseada_entrega" format="dd-MM-yyyy" :disabled="disable_days" v-model="fecha_deseada_cliente"></datepicker>
					</div>
				</div>

				<div class="col-md-2 col-sm-6">
					<div class="form-group required" v-bind:class="{ 'has-error': (errors_return.prioridad) }">
						<label><sup>*</sup>Prioridad</label>
						<select_prioridad :select="prioridad"></select_prioridad>
					</div>
				</div>

			</div>
			<div class="row">
					<div class="col-sm-12" v-bind:class="{ 'has-error': (errors_return.prioridad) }">
						<div class="form-group required">
							<label><sup>*</sup> Descripción</label>
							<vue-html5-editor required="required" :content="solicitud.descripcion" :height="200" :z-index="0" @change="updateData"></vue-html5-editor>
						</div>
						<span class="help-block" v-show="errors_return.descripcion">
							{{ error_msg.descripcion }}
						</span>
					</div>
			</div>
			<!-- <div class="row">
				<input_multiple_files></input_multiple_files>
			</div> -->
		</div>
		<div class="box-footer text-center">
			<button type="button" class="btn btn-primary" v-on:click="agregarInit">Publicar</button>
		</div>
	</form>
</template>


<script>
	import Datepicker from 'vuejs-datepicker';
	import VeeValidate, { Validator } from 'vee-validate';
	import moment from 'moment';
	import VueHtml5Editor from 'vue-html5-editor';

    Vue.use(VueHtml5Editor);
  	Vue.use(VeeValidate);

	module.exports = {
		components: {Datepicker,VeeValidate,Validator},
		data(){
			return{
				solicitud: {
					nombre_solicitud: '',
					descripcion: '',
				},
				prioridad: '',
				fecha_deseada_cliente: '',
				solicitud_nueva: [],
				disable_days: {
					days: [0, 6],
				},
				errors_return: {
					nombre_solicitud: '',
					descripcion: '',
					prioridad: '',
				},
				error_msg: {
					prioridad: 'El campo prioridad es obligatorio.',
					descripcion: 'El campo descripcion es obligatorio.'
				}

			}
		},
		created: function(){
			this.$on('send-prioridad', function(obj) {
				this.prioridad=obj;
				console.log("sad");
			});

		},
		computed:{},

		watch: {},
		methods:{	
			updateData: function (data) {
                this.solicitud.descripcion = data;
				this.errors_return.descripcion=false;
            },
			agregarInit: function(){
				this.$validator.validateAll();
				console.log(this.solicitud);
				console.log(this.errors_return);
				if(this.prioridad==''){
					this.errors_return.prioridad = true;
					return false;
				}
				if(this.solicitud.descripcion==''){
					this.errors_return.descripcion = true;
					return false;
				}
				 if (!this.errors.any()) {
						this.solicitud_nueva['nombre'] = this.solicitud.nombre_solicitud;
						this.solicitud_nueva['descripcion'] = this.solicitud.descripcion;
						this.solicitud_nueva['fecha_ideal_entrega'] = this.fecha_deseada_cliente;
						this.solicitud_nueva['prioridad_id'] = this.prioridad;
						this.solicitud_nueva['estados_id'] = 23;
				 }

				 console.log(this.solicitud_nueva);

			}

		},
	}


	Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));
	

	//toastr.success("respuesta.body.msg",'',"this.option_toast");
</script>

