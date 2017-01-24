<template>
      <div class="box box-primary">
        <div class="box-header">
            <h3>Crear nuevo Usuario</h3>
        </div>
        
        <div class="box-body">
            <form  role="form">
                <div class="form-group">
                    <label for="nombre_usuario">Nombre</label>
                    <input type="text" class="form-control" id="nombre_usuario" placeholder="Nombres  usuario">
                </div>
                <div class="form-group">
                    <label for="apellidos_usuario">Apellidos</label>
                    <input type="text" class="form-control" id="apellidos_usuario" placeholder="Apellidos usuario">
                </div>
                <div class="form-group">
                    <label for="email_usuario">Email</label>
                    <input type="email" class="form-control" id="email_usuario" placeholder="Email usuario">
                </div>
                 <div class="form-group">
                    <label for="contrasena_usuario">Contraseña</label>
                    <input type="text" class="form-control" id="contrasena_usuario" placeholder="Contraseña">
                </div>
                 <div class="form-group">
                    <label for="cargo_usuario">Cargo</label>
                    <input type="text" class="form-control" id="cargo_usuario" placeholder="Cargo usuario">
                 </div>
                 <div class="form-group">
                    <label for="telefono_usuario">Teléfono</label>
                    <input type="number" class="form-control" id="telefono_usuario" placeholder="Teléfono">
                 </div>
                  <div class="form-group">
                    <label for="horas_usuario">Horas Disponibles</label>
                    <input type="text" class="form-control" id="horas_usuario" placeholder="Horas Disponibles">
                 </div>
                  <div class="form-group">
                    <label for="rol_usuario">Rol</label>
                    <input type="text" class="form-control" id="rol_usuario" placeholder="Rol del usuario">
                 </div>
                  <div class="form-group">
                    <label for="area_usuario">Área</label>
                    <input type="text" class="form-control" id="area_usuario" placeholder="Area">
                 </div>
            </form> 
        </div>

        <div class="box-footer">
           <button class="btn btn-primary">Guardar</button>  
        </div>
    </div>
</template>

<script>
    export default {
        mounted() {
            console.log('Component ready.')
        }
    }
</script>
