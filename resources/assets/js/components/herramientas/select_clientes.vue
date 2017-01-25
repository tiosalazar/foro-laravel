<template>
  
  <Multiselect 
   :options="clientes"
   :custom-label="nameWithLang"  placeholder="Seleccione un Cliente" label="nombre" track-by="nombre" 
   :close-on-select="true"
   @update="updateSelected"
   :options-limit="300" 
   :option-height="104">
  </Multiselect>

</template>

<script>

  import Multiselect from 'vue-multiselect'
  

    module.exports= {

       components: { Multiselect},
      data () {
          return {
            clientes:[],
            selected: null,
          }
      },

      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
           var URL=$('#url_path').val();
              $.getJSON(URL+"/api/v1/clientes", function(clientes) {
                  //this.$set('clientes', clientes);
                  this.clientes=clientes;
              }.bind(this));
          },
        nameWithLang ({ nombre, nombre_contacto }) {
          return `${nombre} — ${nombre_contacto}`
        },
         updateSelected (newSelected) {
            this.selected = newSelected
            console.log(this.selected);
          }
    }
  }
</script>
