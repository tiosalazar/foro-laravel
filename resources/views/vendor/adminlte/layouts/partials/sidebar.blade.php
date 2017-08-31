    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

      <!-- sidebar: style can be found in sidebar.less -->
      <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        @if (! Auth::guest())
        <div class="user-panel">
          <div class="pull-left image">
                 <!-- Mostrar imagen de perfil si la ruta existe en la base de datos-->
                  @if(Auth::user()->img_perfil!=null)
                    <img src="{{asset(Auth::user()->img_perfil)}}" class="img-circle" alt="User Image" >
                  @else
                    <img src="{{asset('images/perfil.jpg')}}" class="img-circle" alt="User Image">
                  @endif
          </div>
          <div class="pull-left info">
            <p>{{ Auth::user()->nombre }}</p>
            <p>{{ Auth::user()->apellido }}</p>

            <!-- Status -->
            <a href="#"><i class="fa fa-circle text-success"></i> {{ trans('adminlte_lang::message.online') }}</a>
          </div>
        </div>
        @endif

        <!-- search form (Optional) -->
        <!-- <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="{{ trans('adminlte_lang::message.search') }}..."/>
        <span class="input-group-btn">
        <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
      </span>
    </div>
    </form>-->
    <!-- /.search form -->

    <div style="height: 32px;"></div>

    <!-- Sidebar Menu -->
    <ul class="sidebar-menu">
      <!-- <li class="header">Menú</li> -->
      <!-- Optionally, you can add icons to the links -->

     

      <!--Home -->
      <li class="treeview {{ Request::is('home') ? 'active' : '' }}"  ><a href="{{ url('home') }}"><i class='fuente-icon'>p</i> <span>{{ trans('texto_menu.perfil') }}</span></a></li>

      @if( Auth::user()->can('ver_roles') )
      <!--Roles -->
      <li class="treeview {{ Request::is('roles') ? 'active' : '' }}"><a href="{{ url('roles') }}"><i class='fuente-icon'>c</i><span>{{  trans('texto_menu.crear_roles') }}</span></a></li>
      @endif

       @if(Auth::user()->hasRole('cliente'))
       <li class="treeview">
        <a href="#"><i class='fuente-icon'>o</i> <span>{{ trans('texto_menu.requerimientos_cliente') }}</span> <i class="fa fa-caret-left  fa-lg pull-right"></i></a>
        <ul class="treeview-menu">
          <li><a href="">{{  trans('texto_menu.crear_requerimientos_cliente') }}</a></li>
          <li><a href="">{{  trans('texto_menu.listar_requerimientos_cliente') }}</a></li>
        </ul>
      </li>
      @endif


      <!--Foro -->
      @if(!Auth::user()->hasRole('cliente'))
      <li class="treeview {{ Request::is('foro/*') ? 'active' : '' }}">
        <a href="#"><i class='fuente-icon'>f</i> <span>{{ trans('texto_menu.foro') }}</span> <i class="fa fa-caret-left  fa-lg pull-right"></i></a>
        <ul class="treeview-menu">
        @if(Auth::user()->hasRole('colaborador'))
          <li><a href="{{route('foro')}}">{{ trans('texto_menu.ver_foro') }}</a></li>
         @endif
        @if(Auth::user()->can('ver_foro_creatividad'))
          <li><a href="{{route('creatividad')}}">{{ trans('texto_menu.creatividad') }}</a></li>
         @endif
        @if(Auth::user()->can('ver_foro_diseno'))
          <li><a href="{{route('diseno')}}">{{ trans('texto_menu.diseno') }}</a></li>
        @endif
        @if(Auth::user()->can('ver_foro_desarrollo'))
          <li><a href="{{route('desarrollo')}}">{{ trans('texto_menu.desarrollo') }}</a></li>
         @endif
        @if(Auth::user()->can('ver_foro_contenidos'))
          <li><a href="{{route('contenido')}}">{{ trans('texto_menu.contenido') }}</a></li>
         @endif
        @if(Auth::user()->can('ver_foro_digital'))
          <li><a href="{{route('digital')}}">{{ trans('texto_menu.digital') }}</a></li>
         @endif
         @if(Auth::user()->can('ver_foro_cuentas'))
         <li><a href="{{route('cuentas')}}">{{ trans('texto_menu.cuentas') }}</a></li>
         @endif
         @if(Auth::user()->can('crear_tareas'))
         <li><a href="{{route('ver_todas_tareas')}}">{{ trans('texto_menu.ver_todas_tareas') }}</a></li>
         @endif
          @if(Auth::user()->can('ver_foro_soporte'))
        <!-- <li><a href="{{route('soporte')}}">{{ trans('texto_menu.soporte') }}</a></li>-->
         @endif
          @if( Auth::user()->can('crear_tareas') )
          <li><a href="{{ url('crear_tarea') }}">{{ trans('texto_menu.creacion_tareas') }}</a></li>
          @endif
        </ul>
      </li>
      @endif

       <!--Ots-->
      @if(Auth::user()->can('ver_ots'))
      <li class="treeview {{ Request::is('ots/*') ? 'active' : '' }}">
        <a href="#"><i class='fuente-icon'>o</i> <span>{{ trans('texto_menu.ots') }}</span> <i class="fa fa-caret-left  fa-lg pull-right"></i></a>
        <ul class="treeview-menu">
         <li><a href="{{ url('ots/listado') }}">{{  trans('texto_menu.listar_ot') }}</a></li>
          @if(Auth::user()->can('crear_ots'))
          <li><a href="{{ url('ots/crear') }}">{{  trans('texto_menu.crear_ot') }}</a></li>
          @endif
        </ul>
      </li>
      @endif

      <!--Clientes -->
      @if( Auth::user()->can('ver_clientes') )
      <li class="treeview {{ Request::is('clientes/*') ? 'active' : '' }}">
        <a href="#"><i class='fuente-icon'>a</i> <span>{{  trans('texto_menu.clientes') }}</span> <i class="fa fa-caret-left pull-right fa-lg"></i></a>
        <ul class="treeview-menu">
          @if(Auth::user()->can('crear_clientes'))
          <li><a href="{{ url('clientes/crear') }}">{{  trans('texto_menu.crear_cliente') }}</a></li>
          @endif
          <li><a href="{{ url('clientes/listado') }}">{{  trans('texto_menu.listar_cliente') }}</a></li>
        </ul>
      </li>
      @endif
     <!-- Equipo -->
     @if(!Auth::user()->hasRole('cliente'))
      <li class="treeview {{ Request::is('equipo/*') ? 'active' : '' }}">
        <a href="#"><i class='fuente-icon'>e</i> <span>{{ trans('texto_menu.usuarios') }}</span> <i class="fa fa-caret-left pull-right fa-lg"></i></a>
        <ul class="treeview-menu">
          @if(Auth::user()->can('crear_areas'))
          <li><a href="{{ url('equipo/areas') }}">{{  trans('texto_menu.crear_areas') }}</a></li>
          @endif
          @if(Auth::user()->can('crear_usuarios'))
          <li><a href="{{ url('equipo/usuarios') }}">{{  trans('texto_menu.listar_usuarios') }}</a></li>
          @endif
          @if(Auth::user()->can('ver_listado_areas'))
          <li><a href="{{ url('equipo/directorio') }}">{{  trans('texto_menu.listar_areas') }}</a></li>
          @endif
        </ul>
      </li>
      @endif
      <!-- .Equipo -->


      <!-- Informes -->
      @if( Auth::user()->can('ver_informes') )
      <li class="treeview {{ Request::is('informes/*') ? 'active' : '' }}">
        <a href="#"><i class='fa fa-bar-chart'></i> <span>{{ trans('texto_menu.informes') }}</span> <i class="fa fa-caret-left pull-right fa-lg"></i></a>
        <ul class="treeview-menu">
          <!--Trafico -->
          @if( Auth::user()->can('ver_trafico') )
          <li class="treeview  {{ Request::is('informes/trafico') ? 'active' : '' }}"><a href="{{ url('informes/trafico') }}"><i class='fa fa-calendar'></i><span>{{  trans('texto_menu.trafico') }}</span></a></li>
          @endif
          <!--Trafico -->
          @if( Auth::user()->can('ver_informe_soporte') )
          <li class="treeview  {{ Request::is('informes/soporte') ? 'active' : '' }}"><a href="{{ url('informes/soporte') }}"><i class='fa fa-wrench'></i><span>{{  trans('texto_menu.soporte') }}</span></a></li>
          @endif
          <!-- .Trafico -->
          <!--Historico Usuarios -->
          @if( Auth::user()->can('ver_historico_usuarios') )
          <li class="treeview " ><a href="{{ url('informes/historico_usuarios') }}"><i class='fa fa-history'></i><span>{{  trans('texto_menu.historico_usuarios') }}</span></a></li>
          @endif
          <!-- .HistoricoUsuarios -->
          <!--Historico Áreas -->
          @if( Auth::user()->can('ver_historico_areas') )
          <li class="treeview " ><a href="{{ url('informes/historico_areas') }}"><i class='fa fa-line-chart'></i><span>{{  trans('texto_menu.historico_areas') }}</span></a></li>
          @endif
          <!-- .Historico Áreas -->
          <!--Historico Clientes -->
          @if( Auth::user()->can('ver_historico_clientes') )
          <li class="treeview " ><a href="{{ url('informes/historico_clientes') }}"><i class='fa fa-th-list'></i><span>{{  trans('texto_menu.historico_clientes') }}</span></a></li>
          @endif
          <!-- .Historico Clientes -->
        </ul>
      </li>
       @endif
      <!-- .Informes -->

      <!-- Herramientas -->
      @if( Auth::user()->can('ver_herramientas') )
      <li class="treeview {{ Request::is('herramientas/*') ? 'active' : '' }}">
        <a href="#"><i class='fa fa-cogs'></i> <span>{{ trans('texto_menu.herramientas') }}</span> <i class="fa fa-caret-left pull-right fa-lg"></i></a>
        <ul class="treeview-menu">
          <!--Divisas -->
          @if( Auth::user()->can('ver_fases_planeacion') )
          <li><a href="{{ url('herramientas/divisas') }}"><i class='fa fa-money'></i><span>{{  trans('texto_menu.divisas') }}</span></a></li>
          @endif
          <!--Divisas -->
          <!--Fases Planeacion -->
          @if( Auth::user()->can('ver_fases_planeacion') )
          <li class="treeview  {{ Request::is('herramientas/fases') ? 'active' : '' }}"><a href="{{ url('herramientas/fases') }}"><i class='fa fa-paper-plane'></i><span>{{  trans('texto_menu.fases_planeacion') }}</span></a></li>
          @endif
          <!-- .Fases Planeacion -->

          <!--Tiposcompra -->
          @if( Auth::user()->can('ver_fases_planeacion') )
          <li class="treeview"><a href="{{ url('tiposcompra') }}"><i class='fa fa-cart-plus '></i><span>{{  trans('texto_menu.tipos_compra') }}</span></a></li>
          @endif
      <!-- .Tiposcompra -->
        </ul>
      </li>
       @endif
      <!-- .Herramientas -->

   <!-- Ver compras asociadas -->
       @if( Auth::user()->can('ver_compras_asociadas') )
           <li class="treeview {{ Request::is('compra/*') ? 'active' : '' }}">
        <a href="#"><i class='fa fa-shopping-bag'></i> <span>{{ trans('texto_menu.compras_asociadas') }}</span> <i class="fa fa-caret-left pull-right fa-lg"></i></a>
        <ul class="treeview-menu">
          <!--Listar -->
          <li><a href="{{ url('compra/crear') }}"><i class='fa fa-cart-plus'></i><span>{{  trans('texto_menu.compras_asociadas_crear') }}</span></a></li>

          <!--Crear -->
          <li><a href="{{ url('compra/listar') }}"><i class='fa fa-list-ul'></i><span>{{  trans('texto_menu.compras_asociadas_listar') }}</span></a></li>

        </ul>
      </li>
       @endif
     <!--  Ver compras asociadas -->



      <!-- .Permisos por rol -->
       @if( Auth::user()->can('ver_permisos') )
          <li class="treeview"><a href="{{ url('permisos') }}"><i class='fa fa-key '></i><span>{{  trans('texto_menu.permisos') }}</span></a></li>
       @endif
     <!-- Permisos por rol -->

    </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
    </aside>
