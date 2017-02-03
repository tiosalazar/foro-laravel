@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection-->


@section('main-content')
	
	<cambiar_foto_usuario></cambiar_foto_usuario>


	<div class="container-fluid spark-screen">
		<div class="row">
			<div class="col-md-7 col-md-offset-2">
				<div class="">
					<div class=""></div>

					<div class="panel-body">
					<div class="box perfil-box">
					
						<div class="box-body box_perfil">
							<div class="col-md-12 box_perfil_foto">

							<div class="col-md-5 box_perfil_foto_img">
					            <div class="box_perfil_foto_img-2" >
					            	<img src="{{asset('images/perfil.jpg')}}" class="img-responsive img_perfil">
					            	<i class="glyphicon glyphicon-pencil editar_foto"  data-target="#myModal_perfil" data-toggle="modal"  title="Cambiar Imagen"></i>
					            </div>
							</div>
							<div class="col-md-7">
					            <!-- /.box-header -->
					            <div class="box-header header_perfil">
									<h3 class="nombre_user">{{Auth::user()->nombre}} {{Auth::user()->apellido}}</h3>
									<h4 class="area_user">Area &nbsp| {{Auth::user()->area->nombre}}</h4>
									<h5 class="cargo_user">Cargo &nbsp| {{Auth::User()->cargo}}</h5>									
								</div>
					             <div class="box-body">
					               <div class="info_perfil">
					              	 <strong ><i class="fuente-icon margin-r-5">p</i> Encargado &nbsp| <span>{{$user_encargado}}</span> </strong>
					              	 <strong><i class="fuente-icon margin-r-5">b</i> Correo &nbsp| <span>{{Auth::user()->email}}</span> </strong>
					              	 <strong><i class="fuente-icon margin-r-5">t</i> Teléfono &nbsp|  <span>{{Auth::user()->telefono}}</span></strong>
					              	 <strong><i class="fuente-icon margin-r-5">d</i> Cumpleaños &nbsp| <span>{{Auth::user()->fecha_nacimiento}}</span> </strong>			
					               </div>
					           


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
