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
            <li v-for="usuario in itemsUserArea(usuarios,idareaUser) " :key="usuario.nombre" @click="userviewinfo(usuario.horas_disponible,usuario.id)"><img src="/images/avatars/Desarrollo1.png"><div class="text_user_listado"><p>{{usuario.nombre}}</p><p>{{usuario.cargo}}</p><p>{{usuario.email}}</p><div></li>
          </ul>
        </div>

        <div class="col-md-5 columnas_listar_tareas" >
          <h3 class="titulo_listar_info">Informacion</h3>
          <div class="info_content">
            <h3>Area</h3>
            <p>{{areas_info.nombre}}<span> / Ext {{areas_info.extencion_tel}}</span></p>
          </div>
          <div class="info_content">
            <h3>Encargado</h3>
            <p>{{areas_info.coordinador}}</p>
            <p>{{areas_info.email}}</p>
          </div>
          <div class="info_content" v-if="switcharea_user == '1'">
            <h3>Horas</h3>
            <p>Horas área: <span>{{areas_info.total_horas}}</span></p>
            <p>Horas disponible área: <span>20</span></p>
          </div>
          <div class="info_content" v-if="switcharea_user == '2'">
            <h3>Horas</h3>
            <p>Horas usuario: <span >{{horas_user}}</span></p>
            <p>Horas disponible usuario: <span>20</span></p>
          </div>
          <div class="info_content" v-if="switcharea_user == '2'">
            <a v-bind:href="id_user" ><button class="btn btn-primary" >Editar usuario</button></a>
            <button class="btn btn-danger" v-bind:value="id_user_eliminar" @click="eliminarUsuario(id_user_eliminar)" >Eliminar suario</button>
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
          idareaUser:'',
          areas_info:[],
          switcharea_user:'',
          horas_user:'',
          id_user:'',
          id_user_eliminar:''
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
                // console.log(respuesta);
              });
        },
        consultarApiusuarios:function(areaid){

          this.$http.get('/api/v1/usuarios')
          .then(function(respuesta){
            //asigno los usuarios y el id del area para hacer el filtro en el v-for
            this.usuarios=respuesta.body.data;
            console.log(this.usuarios);
            this.idareaUser=areaid;
            this.switcharea_user=1;
            //consulto la api por el id del area para mostrar la información en la ultima

          });

          //Consulto la api de areas con el id para traer los datos en la columna infomacion
          this.$http.get('/api/v1/areas/'+areaid)
          .then(function(respuesta){
            this.areas_info=respuesta.body;
            
          });
        },
        //FUncion con filtro personalizado para traer los usuarios por io del area
        itemsUserArea: function(items,idareaUser) {
         
            return items.filter(function(item) {
            return item.id_area==idareaUser;

          });  
        },
        userviewinfo:function(horas,id_user){
           this.switcharea_user=2;
           this.horas_user=horas;
           this.id_user="/editar_usuario/"+id_user;
           this.id_user_eliminar=id_user;  
        },
        eliminarUsuario:function(id_usuario_eliminar){
           this.$http.delete('/api/v1/usuarios/'+id_usuario_eliminar)
            .then(function(respuesta){
              console.log(respuesta);
            });
        }              
      
      }

     }


</script>
