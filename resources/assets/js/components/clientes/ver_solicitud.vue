<template>
	<form role="form" name="crear_solicitudes" class="crear_solicitudes">
	<div class="box-body">
		<div class="row">
			<div class="col-sm-6">
				<div class="form-group date required">
				<label for="nombre_solicitud">Nombre de la Solicitud: {{info_requerimiento.nombre}}  </label>
				<!-- <input id="nombre_solicitud" class="form-control" type="text" name="nombre_solicitud"> -->
				</div>
			</div>

			<div class="col-md-4">
				<label>Fecha entrega deseada {{info_requerimiento.fecha_ideal_entrega}}</label>
			</div>


			<div class="col-sm-2">
				<div class="form-group required">
				<label>Prioridad:</label>
					<!-- <select_prioridad></select_prioridad> -->
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-12">
				<div class="form-group required">
					<label> Descripción</label>
					<textarea readonly >
						{{info_requerimiento.descripcion}}
					</textarea>
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
	props: ['requerimientoarray'],
    data(){
	
	return{
		comentarios_array:[],
		info_requerimiento:[],
		descripcion: '',
	}
},
	created: function(){

			
			this.info_requerimiento= JSON.parse(this.requerimientoarray);
			console.log(this.info_requerimiento);

	}
}


Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));

</script>