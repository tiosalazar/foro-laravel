<template>
	<form class="row" name="agregar_cliente" id="agregar_cliente">
            <div class="col-xs-6 col-md-12">
              <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]" >
                <label><sup>*</sup> Nombre</label>
                <input type="text" v-model="cliente.nombre" v-validate data-vv-rules="required|alpha_num_spaces|min:3" name="nombre" id="nombre" class="form-control" required="required">
                <span  class="help-block" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
              </div>
              <!-- /.form-group -->
              <div class="form-group" v-bind:class="[errors_return.nombre_contacto,{ 'has-error': errors.has('nombre_contacto') }]">
                <label><sup>*</sup> Nombre de contacto</label>
                <input type="text" v-model="cliente.nombre_contacto" data-vv-as="Nombre de contacto" v-validate data-vv-rules="required|alpha_num_spaces|min:3"  name="nombre_contacto" id="nombre_contacto" class="form-control">
                <span  class="help-block" v-show="errors.has('nombre_contacto')">{{ errors.first('nombre_contacto') }}</span>
              </div>
              <!-- /.form-group -->
            </div>
            <!-- /.col -->
            <div class="col-xs-6 col-md-12">
              <div class="form-group" v-bind:class="[errors_return.nit,{ 'has-error': errors.has('nit') }]">
                <label><sup>*</sup> NIT</label>
                <input type="text" v-model="cliente.nit" data-vv-as="Nit" v-validate data-vv-rules="required|min:6" name="nit" id="nit" class="form-control" required="required">
                <span  class="help-block" v-show="errors.has('nit')">{{ errors.first('nit') }}</span>
              </div>
              <!-- /.form-group -->

							<div class="form-group" v-bind:class="[errors_return.razon_social,{ 'has-error': errors.has('razon_social') }]">
                <label>Razón social</label>
                <input type="text" v-model="cliente.razon_social" data-vv-as="Razon Social" v-validate data-vv-rules="min:3" name="razon_social" id="razon_social" class="form-control" required="required">
                <span  class="help-block" v-show="errors.has('razon_social')">{{ errors.first('razon_social') }}</span>
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
              <div class="form-group">
								<label for="rol_usuario"> Ejecutivo </label>
								<select_usuarios area="cuentas" :select="ejecutivo"></select_usuarios>
              </div>
              <!-- /.form-group -->
            </div>
            <div class="col-xs-6 col-md-12">
							<div class="form-group" v-bind:class="[errors_return.email,{ 'has-error': errors.has('email') }]">
                <label>Correo</label>
                <input type="email" v-model="cliente.email" v-validate data-vv-rules="email" name="email" id="email" class="form-control">
                <span  class="help-block" v-show="errors.has('email')">{{ errors.first('email') }}</span>
              </div>
              <!-- /.form-group -->

            </div>
						<div class="col-xs-12 col-md-12">
							<a v-show="!agregar" href="/clientes/listado" class="btn btn-primary  aa">Volver al listado de Clientes</a>
               <button type="button" v-show="agregar" v-on:click="addCliente" class="btn btn-success aa">Agregar</button>

               <button type="button" v-show="!agregar" v-on:click="editCliente(cliente)" class="btn btn-success pull-right aa">Actualizar</button>
						</div>
            </form>
          <!-- /.row -->
</template>

<script>
	import VeeValidate, { Validator } from 'vee-validate';
	import messages from '../../es/es';

		// Merge the locales.
		Validator.updateDictionary({es: { messages }});
		// Install the plugin and set the locale.
		Vue.use(VeeValidate, { locale: 'es' });

	module.exports =  {
		components: {VeeValidate,Validator},
		props: ['cliente_url'],
		data () {
			return {
				isActive:true,
				cliente: {
					nombre:'',
					nombre_contacto:'',
					nit:'',
					email:'',
					telefono:'',
					razon_social:'',
					user_id:'',
				},
				ejecutivo:'',
				message :'',
				agregar:true,
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
		created:function() {
			if (this.cliente_url) {
		   	console.log(this.cliente_url)
		    this.cliente = this.cliente_url;
		    this.agregar = false;
		  }
			if (this.cliente.user_id) {
				let that = this;
				this.$http.get(window._apiURL+'usuarios/'+this.cliente.user_id)
				.then(function(respuesta){
					that.message ='';
					if (respuesta.status != '200') {
						if (Object.keys(respuesta.body.obj).length>0) {
							this.setErrors(respuesta.body.obj);
						}
						toastr.warning(that.message,respuesta.body.msg,this.option_toast);
					} else {
						this.ejecutivo=respuesta.body;
					}
				}, (err) => {
					that.message = '';
					if (err.status == 404) {
						toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
					} else {
						if (Object.keys(err.body.obj).length>0) {
							this.setErrors(err.body.obj);
						}else{
							that.message = err.body.error;
						}
						toastr.error(this.message,err.body.msg,this.option_toast);
					}
				});
			}
			/*
			Datos del formulario de Usuarios
			*/
			this.$on('select_ejecutivo', function(v) {
				this.ejecutivo=v;
			});
		},
		methods: {
			setErrors:function(object) {
		        this.message='';
		        var that = this;
		        $.each(object, function(index, value) {
							let campo = index.replace(/_id/g, '');
		          campo = campo.replace(/_/g, ' ');
		          value = value[0].replace(/ id /g, '');
		          that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
		          that.errors_return[index] = 'has-warning';
		        });
		    },
				addCliente: function(e) {
					this.$validator.validateAll();
					if (this.errors.any()) {
						return false
					}
					let that = this;
					this.cliente.user_id = this.ejecutivo.id;
					this.$http.post(window._apiURL+'clientes', this.cliente)
					.then(function(respuesta){
						that.message ='';
						if (respuesta.status != '200') {
							if (Object.keys(respuesta.body.obj).length>0) {
								this.setErrors(respuesta.body.obj);
							}
							toastr.warning(that.message,respuesta.body.msg,this.option_toast);
						} else {
							toastr.success(respuesta.body.msg,'',this.option_toast);
							this.cliente={};
							this.ejecutivo='';
							setTimeout(function(){ that.errors.clear(); }, 50);
						}
					}, (err) => {
						that.message = '';
						if (err.status == 404) {
							toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
						} else {
							if (Object.keys(err.body.obj).length>0) {
								this.setErrors(err.body.obj);
							}else{
								that.message = err.body.error;
							}
							toastr.error(this.message,err.body.msg,this.option_toast);
						}
					});
				},
			editCliente: function(client) {
				let that = this;
						client.user_id = this.ejecutivo.id;
		        this.$http.put(window._apiURL+'clientes/'+client.id, client)
		        .then(function(response) {
		          if (response.status != '200') {
		            if (Object.keys(response.body.obj).length>0) {
		              this.setErrors(response.body.obj);
		            }
		            toastr.warning(this.message,response.body.msg,this.option_toast);
		          } else {
		            toastr.success(response.body.msg,'',this.option_toast);
		            setTimeout(function () {
						location.pathname= '/clientes/listado';
					}, 500);
		          }
		        }, function(err) {
							if (err.status == 404) {
								toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
							} else {
								if (Object.keys(err.body.obj).length>0) {
									this.setErrors(err.body.obj);
								}else{
									that.message = err.body.error;
								}
								toastr.error(this.message,err.body.msg,this.option_toast);
							}
		        })
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
	Vue.component('select_usuarios',require('../herramientas/select_usuarios.vue'));
</script>
