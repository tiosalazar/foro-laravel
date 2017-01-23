<template>

  <multiselect  :options="estados"  :searchable="false" placeholder="Seleccione un Estado de OT" label="nombre" track-by="nombre" :options-limit="300" :option-height="104">
  </multiselect>
</template>

<script>

  import Multiselect from 'vue-multiselect'

    export default {
       components: { Multiselect},
      data () {
          return {
            estados:[]
          }
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
              $.getJSON("http://127.0.0.1:8000/api/v1/estados/2", function(estados) {
                  //this.$set('clientes', clientes);
                  this.estados=estados;
              }.bind(this));
          }
    }
  }
</script>
