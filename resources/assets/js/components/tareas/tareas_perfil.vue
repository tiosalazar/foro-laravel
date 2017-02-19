<template>
	 <div>
        <div class="row tarea_perfil">
          <div v-for="listado_tarea in listado_tareas" class="box tarea_perfil_box">
            <div class="box-header">
              <div class="box-header-tittle" >
                <div class="img-circle" >{{listado_tarea.ot.cliente_inicial}}</div>
                <div class="box-header-content">
                  <h4>{{listado_tarea.ot.cliente.nombre}}</h4>
                  <p>{{listado_tarea.nombre_tarea}}</p>
                  <span>{{listado_tarea.created_at}}7</span>
                </div>
                
              </div>
              
            </div>
            <div class="box-body" >
              <p >{{listado_tarea.descripcion}}</p>
            </div>
            <div class="box-footer footer_tarea" >             
             <a v-bind:href="listado_tarea.url"> <button class="btn btn-primary button_tarea" >Ver tarea</button></a>
            </div>
            
          </div>

        </div>
      </div>
</template>
<script>
	module.exports = {
    props: ['lista_tareas'],
    data(){
      return{
        listado_tareas:[],
        inicial_cliente:''
      }
    },
    created: function() {
      datos= JSON.parse(this.lista_tareas);
      this.listado_tareas=datos;
      console.log(this.listado_tareas);

      // this.inicial_cliente=this.listado_tareas.ot.cliente.nombre.substr(0,1);
      // var dato={'inicial_cliente':this.inicial_client}
      // this.listado_tareas.push(dato);
    },

  }

</script>