<template>
  <div class="col-md-12">
      <div class="row">
      <section class="Form__section" v-for="(ed,index) in compra_asociada">
        <div style="    display: inline-block;">
              <div class="form-group col-md-3">
                <label class="sr-only" for="nombre_requerimiento">Item</label>
                <select_tipo_compra></select_tipo_compra>
              </div>
              <div class="form-group  col-md-3" v-bind:class="{ 'has-error': errors.has('descipcion_compra'+index) }">
                <label class="sr-only" for="descipcion_compra">Descripción</label>
                <input type="text" :name="'descipcion_compra'+index" v-validate data-vv-rules="required|min:4" data-vv-as="Descripción" v-model="ed.model_desc" class="form-control" :id="'descipcion_compra'+index"  placeholder="Descripción">
                <span  class="help-block" v-show="errors.has('descipcion_compra'+index)">{{ errors.first('descipcion_compra'+index) }}</span>
             </div>
              <div class="form-group  col-md-2"  v-bind:class="{ 'has-error': errors.has('provedor_compra'+index) }">
                <label class="sr-only" for="no_horas_req">Provedor</label>
                <input type="text"  :name="'provedor_compra'+index" v-validate data-vv-rules="required|min:4" data-vv-as="Provedor" v-model="ed.model_provedor" class="form-control" :id="'provedor_compra'+index"   placeholder="Provedor">
                <span  class="help-block" v-show="errors.has('provedor_compra'+index)">{{ errors.first('provedor_compra'+index) }}</span>
             </div>
              <div class="form-group  col-md-2"  v-bind:class="{ 'has-error': errors.has('valor_compra'+index) }">
                <label class="sr-only" for="no_horas_req">Valor</label>
                <input type="text" :name="'valor_compra'+index" v-validate data-vv-rules="required" data-vv-as="Valor" v-model="ed.model_valor" class="form-control" :id="'valor_compra'+index"  placeholder="Valor">
                <span  class="help-block" v-show="errors.has('valor_compra'+index)">{{ errors.first('valor_compra'+index) }}</span>

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
import VeeValidate, { Validator } from 'vee-validate';
//Traducciones del validador
import messages from '../../es/es';

//Realizando los Use
// Merge the locales.
Validator.updateDictionary({es: { messages }});
// Install the plugin and set the locale.
Vue.use(VeeValidate, { locale: 'es' });
     module.exports={
        components: {VeeValidate,Validator},
      data () {
          return {
          compra_asociada: [
              {  model_desc:'', model_provedor:'',model_valor:''}
          ],

        }
      },
      methods: {
          addRequerimiento: function(e) {
              e.preventDefault();
              this.$validator.validateAll();
              if (!this.errors.any()) {
              this.compra_asociada.push(Vue.util.extend({}, this.compra_asociada));
            }
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
