<template>
	<form class="row" name="agregar_cliente" id="agregar_cliente">
            <div class="col-md-6">
              <div class="form-group">
                <label>Nombre</label>
                <input type="text" v-model="cliente.nombre" name="nombre" id="nombre" class="form-control" required="required">
              </div>
              <!-- /.form-group -->
              <div class="form-group">
                <label>Nombre de Contacto</label>
                <input type="text" v-model="cliente.nombre_contacto" name="nombre_contacto" id="nombre_contacto" class="form-control">
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
              <div class="form-group">
                <label>NIT</label>
                <input type="text" v-model="cliente.nit" name="nit" id="nit" class="form-control" required="required">
              </div>
              <!-- /.form-group -->
              <div class="form-group">
                <label>Correo</label>
                <input type="email" v-model="cliente.email" name="email" id="email" class="form-control">
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
              <div class="form-group">
                <label>Teléfono</label>
                <input type="text" v-model="cliente.telefono" name="telefono" id="telefono" class="form-control">
              </div>
              <!-- /.form-group -->
            </div>
            <div class="col-md-6">
              <button type="button"  v-on:click="addCliente" class="btn btn-block btn-success aa">Agregar</button>
            </div>
            </form>
          <!-- /.row -->
</template>

<script>

	module.exports =  {
		data () {
			return {
				cliente: {},
				message :'',
				option_toast:{
					timeOut: 5000,
					"positionClass": "toast-top-center",
					"closeButton": true,
				}
			}
		},
		methods: {
			addCliente: function(e) {
				console.log(this.cliente);
				this.$http.post('api/v1/clientes', this.cliente)
	             .then(function(respuesta){
	             	var message = '';
	             	if (respuesta.status != '200') {
	             		if (Object.keys(response.body.obj).length>0) {
		             		$.each(respuesta.body.obj, function(index, value) {
							    message += '<strong>'+index + '</strong>: '+value+ '</br>';
							});
		             	}
	             		toastr.warning(
	             			message,
	             			respuesta.body.msg,
	             			this.option_toast
	             			);
	             	} else {
	             		toastr.success(
	             			respuesta.body.msg,
	             			'',
	             			this.option_toast)
	             	}
	               this.clientes=respuesta.body;
	               console.log(respuesta);
	             }, (response) => {
	             	var message = '';
	             	console.log(response.body)
	             	if (Object.keys(response.body.obj).length>0) {
	             		$.each(response.body.obj, function(index, value) {
						    message += '<strong>'+index + '</strong>: '+value+ '</br>';
						});
	             	}
				    toastr.error(
				    	message,
				    	response.body.msg,
				    	this.option_toast
				    	);
				  });
			},
			deleteRequerimiento: function(e) {
				e.preventDefault();
				var index = this.requerimiento.indexOf(Vue.util.extend({}, this.requerimiento));
				this.requerimiento.splice(index, 1);

			}
		}
	}
</script>
