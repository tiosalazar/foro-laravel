<template>
	<form role="form" name="crear_tarea" class="crear_tarea">
		<div class="box-body col-sm-12">
			<div class="form-group required" v-show="editar != 'true'">
				<label for="ot"><sup>*</sup> Seleccione la OT</label>
				<select_ot :select="select_ot" ></select_ot>
			</div>
			<div class="row desc-ot with-border">
				<div class="col-sm-6 border-right">
					<ul>
						<li><strong>Numero de OT:</strong><span> #{{ot.referencia}}</span></li>
						<li><strong>Ejecutiva:</strong><span> {{ot.usuario_nombre}} - {{ot.usuario_apellido}}  </span></li>
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

			<button type="button" class="btn btn-primary btn-flat " v-on:click="agregarCompras()">Guardar Compras</button>
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
	props:['editar','datos_compras_editar'],
	data(){
		return{
			select_ot:'',
			ot:{
				usuario:'',
				cliente:''
			},
			area:{},
			refresh:'',
			user:'',
			datos_compras:[],
			message:'',
			disabled:{
				"to": moment().subtract(1, 'days').toDate(),
			},
			errors_return:{
				'provedor':'',
				'valor':'',
				'fecha_transaccion':'',
				'descripcion':'',
				'ots_id':'',
				'areas_id':'',
				'divisas_id':'',
				'estados_id':'',
			},
			option_toast:{
				timeOut: 5000,
				"positionClass": "toast-top-center",
				"closeButton": true,
			},
		}
	},
	created: function() {
		this.llenarCampos();
		this.$on('send-ot', function(obj) {
			this.ot= obj;
			this.select_ot= obj;
		});
		/*
		Escucha el arreglo completo de los datos de las compras asociadas, si las tiene
		*/
		this.$on('datos_compras', function(v) {
			this.datos_compras=v;
		});
		this.user = this.$parent.id_user;
	},
	methods:{
		llenarCampos:function(){
			if(this.editar =='true'){
         console.log( JSON.parse(this.datos_compras_editar));
					 this.datos_compras= JSON.parse(this.datos_compras_editar);
					 this.ot=this.datos_compras.ot;
			}
		},
		setErrors:function(object) {
			this.message='';
			let that = this;
			$.each(object, function(index, value) {
				let campo = index.replace(/_id/g, ' ');
				campo = campo.replace(/_/g, ' ');
				value = value[0].replace(/ id /g, ' ');
				that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
				that.errors_return[index] = 'has-warning';
			});
		},
		agregarCompras:function(e){
			var datos_procesados={
				compras: this.procesarCompras()
			};
			if (this.editar != 'true') {
				this.$http.post(window._apiURL+'compra', datos_procesados)
				.then(function(respuesta){
					console.log(respuesta);
					if (respuesta.status == '500') {
						toastr.error("Ocurrio un error  500 del sistema por favor contacte con Soporte",response.statusText,this.option_toast);
						return false;
					}else if (respuesta.status != '200') {
						if (Object.keys(respuesta.body.obj).length>0) {
							this.setErrors(respuesta.body.obj);
						}
						toastr.warning(this.message,respuesta.body.msg,this.option_toast);
					}else{
						toastr.success(respuesta.body.msg,'',this.option_toast);
						this.datos_compras=[];
						setTimeout(function () {
							location.reload(true);
						}, 500);
					}
				},(response) => {
					console.log(response);
					if (response.body.error_creacion) {
						toastr.error("Ocurrio un error del sistema por favor contacte con Soporte",response.body.error,this.option_toast);
						return false;
					}
					if (Object.keys(response.body.obj).length>0) {
						this.setErrors(response.body.obj);
						toastr.error(this.message,response.body.msg,this.option_toast);
						return false;
					}
				});
			}else{
				this.$http.put(window._apiURL+'compra', datos_procesados)
				.then(function(respuesta){
					console.log(respuesta);
					if (respuesta.status == '500') {
						toastr.error("Ocurrio un error  500 del sistema por favor contacte con Soporte",response.statusText,this.option_toast);
						return false;
					}else if (respuesta.status != '200') {
						if (Object.keys(respuesta.body.obj).length>0) {
							this.setErrors(respuesta.body.obj);
						}
						toastr.warning(this.message,respuesta.body.msg,this.option_toast);
					}else{
						toastr.success(respuesta.body.msg,'',this.option_toast);
						this.datos_compras=[];
						setTimeout(function () {
							location.reload(true);
						}, 500);
					}
				},(response) => {
					console.log(response);
					if (response.body.error_creacion) {
						toastr.error("Ocurrio un error del sistema por favor contacte con Soporte",response.body.error,this.option_toast);
						return false;
					}
					if (Object.keys(response.body.obj).length>0) {
						this.setErrors(response.body.obj);
						toastr.error(this.message,response.body.msg,this.option_toast);
						return false;
					}
				});

			}

		},
		procesarCompras(){
			var arreglo_temporal=[];
			var id_ot=this.ot.id;
			var hora_a=this.datos_compras;
			var size = Object.keys(hora_a).length;
			if (hora_a !=null && hora_a !=undefined && hora_a !=[] &&  size > 0 ) {
				var i=0;
				hora_a=hora_a[0].compras;
				for(let f in hora_a ){
					if (hora_a[i].model_desc !="" && hora_a[i].model_provedor !=""  && hora_a[i].model_valor !="") {
						console.log(hora_a[i]);
						var tipo_compra = hora_a[i].tipo_compra;
						var divisa = hora_a[i].divisa;
						var estado = hora_a[i].estado;
						var area = hora_a[i].area;
						var data={
							areas_id:area.id,
							tipos_compras_id: tipo_compra.id,
							divisas_id: divisa.id,
							descripcion:hora_a[i].model_desc,
							provedor:hora_a[i].model_provedor,
							transaccion:hora_a[i].transaccion,
							ots_id:id_ot,
							fecha_transaccion:moment(hora_a[i].fecha_transaccion).format('YYYY-MM-DD'),
							estados_id:estado.id,
							valor:numeral(hora_a[i].model_valor).value(),
						};
						arreglo_temporal.push(data);
					}
					i++;
				}
			}else{
				toastr.error('Por favor llene el formulario','Error al intentar guardar las compras',this.option_toast);
				return false;
			}
			return arreglo_temporal;
		},

	},
	mounted() {}
}

Vue.component('select_ot',require('../herramientas/select_ot.vue'));
Vue.component('anadir_compra',require('../ots/anadir_compra_asociada.vue'));
</script>
