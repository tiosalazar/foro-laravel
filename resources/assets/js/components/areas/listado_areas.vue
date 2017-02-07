<template>
  <div>
    <div class="row listar_areas_modulo">
      <div class="col-md-12">
       <div class="col-md-2 columnas_listar_tareas">
          <h3 class="titulo_listar_area">Áreas</h3>
          <ul >
            <li v-for="area in areas" @click="consultarApiusuarios(area.id)">{{area.nombre}}</li>
          </ul>
        </div>
        <div class="col-md-5 columnas_listar_tareas">
          <h3 class="titulo_listar_user">Usuarios</h3>
          <ul>
            <li v-for="usuario in usuarios"><img src="/images/avatars/Desarrollo1.png"><div class="text_user_listado"><p>{{usuario.nombre}}</p><p>{{usuario.cargo}}</p><p>{{usuario.email}}</p><div></li>
          </ul>
        </div>

        <div class="col-md-5 columnas_listar_tareas">
          <h3 class="titulo_listar_info">Informacion</h3>
          <div class="info_content">
            <h3>Area</h3>
            <p>Diseño <span>/Ext 203</span></p>
          </div>
          <div class="info_content">
            <h3>Encargado</h3>
            <p>Andrés Mabesoy</p>
            <p>afmabesoy@himalayada.com</p>
          </div>
          <div class="info_content">
            <h3>Horas</h3>
            <p>Horas usuario mes: <span>160</span></p>
            <p>Horas disponible usuario: <span>20</span></p>
          </div>
          <div class="info_content">
            <button class="btn btn-primary">Editar usuario</button>
            <button class="btn btn-danger">Eliminar suario</button>
          </div>
        </div>
      </div>
     
    </div>
    
 </div>  

</template>


<script>

 

   module.exports={
   
     data(){
        return{
          areas:[],
          usuarios:[],
          idareaUser:''
        }
     },
     created: function(){
          this.consultarApiAreas();
      }, 
      computed:{
        
      }, 
     methods:{

        consultarApiAreas:function(){

          this.$http.get('/api/v1/areas')
              .then(function(respuesta){
                this.areas=respuesta.body;
                console.log(respuesta);
              });
        },
        consultarApiusuarios:function(areaid){

          this.$http.get('/api/v1/usuarios')
          .then(function(respuesta){
            this.usuarios=respuesta.body.data;
            this.idareaUser=areaid;
             console.log('id del area');
            console.log(this.idareaUser);
            console.log('Usuarios array');
            console.log(this.usuarios);

          });
        },
        //FUncion con filtro personalizado para traer los usuarios por io del area
        // itemsUserArea: function(items) {
        //     return this.items.filter(function(item) {
        //     return item.areas_id=1;
        //   });  
        // }               
      
      }

     }


</script>
