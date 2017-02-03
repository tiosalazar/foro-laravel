<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- Sidebar user panel (optional) -->
        @if (! Auth::guest())
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="{{ Gravatar::get($user->email) }}" class="img-circle" alt="User Image" />
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

            <!--Roles -->    
            <li class="treeview"><a href="{{ url('roles') }}"><i class='fuente-icon'>c</i><span>{{  trans('texto_menu.crear_roles') }}</span></a></li>

            <!--Foro -->
            <li class="treeview">
                <a href="#"><i class='fuente-icon'>f</i> <span>{{ trans('texto_menu.foro') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="#">{{ trans('texto_menu.areas') }}</a></li>
                    <li><a href="{{ url('crear_tarea') }}">{{ trans('texto_menu.creacion_tareas') }}</a></li>
                </ul>
            </li>

            <!--Ots-->
            @can('ver_ots')
                <li class="treeview">
                    <a href="#"><i class='fuente-icon'>o</i> <span>{{ trans('texto_menu.ots') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                       @can('crear_ots')
                        <li><a href="{{ url('crear_ot') }}">{{  trans('texto_menu.crear_ot') }}</a></li>
                        @endcan
                    </ul>
                </li>
            @endcan

            @can('ver_clientes')
                <li class="treeview">
                    <a href="#"><i class='fuente-icon'>a</i> <span>Clientes</span> <i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                        @can('crear_clientes')
                        <li><a href="{{ url('crear_cliente') }}">Crear cliente</a></li>
                        @endcan
                        <li><a href="{{ url('listar_clientes') }}">Listar clientes</a></li>
                    </ul>
                </li>
            @endcan
            
            <li class="treeview">
                <a href="#"><i class='fuente-icon'>e</i> <span>{{ trans('texto_menu.usuarios') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="{{ url('areas') }}">{{  trans('texto_menu.crear_areas') }}</a></li>
                    <li><a href="{{ url('crear_usuario') }}">{{  trans('texto_menu.crear_usuarios') }}</a></li>
                    <li><a href="{{ url('usuarios') }}">{{  trans('texto_menu.listar_usuarios') }}</a></li>
                    <li><a href="{{ url('listar_areas') }}">{{  trans('texto_menu.listar_areas') }}</a></li>
                </ul>

             
            </li>
          
         
        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>
