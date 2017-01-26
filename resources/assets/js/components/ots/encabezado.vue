<template>
<div class="box-header with-border">
								<div class="row">
								<div class="col-md-6">
								<div class="form-group">
								<label for="num_ot" class="col-sm-4 "># OT : </label>
										<div class="col-sm-8">
											<input type="text"  name="num_ot" class="form-control" id="num_ot" placeholder="Numero OT">
										</div>
						   	</div>
								<div class="form-group">
									<label for="cliente" class="col-sm-4 ">Cliente : </label>
											<div class="col-sm-8" >
											<select_clientes></select_clientes>
											</div>
							   </div>
								 <div class="form-group">
								 <label for="name_proyecto" class="col-sm-4 ">Proyecto : </label>
										 <div class="col-sm-8">
											 <input type="text" class="form-control"   v-model="name_proyect" id="name_proyecto" placeholder="Nombre del Proyecto">
										 </div>
								 </div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
									<label for="estado" class="col-sm-4 ">Estado : </label>
											<div class="col-sm-8">
												<select_estados tipo_estado="2"   ></select_estados>
											</div>
									</div>
									<div class="form-group">
									<label for="valor_total" class="col-sm-4 ">Valor Total: </label>
											<div class="col-sm-8 ">
												<input type="text" class="form-control"   v-model="valor_total" id="valor_total" placeholder="Valor Total">
											</div>
									</div>
									<div class="form-group">
									<label for="horas_totales" class="col-sm-4 ">Horas Totales : </label>
											<div class="col-sm-8">
												<input type="text" class="form-control"  v-model="horas_totales"  id="horas_totales" placeholder="Numero de Totales">
											</div>
									</div>
								</div>
								</div>
									<div class="row">
											<div  class="col-md-6">
												<div class="form-group">
												<label for="ejecutivo" class="col-sm-4 ">Ejecutivo : </label>
														<div class="col-sm-8">
															<select_usuarios  area="1" ></select_usuarios>
														</div>
												</div>
											</div>
									</div>
									<div class="row">
								<div class="col-md-6">
									<div class="form-group ">
									<label for="fecha_inicio" class="col-sm-2 ">Inicio: </label>
											<div class="col-sm-3">
											<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<datepicker language="es" id="fecha_inicio"   v-model="fecha_inicio" class="form-control" style="max-width:150px;" format="dd-MM-yyyy"></datepicker>
										</div>
										</div>
									<label for="fecha_fin" class="col-sm-2 ">Fin: </label>
											<div class="col-sm-3">
												<div class="input-group date">
											<div class="input-group-addon">
												<i class="fa fa-calendar"></i>
											</div>
											<datepicker language="es"  id="fecha_fin"  v-model="fecha_fin" class="form-control"  style="max-width:150px;"  format="dd-MM-yyyy"></datepicker>
										</div>
											</div>
									</div>
								</div>
								<div class="col-md-6 ">
									<div class="form-group ">
									<label for="horas_disponibles" class="col-sm-4 ">Horas Disponibles</label>
											<div class="col-sm-6">
												<input type="text" class="form-control"  id="horas_disponibles" v-model="h_Disponibles"  placeholder="Numero de Horas Disponibles">
											</div>
									</div>
								</div>
							  </div><!-- /.row -->

							</div> <!-- /.box-header with-border -->
</template>	

<script>

 import Datepicker from 'vuejs-datepicker';
    module.exports= {
   components: { Datepicker},
      props: ['h_Disponibles','fecha_inicio','cliente','fecha_fin','ejecutivo','horas_totales','htotal','valor_total','estado','name_proyect','num_ot'],  
       data () {
          return {

          }
      },
      computed:{

          num_ot_v: function () {
		      return this.h_Disponibles + this.htotal
		    }     
      },
       created: function(){
          this.fetchTips();
      },
      methods:{
          fetchTips: function(){
 
          }
    }         
  }
</script>						
