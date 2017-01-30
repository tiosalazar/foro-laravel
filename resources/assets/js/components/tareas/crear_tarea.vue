<template>
	<form role="form" name="crear_tarea" class="crear_tarea">
              <div class="box-body">
              <div class="form-group">
				<label for="ot">Nombre el Projecto</label>
                <select_ot></select_ot>
              </div>
              <div class="row">
                <div class="col-sm-3 border-right">
                  <div class="description-block">
                    <h5 class="description-header">3,200</h5>
                    <span class="description-text"># {{ot.id}}</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 border-right">
                  <div class="description-block">
                    <h5 class="description-header">13,000</h5>
                    <span class="description-text">{{ot.nombre_cli}}</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3 border-right">
                  <div class="description-block">
                    <h5 class="description-header">13,000</h5>
                    <span class="description-text">{{ot.nombre}}</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3">
                  <div class="description-block">
                    <h5 class="description-header">35</h5>
                    <span class="description-text">{{ot.nombre_ej}}</span>
                  </div>
                  <!-- /.description-block -->
                </div>
                <!-- /.col -->
              </div>
                <div class="form-group">
                  <label for="exampleInputEmail1">Email address</label>
                  <input type="email" class="form-control"  id="exampleInputEmail1" v-model="tarea.name" name="name" placeholder="Enter email">
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">Password</label>
                  <input type="password" class="form-control"  name="password"  id="exampleInputPassword1" placeholder="Password">
                </div>
                <div class="checkbox">
                  <label>
                    <input type="checkbox"> Check me out
                  </label>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary">Submit</button>
              </div>
            </form>
</template>
<script>
    module.exports = {
      data(){
        return{
          // usuarios:[],
          tarea:{},
          ot:{},
        }
       },
        created: function() {
        	console.log('holamundo')
        	this.$on('send-ot', function(obj) { 
        		console.log('Work',obj); 
        		this.ot= obj;
        	});
    	},
       computed:{
       },
       watch: {

       },
       methods:{
        addUser:function(user) {
          
        },
       },
        mounted() {
            console.log('Component ready.')
        }
    }
    Vue.component('select_ot',require('../herramientas/select_ot.vue'));
    Vue.component('select_area',require('../herramientas/select_area.vue'));
    Vue.component('select_rol',require('../herramientas/select_rol.vue'));
</script>