<template>
	 <div>
        <div class="row tarea_perfil">
          <div v-for="listado_area in listado_areas" class="box tarea_perfil_box">
            <div class="box-header">
              <div class="box-header-tittle" >
                <div class="img-circle" >M</div>
                <div class="box-header-content">
                  <h4>Manitoba</h4>
                  <p>{{listado_area.nombre_tarea}}</p>
                  <span>OT 1234 20/ene/2017</span>
                </div>
                
              </div>
              
            </div>
            <div class="box-body" >
              <p >{{listado_area.descripcion}}</p>
            </div>
            <div class="box-footer footer_tarea" >             
              <button class="btn btn-primary button_tarea" >Ver tarea</button>
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
        listado_areas:[]
      }
    },
    created: function() {
      datos= JSON.parse(this.lista_tareas);
      this.listado_areas=datos;
      console.log(this.listado_areas);
    },

  }

</script>