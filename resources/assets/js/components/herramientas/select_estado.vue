<template>
  <div>
    <multiselect
    :options="estados"
    :searchable="false" placeholder="Seleccione un Estado de OT" label="nombre" track-by="nombre"
    :close-on-select="true"
    :allow-empty="false"
    :options-limit="300"
    @input="updateSelected"
    :option-height="104">
    </multiselect>
      <input type="hidden"  :value="id_estado" name="id_estado">
    </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'

    module.exports= {
       components: { Multiselect},
       props: ['tipo_estado'],
      data () {
          return {
            estados:[],
            id_estado:0
          }
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
             this.$http.get('api/v1/estados/'+this.tipo_estado)
             .then(function(respuesta){
                     this.estados=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            this.id_estado = newSelected.id;
        }
    }
  }
</script>
