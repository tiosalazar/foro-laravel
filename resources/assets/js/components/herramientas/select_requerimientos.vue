<template>
  <div>
  <div :class="{ 'select-error': isInvalid }" class="select_ot">


      <multiselect
      :custom-label="nameWithLang"
      :options="ots"
      selected-label=""
      deselect-label=""
      select-label=""
      :close-on-select="true"
      :searchable="true" placeholder="Escribe el nombre del  cliente o el ID" label="nombre" track-by="nombre"
      :options-limit="100"
      :allow-empty="false"
      @input="updateSelected"
      @close="onTouch"
      @search-change="asyncFind"
      :internal-search="false"
      :loading="isLoading"
      :limit="3"
      :limit-text="limitText"
      id="ajax"
      :value="value_select"
      :option-height="104">
        No se encontraron OTs
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
   props: ['select','id_requerimiento'],
   data () {
    return {
      ots:[],
      id_ot: 0,
      isTouched: false,
      value:'',
      selectedCountries: [],
      countries: [],
      isLoading: false,

    }
  },
  computed:{
    isInvalid () {
          return (this.isTouched &&  this.value=="" )?true:false //Compruebo de que haya selecionado algo
        },
        value_select: function () {
          return this.select;
        },
      },
      created: function(){

        this.fetchTips();

      },

      methods:{
        fetchTips: function(){
          console.log("Id del requermiento")
          console.log(this.id_requerimiento)
         this.$http.get(window._baseURL+'/show_requerimientos_tareas')
         .then(function(respuesta){
         }.bind(this));
       },
          /*
          * Funcion para organizar la visualización del select
          */
          nameWithLang ({ id, nombre, cliente_nombre}) {

              return `# ${id} - ${nombre} - ${cliente_nombre}`;
              
          },
          updateSelected (newSelected) {
            if (newSelected != null && newSelected != undefined) {
             this.id_ot = newSelected;
             this.value = newSelected;
             console.log('select',newSelected);
             // Creo un evento para enviar el item seleccionado al padre.
             this.$parent.$emit('send-requerimiento', newSelected)

           }else {
             this.id_ot = 0;
           }
         },
        /*
        * esta función se ejecuta cuando se da click fuera del cuadro de Dialogo
        */
        onTouch () {
          this.isTouched =(this.value=="" )?true:false ; //Compruebo de que haya selecionado algo
          this.isLoading = false
        },
        limitText (count) {
          return `y ${count} otras OTs`
        },
        asyncFind (query) {
          this.isLoading = true
          this.$http.get(window._baseURL+'/show_requerimientos_tareas/'+query).then(response => {
            this.ots = response.body;
            this.isLoading = false;

          })
        },
      }
    }
</script>
