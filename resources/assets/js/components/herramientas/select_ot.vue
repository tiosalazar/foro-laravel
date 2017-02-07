<template>
  <div>
  <div :class="{ 'select-error': isInvalid }">
      <multiselect
      :custom-label="nameWithLang"
      :options="ots"
      select-label=""
      :close-on-select="true"
      :searchable="true" placeholder="Seleccione un Proyecto" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      @input="updateSelected"
      @close="onTouch"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_ot" name="id_ot">
    </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
      <span  class="help-block">El campo Proyecto es obligatorio</span>
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
            isTouched: false,
            value:''
          }
      },
      computed:{
        isInvalid () {
          return (this.isTouched &&  this.value=="" )?true:false //Compruebo de que haya selecionado algo
        }
      },
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
          /*
          * Funcion para organizar la visualización del select
          */
          nameWithLang ({ nombre, referencia }) {
            return `# ${referencia} - ${nombre}`
          },
          updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_ot = newSelected.id;
             this.value = newSelected;
             // Creo un evento para enviar el item seleccionado al padre.
              this.$parent.$emit('send-ot', newSelected)
           }else {
             this.id_ot = 0;
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
