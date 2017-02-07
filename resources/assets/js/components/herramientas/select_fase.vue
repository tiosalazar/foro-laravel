<template>
  <div>
  <div >
      <multiselect
      :options="estados"
      group-values="fases" 
      group-label="tipo" 
      :searchable="true" placeholder="Seleccione la Fase del projecto" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      @input="updateSelected"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_fase" name="id_fase">
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
            estados:[],
            id_fase: 0,
            isTouched: false,
          }
      },
      computed:{},
      created: function(){
          this.fetchTips();
          console.log(this.options);
      },
      methods:{
          fetchTips: function(){
               this.$http.get('/list_fases/')
             .then(function(respuesta){
                this.estados=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_fase = newSelected.id;
             this.$parent.$emit('fase_option',newSelected);
             // Creo un evento para enviar el item seleccionado al padre.
              // this.$parent.$emit('send-prioridad', newSelected)
           }else {
             this.id_fase = 0;
           }
        },
    }
  }
</script>
