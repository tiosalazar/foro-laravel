
<template>

  <div>
    <div class="box box-primary">

      <div class="box-header">
        <h3 class="box-title">Asignar Roles</h3>
      </div>
      <div class="box-body no-padding">
        <form action="">
          <div class="col-md-3">
            <label class="checkbox-inline">
              <input type="checkbox" id="inlineCheckbox1" value="option1"> 1
            </label>
          </div>
          <div class="col-md-3">
            <label class="checkbox-inline">
              <input type="checkbox" id="inlineCheckbox2" value="option2"> 2
            </label>
          </div>
          <div class="col-md-3">
            <label class="checkbox-inline">
              <input type="checkbox" id="inlineCheckbox3" value="option3"> 3
            </label>
          </div>
          <div class="col-md-3">
            <label class="checkbox-inline">
              <input type="checkbox" id="inlineCheckbox4" value="option4"> 4
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