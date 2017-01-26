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
                    <input type="text" v-model="rolarray.nombre"  class="form-control" id="nombre_rol" placeholder="Nombre del rol" >
                </div>
                <div class="form-group">
                   <button class="btn btn-primary" v-on:click="crear_rol();">Guardar</button>
                </div>     
            </div>
                         
      </div>
      
    </div>
      <listar-roles :rolname="rolarray"></listar-roles>
     
    </div>
    
</template>

<script>



     var nuevo = Vue.component(
      'listar-roles',
      require('./listar_roles.vue')
      );

  
   module.exports= {

       // created: function(){
       //    this.consumerApi_listRol();
       // },
       ready(){
    
       },
       data(){
        return{
          rolarray: {},        
        }
        
       },      
        methods:{
          
          crear_rol: function(e){
            
             var input = this.rolarray;            
            this.$http.post('api/v1/roles',input)
            .then(function(respuesta){ 

                $('#listarol td:last-child').before("<td class='col-md-2'>"+input+"</td><td class='col-md-9'><button class='btn btn-warning btn-xs' data-toggle='modal' data-target='#myModal_rol'>Editar</button></td>");                
            });
          }
        }

    }

      
    
</script>
