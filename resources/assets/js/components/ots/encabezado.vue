<!--Componente el cual se encarga de guardar la Primera parte de la OT  -->
<!-- Entra: Numeric -> las horas disponibles ya calculadas -->
<!-- Entra: Array -> un arreglo de datos, el cual si esta se encarga de llenar todos los campos del formulario -->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
<template>
	<div class=""  id="encabezado_ot">
	    <!-- Mensaje de atención -->
		<div class="box">
			<div class="box-header with-border bg-aqua-active">
			<h3 class="box-title bg-aqua-active">Atención</h3>

			<div class="box-tools pull-right ">

				<button type="button" class="btn btn-box-tool" data-widget="remove" data-toggle="tooltip" title="Cerrar">
				<i class="fa fa-times" style="color:white;"></i></button>
			</div>
			  <div> Recuerda ir guardardando los datos al terminar de llenar cada sección de la  <b>OT</b></div>
				<div> cada que realices un cambio recuerda guardarlo en su debida sección del formulario</div>
			</div>

		</div>

			<h3 class="box-title"><span class="span_descripcion1">Detalle</span> <span class="span_descripcion2">OT</span></h3>
		<div class="box-body">
			<div style="height:22px"></div>
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row ">
						<label for="num_ot" class="col-sm-12 control-label "><sup>*</sup> Número de OT  </label>
						<div class="col-sm-12" v-bind:class="{ 'has-error': errors.has('num_ot') }">
							<input type="text"  name="num_ot" v-validate data-vv-rules="required|min:3" data-vv-as="# OT" @input="guardarDatos" v-model="datos_encabezado.num_ot" class="form-control" id="num_ot" placeholder="Número de OT">
							<span  class="help-block" v-show="errors.has('num_ot')">{{ errors.first('num_ot') }}</span>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row ">
						<label for="estado" class="col-sm-12 "><sup>*</sup> Estado de OT </label>
						<div class="col-sm-12">
							<select_estados tipo_estado="2"  :select="datos_encabezado.estado" ></select_estados>
							<span  class="help-block" v-show="errors.has('estado')">{{ errors.first('estado') }}</span>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row">
						<label for="cliente" class="col-sm-12 "><sup>*</sup>  Cliente  </label>
						<div class="col-sm-12" >
							<select_clientes :select="datos_encabezado.cliente" ></select_clientes>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row">
						<label for="valor_total" class="col-sm-12 "><sup>*</sup> Fee </label>
						<div class="col-sm-12" v-bind:class="{ 'has-error': errors.has('fee') }">
							<div class="col-sm-4 col-xs-6 formulario">
								<input type="radio" name="fee" value="1" id="male" v-model="datos_encabezado.fee"  required="required"  @input="guardarDatos" ><label for="male"> Si</label>
							</div>
							<div class="col-sm-4 col-xs-6 formulario" >
								<input type="radio" name="fee" value="0" id="female" v-model="datos_encabezado.fee"   required="required"   @input="guardarDatos" > <label for="female"> No</label>
							</div>
							<span  class="help-block" v-show="errors.has('fee')">{{ errors.first('fee') }}</span>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row">
						<label for="name_proyecto" class="col-sm-12 "><sup>*</sup> Proyecto   </label>
						<div class="col-sm-12"  v-bind:class="{ 'has-error': errors.has('name_proyect') }">
							<input type="text" name="name_proyect" class="form-control" v-validate data-vv-rules="required|min:5"  @input="guardarDatos" data-vv-as="Proyecto" required="required"  v-model="datos_encabezado.name_proyect" id="name_proyecto" placeholder="Nombre del proyecto">
							<span  class="help-block" v-show="errors.has('name_proyect')">{{ errors.first('name_proyect') }}</span>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row ">
						<label for="valor_total" class="col-sm-12 "><sup>*</sup> Valor total </label>
						<div class="col-sm-12" v-bind:class="{ 'has-error': errors.has('valor_total') }">
							<input type="text" name="valor_total" v-validate data-vv-rules="required"  @input="guardarDatos(),processValue()" data-vv-as="Valor Total" class="form-control" required="required"  v-model="datos_encabezado.valor_total" id="valor_total" placeholder="$">
							<span  class="help-block" v-show="errors.has('valor_total')">{{ errors.first('valor_total') }}</span>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row">
						<label for="ejecutivo" class="col-sm-12 "><sup>*</sup> Ejecutivo  </label>
						<div class="col-sm-12">
							<select_usuarios  area="cuentas" :select="datos_encabezado.ejecutivo" ></select_usuarios>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row ">
						<label for="horas_totales" class="col-sm-12 "><sup>*</sup> Horas totales  </label>
						<div class="col-sm-12" v-bind:class="{ 'has-error': errors.has('horas_totales') }">
							<input type="text" class="form-control" @input="llenar_horas_totales(),guardarDatos()" required="required" name="horas_totales"  v-validate data-vv-rules="required|decimal:2|max:10|min:1" data-vv-as="Horas Totales" v-model="datos_encabezado.horas_totales"  id="horas_totales" placeholder="Número de horas totales">
							<span  class="help-block" v-show="errors.has('horas_totales')">{{ errors.first('horas_totales') }}</span>
						</div>
					</div>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 same-height">
					<div class="form-group required row dates">
						<label   class="col-sm-12 "><sup>*</sup> Fecha OT  </label>
						<div class="form-group col-md-12  required">
							<label for="fecha_inicio" class="col-sm-12  ">Inicio </label>
							<div class="col-sm-9" v-bind:class="{ 'has-error': errors.has('fecha_inicio') }">
								<div class="input-group date">
									<div class="input-group-addon">
										<i class="fa fa-calendar"></i>
									</div>
									<datepicker language="es" id="fecha_inicio" required="required" v-validate data-vv-rules="required"  @input="guardarDatos" data-vv-as="Fecha de Inicio" placeholder="Fecha inicio"  :disabled="state.disabled" v-model="datos_encabezado.fecha_inicio" name="fecha_inicio" class="form-control"  format="dd-MM-yyyy"></datepicker>
								</div>
								<span  class="help-block" v-show="errors.has('fecha_inicio')">{{ errors.first('fecha_inicio') }}</span>
							</div>
						</div>
						<div class="form-group col-md-12  required">
				<label for="fecha_fin" class="col-sm-12   "> Fín </label>
				<div class="col-sm-9" v-bind:class="{ 'has-error': errors.has('fecha_fin') }">
					<div class="input-group date"  >
						<div class="input-group-addon" >
							<i class="fa fa-calendar"></i>
						</div>
						<datepicker language="es"  id="fecha_fin" required="required"  @input="guardarDatos"  v-validate data-vv-rules="required" data-vv-as="Fecha de finalización" placeholder="Fecha fin"  :disabled="state.disabled_fin" v-model="datos_encabezado.fecha_fin" class="form-control"  name="fecha_fin" format="dd-MM-yyyy"></datepicker>
					</div>
					<span  class="help-block" v-show="errors.has('fecha_fin')">{{ errors.first('fecha_fin') }}</span>
				</div>
			</div>
		</div>

	</div>

	<div class="col-md-6 col-sm-6 col-xs-12 same-height">


		<div class="row">
			<div :class="{'col-md-6': $parent.visualizacion =='true','col-md-12': $parent.visualizacion !='true'}" >
				<div class="form-group required row" v-bind:class="{ 'has-error': datos_encabezado.h_pasadas }">
					<label for="horas_disponibles" class="col-sm-12 col-xs-4 col-sm-offset-0 col-xs-offset-4" ><sup>*</sup> Horas disponibles </label>
					<div class="col-sm-12 col-xs-4 col-sm-offset-0 col-xs-offset-4">
						<div class="campo_azul col-xs-12" :class="{'col-sm-12': $parent.visualizacion =='true','col-sm-4': $parent.visualizacion !='true'}">
							{{ horas_disponibles }}
						</div>
							<!--<input type="text" class="form-control" required="required"  id="horas_disponibles" v-model=" horas_disponibles" disabled placeholder="Numero de Horas Disponibles">
						-->
						<span  class="help-block" style="position:relative; display: inline-block;" v-show="datos_encabezado.h_pasadas">Se ha pasado del numero de horas permitidas para el Area</span>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6" v-show="$parent.visualizacion == 'true'">
				<div class="form-group required row" >
					<label  class="col-sm-12 " > Total Horas Adicionales  </label>
					<div class="col-sm-12">
						<div class="campo_azul col-sm-12">
							{{ $parent.h_extra_total }}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-md-6 col-md-offset-3 col-xs-12" >
		<div style="height:15px"></div>
		<button type="submit" @click="validateBeforeSubmit" class="btn btn-block btn-success boton_foro succes text-center">Guardar Información</button>
		<div style="height:15px"></div>
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
import moment from 'moment'

