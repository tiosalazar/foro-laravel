<template>
  <div>
  <div :class="{ 'select-error': isInvalid }">
    <multiselect
    :options="estados"
    :searchable="false" placeholder="Seleccione un Estado de OT" label="nombre" track-by="nombre"
    :close-on-select="true"
    :allow-empty="false"
    :value="value"
    :options-limit="300"
    @input="updateSelected"
    @remove="removeSelected"
    @close="onTouch"
    :option-height="104">
    </multiselect>
          <input type="hidden"  :value="id_estado" name="id_estado">
  </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
          <span  class="help-block">El campo Estado es obligatorio</span>
    </div>
    <div style="height:12px"></div>
  </div>
</template>

<script>

  import Multiselect from 'vue-multiselect'
  import VueLocalStorage from 'vue-localstorage'

  Vue.use(VueLocalStorage)


    module.exports= {
       components: {Multiselect,VueLocalStorage},
        localStorage: {
               estado_ot: {
                 type: Object,
               }
             },
       props: ['tipo_estado'],
      data () {
          return {
            estados:[],
            id_estado:0,
            isTouched: false
          }
      },
      computed:{
        value: function () {
          return this.$localStorage.get('estado_ot')
        },
        isInvalid () {
          return (this.isTouched &&  this.$localStorage.get('clientes')==null )?true:false
        }
      },
      created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
             this.$http.get('api/v1/estados/'+this.tipo_estado)
             .then(function(respuesta){
                     this.estados=respuesta.body;
             }.bind(this));
          },
         updateSelected (newSelected) {
           if (newSelected != null && newSelected != undefined) {
             this.id_estado = newSelected.id;
             this.$localStorage.set('estado_ot', newSelected);
           }else {
             this.id_estado = 0;
             this.$localStorage.remove('estado_ot');
           }
        },
        removeSelected () {
           this.id_estado = 0;
           this.$localStorage.remove('estado_ot');
       },
       onTouch () {
        this.isTouched =(this.$localStorage.get('clientes')==null )?true:false ;
      }
    }
  }
</script>
