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
				<div class="col-sm-6">
					<div class="form-group required" v-bind:class="[errors_return.nombre_solicitud,{ 'has-error': errors.has('nombre_solicitud') }]">
						<label for="nombre_solicitud"><sup>*</sup> Nombre de la Solicitud </label>
						<input id="nombre_solicitud" type="text" class="form-control" name="nombre_solicitud" v-validate data-vv-rules="required|min:4" required="required" v-model="solicitud.nombre_solicitud">
						<span class="help-block" v-show="errors.has('nombre_solicitud')">
							{{ errors.first('nombre_solicitud') }}
						</span>
					</div>
				</div>

				<div class="col-md-4">
					<label>Fecha entrega deseada</label>
					<div class="input-group date" >
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<datepicker language="es"  id="fecha_deseada_entrega" placeholder="Fecha entrega" class="form-control" name="fecha_deseada_entrega" format="dd-MM-yyyy" :disabled="disable_days"></datepicker>
					</div>
				</div>

				<div class="col-sm-2">
					<div class="form-group required">
						<label><sup>*</sup> Prioridad </label>
						<select_prioridad :select="prioridad"></select_prioridad>
					</div>
				</div>

			</div>
			<div class="row">
					<div class="col-sm-12">
						<div class="form-group required">
							<label><sup>*</sup> Descripción</label>
							<vue-html5-editor :content="solicitud.descripcion" :height="200" :z-index="0" @change="updateData"></vue-html5-editor>
						</div>
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
				disable_days: {
					days: [0, 6],
				},
				errors_return: {
					nombre_solicitud: '',
					descripcion: '',
				}
			}
		},
		created: function(){
			this.$on('send-prioridad', function(obj) {
				this.prioridad=obj;
			});

		},
		computed:{},
		watch: {},
		methods:{	
			updateData: function (data) {
                this.tarea.descripcion = data;
				this.errors_return.descripcion=false;
            },
			agregarInit: ()=>{
				this.$validator.validateAll();


			}

		},
	}


	Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));
</script>