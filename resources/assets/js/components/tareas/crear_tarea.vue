<template>
	<form role="form" name="crear_tarea" class="crear_tarea">
		<div class="box-body">
			<div class="form-group required">
				<label for="ot">Nombre el Projecto <sup>*</sup></label>
				<select_ot></select_ot>
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
				<label>Date masks:</label>

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
				<select_prioridad></select_prioridad>
			</div>
			<div class="form-group">
				<label>Fase del Projecto</label>
				<select_fase></select_fase>
			</div>
			<div class="form-group required">
				<label>Área <sup>*</sup></label>
				<select_area  :refresha="refresh"></select_area>
			</div>
			<label>Fecha entrega cliente</label>
			<div class="input-group date" :class="{ 'has-error': !fecha_entrega_cliente }" >
				<div class="input-group-addon">
					<i class="fa fa-calendar"></i>
				</div>
				<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_entrega_cliente" class="form-control"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
			</div>
			<div style="padding:2px 0px;"  :class="{ 'has-error': !fecha_entrega_cliente }" v-show="!fecha_entrega_cliente">
				<span  class="help-block">El campo Fecha Fin es obligatorio</span>
			</div>
			<div class="form-group required">
				<label for="nombre_solicitud">Nombre de la Solicitud <sup>*</sup></label>
				<input type="text" class="form-control"  id="nombre_solicitud" v-model="tarea.nombre_tarea" name="nombre_tarea" placeholder="Solicitud" required="required">
			</div>
			<div class="form-group required">
				<label for="descripcion">Descripción <sup>*</sup></label>
				<textarea class="form-control" rows="3"  name="descripcion"  id="descripcion" v-model="tarea.descripcion" placeholder="Descripción" required="required"></textarea>
			</div>
			<div class="form-group">
				<label for="enlaces_externos">Ruta del server</label>
				<textarea class="form-control" rows="3" name="enlaces_externos"  id="enlaces_externos" v-model="tarea.enlaces_externos" placeholder="Ruta del server"></textarea>
			</div>
			<div class="form-group required">
				<label>Estado <sup>*</sup></label>
				<select_estados tipo_estado="1"  :select="estado" ></select_estados>
			</div>
			<div class="form-group">
				<label for="mapa_cliente">T. Mapa del cliente</label>
				<input type="text" name="mapa_cliente" id="mapa_cliente"  class="form-control" >
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
	module.exports = {
		components: {Datepicker},
		data(){
			return{
				tarea:{},
				ot:{},
				area:{},
				current_date:'',
				refresh:'',
				estado:'',
				fase:'',
				user:'',
				fecha_entrega_cliente:'',
				errors_return:{
		          'nombre':'',
		          'nit':'',
		          'nombre_contacto':'',
		          'telefono':'',
		          'email':'',
		        }
			}
		},
		created: function() {
			this.$on('send-ot', function(obj) { 
				this.ot= obj;
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
			this.current_date=this.getCurrentDate();
			this.user = this.$parent.id_user;

		},
		computed:{},
		watch: {},
		methods:{
			addUser:function(user) {

			},
			getCurrentDate:function(data='') {
				var today;
				if (!data) {
					today = new Date()
				} else {
					today = new Date(data)
				}
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
				return today;
			},
			agregarTarea:function(e) {
				this.tarea.fecha_entrega_cliente = this.getCurrentDate(this.fecha_entrega_cliente.toString());
				this.tarea.estados_id = this.estado.id;
				this.tarea.ots_id= this.ot.id;
				this.tarea.planeacion_fases_id = this.fase.id;
				this.tarea.areas_id = this.area.id;
				this.tarea.usuarios_id = this.user;
				console.log(this.tarea);
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