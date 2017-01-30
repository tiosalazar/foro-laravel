<template>
  <div>
   <div :class="{ 'select-error': isInvalid }">
  <Multiselect
   :options="tipo_compra"
    placeholder="Seleccione un Item" label="nombre" track-by="nombre"
   :close-on-select="true"
   :options-limit="300"
   :value="value"
   @input="updateSelected"
   @close="onTouch"
   :option-height="104">
  </Multiselect>
  <input type="hidden"  :value="id_tipo_compra" name="tipo_compra">
  </div>
  <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
    <span  class="help-block">El campo Item es obligatorio</span>
  </div>
  <div style="height:12px"></div>
</div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {

       components: { Multiselect},
       localStorage: {
         tipo_compra: {
           type: Object,
         }
       },
      data () {
          return {
            tipo_compra:[],
            id_tipo_compra:0,
            isTouched: false
          }
      },
      computed:{
        value: function () {
          return this.$localStorage.get('tipo_compra')
        },
        isInvalid () {
          return (this.isTouched &&  this.$localStorage.get('tipo_compra')==null )?true:false
        }
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
           this.$http.get('api/v1/tipos_compra')
             .then(function(respuesta){
                     this.tipo_compra=respuesta.body;
             }.bind(this));
          },
          updateSelected (newSelected) {
           if (newSelected != null && newSelected != undefined) {
             this.id_tipo_compra = newSelected.id;
             this.$localStorage.set('tipo_compra', newSelected);
           }else {
             this.id_tipo_compra = 0;
             this.$localStorage.remove('tipo_compra');
           }

         },
         onTouch () {
          this.isTouched =(this.$localStorage.get('tipo_compra')==null )?true:false ;
        }

    }
  }
</script>
