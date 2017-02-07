<template>
  <div>
  <div  :class="{ 'select-error': isInvalid }">
      <multiselect
      :options="estados"
      :searchable="true" placeholder="Seleccione la Prioridad" label="nombre" track-by="nombre"
      :options-limit="100"
      select-label=""
      :close-on-select="true"
      :allow-empty="false"
      @input="updateSelected"
      @close="onTouch"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_prioridad" name="id_prioridad">
    </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
      <span  class="help-block">El campo Prioridad es obligatorio</span>
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
            id_prioridad: 0,
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
               this.$http.get('api/v1/estados/3')
             .then(function(respuesta){
                this.estados=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_prioridad = newSelected.id;
             this.value = newSelected;
             // Creo un evento para enviar el item seleccionado al padre.
              this.$parent.$emit('send-prioridad', newSelected)
           }else {
             this.id_prioridad = 0;
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
