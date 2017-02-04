<!--Componente el cual se encarga de guardar la Primera parte de la OT  -->
<!-- Entra: Numeric -> las horas disponibles ya calculadas -->
<!-- Entra: Array -> un arreglo de datos, el cual si esta se encarga de llenar todos los campos del formulario -->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
<template>
	<div class="box box-primary"  id="encabezado_ot">
		<div class="box-header with-border">
			<h3 class="box-title">Detalle OT</h3>
		</div>
		<div class="box-body">
			<div class="row">
				<div class="col-md-6">
					<div class="form-group required ">
						<label for="num_ot" class="col-sm-4 control-label "># OT  <sup>*</sup></label>
						<div class="col-sm-8" v-bind:class="{ 'has-error': errors.has('num_ot') }">
							<input type="text"  name="num_ot" v-validate data-vv-rules="required|alpha_num|min:3" data-vv-as="# OT" v-model="datos_encabezado.num_ot" class="form-control" id="num_ot" placeholder="Numero OT">
							<span  class="help-block" v-show="errors.has('num_ot')">{{ errors.first('num_ot') }}</span>
						</div>
					</div>
					<div class="form-group required">
						<label for="cliente" class="col-sm-4 ">Cliente  <sup>*</sup> </label>
						<div class="col-sm-8" >
							<select_clientes :select="datos_encabezado.cliente" ></select_clientes>
						</div>
					</div>
					<div class="form-group required">
						<label for="name_proyecto" class="col-sm-4 ">Proyecto   <sup>*</sup></label>
						<div class="col-sm-8"  v-bind:class="{ 'has-error': errors.has('name_proyect') }">
							<input type="text" name="name_proyect" class="form-control" v-validate data-vv-rules="required|min:5" data-vv-as="Proyecto" required="required"  v-model="datos_encabezado.name_proyect" id="name_proyecto" placeholder="Nombre del Proyecto">
							<span  class="help-block" v-show="errors.has('name_proyect')">{{ errors.first('name_proyect') }}</span>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group required">
						<label for="estado" class="col-sm-4 ">Estado  <sup>*</sup></label>
						<div class="col-sm-8">
							<select_estados tipo_estado="2"  :select="datos_encabezado.estado" ></select_estados>
							<span  class="help-block" v-show="errors.has('estado')">{{ errors.first('estado') }}</span>
						</div>
					</div>
					<div class="form-group required">
						<label for="valor_total" class="col-sm-4 ">Valor Total <sup>*</sup></label>
						<div class="col-sm-8" v-bind:class="{ 'has-error': errors.has('valor_total') }">
							<input type="text" name="valor_total" v-validate data-vv-rules="required|numeric|min:4" data-vv-as="Valor Total" class="form-control" required="required"  v-model="datos_encabezado.valor_total" id="valor_total" placeholder="Valor Total">
							<span  class="help-block" v-show="errors.has('valor_total')">{{ errors.first('valor_total') }}</span>
						</div>
					</div>
					<div class="form-group required">
						<label for="horas_totales" class="col-sm-4 ">Horas Totales  <sup>*</sup></label>
						<div class="col-sm-8" v-bind:class="{ 'has-error': errors.has('horas_totales') }">
							<input type="text" class="form-control" @input="llenar_horas_totales" required="required" name="horas_totales"  v-validate data-vv-rules="required|decimal:1|max:10|min:1" data-vv-as="Horas Totales" v-model="datos_encabezado.horas_totales"  id="horas_totales" placeholder="Numero de Totales">
							<span  class="help-block" v-show="errors.has('horas_totales')">{{ errors.first('horas_totales') }}</span>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div  class="col-md-6">
					<div class="form-group required">
						<label for="ejecutivo" class="col-sm-4 ">Ejecutivo  <sup>*</sup></label>
						<div class="col-sm-8">
							<select_usuarios  area="1" :select="datos_encabezado.ejecutivo" ></select_usuarios>
						</div>
					</div>
				</div>
			</div>
			<div style="height:15px"></div>
			<div class="row ">
				<div class="col-md-6 col-xs-7">
					<div class="form-group col-md-6 nopadding required">
						<label for="fecha_inicio" class="col-sm-3 nopadding ">Inicio <sup>*</sup></label>
						<div class="col-sm-9" v-bind:class="{ 'has-error': errors.has('fecha_fin') }">
							<div class="input-group date">
								<div class="input-group-addon">
									<i class="fa fa-calendar"></i>
								</div>
								<datepicker language="es" id="fecha_inicio" required="required" v-validate data-vv-rules="required" data-vv-as="Fecha de Inicio" placeholder="Fecha inicio"  :disabled="state.disabled" v-model="datos_encabezado.fecha_inicio" name="fecha_inicio" class="form-control"  format="dd-MM-yyyy"></datepicker>
							</div>
								<span  class="help-block" v-show="errors.has('fecha_inicio')">{{ errors.first('fecha_inicio') }}</span>
						</div>
					</div>
					<div class="form-group col-md-6 nopadding required">
						<label for="fecha_fin" class="col-sm-3 nopadding  ">Fín <sup>*</sup> </label>
						<div class="col-sm-9" v-bind:class="{ 'has-error': errors.has('fecha_fin') }">
							<div class="input-group date"  >
								<div class="input-group-addon" >
									<i class="fa fa-calendar"></i>
								</div>
								<datepicker language="es"  id="fecha_fin" required="required"  v-validate data-vv-rules="required" data-vv-as="Fecha de finalización" placeholder="Fecha fin"  :disabled="state.disabled" v-model="datos_encabezado.fecha_fin" class="form-control"  name="fecha_fin" format="dd-MM-yyyy"></datepicker>
							</div>
							<span  class="help-block" v-show="errors.has('fecha_fin')">{{ errors.first('fecha_fin') }}</span>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-xs-5">
					<div class="form-group required" v-bind:class="{ 'has-error': h_pasadas }">
						<label for="horas_disponibles" class="col-sm-4 " >Horas Disponibles <sup>*</sup></label>
						<div class="col-sm-6">
							<input type="text" class="form-control" required="required"  id="horas_disponibles" v-model="horas_disponibles" disabled placeholder="Numero de Horas Disponibles">
							<span  class="help-block" v-show="h_pasadas">Se ha pasado del numero de horas permitidas para el Area</span>
						</div>
					</div>
				</div>
			</div><!-- /.row -->
			<div style="height:15px"></div>
			<div class="row ">
				<div class=" pull-right  col-md-3">
					<button type="submit" @click="validateBeforeSubmit" class="btn btn-block btn-success col-sm-3">Guardar Avance</button>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
