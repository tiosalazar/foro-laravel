<template>
	<div class="box-header with-border" id="encabezado_ot">
		<div class="row">
			<div class="col-md-6">
				<div class="form-group required">
					<label for="num_ot" class="col-sm-4 "># OT  <sup>*</sup></label>
					<div class="col-sm-8">
						<input type="text"  name="num_ot" required="required" v-model="num_ot" class="form-control" id="num_ot" placeholder="Numero OT">
					</div>
				</div>
				<div class="form-group required">
					<label for="cliente" class="col-sm-4 ">Cliente  <sup>*</sup> </label>
					<div class="col-sm-8" >
						<select_clientes></select_clientes>
					</div>
				</div>
				<div class="form-group required">
					<label for="name_proyecto" class="col-sm-4 ">Proyecto   <sup>*</sup></label>
					<div class="col-sm-8">
						<input type="text" class="form-control" required="required"  v-model="name_proyect" id="name_proyecto" placeholder="Nombre del Proyecto">
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="form-group required">
					<label for="estado" class="col-sm-4 ">Estado  <sup>*</sup></label>
					<div class="col-sm-8">
						<select_estados tipo_estado="2"   ></select_estados>
					</div>
				</div>
				<div class="form-group required">
					<label for="valor_total" class="col-sm-4 ">Valor Total <sup>*</sup></label>
					<div class="col-sm-8 ">
						<input type="text" class="form-control" required="required"  v-model="valor_total" id="valor_total" placeholder="Valor Total">
					</div>
				</div>
				<div class="form-group required">
					<label for="horas_totales" class="col-sm-4 ">Horas Totales  <sup>*</sup></label>
					<div class="col-sm-8">
						<input type="text" class="form-control" required="required" v-model="horas_totales"  id="horas_totales" placeholder="Numero de Totales">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div  class="col-md-6">
				<div class="form-group required">
					<label for="ejecutivo" class="col-sm-4 ">Ejecutivo  <sup>*</sup></label>
					<div class="col-sm-8">
						<select_usuarios  area="1" ></select_usuarios>
					</div>
				</div>
			</div>
		</div>
		  <div style="height:15px"></div>
		<div class="row ">
			<div class="col-md-6">
				<div class="form-group col-md-6 nopadding required">
					<label for="fecha_inicio" class="col-sm-3 nopadding ">Inicio <sup>*</sup></label>
					<div class="col-sm-9">
						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<datepicker language="es" id="fecha_inicio" required="required" placeholder="Fecha de Inicio"  v-model="fecha_inicio" class="form-control"  format="dd-MM-yyyy"></datepicker>
						</div>
					</div>
				</div>
				<div class="form-group col-md-6 nopadding required">
					<label for="fecha_fin" class="col-sm-3 nopadding  ">Fín <sup>*</sup> </label>
					<div class="col-sm-9">
						<div class="input-group date">
							<div class="input-group-addon">
								<i class="fa fa-calendar"></i>
							</div>
							<datepicker language="es"  id="fecha_fin" required="required" placeholder="Fecha fin"  v-model="fecha_fin" class="form-control"   format="dd-MM-yyyy"></datepicker>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6 ">
				<div class="form-group required">
					<label for="horas_disponibles" class="col-sm-4 ">Horas Disponibles <sup>*</sup></label>
					<div class="col-sm-6">
						<input type="text" class="form-control" required="required"  id="horas_disponibles" v-model="h_Disponibles"  placeholder="Numero de Horas Disponibles">
					</div>
				</div>
			</div>
		</div><!-- /.row -->
	</div> <!-- /.box-header with-border -->
</template>

<script>
		import Datepicker from 'vuejs-datepicker';
		import VueLocalStorage from 'vue-localstorage'
		import VueSync from 'vue-sync';
		Vue.use(VueLocalStorage)
		module.exports= {
			components: { Datepicker,VueSync,VueLocalStorage},
			localStorage: {
					    someObject: {
					      type: Object,
					      default: {
					        hello: 'world'
					      }
					    },
					    num_ot: {
					      type: Number
					    },
					    h_Disponibles: {
					      type: Number
					    },
					    name_proyect: {
					      type: String
					    },
					    valor_total: {
					      type: String
					    }
					  },
			data () {
				return {
             h_Disponibles:'',
						 fecha_inicio:'',
						 cliente:'',
						 fecha_fin:'',
						 ejecutivo:'',
						 horas_totales:'',
						 htotal:'',
						 valor_total:'',
						 estado:'',
						 name_proyect:'',
						 num_ot:''
				}
			},
			computed:{
				/*
				num_ot: function () {
					return this.h_Disponibles
				}*/

			},
			created: function(){
				this.fetchTips();
			},
			methods:{
				fetchTips: function(){
					/*let lsValue = this.$localStorage.get('someObject')
						 this.$localStorage.set('someBoolean', true)
						 this.$localStorage.remove('stringOne')*/
				}
			}
		}
</script>
