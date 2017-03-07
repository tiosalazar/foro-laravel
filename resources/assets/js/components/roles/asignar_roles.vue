
<template>

  <div>

    <div class="box box-primary">
      <div class="box-header">
        <h3 class="box-title" style="padding-left:1%; margin-bottom:20px;">Asignar Permisos</h3>
      </div>

      <div class="box-body no-padding">
        <form action="" class="form" style="    display: flex;
    justify-content: flex-start;
    flex-wrap: wrap; padding-left:2%;padding-right:2%;">
         <div class="checkbox checkbox-success" style="width:25%;">
              <input id="checkbox_ver" class="styled" type="checkbox">
              <label for="checkbox_ver">
                  Ver
              </label>
         </div> 

        </form>
      </div>
    </div>
  </div>
  </template>

<script>
  module.exports= {

   components: {},
   props: [],

   created: function(){},
  data(){
    return{
      listroles:[],
      id_rol_edit:[],
      nombre_rol_edit:{
        display_name:'',
      },
      option_toast:{
        timeOut: 5000,
        "positionClass": "toast-top-center",
        "closeButton": true
      },
      errors_return:{
        'nombre':''
      }
    }
  },
  watch : {},
  mounted(){

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
  }
}
</script>