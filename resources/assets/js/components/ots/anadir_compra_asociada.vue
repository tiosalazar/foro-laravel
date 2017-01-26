<template>
  <div class="col-md-12">
      <div class="row">
      <section class="Form__section" v-for="ed in compra_asociada">
        <div style="    display: inline-block;">
              <div class="form-group col-md-3">
                <label class="sr-only" for="nombre_requerimiento">Item</label>
                <select_tipo_compra></select_tipo_compra>
              </div>
              <div class="form-group  col-md-3">
                <label class="sr-only" for="no_horas_req">Descripción</label>
                <input type="text" name="compra_asociada[0][no_horas_req]"  class="form-control" id="no_horas_req" placeholder="Descripción">
             </div>
              <div class="form-group  col-md-2">
                <label class="sr-only" for="no_horas_req">Provedor</label>
                <input type="text" name="compra_asociada[0][no_horas_req]"  class="form-control" id="no_horas_req" placeholder="Provedor">
             </div>
              <div class="form-group  col-md-2">
                <label class="sr-only" for="no_horas_req">Valor</label>
                <input type="text" name="compra_asociada[0][no_horas_req]"  class="form-control" id="no_horas_req" placeholder="Valor">
             </div>
             <div class="form-group  col-md-1">
               <button type="button" @click="deleteRequerimiento" class="btn btn-danger">Eliminar</button>
            </div>
          </div>
      </section>
    </div>
    <div class="row">
      <div class="col-md-3">
        <button type="button" @click="addRequerimiento" class="btn btn-block btn-success col-sm-3">Añadir Compra</button>
      </div>
    </div>
  </div>
</template>

<script>

     module.exports={
      data () {
          return {
          compra_asociada: [
              {nombre_requerimiento: 'compra_asociada[0][nombre_requerimiento]', no_horas_req: 'requerimiento[0][no_horas_req]'}
          ]
        }
      },
      methods: {
          addRequerimiento: function(e) {
              e.preventDefault();
              console.log(this.compra_asociada);
              this.compra_asociada.push(Vue.util.extend({}, this.compra_asociada));
          },
          deleteRequerimiento: function(e) {
              e.preventDefault();
              var index = this.compra_asociada.indexOf(Vue.util.extend({}, this.compra_asociada));
                this.compra_asociada.splice(index, 1);

          }
     }
   }
       Vue.component('select_tipo_compra',require('../herramientas/select_tipo_compra.vue'));
</script>
