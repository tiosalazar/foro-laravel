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
                <input type="text" :name="'descipcion_compra'+index"  @mouseover="guardarDatos" v-validate data-vv-rules="required|min:4" data-vv-as="Descripción" v-model="ed.model_desc" class="form-control" :id="'descipcion_compra'+index"  placeholder="Descripción">
                <span  class="help-block" v-show="errors.has('descipcion_compra'+index)">{{ errors.first('descipcion_compra'+index) }}</span>
             </div>
              <div class="form-group  col-md-2"  v-bind:class="{ 'has-error': errors.has('provedor_compra'+index) }">
                <label class="sr-only" for="no_horas_req">Provedor</label>
                <input type="text"  :name="'provedor_compra'+index"  @mouseover="guardarDatos" v-validate data-vv-rules="required|min:4" data-vv-as="Provedor" v-model="ed.model_provedor" class="form-control" :id="'provedor_compra'+index"   placeholder="Provedor">
                <span  class="help-block" v-show="errors.has('provedor_compra'+index)">{{ errors.first('provedor_compra'+index) }}</span>
             </div>
              <div class="form-group  col-md-2"  v-bind:class="{ 'has-error': errors.has('valor_compra'+index) }">
                <label class="sr-only" for="no_horas_req">Valor</label>
                <input type="text" :name="'valor_compra'+index"  @mouseover="guardarDatos" v-validate data-vv-rules="required|numeric" data-vv-as="Valor" v-model="ed.model_valor" class="form-control" :id="'valor_compra'+index"  placeholder="Valor">
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
import VueLocalStorage from 'vue-localstorage'
    Vue.use(VueLocalStorage);
     module.exports={
        components: {VeeValidate,Validator,VueLocalStorage},
          props: ['area','id_area'],
      data () {
          return {
          compra_asociada: [
              {  model_desc:'', model_provedor:'',model_valor:''}
          ],
          tipo_compra:[]

        }
      },
      created: function(){
          this.llenarCampos();
      },
      methods: {
          addRequerimiento: function(e) {
              e.preventDefault();
              this.$validator.validateAll();
              if (!this.errors.any()) {
              this.compra_asociada.push(Vue.util.extend({}, this.compra_asociada));
            }
          },
          llenarCampos:function () {
            var data_req= JSON.parse(this.$localStorage.get('datos_compra_'+this.id_area));
              if (data_req != null) {
            var arreglo_requerimientos = data_req[0].compras;
               this.compra_asociada= arreglo_requerimientos;
             }
          },
          deleteRequerimiento: function(e) {
              e.preventDefault();
              var index = this.compra_asociada.indexOf(Vue.util.extend({}, this.compra_asociada));
                this.compra_asociada.splice(index, 1);
          },
          guardarDatos: function(){
            var ingreso= this.compra_asociada;
            var index = Object.keys(ingreso).length;
            //console.log(ingreso[index-1]);
            ingreso[index-1].tipo_compra=this.$localStorage.get('tipo_compra');
            console.log(ingreso);
            var datos=[{
                compras:ingreso
              }];
             this.$localStorage.set('datos_compra_'+this.id_area,JSON.stringify(datos) );
          },
     }
   }
       Vue.component('select_tipo_compra',require('../herramientas/select_tipo_compra.vue'));
</script>
