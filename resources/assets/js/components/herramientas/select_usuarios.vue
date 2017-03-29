<!--Componente para Seleccionar Usuarios  -->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
<template>
  <div>
  <div :class="{ 'select-error': isInvalid }">
      <multiselect
      :options="usuarios"
      selected-label=""
      deselect-label=""
      :custom-label="nameWithLang"
      :searchable="true" placeholder="Seleccione un usuario" select-label="" label="nombre" track-by="nombre"
      :options-limit="300"
      :allow-empty="false"
      :value="value"
      @input="updateSelected"
      @remove="removeSelected"
      @close="onTouch"
      :option-height="104">
      </multiselect>
        <!--Se deja un Hidden por si se va a implementar en un form no tener que hacer emits -->
      <input type="hidden"  :value="id_ejecutivo" name="id_ejecutivo">
    </div>
      <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
            <span  class="help-block">El campo Ejecutivo es obligatorio</span>
      </div>
      <!-- <div style="height:12px"></div> -->
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'


    module.exports= {
       components: { Multiselect},
         props: ['area','select','id_area_tarea'], //en la propiedad select se va a meter la opción por defecto
           localStorage: {
               ejecutivo_seleccionado: {
                 type: Object,
               }
             },
      data () {
          return {
            usuarios:[],
            id_ejecutivo:0,
            isTouched: false
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

        if (typeof this.id_area_tarea === 'undefined' || this.id_area_tarea === null) {
          this.fetchTips();
        }else{
          this.usuarios_area();
        }

        //Valido que la propiedad encargado que traigo de la tarea tenga datos
        if (typeof this.select != 'undefined' || this.select != null) {
          // this.value=this.select;
          this.updateSelected(this.select);
          this.id_ejecutivo=this.select.id;
        }

      },
      methods:{
          fetchTips: function(){
            /*Si se necesita agregar más opciones de busqueda agregar un switch aquí */

              this.$http.get(window._apiURL+'usuarios/'+this.area) //Consulta a la Base de datos por GET
             .then(function(respuesta){
                     this.usuarios=respuesta.body;
             }.bind(this));

          },
           usuarios_area: function(){
            /*Si se necesita agregar más opciones de busqueda agregar un switch aquí */

              this.$http.get(window._apiURL+'usuarios_tarea/'+this.id_area_tarea) //Consulta a la Base de datos por GET
             .then(function(respuesta){
                this.usuarios=respuesta.body;
             }.bind(this));

          },
          /*
           Funcion para organizar la visualización del select
          */
        nameWithLang ({ nombre, apellido }) {
          return `${nombre}  ${apellido}`
        },
        /*
           Cuando se selecione algo se realiza la siguiente función
         */
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_ejecutivo = newSelected.id;
             this.value=newSelected;

            this.$parent.$emit('select_ejecutivo',newSelected);
           }else {
             this.id_ejecutivo = 0;
             this.$parent.$emit('select_clientes','');//emito la variable vasia para comprobar en el padre
           }
        },
        /*
          esta función se ejecuta cuando se remueve un tag
        */
        removeSelected () {
           this.id_ejecutivo = 0;
           this.$parent.$emit('select_clientes','');//emito la variable vasia para comprobar en el padre
       },
       /*
         esta función se ejecuta cuando se da click fuera del cuadro de Dialogo
       */
       onTouch () {
        this.isTouched = (this.value=="" )?true:false ;
      }
    }
  }
</script>
