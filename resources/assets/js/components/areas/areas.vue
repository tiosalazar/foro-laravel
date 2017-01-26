<template >
   <div> 
      <div class="box box-default collapsed-box" id="main-app">

        <div class="box-header with-border">
            <h3 class="box-title">Crear nueva área</h3>

            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
           </div>

        </div>
    
      <div class="box-body">
          <div  role="form" class="form-inline" action="#">
                <div class="form-group">
                    <label for="nombre_area">Nombre</label>
                    <input type="text" v-model="areaarray.nombre" class="form-control" id="nombre_area" placeholder="Nombre area">
                </div>
                 <div class="form-group">
                    <label for="nombre_ext">Extención</label>
                    <input type="text" v-model="areaarray.extencion_tel" class="form-control" id="nombre_ext" placeholder="Extención">
                </div>
                         
                <div class="form-group">
                   <button class="btn btn-primary" @click="crear_area">Guardar</button>
                </div>     
            </div>
               
      </div>
      
    </div>
      <listar-areas :id_parent_area="id_area_passing"></listar-areas>
    </div>
    
</template>

<script>
    Vue.component(
    'listar-areas',
    require('./listar_areas.vue')
    );


   module.exports= {
        
       data(){
        return{

          areaarray:{},
          id_area_passing:{}        
        }
       },      
        methods:{
          crear_area: function(e){
            this.areaarray.estado=1;
            var input = this.areaarray;
            this.$http.post('api/v1/areas',input)
            .then(function(respuesta){ 
                 console.log(respuesta);
                this.id_area_passing={'id':respuesta.body.area.id,'nombre':respuesta.body.area.nombre,'extencion_tel':respuesta.body.area.extencion_tel,'estado':respuesta.body.area.estado} 
                        
            });
          }
        }

    }

</script>
