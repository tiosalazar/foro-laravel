<template>
	<form role="form" name="crear_tarea" class="crear_tarea">
		<div class="box-body">
			<div class="form-group required">
				<label for="ot">Nombre el Projecto <sup>*</sup></label>
				<select_ot :select="select_ot"></select_ot>
			</div>
			<div class="row">
				<div class="col-sm-3 border-right">
					<div class="description-block">
						<h5 class="description-header">{{ot.referencia}}</h5>
						<span class="description-text">Referencia</span>
					</div>
					<!-- /.description-block -->
				</div>
				<!-- /.col -->
				<div class="col-sm-3 border-right">
					<div class="description-block">
						<h5 class="description-header">{{ot.nombre_cli}}</h5>
						<span class="description-text">Cliente</span>
					</div>
					<!-- /.description-block -->
				</div>
				<!-- /.col -->
				<div class="col-sm-3 border-right">
					<div class="description-block">
						<h5 class="description-header">{{ot.nombre}}</h5>
						<span class="description-text">Proyecto</span>
					</div>
					<!-- /.description-block -->
				</div>
				<!-- /.col -->
				<div class="col-sm-3">
					<div class="description-block">
						<h5 class="description-header">{{ot.nombre_ej}}</h5>
						<span class="description-text">Ejecutiva</span>
					</div>
					<!-- /.description-block -->
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="form-group">
				<label>Fecha de solicitud:</label>

				<div class="input-group">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<input type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" v-model="current_date" disabled="disabled">
				</div>
				<!-- /.input group -->
			</div>
			<div class="form-group required">
				<label>Prioridad <sup>*</sup></label>
				<select_prioridad :select="prioridad"></select_prioridad>
			</div>
			<div class="form-group required">
				<label>Fase del Projecto <sup>*</sup></label>
				<select_fase :select="fase"></select_fase>
			</div>
			<div class="form-group required">
				<label>Área <sup>*</sup></label>
				<select_area  :refresha="refresh"></select_area>
			</div>
			<label>Fecha entrega cliente</label>
			<div class="input-group date" >
				<div class="input-group-addon">
					<i class="fa fa-calendar"></i>
				</div>
				<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_entrega_cliente" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
			</div>
			<div class="form-group required" v-bind:class="[errors_return.nombre_tarea,{ 'has-error': errors.has('nombre_tarea') }]">
				<label for="nombre_tarea">Nombre de la Solicitud <sup>*</sup></label>
				<input type="text" class="form-control"  id="nombre_tarea" v-model="tarea.nombre_tarea" name="nombre_tarea" placeholder="Solicitud" v-validate data-vv-rules="required|min:4" required="required">
				<span  class="help-block" v-show="errors.has('nombre_tarea')">{{ errors.first('nombre_tarea') }}</span>
			</div>
			<div class="form-group required" v-bind:class="[errors_return.descripcion,{ 'has-error': errors.has('descripcion') }]">
				<label for="descripcion">Descripción <sup>*</sup></label>
				<textarea class="form-control" rows="3"  name="descripcion"  id="descripcion" v-model="tarea.descripcion" placeholder="Descripción" required="required" v-validate data-vv-rules="required|min:4"></textarea>
				<span  class="help-block" v-show="errors.has('descripcion')">{{ errors.first('descripcion') }}</span>
			</div>
			<div class="form-group" v-bind:class="[errors_return.enlaces_externos,{ 'has-error': errors.has('enlaces_externos') }]">
				<label for="enlaces_externos">Ruta del server</label>
				<!-- <textarea class="form-control" rows="3" name="enlaces_externos"  id="enlaces_externos" v-model="tarea.enlaces_externos" placeholder="Ruta del server" v-validate data-vv-rules="required|min:4"></textarea> -->
				<textarea class="form-control" rows="3" name="enlaces_externos"  id="enlaces_externos" v-model="tarea.enlaces_externos" placeholder="Ruta del server"></textarea>
				<!-- <span  class="help-block" v-show="errors.has('enlaces_externos')">{{ errors.first('enlaces_externos') }}</span> -->
			</div>
			<div class="form-group required">
				<label>Estado <sup>*</sup></label>
				<select_estados tipo_estado="1"  :select="estado" ></select_estados>
			</div>
			<div class="form-group">
				<label for="tiempo_mapa_cliente">T. Mapa del cliente</label>
				<input type="text" name="tiempo_mapa_cliente" id="tiempo_mapa_cliente" v-model="tarea.tiempo_mapa_cliente" class="form-control" placeholder="Tiempo Mapa del cliente">
			</div>
		</div>
		<!-- /.box-body -->

		<div class="box-footer text-center">
			<button type="button" class="btn btn-primary" v-on:click="agregarTarea()">Publicar</button>
		</div>
	</form>
