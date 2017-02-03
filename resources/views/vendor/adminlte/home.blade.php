@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection-->


@section('main-content')
	<div class="container-fluid spark-screen">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="panel panel-default">
					<div class="panel-heading">Perfil</div>

					<div class="panel-body">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title"> {{Auth::user()->nombre}} {{Auth::user()->apellido}}  </h3>
						</div>
						<div class="box-body">
							<div class="col-md-12">

							<div class="col-md-6">
								<!--<div class="pull-left image">
				                    <img src="{{ Gravatar::get($user->email) }}" class="img-circle" alt="User Image" />
				                </div>-->
				                <div style="height: 10px;"></div>
				                <div class="box-body box-profile">
					              <img class="profile-user-img img-responsive img-circle" src="{{ Gravatar::get($user->email) }}" alt="User profile picture">

					              <h3 class="profile-username text-center">{{Auth::user()->nombre}} {{Auth::user()->apellido}}</h3>

					              <p class="text-muted text-center">{{Auth::user()->cargo}}</p>

					              <a href="#" class="btn btn-primary btn-block"><b>Cambiar Imagen </b></a>
					            </div>
							</div>
							<div class="col-md-6">
					            <!-- /.box-header -->
					            <div class="box-body">
					                <div class="col-md-6">
					               <strong><i class="fa fa-book margin-r-5"></i> Cargo</strong>
					                <p class="text-muted">
					               {{Auth::user()->cargo}}
					                </p>
					                <hr>
					              <strong><i class="fa fa fa-phone margin-r-5"></i> Teléfono</strong>
					              <p class="text-muted">{{Auth::user()->telefono}}</p>
					               <hr>
					              <strong><i class="fa fa-clock-o margin-r-5"></i> Horas Disponilbes</strong>
					               <p class="text-muted">{{Auth::user()->horas_disponible}}</p>
					                <hr>
					               </div>
					                <div class="col-md-6">
					               <strong><i class="fa fa-user margin-r-5"></i> Email</strong>
					               <p class="text-muted">{{ Auth::user()->email }}</p>
					                <hr>
					              <strong><i class="fa fa-user margin-r-5"></i> Perfil</strong>
					               <p class="text-muted">{{ Auth::user()->roles[0]->display_name }} </p>
					                <hr>
					              <strong><i class="fa fa-pencil margin-r-5"></i> Area</strong>
					               <p class="text-muted">{{Auth::user()->area->nombre }}</p>
					                <hr>
					                </div>

					            </div>
					            <!-- /.box-body -->
							</div>
							</div>
						</div>
					</div>
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title"> Notificaciones </h3>
						</div>
						<div class="box-body">
							<div class="col-md-12">

							</div>

							</div>



						</div>	

						<!--{{ trans('adminlte_lang::message.logged') }}-->
					</div>
				</div>
			</div>
		</div>
	</div>
@endsection
