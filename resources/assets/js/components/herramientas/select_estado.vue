  <!--Componente para Seleccionar Estados  -->
  <!-- Autor: David Salazar  -->
  <!-- Fecha : Enero 2017  -->
  <template>
    <div>
      <div :class="{ 'select-error': isInvalid }">
        <multiselect
        :options="estados"
        selected-label=""
        deselect-label=""
        :searchable="false" placeholder="Seleccione un Estado de OT" select-label="" label="nombre" track-by="nombre"
        :close-on-select="true"
        :allow-empty="false"
        :value="value"
        :options-limit="300"
        @input="updateSelected"
        @remove="removeSelected"
        @close="onTouch"
        :option-height="104">
      </multiselect>
      <!--Se deja un Hidden por si se va a implementar en un form no tener que hacer emits -->
      <input type="hidden"  :value="id_estado" name="id_estado">
    </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
      <span  class="help-block">El campo Estado es obligatorio</span>
    </div>
    <div style="height:12px"></div>
  </div>
  </template>

  <script>
  /*Se Realiza el import de multiselect*/
  import Multiselect from 'vue-multiselect'

  module.exports= {
    components: {Multiselect},
    props: ['tipo_estado','select'], //en la propiedad select se va a meter la opción por defecto
    data () {
      return {
        estados:[],
        id_estado:0,
        isTouched: false,
        // value:'',
      }
    },
    computed:{
      isInvalid () {
        return (this.isTouched &&  this.value=="" )?true:false//Compruebo de que haya selecionado algo
      },
      value: function () {
          return this.select;
        },
    },
    created: function(){
      this.fetchTips();
    },
    methods:{
      fetchTips: function(){
        this.$http.get('/api/v1/estados/'+this.tipo_estado)
        .then(function(respuesta){
          this.estados=respuesta.body;
        }.bind(this));
      },
      /*
      Cuando se selecione algo se realiza la siguiente función
      */
      updateSelected (newSelected) {
        if (newSelected != null && newSelected != undefined) {
          this.id_estado = newSelected.id;
          this.value=newSelected;
          this.$parent.$emit('select_estado',newSelected);
        }else {
          this.id_estado = 0;
          this.$parent.$emit('select_estado','');//emito la variable vasia para comprobar en el padre
        }
      },
      /*
        esta función se ejecuta cuando se remueve un tag
      */
      removeSelected () {
        this.id_estado = 0;
        this.$parent.$emit('select_estado','');//emito la variable vasia para comprobar en el padre
      },
      /*
        esta función se ejecuta cuando se da click fuera del cuadro de Dialogo
      */
      onTouch () {
        this.isTouched =(this.value=="" )?true:false ;
      }
    }
  }
  </script>
