<template>
  <div>
  <div >
      <multiselect
      :options="ots"
      :searchable="true" placeholder="Seleccione un Proyecto" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      @input="updateSelected"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_ot" name="id_ot">
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
            id_ot: 0,
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
             this.id_ot = newSelected.id;
             // Creo un evento para enviar el item seleccionado al padre.
              this.$parent.$emit('send-ot', newSelected)
           }else {
             this.id_ot = 0;
           }
        },
    }
  }
</script>
