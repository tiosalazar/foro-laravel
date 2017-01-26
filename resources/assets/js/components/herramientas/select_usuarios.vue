<template>
  <div>
      <multiselect
      :options="usuarios"
      :custom-label="nameWithLang"
      :searchable="false" placeholder="Seleccione un Usuario" label="nombre" track-by="nombre"
      :options-limit="300"
      @input="updateSelected"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_ejecutivo" name="id_ejecutivo">
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'

    module.exports= {
       components: { Multiselect},
         props: ['area'],
      data () {
          return {
            usuarios:[],
            id_ejecutivo:0
          }
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
               this.$http.get('api/v1/usuarios/'+this.area)
             .then(function(respuesta){
                     this.usuarios=respuesta.body;
             }.bind(this));
          },
        nameWithLang ({ nombre, apellido }) {
          return `${nombre} — ${apellido}`
        },
         updateSelected (newSelected) {
            this.id_ejecutivo = newSelected.id;
        }
    }
  }
</script>