</template>
<script>
	import Datepicker from 'vuejs-datepicker';
	import VeeValidate, { Validator } from 'vee-validate';

  	Vue.use(VeeValidate);
	module.exports = {
		components: {Datepicker,VeeValidate,Validator},
		data(){
			return{
				tarea:{
					nombre_tarea:'',
					descripcion:'',
					enlaces_externos:'',

				},
				select_ot:'',
				prioridad:'',
				estado:'',
				fase:'',
				ot:{},
				area:{},
				current_date:'',
				refresh:'',
				user:'',
				fecha_entrega_cliente:'',
				message:'',
				disabled:{
				  "to": new Date(),
				},
				errors_return:{
		          'nombre':'',
		          'nit':'',
		          'nombre_contacto':'',
		          'telefono':'',
		          'email':'',
		        },
		        option_toast:{
		          timeOut: 5000,
		          "positionClass": "toast-top-center",
		          "closeButton": true,
		        },
			}
		},
		created: function() {
			this.$on('send-ot', function(obj) { 
				this.ot= obj;
				this.select_ot= obj;
			});
			this.$on('area_option', function(obj) { 
				this.area= obj;
			});
			this.$on('select_estado', function(v) {
				this.estado=v;
			});
			this.$on('fase_option', function(obj) {
				this.fase=obj;
			});
			this.$on('send-prioridad', function(obj) {
				this.prioridad=obj;
			});
			this.current_date=this.getCurrentDate();
			this.user = this.$parent.id_user;

		},
		computed:{},
		watch: {},
		methods:{
			setErrors:function(object) {
		        this.message='';
		        var that = this;
		        $.each(object, function(index, value) {
		          that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
		          that.errors_return[index] = 'has-warning';
		        });
		    },
			getCurrentDate:function(data='') {
				var today;
				if (!data) {
					today = new Date();
					var dd = today.getDate();
					var mm = today.getMonth()+1; //January is 0!
					var yyyy = today.getFullYear();
					var HH = today.getHours(); 
					var MM = today.getMinutes(); 
					var ss = today.getSeconds();
					if(dd<10) {
						dd='0'+dd
					} 
					if(mm<10) {
						mm='0'+mm
					} 
					if(HH<10) {
						HH='0'+HH
					} 
					if(MM<10) {
						MM='0'+MM
					}
					if(ss<10) {
						ss='0'+ss
					} 
					today = yyyy +'-' + dd+'-'+ mm +' '+ HH + ':' + MM + ':' + ss;
				} else {
					today = new Date(data)
					let fecha1=today.toISOString();
					var arreglo_nuevo=fecha1.split("T");
					console.log(arreglo_nuevo[0]);
					today = arreglo_nuevo[0];
				}
				
				return today;
			},
			agregarTarea:function(e) {
				this.tarea.fecha_entrega_cliente = (this.fecha_entrega_cliente)?this.getCurrentDate(this.fecha_entrega_cliente):null;
				this.$validator.validateAll();
		        if (this.errors.any()) {
		          return false
		        }
				this.tarea.estados_id = this.estado.id;
				this.tarea.ots_id= this.ot.id;
				this.tarea.planeacion_fases_id = this.fase.id;
				this.tarea.areas_id = this.area.id;
				this.tarea.usuarios_id = this.user;
				console.log(this.tarea);
				this.$http.post('api/v1/tareas',this.tarea)
		         .then(function(respuesta){
		           if (respuesta.status != '200') {
			            if (Object.keys(respuesta.body.obj).length>0) {
			              this.setErrors(respuesta.body.obj);
			            }
			            toastr.warning(this.message,respuesta.body.msg,this.option_toast);
			          } else {
			            toastr.success(respuesta.body.msg,'',this.option_toast);
			            this.tarea= {};
			            this.select_ot='';
			            this.prioridad='';
			            this.fase='';
			            this.estado="";
			            this.refresh=0;
			            this.fecha_entrega_cliente = '';
			          }
		           console.log(respuesta);
		         }, (response) => {
		          if (Object.keys(response.body.obj).length>0) {
		            this.setErrors(response.body.obj);
		          }
		          toastr.error(this.message,response.body.msg,this.option_toast);
		        });
			},
		},
		mounted() {}
}
Vue.component('select_estados',require('../herramientas/select_estado.vue'));
Vue.component('select_area',require('../herramientas/select_area.vue'));
Vue.component('select_fase',require('../herramientas/select_fase.vue'));
Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));
Vue.component('select_ot',require('../herramientas/select_ot.vue'));
Vue.component('select_area',require('../herramientas/select_area.vue'));
Vue.component('select_rol',require('../herramientas/select_rol.vue'));
</script>