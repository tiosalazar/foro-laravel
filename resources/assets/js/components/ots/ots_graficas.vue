<template >
<div>
    <div class="container box">
      <div class="row box-body ">
        <div class="col-md-12 ">
          <select_ot :select="select_ot"></select_ot>
        </div>
          <div class="row desc-ot">
            <div class="col-md-6 border-right">
              <ul>
               <li><strong>Fecha Informe:</strong><span class="capitalize"> {{fecha_informe}}</span></li>
                <li><strong>Numero de OT:</strong><span> #{{ot.referencia}}</span></li>
                <li><strong>Ejecutiva:</strong><span> {{ot.usuario_nombre}} - {{ot.usuario_apellido}}  </span></li>
                <li><strong>Fecha Inicio:</strong><span class="capitalize"> {{ot.fecha_inicio}}</span></li>
                <li><strong>Fecha Final:</strong><span class="capitalize"> {{ot.fecha_final}}</span></li>
              </ul>
            </div>
            <div class="col-md-6">
              <ul>
                <li><strong>Proyecto:</strong><span> {{ot.nombre}}</span></li>
                <li><strong>Cliente:</strong><span> {{ot.cliente_nombre}}</span></li>
                <li><strong>Horas Totales:</strong><span> {{ot.horas_totales}}</span></li>
                <li><strong>Horas Disponibles:</strong><span> {{ot.horas_disponibles}}</span></li>
                <li><strong>Total Horas Extra:</strong><span> {{ot.total_horas_extra}}</span></li>
              </ul>
            </div>
            <!-- /.col -->
          </div>
      </div>
      <div class="row box-footer">
        <button class="btn btn-success center-block" v-on:click="GenerarGraficas(ot.id)">Generar Graficas</button>
      </div>
    </div>

    <div class="container box">
      <div class="row box-body ">
        <div >
          <canvas id="myChart" width="990" height="550" count="2" ></canvas>
          <!-- Grafica Tiempo Real -->
          <chartjs-bar target="myChart" :datalabel="'Tiempo Estimado'" :data="this.tiempo_estimado_grafica"  :labels="areas_grafica"    backgroundcolor="#5cb85c" :width="990" :height="550" :bind="true"></chartjs-bar>
          <!-- Fin grafica Tiempo real -->
          <!-- Grafica Tiempo Estimado -->
          <chartjs-bar target="myChart" :datalabel="'Tiempo Real'"  :data="mydatasets1"  :labels="areas_grafica"  backgroundcolor="#0fb5e8"  :width="990" :height="550" :bind="true"></chartjs-bar>
          <!-- Fin Gráfica Tiempo  Estimado -->
        </div>
      </div>
    </div>
</div>
</template>

<script>

  import VeeValidate, { Validator } from 'vee-validate';
  import 'chart.js';
  import 'hchs-vue-charts';
  import moment from 'moment'
  // require('hchs-vue-charts');


   Vue.use(VueCharts);
   Vue.use(VeeValidate);

   module.exports= {
      components: {VeeValidate,Validator,VueCharts},
       data(){
        return{
          mydatasets1:[65, 59, 80, 81, 56],
          mydatasets2:[20, 50, 20, 41, 26],
          ver_graficas:false,
          areas_grafica:[],
          tiempo_real_grafica:[],
          tiempo_estimado_grafica:[],
          fecha_informe:moment().format('Do | MMM | Y '),
          select_ot:'',
          ot:[],
          tiempos_areas:[],
          message :'',
          option_toast:{
            timeOut: 5000,
            "positionClass": "toast-top-center",
            "closeButton": true
          }
        }
       },
       created:function(){
        this.$on('send-ot', function(obj) {
          this.ot= obj;
          this.select_ot= obj;
          this.ot.fecha_inicio =moment(this.ot.fecha_inicio).format('d | MMM | Y');
          this.ot.fecha_final = moment(this.ot.fecha_final).format('d | MMM | Y');
          console.log(this.ot);
        });
       },
        methods:{

          GenerarGraficas:function(id){
            this.$validator.validateAll();
            if (id==null) {
              toastr.error('Por Favor Selecciona una OT','Error',this.option_toast);
              return false;
            }

            this.$http.get(window._apiURL+'visualizar_graficas/'+id)
            .then(function(respuesta){
              var arreglo_areas=respuesta.body.tiempos_x__area;
              console.log("Arreglo Original");
              console.log(respuesta.body);
              this.areas_grafica=[];
              this.tiempo_estimado_grafica=[];
              this.tiempo_real_grafica=[];
              var that = this;
              arreglo_areas.forEach(function(element) {
                  that.areas_grafica.push(element.area.nombre);
                  that.tiempo_estimado_grafica.push(parseFloat(element.tiempo_estimado_ot));
                  that.tiempo_real_grafica.push(parseFloat(element.tiempo_real));
              });
              this.mydatasets1=this.tiempo_real_grafica;
              console.log("Tiempo Real",this.tiempo_real_grafica);
              console.log("Tiempo estimado",this.tiempo_estimado_grafica);

            });
          }

        }

    }

Vue.component('select_ot',require('../herramientas/select_ot.vue'));

</script>
