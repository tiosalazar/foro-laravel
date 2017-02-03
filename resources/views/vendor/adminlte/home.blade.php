@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection-->


@section('main-content')
	<div class="container-fluid spark-screen">
		<div class="row">
			<div class="col-md-8 col-md-offset-2">
				<div class="">
					<div class=""></div>

					<div class="panel-body">
					<div class="box perfil-box">
						<div class="box-header">
							{{-- <h3 class="box-title"> {{Auth::user()->nombre}} {{Auth::user()->apellido}}  </h3> --}}
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

					            </div>
							</div>
							<div class="col-md-6">
					            <!-- /.box-header -->
					            <div class="box-header">
									<h3>{{Auth::user()->nombre}}</h3>
									<h4>Area | {{Auth::user()->areas_id}}</h4>
									<h5>Cargo |{{Auth::User()->cargo}}</h5>									
								</div>
					            <div class="box-body">
					               <div class="info_perfil">
					              	 <strong><i class="fa fa-book margin-r-5"></i> Encargado |  </strong>
					              	 <strong><i class="fa fa-book margin-r-5"></i> Correo | {{Auth::user()->email}} </strong>
					              	 <strong><i class="fa fa-book margin-r-5"></i> Teléfono |  {{Auth::user()->telefono}}</strong>
					              	 <strong><i class="fa fa-book margin-r-5"></i> Cumpleaños |  </strong>			
					               </div>
<<<<<<< HEAD
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
=======
					           
>>>>>>> origin/bcaldas

					            </div>
					            <!-- /.box-body -->
							</div>
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
