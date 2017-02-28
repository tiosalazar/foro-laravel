<template>
  <div>
  <div :class="{ 'select-error': isInvalid }" class="tipos_fase">
      <multiselect
      :options="tipos_fase"
      selected-label=""
      deselect-label=""
      :close-on-select="true"
      select-label=""
      :searchable="true" placeholder="Seleccion el tipo de Fase correspondiente" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      :value="value"
      @input="updateSelected"
      @close="onTouch"
      @open="fetchTips"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="value" name="tipo_fase_id">
    </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
      <span  class="help-block">El campo Tipo de Fase es obligatorio</span>
    </div>
      <!-- <div style="height:12px"></div> -->
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
    module.exports= {
       components: { Multiselect},
          props: ['tipos' ,'valor'],
      data () {
          return {
            tipos_fase:[],
            tipo_fase_id: 0,
            area:{},
            isTouched: false,
            value:'',
            value2:{}
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
      watch : {
        tipos : function (value) {
          this.value = '';
           this.$http.get(window._apiURL+'tipos_fase/'+value)
             .then(function(respuesta){
              console.log(respuesta.body)
                     this.value=respuesta.body[0];
             }.bind(this));
        }
      },
      methods:{
          fetchTips: function(){
            this.$http.get(window._apiURL+'tipos_fase/')
             .then(function(respuesta){
                     this.tipos_fase=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {

             this.tipo_fase_id = newSelected.id;
              this.value = newSelected;
              this.$parent.$emit('tipo_fase_select',newSelected);
           }else {
             this.tipo_fase_id = 0;
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
