<template>
<div>
             <div class="box box-primary">
			<encabezado  :h_Disponibles="h_Disponibles" fecha_inicio="" :cliente="cliente" fecha_fin="" ejecutivo="" :htotal="htotal" horas_totales="" valor_total="" estado="" name_proyect="" :num_ot="num_ot"></encabezado>
			{{ h_Disponibles }}
				      </div>
							<div class="box box-info">
				            <div class="box-header with-border">
				              <h3 class="box-title">Detalle OT</h3>
				            </div>
				          <div class="box-body">
							<div class="col-md-12">
					          <!-- Custom Tabs -->
					          <div class="nav-tabs-custom">
					            <ul class="nav nav-tabs">
					              <li class="active"><a href="#tab_1" data-toggle="tab">Creatividad</a></li>
					              <li><a href="#tab_2" data-toggle="tab">Diseño</a></li>
					              <li><a href="#tab_3" data-toggle="tab">Desarrollo</a></li>
								  <li><a href="#tab_4" data-toggle="tab">Contenido</a></li>
								 <li><a href="#tab_5" data-toggle="tab">Digital Performance</a></li>

					              <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
					            </ul>
					            <div class="tab-content">
					              <div class="tab-pane active" id="tab_1">
										<div class="row"> <anadir_requerimiento></anadir_requerimiento></div>
					              </div>
					              <!-- /.tab-pane -->
					              <div class="tab-pane" id="tab_2">
					               <div class="row"> <anadir_requerimiento></anadir_requerimiento></div>
					              </div>
					              <!-- /.tab-pane -->
					              <div class="tab-pane" id="tab_3">
					               <div class="row"> <anadir_requerimiento></anadir_requerimiento></div>
					              </div>
					              <!-- /.tab-pane -->
					              <div class="tab-pane" id="tab_4">
					               <div class="row"> <anadir_requerimiento></anadir_requerimiento></div>
					              </div>
					              <!-- /.tab-pane -->
					              <div class="tab-pane" id="tab_5">
					               <div class="row"> <anadir_requerimiento></anadir_requerimiento></div>
					              </div>
					              <!-- /.tab-pane -->
					            </div>
					            <!-- /.tab-content -->
					          </div>
					          <!-- nav-tabs-custom -->
					           <div class="row">
									<div class="col-md-6">
										<h2>Compras relacionadas</h2>
								    </div>
					          </div>
					         <div class="row">
					             <anadir_compra></anadir_compra>
					         </div>
					         <div style="height:30px"></div>
					          <div class="row">
							      <div class=" pull-right  col-md-3">
							        <button type="button" class="btn btn-block btn-success col-sm-3">Guardar</button>
							      </div>
							    </div>
							      <div style="height:20px"></div>
					          <div class="box box-primary">
					            <div class="box-header with-border">
				             		 <h3 class="box-title">Observaciones</h3>
				                </div>
				                <div class="box-body">
				                <div class="form-group">
					                  <textarea class="form-control" rows="3" placeholder="Enter ..."></textarea>
					                </div>
					                </div>
				               </div>
						</div>
					</div>
			</div>			
</template>
<script>

   module.exports= {
       data () {
          return {
      	   h_Disponibles:50,
           hAreaDiseno:0,
           num_ot:0,
           name_proyect:'',
           estado:'',
           valor_total:'',
           horas_totales:'',
           ejecutivo:'',
           fecha_fin:'',
           fecha_inicio:'',
           cliente:[]
          }
      },
        computed: {
		    htotal: function () {
		      return this.h_Disponibles + this.hAreaDiseno
		    }
         },
       created: function(){
          this.fetchTips();
      },
        methods:{
          
          fetchTips: function(){
             //alert("aaa");
          }
        }

    }
    Vue.component('encabezado',require('./encabezado.vue'));
    Vue.component('anadir_requerimiento',require('./anadir_requerimiento.vue'));
    Vue.component('anadir_compra',require('./anadir_compra_asociada.vue'));
    Vue.component('select_clientes', require('../herramientas/select_clientes.vue'));
    Vue.component('select_usuarios', require('../herramientas/select_usuarios.vue'));
    Vue.component('select_estados', require('../herramientas/select_estado.vue'));
</script>
