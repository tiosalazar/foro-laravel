<template>
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
			<div class="box box-primary tarea">
        <div class="box-header with-border">
          <h3 class="box-title">Crear Tarea</h3>
        </div>
        <!-- /.box-header -->
        <crear_tarea></crear_tarea>
      </div>
    </div>
  </div>
</template>
<script>
	module.exports = {
    props: ['id_user'],
    data(){
      return{
        usuarios:[],
      }
    },
    created: function() {},

  }
  Vue.component('crear_tarea',require('./crear_tarea.vue'));
</script>