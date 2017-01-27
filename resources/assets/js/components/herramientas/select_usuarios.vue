<template>
  <div>
  <div :class="{ 'select-error': isInvalid }">
      <multiselect
      :options="usuarios"
      :custom-label="nameWithLang"
      :searchable="true" placeholder="Seleccione un Usuario" label="nombre" track-by="nombre"
      :options-limit="300"
      :allow-empty="false"
      :value="value"
      @input="updateSelected"
      @remove="removeSelected"
      @close="onTouch"
      :option-height="104">
      </multiselect>
      <input type="hidden"  :value="id_ejecutivo" name="id_ejecutivo">
    </div>
      <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
            <span  class="help-block">El campo Ejecutivo es obligatorio</span>
      </div>
      <div style="height:12px"></div>
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
  import VueLocalStorage from 'vue-localstorage'

  Vue.use(VueLocalStorage)

    module.exports= {
       components: { Multiselect,VueLocalStorage},
         props: ['area'],
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
          return this.$localStorage.get('ejecutivo_seleccionado')
        },
        isInvalid () {
          return (this.isTouched &&  this.$localStorage.get('ejecutivo_seleccionado')==null )?true:false
        }
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
               this.$http.get('api/v1/usuarios/'+this.area)
             .then(function(respuesta){
                     this.usuarios=respuesta.body;
             }.bind(this));
          },
        nameWithLang ({ nombre, apellido }) {
          return `${nombre} — ${apellido}`
        },
         updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_ejecutivo = newSelected.id;
             this.$localStorage.set('ejecutivo_seleccionado', newSelected);
           }else {
             this.id_ejecutivo = 0;
             this.$localStorage.remove('ejecutivo_seleccionado');
           }
        },
        removeSelected () {
           this.id_ejecutivo = 0;
           this.$localStorage.remove('ejecutivo_seleccionado');
       },
       onTouch () {
        this.isTouched = (this.$localStorage.get('ejecutivo_seleccionado')==null )?true:false ;
      }
    }
  }
</script>
