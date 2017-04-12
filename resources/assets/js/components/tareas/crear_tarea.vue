<template>
	<form role="form" name="crear_tarea" class="crear_tarea">
		<div class="box-body col-sm-12">
			<div class="form-group required">
				<label for="ot"><sup>*</sup> Nombre el Projecto </label>
				<select_ot :select="select_ot"></select_ot>
			</div>
			<div class="row desc-ot with-border">
				<div class="col-sm-6 border-right">
					<ul>
						<li><strong>Numero de OT:</strong><span> #{{ot.referencia}}</span></li>
						<li><strong>Ejecutiva:</strong><span> {{ot.usuario_nombre}} - {{ot.usuario_apellido}}  </span></li>
						<li><strong>Fecha de Solicitud:</strong><span> {{current_date}}</span></li>
					</ul>
				</div>
				<div class="col-sm-6">
					<ul>
						<li><strong>Proyecto:</strong><span> {{ot.nombre}}</span></li>
						<li><strong>Cliente:</strong><span> {{ot.cliente_nombre}}</span></li>
					</ul>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-3 col-xs-4">
					<label for="valor_total" class="col-sm-12 ">Tarea Recuerrente </label>
					<div class="row" v-bind:class="{ 'has-error': errors.has('recurrente') }">
						<div class="col-sm-4 col-xs-6 formulario">
							<input type="radio" name="recurrente" value="1" id="si" v-model="tarea.recurrente"  required="required" ><label for="si"> Si</label>
						</div>
						<div class="col-sm-4 col-xs-6 formulario" >
							<input type="radio" name="recurrente" value="0" id="no" v-model="tarea.recurrente"   required="required"  > <label for="no"> No</label>
						</div>
						<span  class="help-block" v-show="errors.has('recurrente')">{{ errors.first('recurrente') }}</span>
					</div>
				</div>
				<div class="" v-if="tarea.recurrente=='1'">
					<div class="col-md-4">
						<label>Fecha inicio de recurrencia</label>
						<div class="input-group date" >
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_inicio_recurrencia" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
						</div>
					</div>
					<div class="col-md-4">
						<label>Fecha final de recurrencia</label>
						<div class="input-group date" >
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_final_recurrencia" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
						</div>
					</div>
				</div>
			</div>
			<br>
			<!-- /.row -->
			<div class="row">
				<div class="col-sm-2">
					<div class="form-group required">
						<label><sup>*</sup> Prioridad </label>
						<select_prioridad :select="prioridad"></select_prioridad>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group required">
						<label><sup>*</sup> Área </label>
						<select_area  :refresha="area" compras="true"></select_area>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group required">
						<label><sup>*</sup> Fase del Projecto </label>
						<select_fase :select="fase" :area="area"></select_fase>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col-sm-4">
					<label>Fecha entrega cliente</label>
					<div class="input-group date" >
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_entrega_cliente" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group required" v-bind:class="[errors_return.nombre_tarea,{ 'has-error': errors.has('nombre_tarea') }]">
						<label for="nombre_tarea"><sup>*</sup> Nombre de la Solicitud </label>
						<input type="text" class="form-control"  id="nombre_tarea" v-model="tarea.nombre_tarea" name="nombre_tarea" placeholder="Solicitud" v-validate data-vv-rules="required|min:4" required="required">
						<span  class="help-block" v-show="errors.has('nombre_tarea')">{{ errors.first('nombre_tarea') }}</span>
					</div>
				</div>
			</div>



			<div class="form-group required" v-bind:class="[errors_return.descripcion,{ 'has-error': errors.has('descripcion') }]">
				<label for="descripcion"><sup>*</sup> Descripción </label>
				<vue-html5-editor :content="tarea.descripcion" :height="200"  :z-index="0" @change="updateData"></vue-html5-editor>
				<!-- <textarea  v-model="tarea.descripcion"  name="descripcion"  id="descripcion"  placeholder="Descripción" required="required" v-validate data-vv-rules="required|min:4"></textarea>-->
				<span  class="has-error" style="color:#DD4B39;" v-show="errors_return.descripcion"> Campo Descripcion Obligatorio </span>
			</div>

			<div class="form-group" v-bind:class="[errors_return.enlaces_externos,{ 'has-error': errors.has('enlaces_externos') }]">
				<label for="enlaces_externos">Ruta del server</label>
				<textarea class="form-control" rows="3" name="enlaces_externos"  id="enlaces_externos" v-model="tarea.enlaces_externos" placeholder="Ruta del server"></textarea>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<div class="form-group required">
						<label><sup>*</sup> Estado </label>
						<select_estados tipo_estado="1"  :select="estado" ></select_estados>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="tiempo_mapa_cliente">Tiempo estimado mapa del cliente</label>
						<input type="text" name="tiempo_mapa_cliente" id="tiempo_mapa_cliente" v-model="tarea.tiempo_mapa_cliente" class="form-control" placeholder="Tiempo mapa del cliente">
					</div>
				</div>
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
	import moment from 'moment';
	import VueHtml5Editor from 'vue-html5-editor';
    Vue.use(VueHtml5Editor);

  	Vue.use(VeeValidate);
	module.exports = {
		components: {Datepicker,VeeValidate,Validator},
		data(){
			return{
				tarea:{
					nombre_tarea:'',
					descripcion:'',
					enlaces_externos:'',
					recurrente:0,

				},
				select_ot:'',
				prioridad:'',
				estado:'',
				fase:'',
				ot:{
					usuario:'',
					cliente:''
				},
				area:{},
				current_date:'',
				user:'',
				fecha_entrega_cliente:'',
				fecha_inicio_recurrencia:'',
				fecha_final_recurrencia:'',
				message:'',
				disabled:{
				  "to": moment().subtract(1, 'days').toDate(),
				},
				errors_return:{
		          'nombre':'',
		          'nit':'',
		          'nombre_contacto':'',
		          'telefono':'',
		          'email':'',
				  'descripcion':'',
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
				// console.log('cliente',obj.cliente.nombre)
				this.select_ot= obj;
			});
			this.$on('area_option', function(obj) {
				console.log(obj)
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
			if (this.$parent.area != 0) {
				this.area = this.$parent.area;
			}
			console.log('area',this.area);
		},
		computed:{},
		watch: {},
		methods:{
			setErrors:function(object) {
		        this.message='';
		        let that = this;
		        $.each(object, function(index, value) {
							let campo = index.replace(/_id/g, '');
							campo = campo.replace(/_/g, ' ');
							value = value[0].replace(/ id /g, '');
							that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
		          that.errors_return[index] = 'has-warning';
		        });
		    },
			getCurrentDate:function(data='') {
				let today = moment().format('DD-MMM-YYYY HH:mm:ss');
				return today;
			},
			updateData: function (data) {
                // sync content to component
                this.tarea.descripcion = data;
				this.errors_return.descripcion=false;
            },
			agregarTarea:function(e) {

				if(this.tarea.descripcion==""){
					this.errors.descripcion=true;
					 return false;
				}
				// Serializo la fecha del datepicker
				// y la asigno a la tarea
				this.tarea.fecha_entrega_cliente =
					(this.fecha_entrega_cliente)?moment(this.fecha_entrega_cliente).format('YYYY-MM-DD HH:mm:ss'):null;
				this.tarea.fecha_inicio_recurrencia =
					(this.fecha_inicio_recurrencia)?moment(this.fecha_inicio_recurrencia).format('YYYY-MM-DD HH:mm:ss'):null;
				this.tarea.fecha_final_recurrencia =
					(this.fecha_final_recurrencia)?moment(this.fecha_final_recurrencia).format('YYYY-MM-DD HH:mm:ss'):null;
				this.tarea.tiempo_mapa_cliente =
					(this.tarea.tiempo_mapa_cliente)?this.tarea.tiempo_mapa_cliente:null;
				this.$validator.validateAll();
		    if (this.errors.any()) {
		      return false
		    }
				this.tarea.recurrente = parseInt(this.tarea.recurrente);
				this.tarea.estados_id = this.estado.id;
				this.tarea.ots_id= this.ot.id;
				this.tarea.planeacion_fases_id = this.fase.id;
				this.tarea.areas_id = this.area.id;
				this.tarea.usuarios_id = this.user;
				this.tarea.prioridad_id=this.prioridad.id;

				let that = this;
				this.$http.post(window._apiURL+'tareas',this.tarea)
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
			            this.ot={usuario:{}, cliente:{} };
			            this.current_date=moment().format('DD-MMM-YYYY HH:mm:ss');
			            this.prioridad='';
			            this.fase='';
			            this.estado="";
			            this.area=0;
			            this.fecha_entrega_cliente = '';
			            setTimeout(function(){ that.errors.clear(); }, 50);
			          }
		           console.log(respuesta);
		         }, (err) => {
							 if (err.status == 404) {
 		            toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
 		          } else {
 		            if (Object.keys(err.body.obj).length>0) {
 		              this.setErrors(err.body.obj);
 		            }else{
 		              that.message = err.body.error;
 		            }
								console.log(err)
 		            toastr.error(this.message,err.body.msg,this.option_toast);
 		          }
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
