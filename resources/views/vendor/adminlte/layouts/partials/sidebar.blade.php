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
            <p>{{ Auth::user()->nombre }} {{ Auth::user()->apellido }}</p>

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

    <!-- Sidebar Menu -->
    <ul class="sidebar-menu">
      <!-- <li class="header">Menú</li> -->
      <!-- Optionally, you can add icons to the links -->

      <!--Home -->
      <li class="active treeview"><a href="{{ url('home') }}"><i class='fuente-icon'>p</i> <span>{{ trans('texto_menu.perfil') }}</span></a></li>

      @if( Auth::user()->can('ver_roles') )
      <!--Roles -->
      <li class="treeview"><a href="{{ url('roles') }}"><i class='fuente-icon'>c</i><span>{{  trans('texto_menu.crear_roles') }}</span></a></li>
      @endif


      <!--Foro -->
      <li class="treeview">
        <a href="#"><i class='fuente-icon'>f</i> <span>{{ trans('texto_menu.foro') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
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
          @if(Auth::user()->can('ver_foro_soporte'))
         <li><a href="{{route('soporte')}}">{{ trans('texto_menu.soporte') }}</a></li>
         @endif
          @if( Auth::user()->can('crear_tareas') )
          <li><a href="{{ url('crear_tarea') }}">{{ trans('texto_menu.creacion_tareas') }}</a></li>
          @endif
        </ul>
      </li>
      @if( Auth::user()->can('ver_trafico') )
      <!--Trafico -->
      <li class="treeview"><a href="{{ url('trafico') }}"><i class='fa fa-calendar'></i><span>{{  trans('texto_menu.trafico') }}</span></a></li>
      @endif

      @if( Auth::user()->can('ver_clientes') )
      <li class="treeview">
        <a href="#"><i class='fuente-icon'>a</i> <span>Clientes</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          @if(Auth::user()->can('crear_clientes'))
          <li><a href="{{ url('crear_cliente') }}">Crear cliente</a></li>
          @endif
          <li><a href="{{ url('listar_clientes') }}">Listar clientes</a></li>
        </ul>
      </li>
      @endif

      <!--Ots-->
      @if(Auth::user()->can('ver_ots'))
      <li class="treeview">
        <a href="#"><i class='fuente-icon'>o</i> <span>{{ trans('texto_menu.ots') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
         <li><a href="{{ url('listar_ot') }}">{{  trans('texto_menu.listar_ot') }}</a></li>
          @if(Auth::user()->can('crear_ots'))
          <li><a href="{{ url('crear_ot') }}">{{  trans('texto_menu.crear_ot') }}</a></li>
          @endif
        </ul>
      </li>
      @endif

      <li class="treeview">
        <a href="#"><i class='fuente-icon'>e</i> <span>{{ trans('texto_menu.usuarios') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
        <ul class="treeview-menu">
          @if(Auth::user()->can('crear_areas'))
          <li><a href="{{ url('areas') }}">{{  trans('texto_menu.crear_areas') }}</a></li>
          @endif
          @if(Auth::user()->can('crear_usuarios'))
          <li><a href="{{ url('crear_usuario') }}">{{  trans('texto_menu.crear_usuarios') }}</a></li>
          @endif
          @if(Auth::user()->can('crear_usuarios'))
          <li><a href="{{ url('usuarios') }}">{{  trans('texto_menu.listar_usuarios') }}</a></li>
          @endif
          @if(Auth::user()->can('ver_listado_areas'))
          <li><a href="{{ url('listar_areas') }}">{{  trans('texto_menu.listar_areas') }}</a></li>
          @endif
        </ul>
      </li>


    </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
    </aside>
