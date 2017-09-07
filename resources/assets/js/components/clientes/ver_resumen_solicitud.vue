<template>
<div>
	<form role="form" name="crear_solicitudes" class="crear_solicitudes">
	<div class="box-body">
		<div class="row">
			<div class="col-sm-6">
			 <div class="form-group same-height">
				<label><strong>Nombre de la Solicitud:</strong></label>
				<div>{{info_requerimiento.nombre}}</div>
			</div>
			<div class="form-group same-height required">
			 <label><strong>Fecha entrega deseada:</strong></label>
			 <div>{{info_requerimiento.fecha_ideal_entrega}}</div>
		 </div>
	 </div>
	 <div class="col-sm-6">
		 <div class="form-group same-height">
			<label><strong>Estado :</strong></label>
			<span v-bind:class="'label label-estado estado-'+[info_requerimiento.estado.tipos_estados_id]+'-'+[info_requerimiento.estado.id]">{{info_requerimiento.estado.nombre}}</span>
		</div>
		<div class="form-group same-height required">
		 <label><strong>Prioridad:</strong></label>
		 <span  v-bind:class="'label label-estado estado-'+[info_requerimiento.estado_prioridad.tipos_estados_id]+'-'+[info_requerimiento.estado_prioridad.id]">{{info_requerimiento.estado_prioridad.nombre}}</span>
	 </div>
 </div>
</div>
<div class="row">
 <div class="col-sm-12">
	<div class="form-group required">
	 <label> <strong >Descripción del Requerimiento :</strong></label>
	 <p  class="descripcion_tarea" v-html="info_requerimiento.descripcion"></p>
 </div>
</div>
</div>

	</div>
</form>
</div>
</template>


<script>
import VueHtml5Editor from 'vue-html5-editor';
Vue.use(VueHtml5Editor);

module.exports = {
	props: ['requerimientoarray'],
    data(){
	return{
		comentarios_array:[],
		info_requerimiento:[],
		descripcion: '',
		rol_actual:'',
		prioridad:'',
		comentario_texto:'',
	}
},
	created: function(){
			if (typeof(this.requerimientoarray)!= 'undefined') {
				this.info_requerimiento= JSON.parse( this.requerimientoarray);
				console.log(this.info_requerimiento);
			}

	},
	methods:{

	}
}


Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));

</script>
