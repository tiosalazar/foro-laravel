
<template>

  <div class="permisos">

    <div class="box box-primary">
      <div class="box-header">
         <div>
          <h3 class="box-title" >Asignar Permisos</h3>
          <select_rol class="select_rol" :refresh="rol"></select_rol> 
         </div>
        <!-- <div class="alert alert-danger alerta" v-show="alerta">Debe seleccionar un rol</div> -->
      </div>

      <div class="box-body no-padding">
        <form action="" class="form-permisos">
         <div v-for="listado_permiso in listado_permisos"  class="checkbox checkbox-success permisos_check" >
              <input :id="listado_permiso.name" class="styled" type="checkbox" :value="listado_permiso.id" v-model="permisos_marcados">
              <label :for="listado_permiso.name">
                  {{listado_permiso.display_name}}
              </label>
         </div>   
        </form>
        <div class="box-footer">
          <input type="button" class="btn btn-info guardar_roles" value="Guardar" @click="UpdatePermisosRol">
        </div>
      </div>
    </div>
  </div>
  </template>

<script>

  Vue.component('select_rol ',require('../herramientas/select_rol.vue'));

  module.exports= {

   components: {},
   props: [],

   created: function(){
    this.permisos();
    this.$on('rol_option', function(v) {
      this.rol=v.id;
      this.ObtenerPermisosRol(this.rol);
    });
   },
  data(){
    return{
      rol:'',
      alerta:false,
      listado_permisos:[],
      permisos_marcados:[],
      option_toast:{
        timeOut: 5000,
        "positionClass": "toast-top-center",
        "closeButton": true
      }
    }
  },
  methods:{
    setErrors:function(object) {
      this.message='';
      let that = this;
      $.each(object, function(index, value) {
        that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
        that.errors_return[index] = 'has-warning';
      });
    },
    permisos:function(){
      //Optengo todos los permisos para mostrar los checkbox
       this.$http.get(window._apiURL+'permisos')
        .then(function(respuesta){
          this.listado_permisos=respuesta.body;
        });
    },
    ObtenerPermisosRol:function(dato){
      //Optengo todos los permisos para mostrar los marcados
        this.$http.get(window._apiURL+'permisos_role/'+dato)
        .then(function(respuesta){
          this.permisos_marcados=[];
          var permisos_id = respuesta.body;
          var _this = this;
          //Recorro el arreglo y agrego los id para mostrar los marcados con la variable en v-model de los input permisos_marcados[]
          permisos_id.forEach( function(valor, indice, array) {
            _this.permisos_marcados.push(valor.id);
          });
        });
    },
    UpdatePermisosRol:function(){
        if (this.rol=="") {
           this.alerta=true;
           toastr.error("","Debe seleccionar un Rol",this.option_toast);
           return false;
        }
       let that = this;
       this.$http.put(window._apiURL+'permisos_role/'+this.rol+'', this.permisos_marcados )
        .then(function(respuesta){
          that.message ='';
        if (respuesta.status != '200') {
             if (Object.keys(respuesta.body.request).length>0) {

              this.setErrors(respuesta.body.request);
            }
            toastr.warning(that.message,respuesta.body.msg,this.option_toast);
          }else{
            toastr.success(respuesta.body.msg,'',this.option_toast);
            this.id_rol_passing={'id':respuesta.body.obj.id,'name':respuesta.body.obj.name,'display_name':respuesta.body.obj.display_name,'description':respuesta.body.obj.description};
            this.rolarray={};
            setTimeout(function(){ that.errors.clear(); }, 50); 
          }
        },(response) => {
         
          that.message = '';
          if (Object.keys(response.body.request).length>0) {
            this.setErrors(respuesta.body.request);
          }
          toastr.error(that.message,response.body.msg,this.option_toast);
       
          this.alerta=false;
       });  
    }
  }
}
</script>


