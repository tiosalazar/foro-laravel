<template>
<div>
  <Multiselect 
   :options="clientes"
   :custom-label="nameWithLang"  placeholder="Seleccione un Cliente" label="nombre" track-by="nombre" 
   :close-on-select="true"
   :options-limit="300"
   @input="updateSelected"
   :option-height="104">
  </Multiselect>
  <input type="hidden"  :value="id_cliente" name="cliente">
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {

       components: { Multiselect},
      data () {
          return {
            clientes:[],
            id_cliente:0,
          }
      },
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
            this.id_cliente = newSelected.id;
        }
    }
  }
</script>
