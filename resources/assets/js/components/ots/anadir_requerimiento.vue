<!--Componente el cual se encarga de guardar Los requerimientos asociados a la OT  -->
<!-- htotales : Numeric -> las horas Totales de la OT, para realizar el calculo -->
<!-- area: String -> Que area es, es solo para la visualización -->
<!-- id_area : Numeric -> El id del area, esta sirve para saber en que arreglo buscar al momento de guardar -->
<!-- realizar_validado: Boolean  ->si realizo el validado de los datos o no-->
<!-- Autor: David Salazar  -->
<!-- Fecha : Enero 2017  -->
<template>
  <div class="col-md-12">
      <div class="row">
      <div class="col-md-12 nopadding">
      <div style="height:22px;"></div>
        <div class="form-group col-md-4 col-sm-6" v-bind:class="{ 'has-error': errors.has('horas_area'+id_area) }">
          <label for="horas_area" class="col-sm-6 nopadding"><h5>Horas de {{ area }}</h5> </label>
          <div class="col-sm-6">
            <input type="text" @input="emitirData(),guardarDatos()"  style="margin-top: 12px;" :name="'horas_area'+id_area"  v-validate data-vv-rules="required|numeric" data-vv-as="Horas Area" class="form-control text-center" :id="'horas_area'+id_area" v-model="nhoras" :placeholder="'Numero de Horas '+area">
            <span  class="help-block" v-show="errors.has('horas_area'+id_area)">{{ errors.first('horas_area'+id_area) }}</span>
          </div>
        </div>
        <div class="form-group col-md-6 col-sm-6"  v-bind:class="{ 'has-error': h_pasadas }">
          <label for="horas_area" class="col-sm-5 "><h5>Resumen de horas de {{ area }}</h5> </label>
          <div class="col-sm-7">
           <div class="campo_azul">
                {{ v_resta }}
            </div>
            <!--<input type="text" class="form-control" disabled="disabled" v-model="v_resta" :placeholder="'Resumen de Horas '+area">-->
            <span  class="help-block" v-show="h_pasadas">Se ha pasado del numero de horas permitidas para el Area</span>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-md-4">
        <h4 class="titulo_interna_ot">Requerimiento</h4>
      </div>
    </div>
    <div style="height:22px;"></div>
    <div class="row">
      <section class="col-md-12 nopadding" v-for="(ed,index) in requerimiento">
        <div class="form-group col-md-8" v-bind:class="{ 'has-error': errors.has('nombre_requerimiento'+index) }">
          <label class="sr-only" for="nombre_requerimiento">Nombre Requerimiento</label>
          <input type="text" @input="guardarDatos" :name="'nombre_requerimiento'+index" v-validate data-vv-rules="required|min:3" data-vv-as="Nombre Requerimiento" v-model="ed.model_nom" class="form-control" :id="'nombre_requerimiento'+index" placeholder="Nombre Requerimiento">
          <span  class="help-block" v-show="errors.has('nombre_requerimiento'+index)">{{ errors.first('nombre_requerimiento'+index) }}</span>
        </div>
        <div class="form-group  col-md-2"  v-bind:class="{ 'has-error': errors.has('no_horas_req'+index) }">
          <label class="sr-only" for="no_horas_req">N° Horas</label>
          <input type="text" @input="realizarCalculo(),guardarDatos()" :name="'no_horas_req'+index" v-validate data-vv-rules="required|numeric" data-vv-as="No horas"  v-model="ed.model_horas" class="form-control" :id="'no_horas_req'+index" placeholder="No. Horas">
          <span  class="help-block" v-show="errors.has('no_horas_req'+index)">{{ errors.first('no_horas_req'+index) }}</span>
        </div>
        <div class="form-group  col-md-2"  v-show="$parent.visualizacion != 'true'" >
          <button type="button" @click="deleteRequerimiento" class="btn btn-danger boton_foro error">Eliminar</button>
        </div>
      </section>

    </div>
    <div style="height:12px;"></div>
    <div class="row"  v-show="$parent.visualizacion != 'true'">
      <div class="col-md-4" >
        <button type="button" @click="addRequerimiento" class="btn btn-block btn-success boton_foro add_req col-sm-3">Añadir Requerimiento</button>
      </div>
    </div>

  </div>
</template>

<script>

