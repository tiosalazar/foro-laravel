<template>

  <multiselect  :options="clientes" :custom-label="nameWithLang"  placeholder="Seleccione un Cliente" label="nombre" track-by="nombre" :options-limit="300" :option-height="104">
  </multiselect>
</template>

<script>

  import Multiselect from 'vue-multiselect'

    export default {
       components: { Multiselect},
      data () {
          return {
            clientes:[],
          }
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
              $.getJSON("http://127.0.0.1:8000/api/v1/clientes", function(clientes) {
                  //this.$set('clientes', clientes);
                  this.clientes=clientes;
              }.bind(this));
          },
        nameWithLang ({ nombre, nombre_contacto }) {
          return `${nombre} — ${nombre_contacto}`
        }
    }
  }
</script>
