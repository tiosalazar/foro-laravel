<template >
    <div class="container box">
      <div class="row box-body ">
        <div class="col-md-12 ">
          <select_ot :select="select_ot"></select_ot>
        </div>
          <div class="row desc-ot">
            <div class="col-md-6 border-right">
              <ul>
               <li><strong>Fecha Informe:</strong><span> Current Date</span></li>
                <li><strong>Numero de OT:</strong><span> #{{ot.referencia}}</span></li>
                <li><strong>Ejecutiva:</strong><span> {{ot.usuario_nombre}} - {{ot.usuario_apellido}}  </span></li>
                <li><strong>Fecha Inicio:</strong><span>{{ot.fecha_inicio}}</span></li>
                <li><strong>Fecha Final:</strong><span>{{ot.fecha_final}}</span></li>
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
</template>

<script>

  import VeeValidate, { Validator } from 'vee-validate';

    Vue.use(VeeValidate);

   module.exports= {
      components: {VeeValidate,Validator},
       data(){
        return{
          select_ot:'',
          ot:[],
          message :'',
          errors_return:{
            'nombre':'',
            'extencion_tel':''
          },
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
          console.log(this.ot);
        });
       },
        methods:{
          GenerarGraficas:function(id){
            console.log("Generar Grafica id o "+id);
            this.$http.get(window._apiURL+'visualizar_graficas/'+id)
            .then(function(respuesta){
              console.log(respuesta.body);
            });
          }
         
        }

    }

Vue.component('select_ot',require('../herramientas/select_ot.vue'));

</script>
