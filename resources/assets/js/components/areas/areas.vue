<template >
   <div>
      <div class="titulos_foro">
      <h3 class="box-title"><span class="span_descripcion1">Áreas</span></h3>
     </div>
      <div class="box box-primary collapsed-box" id="main-app">

        <div class="box-header with-border">
            <h3 class="box-title">Crear nueva</h3>

            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool btn-info" data-widget="collapse"><i class="fa fa-plus"></i></button>
           </div>

        </div>

      <div class="box-body">
          <div   role="form" class="form-area"  >
                <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]">
                    <label for="nombre_area"><sup>*</sup> Nombre</label>
                    <input type="text" v-model="areaarray.nombre" class="form-control" id="nombre_area" name="nombre" placeholder="Nombre area" v-validate data-vv-rules="required|alpha_num_spaces|min:3">
                    <span  class="help-block error_absolute" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
                </div>

                 <div class="form-group" v-bind:class="[errors_return.extencion_tel,{ 'has-error': errors.has('extencion') }]">
                    <label for="nombre_ext"><sup>*</sup> Extención</label>
                    <input type="text" v-model="areaarray.extencion_tel" class="form-control" id="nombre_ext" name="extencion" placeholder="Extención" v-validate data-vv-rules="required|numeric|min:3">
                     <span  class="help-block" v-show="errors.has('extencion')">{{ errors.first('extencion') }}</span>
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

  import VeeValidate, { Validator } from 'vee-validate';

    Vue.use(VeeValidate);


    Vue.component(
    'listar-areas',
    require('./listar_areas.vue')
    );


   module.exports= {
      components: {VeeValidate,Validator},
       data(){
        return{

          areaarray:{
            nombre:'',
            extencion_tel:'',

          },
          id_area_passing:{},
          message :'',
          errors_return:{
            'nombre':'',
            'extencion_tel':''
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
            var that = this;
            $.each(object, function(index, value) {
              let campo = index.replace(/_id/g, '');
              campo = campo.replace(/_/g, ' ');
              value = value[0].replace(/ id /g, '');
              that.message += '<strong>'+campo + '</strong>: '+value+ '</br>';
              that.errors_return[index] = 'has-warning';
            });
          },
          crear_area: function(e){
             this.$validator.validateAll();
              if (this.errors.any()) {
                return false
              }
            this.areaarray.estado=1;
            var input = this.areaarray;
            var that = this;
            this.$http.post(window._apiURL+'areas',input)
            .then(function(respuesta){
                that.message ='';
                if (respuesta.status != '200') {
                   if (Object.keys(respuesta.body.request).length>0) {

                    $.each(respuesta.body.request, function(index, value) {
                      that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                      that.errors_return[index] = 'has-warning';
                    });
                  }
                  toastr.warning(that.message,respuesta.body.msg,this.option_toast);
                }else{
                  toastr.success(respuesta.body.msg,'',this.option_toast);
                  this.id_area_passing={'id':respuesta.body.area.id,'nombre':respuesta.body.area.nombre,'extencion_tel':respuesta.body.area.extencion_tel,'estado':respuesta.body.area.estado}
                  this.areaarray={};
                  setTimeout(function(){ that.errors.clear(); }, 50);

                }


            },(err) => {
                that.message ='';
                if (err.status == 404) {
                  toastr.error('No se encontraron resultados, verfique la informacion','Error',this.option_toast);
                } else {
                  if (Object.keys(err.body.obj).length>0) {
                    this.setErrors(err.body.obj);
                  }else{
                    that.message = err.body.error;
                  }
                  toastr.error(this.message,err.body.msg,this.option_toast);
                }
              });
          }
        }

    }

</script>
