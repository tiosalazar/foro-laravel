<template>
	<form class="row" name="agregar_cliente" id="agregar_cliente">
            <div class="col-md-6">
              <div class="form-group" v-bind:class="errors.nombre">
                <label>Nombre {{errors.nombre}}</label>
                <input type="text" v-model="cliente.nombre" name="nombre" id="nombre" class="form-control" required="required">
              </div>
              <!-- /.form-group -->
              <div class="form-group" v-bind:class="errors.nombre_contacto">
                <label>Nombre de Contacto</label>
                <input type="text" v-model="cliente.nombre_contacto" name="nombre_contacto" id="nombre_contacto" class="form-control">
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
              <div class="form-group" v-bind:class="errors.nit">
                <label>NIT</label>
                <input type="text" v-model="cliente.nit" name="nit" id="nit" class="form-control" required="required">
              </div>
              <!-- /.form-group -->
              <div class="form-group" v-bind:class="errors.email">
                <label>Correo</label>
                <input type="email" v-model="cliente.email" name="email" id="email" class="form-control">
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-md-6">
              <div class="form-group" v-bind:class="errors.telefono">
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
				isActive:true,
				cliente: {},
				message :'',
				option_toast:{
					timeOut: 5000,
					"positionClass": "toast-top-center",
					"closeButton": true,
				},
				errors:{
					'nombre':'',
					'nit':'',
					'nombre_contacto':'',
					'telefono':'',
					'email':'',
				}
			}
		},
		methods: {
			addCliente: function(e) {
				console.log(this.cliente);
				this.$http.post('api/v1/clientes', this.cliente)
	             .then(function(respuesta){
	             	var that = this;
	             	that.message ='';
	             	if (respuesta.status != '200') {
	             		if (Object.keys(response.body.obj).length>0) {
		             		$.each(respuesta.body.obj, function(index, value) {
							    that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
							    that.errors[index] = 'has-warning';
							});
		             	}
	             		toastr.warning(that.message,respuesta.body.msg,this.option_toast);
	             	} else {
	             		toastr.success(respuesta.body.msg,'',this.option_toast);
	             		$('#agregar_cliente').trigger("reset");
	             		$('.collapse-cliente').collapse('hide');
	             		$('#app-datatable').append( $( "<tr> <td>"+respuesta.body.obj.nit+"</td> <td>"+respuesta.body.obj.nit+"</td> <td>"+respuesta.body.obj.nombre_contacto+"</td> <td>"+respuesta.body.obj.email+"</td> <td>"+respuesta.body.obj.telefono+"</td> <td><button type='button' class='btn btn-block btn-warning btn-sm edit'  :id='"+respuesta.body.obj.id+"'>Editar</button></td> <td><button type='button' class='btn btn-block btn-danger btn-sm edit' :id='"+respuesta.body.obj.id+"'>Borrar</button></td> </tr>" ) );
	             	}
	               this.clientes=respuesta.body;
	               console.log(respuesta);
	             }, (response) => {
	             	var that = this;
	             	that.message = '';
	             	if (Object.keys(response.body.obj).length>0) {
	             		$.each(response.body.obj, function(index, value) {
						    that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
						    that.errors[index] = 'has-error';
						});
	             	}
				    toastr.error(that.message,response.body.msg,this.option_toast);
				  });
			},
			editCliente: function(e) {
				$('.example-modal').modal('show');

			},
			deleteRequerimiento: function(e) {
				e.preventDefault();
				var index = this.requerimiento.indexOf(Vue.util.extend({}, this.requerimiento));
				this.requerimiento.splice(index, 1);

			}
		}
	}
</script>
