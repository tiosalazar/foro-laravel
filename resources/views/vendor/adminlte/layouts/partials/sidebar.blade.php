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
                    <p>{{ Auth::user()->name }}</p>
                    <!-- Status -->
                    <a href="#"><i class="fa fa-circle text-success"></i> {{ trans('adminlte_lang::message.online') }}</a>
                </div>
            </div>
        @endif

        <!-- search form (Optional) -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="{{ trans('adminlte_lang::message.search') }}..."/>
              <span class="input-group-btn">
                <button type='submit' name='search' id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></button>
              </span>
            </div>
        </form>
        <!-- /.search form -->

        <!-- Sidebar Menu -->
        <ul class="sidebar-menu">
            <li class="header">{{ trans('adminlte_lang::message.header') }}</li>
            <!-- Optionally, you can add icons to the links -->
            <li class="active"><a href="{{ url('home') }}"><i class='fa fa-link'></i> <span>{{ trans('adminlte_lang::message.home') }}</span></a></li>
            <li><a href="#"><i class='fa fa-link'></i> <span>{{ trans('adminlte_lang::message.anotherlink') }}</span></a></li>
            <li class="treeview">
                <a href="#"><i class='fa fa-users'></i> <span>{{ trans('texto_menu.organizacion') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="{{ url('roles') }}">{{  trans('texto_menu.crear_roles') }}</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class='fa  fa-user'></i> <span>{{ trans('texto_menu.usuarios') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="{{ url('areas') }}">{{  trans('texto_menu.crear_areas') }}</a></li>
                    <li><a href="{{ url('crear_usuario') }}">{{  trans('texto_menu.crear_usuarios') }}</a></li>
                    <li><a href="{{ url('usuarios') }}">{{  trans('texto_menu.listar_usuarios') }}</a></li>
                    <li><a href="{{ url('areas') }}">{{  trans('texto_menu.listar_areas') }}</a></li>
                </ul>

             
            </li>
            <li class="treeview">
                <a href="#"><i class='fa fa-link'></i> <span>Clientes</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">

                    <li><a href="{{ url('crear_cliente') }}">Crear cliente</a></li>
                    <li><a href="{{ url('listar_clientes') }}">Listar clientes</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#"><i class='fa fa-link'></i> <span>{{ trans('texto_menu.ots') }}</span> <i class="fa fa-angle-left pull-right"></i></a>
                <ul class="treeview-menu">
                    <li><a href="{{ url('crear_ot') }}">{{  trans('texto_menu.crear_ot') }}</a></li>
                </ul>
            </li>
        </ul><!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
</aside>
