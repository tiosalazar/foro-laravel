<!--Componente para Seleccionar el Titem del Tipo de Compra  -->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
<template>
  <div>
    <div :class="{ 'select-error': isInvalid }">
      <Multiselect
      :options="tipo_compra"
      selected-label=""
      deselect-label=""
      placeholder="Item" select-label="" label="nombre" track-by="nombre"
      :close-on-select="true"
      :options-limit="300"
      :value="value"
      @input="updateSelected"
      @remove="removeSelected"
      @close="onTouch"
      @open="fetchTips"
      :option-height="104">
    </Multiselect>
      <!--Se deja un Hidden por si se va a implementar en un form no tener que hacer emits -->
    <input type="hidden"  :value="id_tipo_compra" name="id_tipo_compra">
  </div>
  <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
    <span  class="help-block">El campo Tipo compra es obligatorio</span>
  </div>
  <div style="height:12px"></div>
</div>
</template>

<script>

import Multiselect from 'vue-multiselect'
module.exports= {

  components: { Multiselect},
  props:['select','index'],//en la propiedad select se va a meter la opción por defecto //la propiedad index me sirve para saber en que compra guardarla
  data () {
    return {
      tipo_compra:[],
      id_tipo_compra:0,
      seleccionado:'',
      isTouched: false
    }
  },
  computed:{
    value:function () {
      return this.select;
    },
    isInvalid () {
      return (this.isTouched &&  this.seleccionado=="" )?true:false//Compruebo de que haya selecionado algo
    }
  },
  created: function(){
    this.fetchTips();
  },
  methods:{
    fetchTips: function(){
      this.$http.get(window._apiURL+'tipos_compra')//Consulta a la Base de datos por GET
      .then(function(respuesta){
        this.tipo_compra=respuesta.body;
      }.bind(this));
    },
    updateSelected (newSelected) {
      if (newSelected != null && newSelected != undefined) {
        this.id_tipo_compra = newSelected.id;
        this.value=newSelected;
        this.seleccionado=newSelected;
        let respuesta = {index: this.index, tipo_compra: newSelected } //Devuelvo el Index en el que se encuentra junto con el arreglo de datos, para saber en que posición
        this.$parent.$emit('tipo_compra',respuesta);                   //debe de ir.
      }else {
        this.id_tipo_compra = 0;
        this.seleccionado='';
        this.$parent.$emit('tipo_compra','');//emito la variable vasia para comprobar en el padre
      }

    },
    /*
      esta función se ejecuta cuando se remueve un tag
    */
    removeSelected () {
      this.id_tipo_compra = 0;
      this.seleccionado='';
      this.$parent.$emit('select_clientes','');//emito la variable vasia para comprobar en el padre
    },
    onTouch () {
      this.isTouched =(this.seleccionado=="" )?true:false ;//Compruebo de que haya selecionado algo
      this.fetchTips();
    }

  }
}
</script>
