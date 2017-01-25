<template>
	<form >
		<div class="box-body">
			<div class="form-group">
				<label for="nombreCliente">Nombre</label>
				<input type="text" class="form-control" id="nombreCliente" placeholder="Nombre">
			</div>
			<div class="form-group">
				<label for="nit">NIT</label>
				<input type="text" class="form-control" id="nit" placeholder="NIT">
			</div>
			<div class="form-group">
				<label for="email">Correo Electronico</label>
				<input type="email" class="form-control" id="email" placeholder="Correo Electronico">
			</div>
			<div class="form-group">
				<label for="telefono">Teléfono</label>
				<input type="number" class="form-control" id="telefono" placeholder="Teléfono">
			</div>
			<div class="form-group">
				<label for="nombre_contacto">Nombre de Contacto</label>
				<input type="text" class="form-control" id="nombre_contacto" placeholder="Nombre de Contacto">
			</div>
			<button type="submit" class="btn btn-default">Submit</button>
		</div>
	</form>
</template>

<script>

	export default {
		data () {
			return {
				requerimiento: [
				{nombre_requerimiento: 'requerimiento[0][nombre_requerimiento]', no_horas_req: 'requerimiento[0][no_horas_req]'}
				]
			}
		},
		methods: {
			addRequerimiento: function(e) {
				e.preventDefault();
				console.log(this.requerimiento);
				this.requerimiento.push(Vue.util.extend({}, this.requerimiento));
			},
			deleteRequerimiento: function(e) {
				e.preventDefault();
				var index = this.requerimiento.indexOf(Vue.util.extend({}, this.requerimiento));
				this.requerimiento.splice(index, 1);

			}
		}
	}
</script>
