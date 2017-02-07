@extends('adminlte::layouts.app')

<!--@section('htmlheader_title')
	{{ trans('adminlte_lang::message.home') }}
@endsection-->


@section('main-content')

	
	   <div class="modal fade " id="image_upload">
	   <div class="modal-dialog">
		     <div class="modal-content">
			     <div class="modal-header">
			     	<h3>Cambiar imagen</h3>
			     </div>
			     <div class="modal-body">
				     {!! Form::open(['url' => 'usuariosuploadimagen', 'method' => 'POST' ,'files' => true]) !!}
					    {{ Form::file('image', ['class' => 'form-control','accept'=>'image/*']) }}
					    <div class="modal-footer">
					    {{ Form::button('Cerrar', ['class' => 'btn btn-danger','data-dismiss'=>'modal']) }}
					    {{ Form::submit('Cambiar Imagen', ['class' => 'btn btn-primary']) }}
					    </div>
					 {!! Form::close() !!} 
				 </div>
			 </div>
		 </div>
	  </div>

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

									@if(Auth::user()->img_perfil!=null) 
										<img src="{{Auth::user()->img_perfil}}" alt="imagen perfil" class="img-responsive img_perfil" >
									@else 
										<img src="{{asset('images/perfil.jpg')}}" alt="imagen perfil" class="img-responsive img_perfil"> 
									@endif 
					            	
					            	<i class="glyphicon glyphicon-pencil editar_foto"  data-target="#image_upload" data-toggle="modal"  title="Cambiar Imagen"></i>
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
		 <!--Listado de tareas con un componente vuejs-->

		 	<div>
		 		<div class="row tarea_perfil">
		 			<div class="box tarea_perfil_box">
		 				<div class="box-header">
			 				<div class="box-header-tittle" >
			 					<div class="img-circle" >M</div>
			 					<div class="box-header-content">
			 						<h4>Manitoba</h4>
			 						<p>Diseño pieza articulo Valle empresa</p>
		 							<span>OT 1234 20/ene/2017</span>
			 					</div>
			 					
			 				</div>
		 					
		 				</div>
		 				<div class="box-body" >
		 					<p >Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore</p>
		 				</div>
		 				<div class="box-footer" >		 					
		 					<button class="btn btn-primary button_tarea" >Ver tarea</button>
		 				</div>
		 				
		 			</div>

		 		</div>
		 	</div>
			

			</div>
		</div>
	</div>
@endsection
