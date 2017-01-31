<template >
      <div class="box box-primary" id="crear_user">
        <div class="box-header">
            <h3>Crear nuevo Usuario</h3>
        </div>
        
        <div class="box-body">
            <form  role="form">
                <div class="form-group">
                    <label for="nombre_usuario">Nombre</label>
                    <input type="text" class="form-control" id="nombre_usuario" v-model="usuarios.nombre" placeholder="Nombre">
                </div>
                <div class="form-group">
                    <label for="apellidos_usuario">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos_usuario"   v-model="usuarios.apellido" placeholder="Apellidos">
                </div>
                <div class="form-group">
                    <label for="email_usuario">Email</label>
                    <input type="email" class="form-control" id="email_usuario"   v-model="usuarios.email" placeholder="Email">
                </div>
                 <div class="form-group">
                    <label for="contrasena_usuario">Contraseña</label>
                    <input type="text" class="form-control" id="contrasena_usuario"  v-model="usuarios.password"  placeholder="Contraseña">
                </div>
                 <div class="form-group">
                    <label for="cargo_usuario">Cargo</label>
                    <input type="text" class="form-control" id="cargo_usuario"  v-model="usuarios.cargo"  placeholder="Cargo">
                 </div>
                 <div class="form-group">
                    <label for="telefono_usuario">Teléfono</label>
                    <input type="number" class="form-control" id="telefono_usuario"   v-model="usuarios.telefono" placeholder="Teléfono">
                 </div>
                  <div class="form-group">
                    <label for="horas_usuario">Horas Disponibles</label>
                    <input type="number" class="form-control" id="horas_usuario"  v-model="usuarios.horas_disponible"  placeholder="Horas Disponibles">
                 </div>
                  <div class="form-group">
                    <label for="rol_usuario">Rol</label>
                    <select_rol ></select_rol>
                    <!-- <input type="text" class="form-control" id="rol_usuario" placeholder="Rol del usuario"> -->
                 </div>
                  <div class="form-group">
                    <label for="area_usuario">Área</label>
                    <select_area ></select_area>
                 </div>
            </form> 
        </div>

        <div class="box-footer">
           <button class="btn btn-primary" @click="addUser">Guardar</button>  
        </div>
    </div>
</template>

<script>
    import VeeValidate, { Validator } from 'vee-validate';

    Vue.component('select_area',require('../herramientas/select_area.vue'));
    Vue.component('select_rol',require('../herramientas/select_rol.vue'));

    module.exports={
      components: {VeeValidate,Validator},
      
      data(){
        return{
          usuarios:{}
        }
       },
       created: function(){
          this.$on('rol_option', function(v) {
            this.usuarios.roles_id=v.id;
          });
          this.$on('area_option', function(b) {
            this.usuarios.areas_id=b.id;
          });    
      },
       methods:{
        addUser:function(user) {
          
          console.log(this.usuarios);
          this.$http.post('api/v1/user',this.usuarios)
          .then(function (response) {
            console.log(response);
          })
        }
       },
        mounted() {
            console.log('Component ready.')
        }
    }
   
</script>
