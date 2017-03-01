<template>
 <div>
  
    
    <div class="row listar_areas_modulo">
      <div  class="user_created_and_area" v-show="this.administrador=='1'">
         <a :href="url+'/equipo/usuarios'"><span>Crear usuario</span> + </a>    |   <a :href="url+'/equipo/areas'"><span>Crear area</span> + </a>
      </div>
      <div class="col-md-12 ">

           <!-- Áreas -->
            <div class="col-md-2 col-sm-6 columnas_listar_areas">
              <h3 class="titulo_listar_area">Áreas</h3>
              <ul>
                <a href="#" v-for="area in areas"><li  @click.prevent="consultarApiusuarios(area.id)" class="list_areas" :id="'area_'+area.id" >{{area.nombre}}</li></a>
              </ul>        
            </div>
            <!--fin  Áreas -->

             <!-- Usuarios -->
              <div class="col-md-5 col-sm-6 columnas_listar_areas">
                <h3 class="titulo_listar_user">Usuarios</h3>
                  <ul class="listado_usuarios">
                  <a href="#" v-for="usuario in itemsUserArea(usuarios,idareaUser)" v-bind:key="usuario" class="list-usuario" transition="fade">
                    <li class="listado_usuarios_item"  :key="usuario.nombre" @click="userviewinfo(usuario)" >
                      <div v-if="usuario.img_perfil==null"><img   v-bind:src="url_imagen_defecto"></div>
                      <div v-else><img   v-bind:src="url+usuario.img_perfil"></div>
                      <div class="text_user_listado"><p><strong>{{usuario.nombre}} {{usuario.apellido}}</strong></p><p>{{usuario.cargo}}</p><p>{{usuario.email}}</p></div>
                    </li>
                  </a>
                  </ul>
              </div>
              <!-- Fin usuarios -->
              
              <!-- Información -->
              <div class="col-md-5 col-sm-12 columnas_listar_areas" >
                <h3 class="titulo_listar_info">Información</h3>
                <div class="info_content">
                  <h3>Área</h3>
                  <p>{{areas_info.nombre}} <span style="padding:0px 10px;">/ </span> <span> Ext: {{areas_info.extencion_tel}}</span></p>
                </div>
                <div class="info_content">
                  <h3>Encargado</h3>
                  <p>{{areas_info.coordinador}} {{areas_info.apellido_coordinador}}</p>
                  <p>{{areas_info.email}}</p>
                </div>
                <div class="info_content" v-if="switcharea_user == '1'">
                  <h3>Horas</h3>
                  <p>Horas área: <span>{{areas_info.total_horas}}</span></p>
                  <p>Horas disponible área: <span>{{parseInt(areas_info.total_horas)-parseInt(areas_info.horas_consumidas)}}</span></p>
                </div>
                <div class="info_content" v-if="switcharea_user == '2'">
                  <h3>Horas</h3>
                  <p>Horas usuario mes: <span >{{horas_user}}</span></p>
                  <p>Horas disponibles usuario: <span>{{horas_disponible_user}}</span></p>
                </div>
                <div class="info_content" v-if="switcharea_user == '2'" v-show="this.administrador=='1'" >
                  <a v-bind:href="id_user" ><button class="btn btn-primary btn-flat editar_usuarios_area" >Editar usuario</button></a>
                  <button class="btn btn-danger btn-flat eliminar_usuario_area" v-bind:value="id_user_eliminar" data-target="#confirm_delete_user" data-toggle="modal"  >Eliminar suario</button>
                </div>
              </div>
              <!-- Fin información -->
        </div>
      </div>

   

     <!-- Eliminar usuario Modal -->
     <div class="modal fade " id="confirm_delete_user">
     <div class="modal-dialog">
         <div class="modal-content">
           <div class="modal-header">
            <h3>Está Seguro que desea eliminar este usuario</h3>
           </div>
           <div class="modal-body">
              <div class="center-block" style="width:150px; text-align:center;">
                <button class="btn btn-danger btn-flat" data-dismiss="modal">NO</button>
                <button class="btn btn-primary btn-flat" @click="eliminarUsuario(id_user_eliminar)" data-dismiss="modal">SI</button>
              </div>
              <div class="modal-footer">
              </div>
           </div>
       </div>
     </div>
    </div>
    <!-- Fin usuario Modal -->

 </div>

</template>

<script>



   module.exports={
     props:['administrador'],
     data(){
        return{
          url:'',
          url_imagen_defecto:'',
          areas:[],
          usuarios:[],
          idareaUser:'',
          areas_info:[],
          switcharea_user:'',
          horas_user:'',
          horas_disponible_user:0,
          id_user:'',
          id_user_eliminar:'',
          i:1
        }
     },
     created: function(){
        this.consultarApiAreas();
        this.url=_baseURL;
        this.url_imagen_defecto=_baseURL+"/images/perfil.jpg";
      },
      methods:{
        //Consultar api de areas
        consultarApiAreas:function(){

          this.$http.get(window._apiURL+'listar_areas')
              .then(function(respuesta){
                this.areas=respuesta.body;
                // console.log(respuesta);

              });
        },
        consultarApiusuarios:function(areaid){
          $('.list_areas').removeClass( "active" );
          $('#area_'+areaid).addClass('active');
          // The .each() method is unnecessary here:
          



          this.$http.get(window._apiURL+'usuarios')
          .then(function(respuesta){
            //asigno los usuarios y el id del area para hacer el filtro en el v-for
            this.usuarios=respuesta.body.data;
            // console.log(this.usuarios);
            this.idareaUser=areaid;
            this.switcharea_user=1;
            //consulto la api por el id del area para mostrar la información en la ultima
          });

          //Consulto la api de areas con el id para traer los datos en la columna infomacion
          this.$http.get(window._apiURL+'areas/'+areaid)
          .then(function(respuesta){
            this.areas_info=respuesta.body;
             console.log(this.areas_info);

          });
        },
        //FUncion con filtro personalizado para traer los usuarios por io del area
        itemsUserArea: function(items,idareaUser) {
            return items.filter(function(item) {
            return item.id_area==idareaUser;
          });
        },
        userviewinfo:function(usuario){
          console.log(usuario);
           this.switcharea_user=2;
           this.horas_user=usuario.horas_disponible;
           this.horas_disponible_user=parseInt(usuario.horas_disponible)-parseInt(usuario.horas_gastadas);
           this.id_user="usuarios/editar/"+usuario.id;
           this.id_user_eliminar=usuario.id;

         },
        eliminarUsuario:function(id_usuario_eliminar){
           this.$http.delete(window._apiURL+'usuarios/'+id_usuario_eliminar)
            .then(function(respuesta){
              var id_usuario_respuesta=respuesta.body.obj.id;
              console.log(id_usuario_respuesta);
              var i=0;
              this.usuarios.forEach(function(element, index, array){
                if (element['id']==id_usuario_respuesta) {
                   array.splice(i);
                }
                i++;
              });

            });
        }

      }

     }


</script>
