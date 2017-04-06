
/**
 * First we will load all of this project's JavaScript dependencies which
 * include Vue and Vue Resource. This gives a great starting point for
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');


/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the body of the page. From here, you may begin adding components to
 * the application, or feel free to tweak this setup for your needs.
 */

Vue.component('crear_cliente_form', require('./components/clientes/crear_cliente_form.vue'));
Vue.component('crear_listar_cliente', require('./components/clientes/crear_listar_cliente.vue'));

// Tarea
Vue.component('tarea', require('./components/tareas/tarea.vue'));
Vue.component('ver_tareas', require('./components/tareas/ver_tareas.vue'));
Vue.component('ver_tarea', require('./components/tareas/ver_tarea.vue'));
Vue.component('tareas_perfil', require('./components/tareas/tareas_perfil.vue'));

// Trafico
Vue.component('listar_trafico', require('./components/trafico/listar.vue'));

// Notificaciones
Vue.component('notificacion',require('./components/herramientas/notificacion.vue'));
Vue.component('notificaciones_total',require('./components/herramientas/notificaciones_total.vue'));
Vue.component('listar_notificaciones',require('./components/notificaciones/listar_notificaciones.vue'));

// Fases del Proyecto
// Vue.component('listar_fases',require('./components/fases_proyecto/listar_fases.vue'));
Vue.component('crear_fase',require('./components/fases_proyecto/crear_fase.vue'));
Vue.component('crear_tipos_fase',require('./components/fases_proyecto/crear_tipos_fase.vue'));
Vue.component('editar_fase',require('./components/fases_proyecto/editar_fase.vue'));
Vue.component('editar_tipo_fase',require('./components/fases_proyecto/editar_tipo_fase.vue'));

// Divisas
Vue.component('crear_divisa',require('./components/divisas/crear_divisa.vue'));
Vue.component('editar_divisa',require('./components/divisas/editar_divisa.vue'));

// Asignar Roles
Vue.component('asignar_roles',require('./components/roles/asignar_roles.vue'));

//Componentes Dsalazar
Vue.component('formulario_anadir_requerimiento', require('./components/ots/formulario_anadir_requerimiento.vue'));
Vue.component('listar_ots', require('./components/ots/listar_ots.vue'));
// Compras Asociadas
Vue.component('compras_asociadas_crear', require('./components/compras/formulario.vue'));
Vue.component('listar_compras', require('./components/compras/listar_compras.vue'));

//Fin Componentes Dsalazar
//Componentes Bcaldas
Vue.component('form_usuarios', require('./components/usuarios/crear_usuario.vue'));
Vue.component('list_usuarios', require('./components/usuarios/listar_usuario.vue'));
Vue.component('roles', require('./components/roles/roles.vue'));
Vue.component('areas', require('./components/areas/areas.vue'));
Vue.component('listado_areas', require('./components/areas/listado_areas.vue'));
Vue.component('historico_equipos', require('./components/areas/historico_equipos.vue'));
//Fin Componentes Bcaldas

//Tipos de compra
Vue.component('tipos_compra_crear', require('./components/tipos_compras/tipos_compra_crear.vue'));
Vue.component('tipos_compra_editar', require('./components/tipos_compras/tipos_compra_editar.vue'));

const app = new Vue({
    el: '#app',

});
