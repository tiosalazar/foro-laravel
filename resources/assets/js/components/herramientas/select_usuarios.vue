<template>
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
        <span  class="help-block" v-show="isInvalid">El campo Usuarios es obligatorio</span>
      <input type="hidden"  :value="id_ejecutivo" name="id_ejecutivo">
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
  import VueLocalStorage from 'vue-localstorage'
  //import VueSync from 'vue-sync'
  Vue.use(VueLocalStorage)
  //var localSync = VueSync.localStrategy()

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
            id_ejecutivo:0
          }
      },
      computed:{
        value: function () {
          return this.$localStorage.get('ejecutivo_seleccionado')
        },
        isInvalid () {
          return this.isTouched && this.value.length === 0
        }
      },/*
      sync: {
        usuarios: localSync('ejecutivo_seleccionado') // in this example, app_data is the namespace
      },*/
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
        this.isTouched = true
      }
    }
  }
</script>
