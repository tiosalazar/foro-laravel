<template >
   <div> 
      <div class="box box-default collapsed-box" id="main-app">

        <div class="box-header with-border">
            <h3 class="box-title">Crear nuevo rol</h3>

            <div class="box-tools pull-right">
              <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-plus"></i></button>
           </div>

        </div>
    
      <div class="box-body">
          <form  role="form" class="form-inline">
                <div class="form-group">
                    <label for="nombre_rol">Nombre</label>
                    <input type="text" class="form-control" id="nombre_rol" placeholder="Nombre del rol">
                </div>
                <div class="form-group">
                   <button class="btn btn-primary">Guardar</button>
                </div>     
            </form>
               
      </div>
      
    </div>
      <listar-roles></listar-roles>
    </div>
    
</template>

<script>
    Vue.component(
    'listar-roles',
    require('./listar_roles.vue')
    );
</script>
