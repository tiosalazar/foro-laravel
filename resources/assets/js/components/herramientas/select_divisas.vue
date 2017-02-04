<!--Componente para Seleccionar Divisas  -->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
<template>
  <div>
    <div :class="{ 'select-error': isInvalid }">
      <Multiselect
      :options="divisa"
      placeholder="Moneda" label="nombre" select-label="" track-by="nombre"
      :close-on-select="true"
      :options-limit="300"
      :value="value"
      @input="updateSelected"
      @close="onTouch"
      :option-height="104">
    </Multiselect>
    <!--Se deja un Hidden por si se va a implementar en un form no tener que hacer emits -->
    <input type="hidden"  :value="id_divisa" name="id_divisa">
  </div>
  <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
    <span  class="help-block">El campo Divisa es obligatorio</span>
  </div>
  <div style="height:12px"></div>
</div>
</template>

<script>

import Multiselect from 'vue-multiselect'
module.exports= {

  components: { Multiselect},
  props:['select','index'], //en la propiedad select se va a meter la opción por defecto //la propiedad index me sirve para saber en que compra guardarla
  data () {
    return {
      divisa:[],
      id_divisa:0,
      isTouched: false,
    }
  },
  computed:{
    value:function () {
      return this.select;
    },
    isInvalid () {
      return (this.isTouched &&  this.value=="" )?true:false//Compruebo de que haya selecionado algo
    }
  },
  created: function(){
    this.fetchTips();
  },
  methods:{
    fetchTips: function(){
      this.$http.get('api/v1/divisas') //Consulta a la Base de datos por GET
      .then(function(respuesta){
        this.divisa=respuesta.body;
      }.bind(this));
    },
    /*
    Cuando se selecione algo se realiza la siguiente función
    */
    updateSelected (newSelected) {
      if (newSelected != null && newSelected != undefined) {
        this.id_divisa = newSelected.id;
        this.value=newSelected;
        var respuesta = {index: this.index, divisa: newSelected }//Devuelvo el Index en el que se encuentra junto con el arreglo de datos, para saber en que posición
        this.$parent.$emit('divisa',respuesta);                  //debe de ir.
      }else {
        this.id_divisa = 0;
        this.value='';
        this.$parent.$emit('divisa',''); //emito la variable vasia para comprobar en el padre
      }

    },
    /*
    esta función se ejecuta cuando se da click fuera del cuadro de Dialogo
    */
    onTouch () {
      this.isTouched =(this.value=="" )?true:false ; //Compruebo de que haya selecionado algo
    }

  }
}
</script>
