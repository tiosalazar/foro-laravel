<template id="rol_list">
 <div>
  <div class="box box-primary collapsed-box" id="main-app">

    <div class="box-header box-primary with-border">
      <h3 class="box-title">Crear nuevo</h3>

      <div class="box-tools pull-right">
        <button type="button" class="btn btn-box-tool btn-info" data-widget="collapse"><i class="fa fa-plus"></i></button>
      </div>

    </div>

    <div class="box-body">
      <div  role="form"  action="#">
        <div class="form-group required" v-bind:class="[errors_return.name,{ 'has-error': errors.has('name') }]">
          <label for="nombre_rol"><sup>*</sup> Nombre   </label>
          <input type="text" v-model="rolarray.name"  class="form-control" name="name" id="nombre_rol" placeholder="Nombre logico del rol" data-vv-as="Nombre Logico" v-validate data-vv-rules="required|alpha_num|min:3" >
          <span  class="help-block" v-show="errors.has('name')">{{ errors.first('name') }}</span>
        </div>
        <div class="form-group required" v-bind:class="[errors_return.Nombre,{ 'has-error': errors.has('Nombre') }]">
          <label for="nombre_rol"><sup>*</sup> Nombre a Mostrar    </label>
          <input type="text" v-model="rolarray.display_name"  class="form-control" name="Nombre" id="Nombre_rol" data-vv-as="Nombre a mostrar" placeholder="Nombre del rol"  v-validate data-vv-rules="required|alpha_num_spaces|min:3" >
          <span  class="help-block" v-show="errors.has('Nombre')">{{ errors.first('Nombre') }}</span>
        </div>
        <div class="form-group required" v-bind:class="[errors_return.description,{ 'has-error': errors.has('description') }]">
          <label for="nombre_rol">Descripción </label>
          <textarea v-model="rolarray.description"  class="form-control" name="description" id="description_rol" placeholder="Descripción del rol"  >
          </textarea>
          <span  class="help-block" v-show="errors.has('description')">{{ errors.first('description') }}</span>
        </div>
        <div class="form-group">
         <button class="btn btn-primary" v-on:click="crear_rol()">Guardar</button>
       </div>

     </div>


   </div>

 </div>

 <listar-roles  :id_parent="id_rol_passing" ></listar-roles>

</div>

</template>
<script>

  import VeeValidate, { Validator } from 'vee-validate';
  import messages from '../../es/es';
    //Realizando los Use
    // Merge the locales.
    Validator.updateDictionary({es: { messages }});
    // Install the plugin and set the locale.
    Vue.use(VeeValidate, { locale: 'es' });

    Vue.component('listar-roles',require('./listar_roles.vue'));
    module.exports= {
      components: {VeeValidate,Validator},
      data(){
        return{
          rolarray: {
            name:'',
            display_name:'',
            description:''
          },
          id_rol_passing:{},
          message :'',
          errors_return:{
            'nombre':''
          },
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
          let campo = index.replace(/_id/g, '');
          campo = campo.replace(/_/g, ' ');
          value = value[0].replace(/ id /g, '');
          that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
          that.errors_return[index] = 'has-warning';
        });
      },
      crear_rol: function(e){
       this.$validator.validateAll();
       if (this.errors.any()) {
        return false
      }
      let that = this;
      this.$http.post(window._apiURL+'roles',this.rolarray)
      .then(function(respuesta){
        that.message ='';
        if (respuesta.status != '200') {
         if (Object.keys(respuesta.body.request).length>0) {

          this.setErrors(respuesta.body.request);
        }
        toastr.warning(that.message,respuesta.body.msg,this.option_toast);
      }else{
        console.log(respuesta)
        toastr.success(respuesta.body.msg,'',this.option_toast);
        this.id_rol_passing={'id':respuesta.body.obj.id,'name':respuesta.body.obj.name,'display_name':respuesta.body.obj.display_name,'description':respuesta.body.obj.description};
        this.rolarray={};
        setTimeout(function(){ that.errors.clear(); }, 50);
      }
    },(response) => {
      console.log(response);
      console.log('error');
      that.message = '';
      if (Object.keys(response.body.request).length>0) {
        this.setErrors(response.body.request);
      }
      toastr.error(that.message,response.body.msg,this.option_toast);
    });
    }

  }

}
</script>
