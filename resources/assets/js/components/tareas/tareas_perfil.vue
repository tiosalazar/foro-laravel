<template>
	 <div>
        <div class="row tarea_perfil">

          <div v-for="(listado_tarea, key, index) in listado_tareas"  class="box tarea_perfil_box" v-if="key<=variable">

            <div class="box-header">
              <div class="box-header-tittle" >
                <div class="img-circle" >{{listado_tarea.ot.cliente_inicial}}</div>
                <div class="box-header-content">
                  <h4>{{listado_tarea.ot.cliente.nombre }}</h4>
                  <p>{{listado_tarea.nombre_tarea | long_tarea_titulo }}</p>
                  <div v-if="listado_tarea.estados_id==5 || listado_tarea.estados_id==7 || listado_tarea.estados_id==2">
                    <span>{{listado_tarea.created_at}}</span>
                  </div>
                  <div v-else>
                    <span>Entrega área: {{listado_tarea.fecha_entrega_area | date_format}}</span>
                  </div>
                </div>

              </div>

            </div>
            <div class="box-body" >
              <p class="descripcion_tarea_perfil">{{listado_tarea.descripcion | long_tarea_descripcion }}</p>
            </div>
            <div class="box-footer footer_tarea" >
             <a v-bind:href="_baseURL+listado_tarea.url"> <button class="btn btn-primary button_tarea" >Ver tarea</button></a>
            </div>

          </div>
          <div  class="ver_mas" ><span class="ver_mas_texto" v-show="cargar_ok"  @click="cargar_mas" >Ver mas</span></div>
        </div>

        <div class="row tarea_perfil" v-if="this.lista_requerimiento != ''">
          <!-- <h4>Requerimientos</h4>-->
          <div v-for="(lista_requerimiento, key, index) in listado_requerimientos"  class="box tarea_perfil_box" v-if="key<=variable">

            <div class="box-header">
              <div class="box-header-tittle" >
                <div class="img-circle" >{{lista_requerimiento.cliente.cliente_inicial}}</div>
                <div class="box-header-content">
                  <h4>{{lista_requerimiento.cliente.nombre }}</h4>
                   <p>{{lista_requerimiento.nombre | long_tarea_titulo }}</p>
                  <div>
                     <span>Fecha solicitud: {{lista_requerimiento.created_at | date_format}}</span>
                  </div>
                </div>
              </div>
            </div>
            <div class="box-body" >
              <p class="descripcion_tarea_perfil">{{lista_requerimiento.descripcion | long_tarea_descripcion }}<br>
               <span>Fecha ideal de entrega: {{lista_requerimiento.fecha_ideal_entrega | date_format}} </span>
              </p>

            </div>
            <div class="box-footer footer_tarea" >
             <a v-bind:href="_baseURL+lista_requerimiento.url"> <button class="btn btn-primary button_tarea" >Ver requerimiento</button></a>
            </div>

          </div>
          <div  class="ver_mas" ><span class="ver_mas_texto" v-show="cargar_ok"  @click="cargar_mas" >Ver mas</span></div>
          <div  class="ver_mas" ><span class="ver_mas_texto" v-show="cargar_req_ok"  @click="cargar_mas_req" >Ver mas Requerimientos</span></div>
        </div>
      </div>
</template>
<script>

 import moment from 'moment';
	module.exports = {
    props: ['lista_tareas','lista_requerimiento'],
    data(){
      return{
        cargar_ok:false,
		cargar_req_ok:false,
        listado_tareas:[],
        listado_requerimientos:[],
        inicial_cliente:'',
        variable:3,
        option_toast:{
          timeOut: 5000,
          "positionClass": "toast-top-center",
          "closeButton": true,
        }
      }
    },
    filters: {
      //Filtro personalizado para mostrar un número determinado de caracteres de una variable de vue js
      long_tarea_descripcion: function(string) {
        return string.substring(0, 60);
      },
      //Filtro personalizado para mostrar un número determinado de caracteres de una variable de vue js
      long_tarea_titulo: function(string) {
        return string.substring(0, 42);
      },
      date_format: function (value) {
        if (!value) return ''

        return (value)?moment(value).format('DD | MMM | YY'):'';
      }
    },
    created: function() {

      let datos= JSON.parse(this.lista_tareas);
      this.listado_tareas=datos;
      if (this.lista_requerimiento != '') {
				let datos_req= JSON.parse(this.lista_requerimiento);
	      this.listado_requerimientos=datos_req;
      }


      //Si el listado de tareas es mayor que 4 muestro el ver mas
      if (this.listado_tareas.length>3) {
        this.cargar_ok=true;
      }
			if (this.listado_requerimientos.length>3) {
        this.cargar_req_ok=true;
      }
    },
    methods:{
      //Con esta funcion muestro otros cuatro elementos al dar clic sobre el boton ver mas
      cargar_mas: function(){
       var  numero_datos_array=this.listado_tareas.length;
        if (numero_datos_array<=this.variable) {
           toastr.warning('No hay mas tareas por cargar',this.option_toast);
        }else{
          this.variable=this.variable+4;
        }
    },
    cargar_mas_req: function(){
     var  numero_datos_array=this.listado_requerimientos.length;
      if (numero_datos_array<=this.variable) {
         toastr.warning('No hay mas tareas por cargar',this.option_toast);
      }else{
        this.variable=this.variable+4;
      }
    }
    }


  }

</script>