/*DSO 26-01-2017
Realizo los Required
*/
import Datepicker from 'vuejs-datepicker';


module.exports= {
	components: {Datepicker},
	props: ['horas_disponibles'],
	localStorage: {
		datos_encabezado: {
			type: Object,
		}
	},
	data () {
		return {
			datos_encabezado:{
				fecha_inicio:new Date(),
				cliente:'',
				ejecutivo:'',
				htotal:'',
				estado:'',
				num_ot:'',
				name_proyect:'',
				valor_total:'',
				horas_totales:'',
				fecha_fin:'',
			},
			h_pasadas:false,
			option_toast:{
				timeOut: 5000,
				"positionClass": "toast-top-center",
				"closeButton": true,
			},
			state: {
				disabled: {
					to: new Date(), // Disable all dates up to specific date
					//  from: new Date(2017,5,2), // Disable all dates after specific date
					days: [0] // Disable Saturday's and Sunday's
				}
			}
		}
	},
	watch:{
		horas_disponibles:function(){
			this.h_pasadas= (this.horas_disponibles < 0 )?true:false;
		}
	},
	created: function(){
		this.fetchTips();
		/*
		Datos del formulario de clientes
		*/
		this.$on('select_clientes', function(v) {
			this.datos_encabezado.cliente=v;
		});
		/*
		Datos del formulario de Usuarios
		*/
		this.$on('select_ejecutivo', function(v) {
			this.datos_encabezado.ejecutivo=v;
		});
		/*
		Datos del formulario de Estados
		*/
		this.$on('select_estado', function(v) {
			this.datos_encabezado.estado=v;
		});

	},
	methods:{
		/*
     Si encuentra el arreglo de Datos Guardados proceda a llenar el formulario
		*/
		fetchTips: function(){
			if(	this.$localStorage.get('datos_encabezado') != null  ){
				var arreglo =this.$localStorage.get('datos_encabezado');
				var arreglo_Datos = new Object();
				for (var k in arreglo){
					if (typeof arreglo[k] != '') {
						arreglo_Datos[''+k+''] = arreglo[k];
					}
				}
				this.datos_encabezado=arreglo_Datos;
				this.$parent.$emit('horas_totales',this.datos_encabezado.horas_totales);//Envio de total de Horas
			}

		},
		/*
      Esta función se esta ejecutando constantemente, se encarga de emitir las horas totales al padre
		*/
		llenar_horas_totales:function () {
			this.$parent.$emit('horas_totales',this.datos_encabezado.horas_totales);
		},
		/*
    Función Submit de guardar el formulario
		 */
		validateBeforeSubmit(e) {
			this.$validator.validateAll();
			if (!this.errors.any()) {
				if(this.validarSelects() == true){
					var datos_encabezado={
						num_ot:this.datos_encabezado.num_ot,
						name_proyect:this.datos_encabezado.name_proyect,
						valor_total:this.datos_encabezado.valor_total,
						horas_totales:this.datos_encabezado.horas_totales,
						fecha_fin:this.datos_encabezado.fecha_fin,
						fecha_inicio:this.datos_encabezado.fecha_inicio,
						cliente:this.datos_encabezado.cliente,
						estado:this.datos_encabezado.ejecutivo,
						ejecutivo:this.datos_encabezado.estado
					};
					/*Compruebo los datos, si todo esta bien se guardan en LocalStorage*/
					if(this.validarDatos(datos_encabezado) ==true){
						toastr.success('Puede seguir Editando la OT o Regresar más tarde para Continuar con la edición',"Datos Guadados Correctamente",this.option_toast);
						this.$localStorage.set('datos_encabezado',datos_encabezado);
					}

				}
			}
		},
		/*Función la cual me comprueba que los selects esten llenos*/
		validarSelects: function(){
			if(this.cliente == ""){
				toastr.error('No se olvide de elegir un cliente',"Error al guardar los datos",this.option_toast);
				return false;
			}else if(	this.ejecutivo == ""){
				toastr.error('No se olvide elegir el estado de la OT',"Error al guardar los datos",this.option_toast);
				return false;
			}else if(this.estado == ""){
				toastr.error('No se Olvide de elegir a quien va a estar asignada la OT',"Error al guardar los datos",this.option_toast);
				return false;
			}else{
				return true;
			}
		},
		/*Función la cual valida los datos del arreglo de datos, comprueba que ningun campo este vacio*/
		validarDatos: function(arreglo){
			for (var k in arreglo){
				if (typeof arreglo[k] === '') {
					return false;
					 break;
				}
			}
			return true;
		}

	}

	/*DS POR SI NECECITO ESTAS FUNCIONES
	AREA IMPORTS
	import VueLocalStorage from 'vue-localstorage'

	import VeeValidate, { Validator } from 'vee-validate';
	//Traducciones del validador
	import messages from '../../es/es';

	//Realizando los Use

	//Uso LocalStorage para gardar la data.
	Vue.use(VueLocalStorage);
	// Merge the locales.
	Validator.updateDictionary({es: { messages }});
	// Install the plugin and set the locale.
	Vue.use(VeeValidate, { locale: 'es' });
	components: {Datepicker,VueLocalStorage,VeeValidate,Validator},

	COMPUTED

	date: function () {

	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!

	var yyyy = today.getFullYear();
	if(dd<10){
	dd='0'+dd;
}
if(mm<10){
mm='0'+mm;
}
var today = dd+'-'+mm+'-'+yyyy;
return new Date()
}

METHODS
realizarCalculoHoras:function () {
var total_areas  =this.$localStorage.get('listado_areas');
if (total_areas != null || total_areas != undefined ) {
var size = Object.keys(total_areas).length;
var hora_a=0;
var total_a_restar=0;

for (let f in total_areas) {
let idx = Number(f)
let p = total_areas[idx]
hora_a=JSON.parse(this.$localStorage.get('datos_requerimiento_'+p.id));
if (hora_a !=null && hora_a[0].horas !="") {
total_a_restar +=parseInt(hora_a[0].horas);
}
}
var total=	this.horas_totales -total_a_restar;
this.h_pasadas= (this.$localStorage.get('h_Disponibles') > total)?true:false;
console.log(this.h_pasadas);
this.$localStorage.set('h_Disponibles',total);
}


},





*/

}
</script>
