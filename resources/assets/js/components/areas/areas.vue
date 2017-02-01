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
          <div   role="form" class="form-area"  >
                <div class="form-group" v-bind:class="[errors_return.nombre,{ 'has-error': errors.has('nombre') }]">
                    <label for="nombre_area">Nombre</label>
                    <input type="text" v-model="areaarray.nombre" class="form-control" id="nombre_area" name="nombre" placeholder="Nombre area" v-validate data-vv-rules="required|alpha_num|max:30">
                    <span  class="has-error error_absolute" v-show="errors.has('nombre')">{{ errors.first('nombre') }}</span>
                </div>
               
                 <div class="form-group" v-bind:class="[errors_return.extencion_tel,{ 'has-error': errors.has('extencion_tel') }]">
                    <label for="nombre_ext">Extención</label>
                    <input type="text" v-model="areaarray.extencion_tel" class="form-control" id="nombre_ext" name="extencion_tel" placeholder="Extención" v-validate data-vv-rules="required|numeric|min:5"> 
                     <span  class="has-error" v-show="errors.has('extencion_tel')">{{ errors.first('extencion_tel') }}</span>  
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

          areaarray:{},
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
              that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
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
            this.$http.post('api/v1/areas',input)
            .then(function(respuesta){ 
                var that = this;
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
                } 
                
                        
            },(response) => {
               var that = this;
                that.message ='';
                
                console.log(response);
                  if (Object.keys(response.body.request).length>0) {
                   
                    $.each(response.body.request, function(index, value) {
                      that.message += '<strong>'+index + '</strong>: '+value+ '</br>';
                      that.errors_return[index] = 'has-warning';
                    });
                  }

                toastr.error(that.message,response.body.error,this.option_toast);
              });
          }
        }

    }

</script>
