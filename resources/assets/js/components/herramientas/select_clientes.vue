<template>
<div>
   <div :class="{ 'select-error': isInvalid }">
  <Multiselect
   :options="clientes"
   :custom-label="nameWithLang"  placeholder="Seleccione un Cliente" label="nombre" track-by="nombre"
   :close-on-select="true"
   :value="value"
   :options-limit="300"
   @input="updateSelected"
   @remove="removeSelected"
   @close="onTouch"
   :option-height="104">
  </Multiselect>
  <input type="hidden"  :value="id_cliente" name="cliente">
  </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
          <span  class="help-block">El campo Clientes es obligatorio</span>
    </div>
 </div>
</template>
<script>
  import Multiselect from 'vue-multiselect'
  import VueLocalStorage from 'vue-localstorage'
  //import VueSync from 'vue-sync'
  Vue.use(VueLocalStorage)
  //var localSync = VueSync.localStrategy()
    module.exports= {
       components: { Multiselect: Multiselect,VueLocalStorage: VueLocalStorage},
       localStorage: {
               clientes: {
                 type: Object,
               }
             },
      data () {
          return {
            clientes:[],
            id_cliente:0,
            isTouched: false
          }
      },
      computed:{
        value: function () {
          return this.$localStorage.get('clientes')
        },
        isInvalid () {
          return (this.isTouched &&  this.$localStorage.get('clientes')==null )?true:false
        }
      },/*
      sync: {
        clientes: localSync('clientes') // in this example, app_data is the namespace
      },*/
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
           this.$http.get('api/v1/clientes')
             .then(function(respuesta){
                     this.clientes=respuesta.body;
             }.bind(this));
          },
        nameWithLang ({ nombre, nombre_contacto }) {
          return `${nombre} — ${nombre_contacto}`
        },
         updateSelected (newSelected) {
           if (newSelected != null && newSelected != undefined) {
             this.id_cliente = newSelected.id;
             this.$localStorage.set('clientes', newSelected);
           }else {
             this.id_cliente = 0;
             this.$localStorage.remove('clientes');
           }

        },
        removeSelected () {
           this.id_cliente = 0;
           this.$localStorage.remove('clientes');
       },
       onTouch () {
        this.isTouched =(this.$localStorage.get('clientes')==null )?true:false ;
      }
    }
  }
</script>
