<template>
	<form role="form" name="crear_tarea" class="crear_tarea">
              <div class="box-body">
              <div class="form-group">
				<label for="ot">Nombre el Projecto</label>
                <select_ot></select_ot>
              </div>
              <div class="row">
                <div class="col-sm-3 border-right">
                  <div class="description-block">
                    <h5 class="description-header">{{ot.referencia}}</h5>
                    <span class="description-text">Referencia</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 border-right">
                  <div class="description-block">
                    <h5 class="description-header">{{ot.nombre_cli}}</h5>
                    <span class="description-text">Cliente</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 border-right">
                  <div class="description-block">
                    <h5 class="description-header">{{ot.nombre}}</h5>
                    <span class="description-text">Proyecto</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3">
                  <div class="description-block">
                    <h5 class="description-header">{{ot.nombre_ej}}</h5>
                    <span class="description-text">Ejecutiva</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
              </div>
              <!-- /.row -->
              <div class="form-group">
                <label>Date masks:</label>

                <div class="input-group">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control" data-inputmask="'alias': 'dd/mm/yyyy'" data-mask="" v-model="current_date" disabled="disabled">
                </div>
                <!-- /.input group -->
              </div>
              <div class="form-group">
				<label for="ot">Prioridad</label>
              	<select_prioridad></select_prioridad>
              </div>
                <div class="form-group">
					<label for="ot">Fase del Projecto</label>
                	<select_fase></select_fase>
	            </div>
	            <div class="form-group">
					<label for="ot">Área</label>
                	<select_area  :refresha="refresh"></select_area>
	            </div>
				<label for="ot">Fecha entrega cliente</label>
				<div class="input-group date">
					<div class="input-group-addon">
						<i class="fa fa-calendar"></i>
					</div>
					<datepicker language="es"  id="fecha_fin" required="required" placeholder="Fecha fin" v-model="fecha_fin" class="form-control"  name="fecha_fin" format="dd-MM-yyyy"></datepicker>
				</div>
				<div class="form-group">
                  <label for="nombre_solicitud">Nombre de la Solicitud</label>
                  <input type="text" class="form-control"  id="nombre_solicitud" v-model="tarea.name" name="name" placeholder="Solicitud">
                </div>
                <div class="form-group">
                  <label for="descripcion">Descripción</label>
                  <textarea class="form-control" rows="3"  name="descripcion"  id="descripcion" v-model="tarea.descripcion" placeholder="Descripción"></textarea>
                </div>
                <div class="form-group">
                  <label for="ruta_serve">Ruta del server</label>
                  <textarea class="form-control" rows="3" name="ruta_serve"  id="ruta_serve" v-model="tarea.ruta_serve" placeholder="Ruta del server"></textarea>
                </div>
                <div class="form-group">
                  <label for="ruta_serve">Ruta del server</label>
                  <select_estados tipo_estado="1"  :select="tarea.estado" ></select_estados>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
</template>
<script>
import Datepicker from 'vuejs-datepicker';
    module.exports = {
    components: {Datepicker},
      data(){
        return{
          // usuarios:[],
          tarea:{},
          ot:{},
          current_date:'',
          refresh:'',
          fecha_fin:''
        }
       },
        created: function() {
        	this.$on('send-ot', function(obj) { 
        		console.log('Work',obj); 
        		this.ot= obj;
        	});
        	this.current_date=this.getCurrentDate();

    	},
       computed:{

       },
       watch: {

       },
       methods:{
        addUser:function(user) {
          
        },
        getCurrentDate:function() {

        	var today = new Date();
        	var dd = today.getDate();
			var mm = today.getMonth()+1; //January is 0!
			var yyyy = today.getFullYear();
			var HH = today.getHours(); 
            var MM = today.getMinutes(); 
            var ss = today.getSeconds();
			if(dd<10) {
				dd='0'+dd
			} 
			if(mm<10) {
				mm='0'+mm
			} 
			if(HH<10) {
				HH='0'+HH
			} 
			if(MM<10) {
				MM='0'+MM
			}
			if(ss<10) {
				ss='0'+ss
			} 
			today = yyyy +'-' + dd+'-'+ mm +' '+ HH + ':' + MM + ':' + ss;
			return today;
			}
       },
        mounted() {
            console.log('Component ready.')
        }
    }
    Vue.component('select_estados',require('../herramientas/select_estado.vue'));
    Vue.component('select_area',require('../herramientas/select_area.vue'));
    Vue.component('select_fase',require('../herramientas/select_fase.vue'));
    Vue.component('select_prioridad',require('../herramientas/select_prioridad.vue'));
    Vue.component('select_ot',require('../herramientas/select_ot.vue'));
    Vue.component('select_area',require('../herramientas/select_area.vue'));
    Vue.component('select_rol',require('../herramientas/select_rol.vue'));
</script>