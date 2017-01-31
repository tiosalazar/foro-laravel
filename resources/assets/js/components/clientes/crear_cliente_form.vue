<template>
	<form class="row" name="agregar_cliente" id="agregar_cliente">
            <div class="col-xs-6 col-md-12">
              <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
                <label>Nombre</label>
                <input type="text" v-model="cliente.nombre" v-validate data-vv-rules="required|alpha_num|min:3" name="nombre" id="nombre" class="form-control" required="required">
                <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
              </div>
              <!-- /.form-group -->
              <div class="form-group" v-bind:class="[errors_return.nombre_contacto,{ 'has-error': errors.has('nombre_contacto') }]">
                <label>Nombre de Contacto</label>
                <input type="text" v-model="cliente.nombre_contacto" v-validate data-vv-rules="alpha|min:3"  name="nombre_contacto" id="nombre_contacto" class="form-control">
                <span  class="help-block" v-show="errors.has('nombre_contacto')">{{ errors.first('nombre_contacto') }}</span>
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-xs-6 col-md-12">
              <div class="form-group" v-bind:class="[errors_return.nit,{ 'has-error': errors.has('nit') }]">
                <label>NIT</label>
                <input type="text" v-model="cliente.nit" v-validate data-vv-rules="required|alpha_num|min:3" name="nit" id="nit" class="form-control" required="required">
                <span  class="help-block" v-show="errors.has('nit')">{{ errors.first('nit') }}</span>
              </div>
              <!-- /.form-group -->
              <div class="form-group" v-bind:class="[errors_return.email,{ 'has-error': errors.has('email') }]">
                <label>Correo</label>
                <input type="email" v-model="cliente.email" v-validate data-vv-rules="email" name="email" id="email" class="form-control">
                <span  class="help-block" v-show="errors.has('email')">{{ errors.first('email') }}</span>
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-xs-6 col-md-12">
              <div class="form-group" v-bind:class="[errors_return.telefono,{ 'has-error': errors.has('telefono') }]">
                <label>Teléfono</label>
                <input type="text" v-model="cliente.telefono" v-validate data-vv-rules="min:5" name="telefono" id="telefono" class="form-control">
                <span  class="help-block" v-show="errors.has('telefono')">{{ errors.first('telefono') }}</span>
              </div>
              <!-- /.form-group -->
            </div>
            <div class="col-xs-6 col-md-12">
              <button type="button"  v-on:click="addCliente" class="btn btn-block btn-success aa">Agregar</button>
            </div>
            </form>
          <!-- /.row -->
</template>

<script>
	import VeeValidate, { Validator } from 'vee-validate';
	import messages from '../../es/es';

       //Realizando los Use
	
		// Merge the locales.
		Validator.updateDictionary({es: { messages }});
		// Install the plugin and set the locale.
		Vue.use(VeeValidate, { locale: 'es' });

	module.exports =  {
		components: {VeeValidate,Validator},
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
				errors_return:{
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
				this.$validator.validateAll();
			    if (this.errors.any()) {
			        return false
			    }
				console.log(this.cliente);
				this.$http.post('api/v1/clientes', this.cliente)
	             .then(function(respuesta){
	             	var that = this;
	             	that.message ='';
	             	if (respuesta.status != '200') {
	             		if (Object.keys(response.body.obj).length>0) {
		             		$.each(respuesta.body.obj, function(index, value) {
							    that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
							    that.errors_return[index] = 'has-warning';
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
						    that.errors_return[index] = 'has-error';
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

			},
			validateBeforeSubmit(e) {
				 	console.log(this.errors);
			        this.$validator.validateAll();
			        if (!this.errors.any()) {
			            this.submitForm()
			        }
			      },
		}
	}
</script>
