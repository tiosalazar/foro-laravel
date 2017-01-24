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
          <form  role="form" class="form-inline">
                <div class="form-group">
                    <label for="nombre_area">Nombre</label>
                    <input type="text" class="form-control" id="nombre_area" placeholder="Nombre area">
                </div>
                 <div class="form-group">
                    <label for="nombre_ext">Extención</label>
                    <input type="text" class="form-control" id="nombre_ext" placeholder="Extención">
                </div>
          
                <div class="form-group">
                   <button class="btn btn-primary">Guardar</button>
                </div>     
            </form>
               
      </div>
      
    </div>
      <listar-areas></listar-areas>
    </div>
    
</template>

<script>
    Vue.component(
    'listar-areas',
    require('./listar_areas.vue')
    );
</script>
