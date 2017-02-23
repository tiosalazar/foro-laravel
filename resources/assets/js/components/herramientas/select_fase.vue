<template>
  <div>
  <div >
      <multiselect
      :options="estados"
      select-label=""
      selected-label=""
      deselect-label=""
      group-values="fases" 
      group-label="tipo" 
      :searchable="true" placeholder="Seleccione la Fase del projecto" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      @input="updateSelected"
      @close="onTouch"
      @open="fetchTips"
      :value="value"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_fase" name="id_fase">
    </div>
      <!-- <div style="height:12px"></div> -->
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {
       components: { Multiselect},
       props: ['select'],
      data () {
          return {
            estados:[],
            id_fase: '',
            isTouched: false,
          }
      },
      computed:{
        isInvalid () {
          return (this.isTouched &&  this.value=="" )?true:false //Compruebo de que haya selecionado algo
        },
        value: function () {
          return this.select;
        },
      },
      created: function(){
          this.fetchTips();
          // console.log(this.options);
      },
      methods:{
          fetchTips: function(){
               this.$http.get(window._baseURL+'/list_fases')
             .then(function(respuesta){
                this.estados=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.value = newSelected;
             this.id_fase = newSelected.id;
             this.$parent.$emit('fase_option',newSelected);
             // Creo un evento para enviar el item seleccionado al padre.
              // this.$parent.$emit('send-prioridad', newSelected)
           }else {
             this.id_fase = 0;
           }
        },
        /*
        * esta función se ejecuta cuando se da click fuera del cuadro de Dialogo
        */
        onTouch () {
          this.isTouched =(this.value=="" )?true:false ; //Compruebo de que haya selecionado algo
        },
    }
  }
</script>
