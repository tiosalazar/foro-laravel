<template>
<div>
	<form role="form" name="crear_solicitudes" class="crear_solicitudes">
	<div class="box-body">
		<div class="row">
			<div class="col-sm-4">
				<div class="form-group date required">
				<label for="nombre_solicitud">Nombre de la Solicitud:   </label> <br>
				{{info_requerimiento.nombre}}
				</div>
			</div>

			<div class="col-sm-4">
				<label>Fecha entrega deseada</label> <br>
				{{info_requerimiento.fecha_ideal_entrega}}
			</div>


			<div class="col-sm-4">
				<div class="form-group required">
				<label>Estado:</label>
				<span   v-bind:class="'label label-estado estado-'+[info_requerimiento.estado_prioridad.tipos_estados_id]+'-'+[info_requerimiento.estado_prioridad.id]">{{info_requerimiento.estado_prioridad.nombre}}</span>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="form-group required">
					<label> Descripción</label>
					<p v-html="info_requerimiento.descripcion"  ></p>
				</div>
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
				this.info_requerimiento= this.requerimientoarray;
				//console.log(this.requerimientoarray);
			}

	},
	methods:{

	}
}


Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));

</script>
