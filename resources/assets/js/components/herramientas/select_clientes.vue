<!--Componente para Seleccionar Clientes  -->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
  <template>
    <div>
      <div :class="{ 'select-error': isInvalid }">
        <Multiselect
        :options="clientes"
        :custom-label="nameWithLang"  placeholder="Seleccione un Cliente" label="nombre" track-by="nombre"
        select-label=""
        :close-on-select="true"
        :value="value"
        :options-limit="300"
        @input="updateSelected"
        @remove="removeSelected"
        @close="onTouch"
        :option-height="104">
      </Multiselect>
      <!--Se deja un Hidden por si se va a implementar en un form no tener que hacer emits -->
      <input type="hidden"  :value="id_cliente" name="id_cliente">
    </div>
    <div style="padding:2px 0px;"  :class="{ 'has-error': isInvalid }" v-show="isInvalid">
      <span  class="help-block">El campo Clientes es obligatorio</span>
    </div>
    <div style="height:12px"></div>
  </div>
  </template>
  <script>
  /*Se Realiza el import de multiselect*/
  import Multiselect from 'vue-multiselect'
  module.exports= {
    components: { Multiselect},
    props:['select'], //en la propiedad select se va a meter la opción por defecto
    data () {
      return {
        clientes:[],
        id_cliente:0,
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
      this.fetchTips();
    },
    methods:{
      fetchTips: function(){
        this.$http.get('/api/v1/clientes') //realizo la consulta de todos los clientes
        .then(function(respuesta){
          this.clientes=respuesta.body;
        }.bind(this));
      },
      /*
       Funcion para organizar la visualización del select
      */
      nameWithLang ({ nombre, nombre_contacto }) {
        return `${nombre} — ${nombre_contacto}`
      },
      /*
         Cuando se selecione algo se realiza la siguiente función
       */
      updateSelected (newSelected) {
        if (newSelected != null && newSelected != undefined) {
          this.id_cliente = newSelected.id;
          this.value=newSelected;
          this.$parent.$emit('select_clientes',newSelected);
        }else {
          this.id_cliente = 0;
          this.$parent.$emit('select_clientes','');//emito la variable vasia para comprobar en el padre
        }
      },
      /*
        esta función se ejecuta cuando se remueve un tag
      */
      removeSelected () {
        this.id_cliente = 0;
        this.$parent.$emit('select_clientes','');//emito la variable vasia para comprobar en el padre
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