module.exports= {
	components: {Datepicker},
	props: ['horas_disponibles','limpiar_datos'],
	localStorage: {
		datos_encabezado: {
			type: Object,
		}
	},
	data () {
		return {
			datos_encabezado:{
				fecha_inicio: moment().toDate(),
				cliente:'',
				ejecutivo:'',
				fee:1,
				htotal:'',
				estado:'',
				num_ot:'',
				name_proyect:'',
				valor_total:'',
				horas_totales:'',
				fecha_fin:'',
				h_pasadas:false,
			},
			valor_formated:'',
			option_toast:{
				timeOut: 5000,
				"positionClass": "toast-top-center",
				"closeButton": true,
			},
			state: {
				disabled: {
					to: moment().subtract(1, 'days').toDate(), // Disable all dates up to specific date
					//  from: new Date(2017,5,2), // Disable all dates after specific date
					days: [0] // Disable Saturday's and Sunday's
				},
				disabled_fin:{
					to:moment().toDate(),
					days:[0]
				}
			}
		}
	},
	watch:{
		horas_disponibles:function(){
			this.datos_encabezado.h_pasadas= (this.horas_disponibles < 0 )?true:false;
		},
		limpiar_datos: function(){
			if(this.limpiar_datos == true){
				this.datos_encabezado={
					fecha_inicio:new Date(),
					cliente:'',
					ejecutivo:'',
					fee:1,
					htotal:'',
					estado:'',
					num_ot:'',
					name_proyect:'',
					valor_total:'',
					horas_totales:'',
					fecha_fin:'',
					h_pasadas:false,
				};
			}
		},
		/*valor_formated: function (val) {
	        let thing = numeral(val).format('0,0');
	        console.log(thing)
	        return thing;
	      },*/
	},
	created: function(){
		this.fetchTips();
		this.llenarDatosSiesVisualizacion();
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
	computed:{
      /*valor_formated: function (val) {
        let thing = numeral(val).format('0,0');
        console.log(thing)
        return thing;
      },*/
    },
	methods:{
		processValue:function() {
			console.log('thing')
			// this.$emit('input', numeral(val).format('0,0'))
			this.datos_encabezado.valor_total =  numeral(this.datos_encabezado.valor_total).format('0,0')
		},
		/*
     Si encuentra el arreglo de Datos Guardados proceda a llenar el formulario
     */
     fetchTips: function(){
     	if(	this.$localStorage.get('datos_encabezado') != null && this.$localStorage.get('datos_encabezado') != ""  ){
     		var arreglo =this.$localStorage.get('datos_encabezado');
     		var arreglo_Datos = new Object();
     		for (var k in arreglo){
     			if (typeof arreglo[k] != '') {
     				arreglo_Datos[''+k+''] = arreglo[k];
     			}
     		}
     		this.datos_encabezado=arreglo_Datos;
				this.$parent.$emit('horas_totales',this.datos_encabezado.horas_totales);//Envio de total de Horas
				this.$parent.$emit('datos_encabezado',arreglo);//Emite los datos al padre
			}

		},
		 number_format: function(amount, decimals) {
			    amount += ''; // por si pasan un numero en vez de un string
			    amount = parseFloat(amount.replace(/[^0-9\.]/g, '')); // elimino cualquier cosa que no sea numero o punto

			    decimals = decimals || 0; // por si la variable no fue fue pasada

			    // si no es un numero o es igual a cero retorno el mismo cero
			    if (isNaN(amount) || amount === 0)
			        return parseFloat(0).toFixed(decimals);

			    // si es mayor o menor que cero retorno el valor formateado como numero
			    amount = '' + amount.toFixed(decimals);

			    var amount_parts = amount.split('.'),
			        regexp = /(\d+)(\d{3})/;

			    while (regexp.test(amount_parts[0]))
			        amount_parts[0] = amount_parts[0].replace(regexp, '$1' + ',' + '$2');

			    return amount_parts.join('.');
			},
		llenarDatosSiesVisualizacion: function(){

			if (this.$parent.visualizacion=="true") {

				var arreglo_visualizar =JSON.parse(this.$parent.arreglo_visualizar);
				console.log(arreglo_visualizar);
				this.datos_encabezado={
					fecha_inicio:arreglo_visualizar.datos_encabezado.fecha_inicio,
					cliente:arreglo_visualizar.datos_encabezado.cliente,
					ejecutivo:arreglo_visualizar.datos_encabezado.ejecutivo,
					fee:arreglo_visualizar.datos_encabezado.fee,
					estado:arreglo_visualizar.datos_encabezado.estado,
					num_ot:arreglo_visualizar.datos_encabezado.referencia,
					horas_totales:arreglo_visualizar.datos_encabezado.horas_totales,
					horas_disponibles:arreglo_visualizar.datos_encabezado.horas_disponibles,
					name_proyect:arreglo_visualizar.datos_encabezado.nombre,
					valor_total:numeral(arreglo_visualizar.datos_encabezado.valor).format('0,0'),
					fecha_fin:arreglo_visualizar.datos_encabezado.fecha_final
				};
				this.llenar_horas_totales();

				//this.horas_disponibles=arreglo_visualizar.datos_encabezado.horas_disponibles;
			    this.$parent.$emit('datos_encabezado',this.datos_encabezado);//Emite los datos al padre

					/*this.datos_requerimiento=arreglo_visualizar.requerimientos;
					this.datos_compras=arreglo_visualizar.compras;*/
				}

			},
		/*
      Esta función se esta ejecutando constantemente, se encarga de emitir las horas totales al padre
      */
      llenar_horas_totales:function () {

      	//console.log("Horas Totales Encabezado : "+ this.datos_encabezado.horas_totales);
      	this.$parent.$emit('horas_totales',this.datos_encabezado.horas_totales);
      },
		/*
     Le envia constantemente los datos al padre, por si la persona no le da en guardar Avance
     */
     guardarDatos: function () {
     	this.state.disabled_fin.to = moment(this.datos_encabezado.fecha_inicio).toDate();
			//Wed Feb 15 2017 00:00:00 GMT-0500 (Hora est. Pacífico, Sudamérica)
			var datos_encabezado={
				num_ot:this.datos_encabezado.num_ot,
				name_proyect:this.datos_encabezado.name_proyect,
				valor_total:numeral(this.datos_encabezado.valor_total).value(),
				fee:this.datos_encabezado.fee,
				horas_totales:this.datos_encabezado.horas_totales,
				horas_disponibles:this.horas_disponibles,
				fecha_fin:moment(this.datos_encabezado.fecha_fin).format('YYYY-MM-DD'),
				fecha_inicio:moment(this.datos_encabezado.fecha_inicio).format('YYYY-MM-DD'),
				cliente:this.datos_encabezado.cliente,
				estado:this.datos_encabezado.estado,
				ejecutivo:this.datos_encabezado.ejecutivo,
				h_pasadas:this.datos_encabezado.h_pasadas
			};
			// console.log(datos_encabezado)
			  this.$parent.$emit('datos_encabezado',datos_encabezado);//Emite los datos al padre

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
    				valor_total:numeral(this.datos_encabezado.valor_total).value(),
    				horas_totales:this.datos_encabezado.horas_totales,
    				horas_disponibles:this.horas_disponibles,
    				fee:this.datos_encabezado.fee,
    				fecha_fin:moment(this.datos_encabezado.fecha_fin).format('YYYY-MM-DD'),
    				fecha_inicio:moment(this.datos_encabezado.fecha_inicio).format('YYYY-MM-DD'),
    				cliente:this.datos_encabezado.cliente,
    				estado:this.datos_encabezado.estado,
    				ejecutivo:this.datos_encabezado.ejecutivo,
    				h_pasadas:this.datos_encabezado.h_pasadas
    			};
    			/*Compruebo que no se haya pasado de las horas*/
    			if(datos_encabezado.h_pasadas ==true){
    				toastr.error('El Resúmen de horas no puede dar negativo',"Error al guardar los datos",this.option_toast);
    				return false;
    			}
    			/*Compruebo los datos, si todo esta bien se guardan en LocalStorage*/
    			else if (this.validarDatos(datos_encabezado) ==true){
    				toastr.success('Puede seguir Editando la OT o Regresar más tarde para Continuar con la edición',"Datos Guadados Correctamente",this.option_toast);
    				this.$localStorage.set('datos_encabezado',datos_encabezado);
						this.$parent.$emit('datos_encabezado',datos_encabezado);//Emite los datos al padre
					}

				}
			}
		},
		limpiarFechas:function(fecha){
			if (fecha != null && fecha != undefined && fecha != '' && this.validarFormatoFecha(fecha) ==false ) {
			//console.log(fecha.toISOString());
			var fecha1=fecha;
			fecha1=fecha1.toISOString();
			var arreglo_nuevo=fecha1.split("T");
			return arreglo_nuevo[0];
		}else{
			return fecha;
		}
	},
	validarFormatoFecha:function(campo) {
		var campo2 = campo;
		var RegExPattern = /^\d{1,2}\-\d{1,2}\-\d{2,4}$/;
		//var RegExPattern2 = /^\d{1,2}\-\d{1,2}\-\d{2,4}\ \d{0,2}\:\d{0,2}\:\d{0,2}$/;

		console.log(moment(campo).format('DD-MM-YYYY'));

		if (  (String(campo2).match(RegExPattern)) && ( String(campo2) !='') ) {
			return true;
		} else {
			return false;
		}
	},
	/*Función la cual me comprueba que los selects esten llenos*/
	validarSelects: function(){
		if(this.datos_encabezado.cliente == "" || this.datos_encabezado.cliente ==null){
			toastr.error('No olvide elegir un cliente',"Error al guardar los datos",this.option_toast);
			return false;
		}else if(	this.datos_encabezado.ejecutivo == "" || this.datos_encabezado.ejecutivo ==null){
			toastr.error(' No olvide elegir a quien va a estar asignada la OT',"Error al guardar los datos",this.option_toast);
			return false;
		}else if(this.datos_encabezado.estado == "" || this.datos_encabezado.estado ==null){
			toastr.error('No olvide elegir el estado de la OT',"Error al guardar los datos",this.option_toast);
			return false;
		}else{
			return true;
		}
	},
	/*Función la cual valida los datos del arreglo de datos, comprueba que ningun campo este vacio*/
	validarDatos: function(arreglo){
		for (var k in arreglo){
			if (typeof arreglo[k] == '') {
				return false;
				break;
			}
		}
		return true;
	}

}



}
</script>
