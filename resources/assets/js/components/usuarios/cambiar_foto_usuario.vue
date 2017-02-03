<template>
	  <!-- Ventana modal para Editar Foto perfil -->
              <div class="example-modal">
                <div class="modal fade" id="myModal_perfil">
                  <div class="modal-dialog">
                   <form action="">
                    <div class="modal-content">
                      <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">×</span></button>
                        <h4 class="modal-title">Editar foto de Perfil</h4>
                      </div>
                      <div class="modal-body">
                      	<div class="form-group">
	                      	<label for="imagen_perfil" >Selecciona una Imagen</label>
	                     	<input type="file" name="imagen_perfil" id="imagen_perfil" class="form-control">
                     	</div>
                      </div>
                       
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-primary " id="" >Cambiar imagen</button>
                      </div>
                    </div>
                    </form>
                    <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
                </div>
                <!-- /.modal -->
             </div>	
</template>


<script>
	


	
	module.exports={
		
		data(){
			return{
			
				
			}
		},
		 created: function(){

	      
	      
	     },
	     
		methods:{
			 			
		cambiar_foto: function(){

   
          }
         
         
		}
	}



</script>