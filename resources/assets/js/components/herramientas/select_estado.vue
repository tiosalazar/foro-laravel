<template>

  <multiselect
  :options="estados"
  :searchable="false" placeholder="Seleccione un Estado de OT" label="nombre" track-by="nombre"
  :close-on-select="true"
  :allow-empty="false"
  :options-limit="300"
  :option-height="104">
  </multiselect>
</template>

<script>

  import Multiselect from 'vue-multiselect'

    export default {
       components: { Multiselect},
       props: ['tipo_estado'],
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
               var URL=$('#url_path').val();
              $.getJSON(URL+"/api/v1/estados/"+this.tipo_estado, function(estados) {
                  //this.$set('clientes', clientes);
                  this.estados=estados;
              }.bind(this));
          }
    }
  }
</script>
