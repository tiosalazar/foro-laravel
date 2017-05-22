<template>
  <div>
  <div  :class="{ 'select-error': isInvalid }" class="prioridad">
      <multiselect
      :options="estados"
      selected-label=""
      deselect-label=""
      :searchable="true" placeholder="--" label="nombre" track-by="nombre"
      :options-limit="100"
      select-label=""
      :close-on-select="true"
      :allow-empty="false"
      @input="updateSelected"
      @close="onTouch"
      :value="value"
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
   props: ['select','indice'],
   data () {
    return {
      estados:[],
      id_prioridad: '',
      isTouched: false,
    }
  },
  computed:{
    value: function () {
      return this.select;
    },
    isInvalid () {
          return (this.isTouched &&  this.value=="" )?true:false //Compruebo de que haya selecionado algo
        }
      },
      created: function(){
        this.fetchTips();
      },
      watch: {
        select:function(val) {
          this.isInvalid = false;
          this.isTouched=false;
        },
      },
      methods:{
        fetchTips: function(){
         this.$http.get(window._apiURL+'estados/3')
         .then(function(respuesta){
          this.estados=respuesta.body;
        }.bind(this));
       },
       updateSelected (newSelected) {
        if (newSelected != null && newSelected != undefined) {
         this.id_prioridad = newSelected.id;
         this.value = newSelected;
             // Creo un evento para enviar el item seleccionado al padre.
          console.log(this.indice);
          if (this.indice==null) {
            this.$parent.$emit('send-prioridad', newSelected);
          }else{
            
             this.$parent.$emit('send-indice-prioridad', {'indice':this.indice,'select':newSelected});
          }
            
             
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
