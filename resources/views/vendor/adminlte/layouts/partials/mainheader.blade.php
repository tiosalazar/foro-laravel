<!-- Main Header -->
<header class="main-header">

    <!-- Logo -->
    <a href="{{ url('/home') }}" class="logo">
        <!-- mini logo for sidebar mini 50x50 pixels -->
        <span class="logo-mini"><img src="{{ asset('images/icon_small.png') }}" alt=""></span>
        <!-- logo for regular state and mobile devices -->
        <span class="logo-lg">  <img src="{{ asset('images/logo_himalaya.png') }}" width="180px"> </span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">{{ trans('adminlte_lang::message.togglenav') }}</span>
        </a>
        <!-- Navbar Right Menu -->
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <!-- Messages: style can be found in dropdown.less-->
                 <li class="dropdown messages-menu">
                    <!-- Menu toggle button -->
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <!-- <span class="label label-success">4</span> -->
                        <notificaciones_total></notificaciones_total>
                    </a>
                    <ul class="dropdown-menu">
                      <!-- <li class="header">You have 4 messages</li> -->
                      <li>
                        <!-- inner menu: contains the actual data -->
                            <notificacion :id="{{Auth::user()->id }}" ></notificacion>
                      </li>
                      <li class="footer"><a href="/listar_notificaciones">Ver todas las notificaciones</a></li>
                    </ul>
                </li><!-- /.messages-menu -->

                <!-- Notifications Menu -->
                <!-- <li class="dropdown notifications-menu">
                    Menu toggle button
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-bell-o"></i>
                        <span class="label label-danger">5</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">{{ trans('adminlte_lang::message.notifications') }}</li>
                        <li>
                            Inner Menu: contains the notifications
                        </li>
                        <li class="footer"><a href="#">{{ trans('adminlte_lang::message.viewall') }}</a></li>
                    </ul>
                </li> -->
                <!-- Tasks Menu -->
              <!--   <li class="dropdown tasks-menu">
                    <!-- Menu Toggle Button -->
                  <!--  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-flag-o"></i>
                        <span class="label label-danger">9</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">{{ trans('adminlte_lang::message.tasks') }}</li>
                        <li>
                            <!-- Inner menu: contains the tasks -->
                      <!--      <ul class="menu">
                                <li><!-- Task item -->
                                <!--    <a href="#">
                                        <!-- Task title and progress text -->
                             <!--           <h3>
                                            {{ trans('adminlte_lang::message.tasks') }}
                                            <small class="pull-right">20%</small>
                                        </h3>
                                        <!-- The progress bar -->
                                   <!--     <div class="progress xs">
                                            <!-- Change the css width attribute to simulate progress -->
                                        <!--    <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                                                <span class="sr-only">20% {{ trans('adminlte_lang::message.complete') }}</span>
                                            </div>
                                        </div>
                                    </a>
                                </li><!-- end task item -->
                        <!--    </ul>
                        </li>
                        <li class="footer">
                            <a href="#">{{ trans('adminlte_lang::message.alltasks') }}</a>
                        </li>
                    </ul>
                </li> -->
                @if (Auth::guest())
                    <li><a href="{{ url('/register') }}">{{ trans('adminlte_lang::message.register') }}</a></li>
                    <li><a href="{{ url('/login') }}">{{ trans('adminlte_lang::message.login') }}</a></li>
                @else
                    <!-- User Account Menu -->
                    <li class="dropdown user user-menu">
                        <!-- Menu Toggle Button -->
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            <!-- The user image in the navbar-->
                             <!-- Mostrar imagen de perfil si la ruta existe en la base de datos-->
                                @if(Auth::user()->img_perfil!=null)
                                    <img src="{{Auth::user()->img_perfil}}" class="user-image" alt="User Image" >
                                  @else
                                    <img src="{{asset('images/perfil.jpg')}}" class="user-image" alt="User Image"> 
                                  @endif

                            <!-- hidden-xs hides the username on small devices so only the image appears. -->
                            <span class="hidden-xs">{{ Auth::user()->nombre }}</span>
                        </a>
                        <ul class="dropdown-menu">
                            <!-- The user image in the menu -->
                            <li class="user-header">
                             <!-- Mostrar imagen de perfil si la ruta existe en la base de datos-->
                                  @if(Auth::user()->img_perfil!=null)
                                    <img src="{{Auth::user()->img_perfil}}" class="img-circle" alt="User Image" >
                                  @else
                                    <img src="{{asset('images/perfil.jpg')}}" class="img-circle" alt="User Image">
                                  @endif
                                <p>
                                    {{ Auth::user()->nombre }}
                                    <small>{{ Auth::user()->rol->name}}</small>
                                </p>
                            </li>
                            <!-- Menu Body -->
                           <!--  <li class="user-body">
                                <div class="col-xs-4 text-center">
                                    <a href="#">{{ trans('adminlte_lang::message.followers') }}</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">{{ trans('adminlte_lang::message.sales') }}</a>
                                </div>
                                <div class="col-xs-4 text-center">
                                    <a href="#">{{ trans('adminlte_lang::message.friends') }}</a>
                                </div>
                            </li>-->
                            <!-- Menu Footer-->
                            <li class="user-footer">
                                <div class="pull-left">
                                    {{-- <a href="{{ url('/settings') }}" class="btn btn-default btn-flat">{{ trans('adminlte_lang::message.profile') }}</a> --}}
                                </div>
                                <div class="pull-right">
                                    <a href="{{ url('/logout') }}" class="btn btn-default btn-flat"
                                       onclick="event.preventDefault();
                                                 document.getElementById('logout-form').submit();">
                                        {{ trans('adminlte_lang::message.signout') }}
                                    </a>

                                    <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                                        {{ csrf_field() }}
                                        <input type="submit" value="logout" style="display: none;">
                                    </form>

                                </div>
                            </li>
                        </ul>
                    </li>
                @endif

            {{--     <!-- Control Sidebar Toggle Button -->
                <li>
                    <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                </li> --}}
            </ul>
        </div>
    </nav>
</header>
