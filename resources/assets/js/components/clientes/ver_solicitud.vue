<template>
	<form role="form" name="crear_solicitudes" class="crear_solicitudes">
	<div class="box-body">
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group date required">
				<label for="nombre_solicitud">Nombre de la Solicitud </label>
				<!-- <input id="nombre_solicitud" class="form-control" type="text" name="nombre_solicitud"> -->
				</div>
			</div>

			<div class="col-md-4">
				<label>Fecha entrega deseada</label>
			</div>


			<div class="col-sm-2">
				<div class="form-group required">
				<label>Prioridad </label>
				<select_prioridad></select_prioridad>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="form-group required">
					<label> Descripción</label>
				</div>
			</div>
		</div>
	</div>

	<div class="box-footer text-center">
		<button type="button" class="btn btn-primary">Publicar</button>
	</div>
	</form>
</template>


<script>

module.exports = {
data(){
	 props: ['requerimientoarray'],
	return{
		comentarios_array:[],
		info_requerimiento:[],
		descripcion: '',
	}
},
	created: function(){

			this.info_requerimiento=this.requerimientoarray;

	}
}


Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));

</script>