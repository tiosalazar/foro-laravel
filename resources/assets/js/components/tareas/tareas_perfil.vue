<template>
	 <div>
        <div class="row tarea_perfil">

          <div v-for="(listado_tarea, key, index) in listado_tareas" class="box tarea_perfil_box" v-if="key<=variable">

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
                    <span>{{listado_tarea.updated_at}}</span>
                  </div>
                </div>

              </div>

            </div>
            <div class="box-body" >
              <p >{{listado_tarea.descripcion | long_tarea_descripcion }}</p>
            </div>
            <div class="box-footer footer_tarea" >
             <a v-bind:href="_baseURL+listado_tarea.url"> <button class="btn btn-primary button_tarea" >Ver tarea</button></a>
            </div>

          </div>
          <div  class="ver_mas" ><span class="ver_mas_texto" v-show="cargar_ok"  @click="cargar_mas" >Ver mas</span></div>

        </div>
      </div>
</template>
<script>
	module.exports = {
    props: ['lista_tareas'],
    data(){
      return{
        cargar_ok:false,
        listado_tareas:[],
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
      }
    },
    created: function() {
      datos= JSON.parse(this.lista_tareas);
      this.listado_tareas=datos;
			console.log(this.listado_tareas);
      //Si el listado de tareas es mayor que 4 muestro el ver mas
      if (this.listado_tareas.length>3) {
        this.cargar_ok=true;
      }
    },

    methods:{
      //Con esta funcion muestro otros cuatro elementos al dar clic sobre el boton ver mas
      cargar_mas: function(){
        numero_datos_array=this.listado_tareas.length;
        if (numero_datos_array<=this.variable) {
           toastr.warning('No hay mas tareas por cargar',this.option_toast);
        }else{
          this.variable=this.variable+4;
        }
      }
    }


  }

</script>
