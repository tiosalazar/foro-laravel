<template>
  <div>
  <div >
      <multiselect
      :options="ots"
      :searchable="true" placeholder="Seleccione la Prioridad" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      @input="updateSelected"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_prioridad" name="id_prioridad">
    </div>
      <div style="height:12px"></div>
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {
       components: { Multiselect},
      data () {
          return {
            ots:[],
            id_prioridad: 0,
            isTouched: false
          }
      },
      computed:{},
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
               this.$http.get('api/v1/ots/')
             .then(function(respuesta){
                this.ots=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_prioridad = newSelected.id;
             // Creo un evento para enviar el item seleccionado al padre.
              this.$parent.$emit('send-prioridad', newSelected)
           }else {
             this.id_prioridad = 0;
           }
        },
    }
  }
</script>
