<template>
	<form role="form" name="crear_tarea" class="crear_tarea">
		<div class="box-body">
			<div class="form-group required">
				<label for="ot"><sup>*</sup> Nombre del requerimiento </label>
				<select_requerimiento :select="select_requerimiento_obj" :id_requerimiento="requerimiento_id"></select_requerimiento>
			</div>
			<div class="row desc-ot with-border">
				<div class="col-sm-12 border-right">
					<ul>
						<!-- <li><strong>Id Requerimiento:  </strong><span>{{select_requerimiento_obj.id}}</span></li> -->
						<li><strong>Cliente:  </strong><span>{{select_requerimiento_obj.nombre}}</span></li>
						<li><strong>Fecha Solicitud: </strong><span>{{select_requerimiento_obj.updated_at}} </span></li>
					</ul>
				</div>
				<div class="col-sm-12">
					<ul>
						<li><strong>Descripción:</strong></li>
						<textarea name="descripcion" id="descripcion" style="width:100%; height:200px; resize: none;" readonly>{{select_requerimiento_obj.descripcion}}</textarea>
					</ul>
			     </div>
				<!-- /.col -->
			</div>
			<div class="form-group required">
				<label for="ot"><sup>*</sup> Nombre el Proyecto </label>
				<select_ot :select="select_ot"></select_ot>
			</div>
			<div class="row desc-ot with-border">
				<div class="col-sm-6 border-right">
					<ul>
						<li><strong>Numero de OT:</strong><span> #{{ot.referencia}}</span></li>
						<li><strong>Ejecutiva:</strong><span> {{ot.usuario_nombre}} - {{ot.usuario_apellido}}  </span></li>
						<li><strong>Fecha de Solicitud:</strong><span> {{current_date}}</span></li>
					</ul>
				</div>
				<div class="col-sm-6">
					<ul>
						<li><strong>Proyecto:</strong><span> {{ot.nombre}}</span></li>
						<li><strong>Cliente:</strong><span> {{ot.cliente_nombre}}</span></li>
					</ul>
				</div>
				<!-- /.col -->
			</div>
			<!-- /.row -->
			<div class="row">
				<div class="col-md-3 col-xs-4">
					<label for="valor_total" class="col-sm-12 ">Tarea Recurrente </label>
					<div class="row" v-bind:class="{ 'has-error': errors.has('recurrente') }">
						<div class="col-sm-4 col-xs-6 formulario">
							<input type="radio" name="recurrente" value="1" id="si" v-model="tarea.recurrente"  required="required" ><label for="si"> Si</label>
						</div>
						<div class="col-sm-4 col-xs-6 formulario" >
							<input type="radio" name="recurrente" value="0" id="no" v-model="tarea.recurrente"   required="required"  > <label for="no"> No</label>
						</div>
						<span  class="help-block" v-show="errors.has('recurrente')">{{ errors.first('recurrente') }}</span>
					</div>
				</div>
				<div class="" v-if="tarea.recurrente=='1'">
					<div class="col-md-4">
						<label>Fecha inicio de recurrencia</label>
						<div class="input-group date" >
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_inicio_recurrencia" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
						</div>
					</div>
					<div class="col-md-4">
						<label>Fecha final de recurrencia</label>
						<div class="input-group date" >
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_final_recurrencia" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
						</div>
					</div>
				</div>
			</div>
			<br>
			<!-- /.row -->
			<div class="row">
				<div class="col-sm-2">
					<div class="form-group required">
						<label><sup>*</sup> Prioridad </label>
						<select_prioridad :select="prioridad" ></select_prioridad>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="form-group required">
						<label><sup>*</sup> Área </label>
						<select_area  :refresha="area" compras="true"></select_area>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group required">
						<label><sup>*</sup> Fase del Proyecto </label>
						<select_fase :select="fase" :area="area"></select_fase>
					</div>
				</div>
			</div>


			<div class="row">
				<div class="col-sm-4">
					<label>Fecha entrega cliente</label>
					<div class="input-group date" >
						<div class="input-group-addon">
							<i class="fa fa-calendar"></i>
						</div>
						<datepicker language="es"  id="fecha_entrega_cliente" required="required" placeholder="Fecha fin" v-model="fecha_entrega_cliente" class="form-control" :disabled="disabled"  name="fecha_entrega_cliente" format="dd-MM-yyyy"></datepicker>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="form-group required" v-bind:class="[errors_return.nombre_tarea,{ 'has-error': errors.has('nombre_tarea') }]">
						<label for="nombre_tarea"><sup>*</sup> Nombre de la Solicitud </label>
						<input type="text" class="form-control"  id="nombre_tarea" v-model="tarea.nombre_tarea" name="nombre_tarea" placeholder="Solicitud" v-validate data-vv-rules="required|min:4" required="required">
						<span  class="help-block" v-show="errors.has('nombre_tarea')">{{ errors.first('nombre_tarea') }}</span>
					</div>
				</div>
			</div>



			<div class="form-group required" v-bind:class="[errors_return.descripcion,{ 'has-error': errors.has('descripcion') }]">
				<label for="descripcion"><sup>*</sup> Descripción </label>
				<vue-html5-editor :content="descripcion_fake" :height="200"  :z-index="0" @change="updateData"></vue-html5-editor>
				<!-- <textarea  v-model="tarea.descripcion"  name="descripcion"  id="descripcion"  placeholder="Descripción" required="required" v-validate data-vv-rules="required|min:4"></textarea>-->
				<span  class="has-error" style="color:#DD4B39;" v-show="errors_return.descripcion"> Campo Descripcion Obligatorio </span>
			</div>

			<div class="form-group" v-bind:class="[errors_return.enlaces_externos,{ 'has-error': errors.has('enlaces_externos') }]">
				<label for="enlaces_externos">Ruta del server</label>
				<textarea class="form-control" rows="3" name="enlaces_externos"  id="enlaces_externos" v-model="tarea.enlaces_externos" placeholder="Ruta del server"></textarea>
			</div>

			<div class="row">
				<div class="col-sm-6">
					<div class="form-group required">
						<label><sup>*</sup> Estado </label>
						<select_estados tipo_estado="1"  :select="estado" ></select_estados>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<label for="tiempo_mapa_cliente">Tiempo estimado mapa del cliente</label>
						<input type="text" name="tiempo_mapa_cliente" id="tiempo_mapa_cliente" v-model="tarea.tiempo_mapa_cliente" class="form-control" placeholder="Tiempo mapa del cliente">
					</div>
				</div>
			</div>

		</div>

		<div class="box-footer text-center seccion_mas_tareas" >

			<div v-show="form_tarea_nueva">
		    <form >
		    	<div  v-for="(ed,index) tarea_nueva in tareas_nuevas" class="form_tarea_nueva">
			    	<!-- Tareas Nuevas -->

					<div class="row">
						<div class="col-md-12">
						<hr class="division_tareas_nuevas">
							<h3 class="titulo_tareas_nuevas">Nueva Tarea Para {{ot.nombre}}</h3>
						</div>
					</div>
				    <div class="row">
					    <div class="row">
							<div class="col-md-2">
								<div class="form-group required">
									<label><sup>*</sup> Prioridad </label>
									<select_prioridad :select="ed.prioridad" :indice="index" ></select_prioridad>
								</div>
							</div>
							<div class="col-md-4">
								<div class="form-group required">

									<label><sup>*</sup> Área </label>
									<select_area  :refresha="ed.area"  :indice="index" compras="true" ></select_area>
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group required">
									<label><sup>*</sup> Fase del Proyecto </label>
									<select_fase :select="ed.fase" :area="ed.area" :indice="index"></select_fase>
								</div>
							</div>
						</div>

						<div class="col-sm-4">
							<label>Fecha entrega cliente</label>
							<div class="input-group date" >
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<datepicker language="es"  :id="'fecha_entrega_cliente'+index" required="required" placeholder="Fecha fin" v-model="ed.fecha_entrega_cliente" class="form-control" :disabled="disabled"  :name="'fecha_entrega_cliente'+index" format="dd-MM-yyyy"></datepicker>
							</div>
						</div>
						<div class="col-sm-8">
							<div class="form-group required" v-bind:class="[errors_return.nombre_tarea,{'has-error': errors.has('nombre_tarea'+index) }]">
								<label :for="'nombre_tarea'+index"><sup>*</sup> Nombre de la Solicitud </label>
								<input type="text" class="form-control"  :id="'nombre_tarea'+index" v-model="ed.nombre_tarea" :name="'nombre_tarea'+index" placeholder="Solicitud" v-validate data-vv-rules="required|min:4">
								<span  class="help-block" v-show="errors.has('nombre_tarea'+index)">{{ errors.first('nombre_tarea'+index) }}</span>
							</div>
						</div>
				   </div>

				   <div class="form-group required" v-bind:class="[errors_return.descripcion,{ 'has-error': errors.has('descripcion+index') }]">
					<label for="descripcion" :id="'descripcion_borrar'+index"><sup>*</sup> Descripción </label>
						<vue-html5-editor :content="ed.descripcion" :height="200"  :z-index="0" @change="updateDataTareas" ></vue-html5-editor>
						<span style="display:none;">
						{{indice_textarea=index}}
						</span>

						<!-- <textarea  v-model="tarea.descripcion"  name="descripcion"  id="descripcion"  placeholder="Descripción" required="required" v-validate data-vv-rules="required|min:4"></textarea>-->
						<span  class="has-error" style="color:#DD4B39;" v-show="errors_return.descripcion+index"> Campo Descripcion Obligatorio </span>
				   </div>

					<div class="form-group" v-bind:class="[errors_return.enlaces_externos,{ 'has-error': errors.has('enlaces_externos'+index) }]">
						<label :for="'enlaces_externos'+index">Ruta del server</label>
						<textarea class="form-control" rows="3" :name="'enlaces_externos'+index"  id="'enlaces_externos'+index" v-model="ed.enlaces_externos" placeholder="Ruta del server"></textarea>
					</div>

					<div class="row">
						<div class="col-sm-6">
							<div class="form-group required">
								<label><sup>*</sup> Estado </label>
								<select_estados tipo_estado="1"  :select="ed.estado" :indice="index" ></select_estados>
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="tiempo_mapa_cliente">Tiempo estimado mapa del cliente</label>
								<input type="text" :name="'tiempo_mapa_cliente'+index" :id="'tiempo_mapa_cliente'+index" v-model="ed.tiempo_mapa_cliente" class="form-control" placeholder="Tiempo mapa del cliente">
							</div>
						</div>
					</div>
			    	<!-- Fin tareas Nuevas -->

			    	<!--Boton Agregar mas tareas a la lista -->
			    	<button type="button" class="btn btn-danger pull-right" v-on:click="EliminarTarea(index)">Eliminar Tarea</button>
		    	</div>

		    </form>

		    <!-- Boton Agregar Tareas -->

		    	 <button v-show="form_tarea_nueva"  type="button" class="btn btn-success boton_agregar_tareas" v-on:click="agregarMasTareas(indice_textarea)">Agregar Más Tareas</button>


			</div>
				<button v-show="!form_tarea_nueva"  type="button" class="btn btn-success boton_agregar_tareas" v-on:click="agregarPrimerTareas()">Más Tareas</button>

		</div>

		<div class="box-footer text-center">
			<button type="button" class="btn btn-primary" v-on:click="agregarTarea()">Publicar</button>
		</div>
	</form>
