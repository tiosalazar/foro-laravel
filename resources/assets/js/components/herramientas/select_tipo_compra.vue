<template>
<div>
  <Multiselect
   :options="tipo_compra"
    placeholder="Seleccione un Item" label="nombre" track-by="nombre"
   :close-on-select="true"
   :options-limit="300"
   @input="updateSelected"
   :option-height="104">
  </Multiselect>
  <input type="hidden"  :value="id_tipo_compra" name="cliente">
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {

       components: { Multiselect},
      data () {
          return {
            tipo_compra:[],
            id_tipo_compra:0,
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
            this.id_tipo_compra = newSelected.id;
        }
    }
  }
</script>
