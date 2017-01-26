<template id="rol_list">
   <div> 
      <div class="box box-default collapsed-box" id="main-app">

        <div class="box-header with-border">
            <h3 class="box-title">Crear nuevo rol</h3>

            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
           </div>

        </div>
    
      <div class="box-body">
          <div  role="form" class="form-inline" action="#">
                <div class="form-group">
                    <label for="nombre_rol">Nombre</label>
                    <input type="text" v-model="rolarray.nombre"  class="form-control" id="nombre_rol" placeholder="Nombre del rol" required="">
                </div>
                <div class="form-group">
                   <button class="btn btn-primary" v-on:click="crear_rol();">Guardar</button>
                </div>     
            </div>
                         
      </div>
      
    </div>
      <listar-roles :rolname="rolarray" :id_parent="id_rol_passing" ></listar-roles>
     
    </div>
    
</template>

<script>

     Vue.component(
        'listar-roles',
        require('./listar_roles.vue')
      );

  
   module.exports= {
  
       ready(){
    
       },
       data(){
        return{
          rolarray: {},
          id_rol_passing:{}        
        }
        
       },      
        methods:{
          
          crear_rol: function(e){
            
          var input = this.rolarray;            
            this.$http.post('api/v1/roles',input)
            .then(function(respuesta){ 
                 console.log(respuesta);
                this.id_rol_passing={'id':respuesta.body.rol.id,'nombre':respuesta.body.rol.nombre}           
            });
          }
        }

    }

      
    
</script>