module.exports={
  props: ['htotales','area','id_area','realizar_validado','limpiar_datos'],// Propiedades del componente
  data () {
    return {
      requerimiento: [
        {  model_nom:'', model_horas:''}
      ],
      nhoras:'',
      model_nom:'',
      model_horas:0,
      v_resta:'',
      h_pasadas:false
    }
  },
  watch: {
    nhoras: function (val) {
      this.realizarCalculo(); //Realiza la resta de las horas
    },
    limpiar_datos: function(){
      if(this.limpiar_datos == true){
          this.requerimiento=[
            {  model_nom:'', model_horas:0}
          ];
      this.nhoras='';
      this.v_resta='';
      this.h_pasadas=false;
      }
    },
    /*
       Función la cual esta pendiente de la variable realizar_validado cuando le entra un true valida los datos
        y manda a el padre si todo esta correcto o no
    */
    realizar_validado:function(){
      if (this.realizar_validado==true) {
        this.$validator.validateAll();
        if (!this.errors.any()) {
          this.$parent.$emit('form_requerimiento_validado',true);
        }else{
          this.$parent.$emit('form_requerimiento_validado',false);
        }
      }
    }
  },
  created: function(){
    this.llenarDatosSiesVisualizacion();
    this.llenarCampos();
    this.realizarCalculo();
  },
  methods: {
    /*
     Envia El total de horas del area
     */
    emitirData:function(){
      this.$parent.$emit('horas_area',this.nhoras,this.id_area );
    },
    /*
     Si encuentra el arreglo guardado en el localStorage llena nos datos con lo que se ha escrito.
    */
    llenarCampos:function () {
      var data_req= JSON.parse(this.$localStorage.get('datos_requerimiento_'+this.id_area));//busca dependiendo del Área
      if (data_req != null) {
        var arreglo_requerimientos = data_req[0].requerimientos;
         this.requerimiento= arreglo_requerimientos;
        this.nhoras	= data_req[0].horas;
        console.log("llenarCampos"+this.nhoras);
        this.h_pasadas	= data_req[0].h_pasadas;
         this.emitirData();

        var datos=[{
          requerimientos:this.requerimiento,
          horas:this.nhoras,
          h_pasadas: this.h_pasadas
        }];
        this.$parent.$emit('datos_requerimiento',datos);//Emite los datos al padre
      }
    },
    llenarDatosSiesVisualizacion: function(){
        if (this.$parent.visualizacion=="true") {
               var arreglo_visualizar =JSON.parse(this.$parent.arreglo_visualizar);
              // console.log(arreglo_visualizar);
              var arreglo_requerimientos=arreglo_visualizar.final_req;

                for (let f in arreglo_requerimientos) {
                    let idx = Number(f)
                    this.horas=parseInt(arreglo_requerimientos[idx].horas);
                    this.h_pasadas=this.h_pasadas;
                    this.emitirData();
                    this.realizarCalculo();
                  var datos=[{
                     requerimientos:[JSON.parse(arreglo_requerimientos[idx].requerimientos)],
                     horas: parseInt(arreglo_requerimientos[idx].horas),
                     h_pasadas: this.h_pasadas
                   }];

                   this.$localStorage.set('datos_requerimiento_'+arreglo_requerimientos[idx].area,JSON.stringify(datos));//busca dependiendo del Área

                }
               /*
               var arreglo_requerimientos=arreglo_visualizar.final_req.requerimientos;
           var datos=[{
              requerimientos:arreglo_requerimientos,
              horas: parseInt(arreglo_visualizar.requerimientos.horas),
              h_pasadas: this.h_pasadas
            }];
            this.$localStorage.set('datos_requerimiento_'+arreglo_visualizar.final_req.area,JSON.stringify(datos));//busca dependiendo del Área
            */
        }
      },
    /*
     Guarda los datos con cada entrada del Tecla en el input
    */
    guardarDatos: function(){
       this.realizarCalculo();
      var datos=[{
        requerimientos:this.requerimiento,
        horas:this.nhoras,
        h_pasadas: this.h_pasadas
      }];
      this.$parent.$emit('datos_requerimiento',datos);//Emite los datos al padre
    },
    /*
    Al darle click en añadir Requerimiento la función valida la información y añade una nueva posición al
    arreglo de requerimientos
    */
    addRequerimiento: function(e) {
      e.preventDefault();
      this.$validator.validateAll();
      if (!this.errors.any()) {
        this.requerimiento.push(Vue.util.extend({}, this.requerimiento));
      }
    },
    /*
     Función la cual se encarga de borrar un requerimiento, lo que hace es que
     busca el indece el cual se toco y se procede a eliminar del arreglo de
     requerimientos
    */
    deleteRequerimiento: function(e) {
      e.preventDefault();
      var index = this.requerimiento.indexOf(Vue.util.extend({}, this.requerimiento));
      this.requerimiento.splice(index, 1);
      //Realizar el Calculo de las horas.
      this.realizarCalculo();
    },
    /*
      función la cual realiza el calculo de hroas.
    */
    realizarCalculo: function () {
      var resta;
      var sumatoria=0;
      for (let f in this.requerimiento) {
        let idx = Number(f)
        let p = this.requerimiento[idx]
        if (idx === this.requerimiento.length - 1){
          if(p.model_horas){
            sumatoria += parseInt(p.model_horas)
          }
        }
        if ( idx != this.requerimiento.length - 1) {
          if(p["model_horas"]){
            sumatoria += parseInt(p["model_horas"])
          }
        }
      }
      if (this.nhoras < sumatoria) {
        this.h_pasadas=true;
      }else {
        this.h_pasadas=false;
      }
      this.v_resta= this.nhoras-sumatoria;
    }


  }
}
</script>
