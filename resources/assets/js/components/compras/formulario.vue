<template>
	<form role="form" name="crear_tarea" class="crear_tarea">
		<div class="box-body col-sm-12">
			<div class="form-group required">
				<label for="ot"><sup>*</sup> Seleccione la OT</label>
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
						<li><strong>Cliente:</strong><span> {{ot.cliente}}</span></li>
					</ul>
				</div>
				<!-- /.col -->
			</div>
			  <anadir_compra campos_extra="1" ></anadir_compra>

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
				ot:{
					usuario:'',
					cliente:''
				},
				area:{},
				current_date:'',
				refresh:'',
				user:'',
				fecha_entrega_cliente:'',
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
			agregarTarea:function(e) {
				// Serializo la fecha del datepicker
				// y la asigno a la tarea
				this.tarea.fecha_entrega_cliente =
					(this.fecha_entrega_cliente)?moment(this.fecha_entrega_cliente).format('YYYY-MM-DD : HH:mm:ss'):null;
				this.tarea.tiempo_mapa_cliente =
					(this.tarea.tiempo_mapa_cliente)?this.tarea.tiempo_mapa_cliente:null;
				this.$validator.validateAll();
		    if (this.errors.any()) {
		      return false
		    }
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
			            this.ot={usuario:{nombre:''}, cliente:{nombre:''} };
			            this.current_date=moment().format('DD-MMM-YYYY HH:mm:ss');
			            this.prioridad='';
			            this.fase='';
			            this.estado="";
			            this.refresh=0;
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
Vue.component('anadir_compra',require('../ots/anadir_compra_asociada.vue'));
</script>