</template>
<script>
	import Datepicker from 'vuejs-datepicker';
	import VeeValidate, { Validator } from 'vee-validate';
	import moment from 'moment';
	import VueHtml5Editor from 'vue-html5-editor';
    Vue.use(VueHtml5Editor);

  	Vue.use(VeeValidate);
	module.exports = {
		components: {Datepicker,VeeValidate,Validator},
		props: ['requerimiento_id','id_user'],
		data(){
			return{
				reque_id:'',
				tarea:{
					nombre_tarea:'',
					descripcion:'',
					enlaces_externos:'',
					recurrente:0,
				},
				form_tarea_nueva:false,
				tareas_nuevas:[],
				datos_prioridad_mastareas:{},
				select_ot:'',
				prioridad:'',
				estado:'',
				fase:'',
				indice_textarea:'',
				requerimiento:{},
				select_requerimiento_obj:{},
				ot:{
					usuario:'',
					cliente:''
				},
				area:{
					id:0,
				},
				current_date:'',
				user:'',
				descripcion_fake:'',
				fecha_entrega_cliente:'',
				fecha_inicio_recurrencia:'',
				fecha_final_recurrencia:'',
				message:'',
				disabled:{
				  "to": moment().subtract(1, 'days').toDate(),
				},
				errors_return:{
		          'nombre':'',
		          'nit':'',
		          'nombre_contacto':'',
		          'telefono':'',
		          'email':'',
				  'descripcion':'',
		        },
		        errors_return2:{},
		        option_toast:{
		          timeOut: 5000,
		          "positionClass": "toast-top-center",
		          "closeButton": true,
		        },
			}
		},
		created: function() {
			// this.reque_id = this.requerimiento_id;
			this.select_requerimiento_obj=this.requerimiento_id;
			this.$on('send-ot', function(obj) {
				this.ot= obj;
				// console.log('cliente',obj.cliente.nombre)
				this.select_ot= obj;
			});
			this.$on('send-requerimiento', function(obj) {
				this.requerimiento= obj;
				this.select_requerimiento_obj= obj;
			});
			this.$on('area_option', function(obj) {
				this.area=obj;
				console.log(this.area);
			});
			this.$on('select_estado', function(v) {
				this.estado=v;
			});
			this.$on('fase_option', function(obj) {
				this.fase=obj;
			});
			this.$on('send-prioridad', function(obj) {
				this.prioridad=obj;
			});

			//Eventos para llenar el arreglo de más tareas de los select correspondientes, recibe el id de la prioridad y el item seleccionado

			//On select prioridad
			this.$on('send-indice-prioridad', function(obj) {
				this.datos_prioridad_mastareas=obj;
				this.tareas_nuevas[this.datos_prioridad_mastareas.indice]['prioridad']=this.datos_prioridad_mastareas.select;
			});

			//On select area
			this.$on('send-indice-area', function(obj) {
				this.datos_prioridad_mastareas=obj;
				this.tareas_nuevas[this.datos_prioridad_mastareas.indice]['area']=this.datos_prioridad_mastareas.select;
			});

			//On select fase
			this.$on('send-indice-fase', function(obj) {
				this.datos_prioridad_mastareas=obj;
				this.tareas_nuevas[this.datos_prioridad_mastareas.indice]['fase']=this.datos_prioridad_mastareas.select;
			});

			//On select fase
			this.$on('send-indice-estado', function(obj) {
				this.datos_prioridad_mastareas=obj;
				this.tareas_nuevas[this.datos_prioridad_mastareas.indice]['estado']=this.datos_prioridad_mastareas.select;

			});

			//Fin de los eventos más tareas

			this.current_date=this.getCurrentDate();
			this.user = this.id_user;
			if (this.$parent.area != 0) {
				this.area = this.$parent.area;
			}
		
		},
		computed:{},
		watch: {},
		methods:{
			setErrors:function(object) {
		        this.message='';
		        let that = this;
		        $.each(object, function(index, value) {
							let campo = index.replace(/_id/g, '');
							campo = campo.replace(/_/g, ' ');
							value = value[0].replace(/ id /g, '');
							that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
		          that.errors_return[index] = 'has-warning';
		        });
		    },
			getCurrentDate:function(data='') {
				let today = moment().format('DD-MMM-YYYY HH:mm:ss');
				return today;
			},
			updateData: function (data) {
                // sync content to component
                this.tarea.descripcion = data;
				this.errors_return.descripcion=false;
            },
            updateDataTareas: function (data) {
                // sync content to component
                // this.tarea.descripcion = data;
                this.tareas_nuevas[this.indice_textarea]['descripcion'] = data;
				this.errors_return.descripcion=false;
            },
			agregarTarea:function(e) {

				if(this.tarea.descripcion==""){
					this.errors_return.descripcion=true;
					 return false;
				}
				// Serializo la fecha del datepicker
				// y la asigno a la tarea
				this.tarea.fecha_entrega_cliente =
					(this.fecha_entrega_cliente)?moment(this.fecha_entrega_cliente).format('YYYY-MM-DD HH:mm:ss'):null;
				this.tarea.fecha_inicio_recurrencia =
					(this.fecha_inicio_recurrencia)?moment(this.fecha_inicio_recurrencia).format('YYYY-MM-DD HH:mm:ss'):null;
				this.tarea.fecha_final_recurrencia =
					(this.fecha_final_recurrencia)?moment(this.fecha_final_recurrencia).format('YYYY-MM-DD HH:mm:ss'):null;
				this.tarea.tiempo_mapa_cliente =
					(this.tarea.tiempo_mapa_cliente)?this.tarea.tiempo_mapa_cliente:null;
				this.$validator.validateAll();
		    if (this.errors.any()) {
		      return false
		    }
				this.tarea.recurrente = parseInt(this.tarea.recurrente);
				this.tarea.estados_id = this.estado.id;
				this.tarea.ots_id= this.ot.id;
				this.tarea.planeacion_fases_id = this.fase.id;
				this.tarea.areas_id = this.area.id;
				this.tarea.usuarios_id = this.user;
				this.tarea.prioridad_id=this.prioridad.id;
				this.tarea.requerimientos_clientes_id=this.select_requerimiento_obj.id;
				this.tarea.arreglo_tareas_extra  = this.organizaAntesDeEnviar(this.tareas_nuevas);

				//console.log(this.tarea.arreglo_tareas_extra ,'Tarea Extra');
//return false;
				let that = this;
				this.$http.post(window._apiURL+'tareas',this.tarea)
		         .then(function(respuesta){
		           if (respuesta.status != '200') {
			            if (Object.keys(respuesta.body.obj).length>0) {
			              this.setErrors(respuesta.body.obj);
			            }
			            toastr.warning(this.message,respuesta.body.msg,this.option_toast);
			          } else {
			            toastr.success(respuesta.body.msg,'',this.option_toast);
			            this.tarea= {};
			            this.select_ot='';
			            this.ot={usuario:{}, cliente:{} };
			            this.current_date=moment().format('DD-MMM-YYYY HH:mm:ss');
			            this.prioridad='';
			            this.fase='';
			            this.estado="";
			            this.area=0;
			            this.fecha_entrega_cliente = '';
									this.descripcion_fake=" ";
			            setTimeout(function(){ that.errors.clear(); location.reload(true); }, 50);
			          }
		           console.log(respuesta);
		         }, (err) => {
							 if (err.status == 404) {
 		            toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
 		          } else {
 		            if (Object.keys(err.body.obj).length>0) {
 		              this.setErrors(err.body.obj);
 		            }else{
 		              that.message = err.body.error;
 		            }
								console.log(err)
 		            toastr.error(this.message,err.body.msg,this.option_toast);
 		          }
		        });
			},
			organizaAntesDeEnviar: function (arrayTareas) {

       //var arrayTareasFinal=[];
				for (let f in arrayTareas) {
					let idx = Number(f)
					let p = arrayTareas[idx]

				arrayTareas[idx].fecha_entrega_cliente =
					(arrayTareas[idx].fecha_entrega_cliente)?moment(arrayTareas[idx].fecha_entrega_cliente).format('YYYY-MM-DD HH:mm:ss'):null;
				arrayTareas[idx].tiempo_mapa_cliente =
					(arrayTareas[idx].tiempo_mapa_cliente)?arrayTareas[idx].tiempo_mapa_cliente:null;
				 arrayTareas[idx].recurrente = 0;
				arrayTareas[idx].estados_id = arrayTareas[idx].estado.id;
				arrayTareas[idx].ots_id= this.ot.id;
				arrayTareas[idx].planeacion_fases_id = arrayTareas[idx].fase.id;
				arrayTareas[idx].areas_id = arrayTareas[idx].area.id;
				arrayTareas[idx].usuarios_id = this.user;
				arrayTareas[idx].prioridad_id=arrayTareas[idx].prioridad.id;

				 }

				 return arrayTareas;


			},
     agregarPrimerTareas: function(){
			 this.$validator.validateAll();
			 if (!this.errors.any()) {
				 this.form_tarea_nueva=true;
				 this.tareas_nuevas=[					{
				 				    prioridad: {
				 				      id: 0,
				 				      nombre: '',
				 				    },
				 				    area: {
				 				      id: 0,
				 				      nombre: '',
				 				    },
				 				    fase: {
				 				      id:0,
				 				      nombre: '',
				 				    },
				 				    estado: {
				 				      id: 0,
				 				      nombre:'',
				 				    },
				 				    nombre_tarea: '',
										fecha_entrega_cliente:'',
				 				  }];
	 			 this.tareas_nuevas[0]['prioridad']=this.prioridad;
	 			 this.tareas_nuevas[0]['area']=this.area;
	 			 this.tareas_nuevas[0]['fase']=this.fase;
	 			 this.tareas_nuevas[0]['estado']=this.estado;
			 }

			 console.log(this.tareas_nuevas);

      },
			agregarMasTareas: function(ind){

			 this.$validator.validateAll();
			 if (this.tareas_nuevas[ind]['prioridad']==null) {
			 	toastr.error('El Campo Prioridad es Obligatorio','Error',this.option_toast);
			 }else if (this.tareas_nuevas[ind]['area']==null) {
			 	toastr.error('El Campo Area es Obligatorio','Error',this.option_toast);
			 }else if (this.tareas_nuevas[ind]['fase']==null) {
			 	toastr.error('El Campo Fase es Obligatorio','Error',this.option_toast);
			 }else if (this.tareas_nuevas[ind]['estado']==null) {
			 	toastr.error('El Campo Estado es Obligatorio','Error',this.option_toast);
			 }else if (this.tareas_nuevas[ind]['descripcion']==null) {
			 	toastr.error('El Campo Descripción es Obligatorio','Error',this.option_toast);
			 }else{

			    if (!this.errors.any()) {
			      this.tareas_nuevas.push(Vue.util.extend({}));
						this.tareas_nuevas[ind+1]['prioridad']=this.prioridad;
						this.tareas_nuevas[ind+1]['area']=this.area;
						this.tareas_nuevas[ind+1]['fase']=this.fase;
						this.tareas_nuevas[ind+1]['estado']=this.estado;
	    		}
			 }


			},
			EliminarTarea:function(ind){

				this.tareas_nuevas[ind]['prioridad']='';
				this.tareas_nuevas[ind]['area']=0;
				this.tareas_nuevas[ind]['fase']='';
				this.tareas_nuevas[ind]['estado']='';
				this.tareas_nuevas[ind]['descripcion']='';
				this.updateDataTareas();
				this.tareas_nuevas[ind]['fecha_entrega_cliente']='';
				this.tareas_nuevas.splice(ind,1);
				// }
				if (this.tareas_nuevas.length==0) {
					this.form_tarea_nueva=false;
				}
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
Vue.component('select_requerimiento',require('../herramientas/select_requerimientos.vue'));
</script>
