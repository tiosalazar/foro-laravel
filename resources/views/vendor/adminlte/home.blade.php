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

					 <div class="input-group grupo_img_perfil">
		                <label class="input-group-btn">
		                    <span class="btn btn-primary input_buscar">
		                        Buscar&hellip;{{ Form::file('image', ['class' => 'input_img','style' => 'display:none','accept'=>'.jpg,.png']) }}
		                    </span>
		                </label>
		                <input type="text" class="form-control" readonly>
       				 </div>


					    <div class="boton_accion">
					    {{ Form::button('Cerrar', ['class' => 'btn btn-danger btn-flat img_cerrar','data-dismiss'=>'modal']) }}
					    {{ Form::submit('Cambiar Imagen', ['class' => 'btn btn-primary btn-flat img_cambiar']) }}
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
					@if (session('error'))
						 <div class="alert alert-error">
								 {{ session('error') }}
						 </div>
				 @elseif (session('status'))
						<div class="alert alert-success">
								{{ session('status') }}
						</div>
				@endif

					<div class="panel-body">
					<div class="box perfil-box">

						<div class="box-body box_perfil">
							<div class="col-md-12 box_perfil_foto">

							<div class="col-md-5 box_perfil_foto_img">
					            <div class="box_perfil_foto_img-2" >

									@if(Auth::user()->img_perfil!=null)
										<img src="{{asset(Auth::user()->img_perfil)}}" alt="imagen perfil" class="img-responsive img_perfil" >
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
									<h4 class="area_user">Área &nbsp| {{Auth::user()->area->nombre}}</h4>
									<h5 class="cargo_user">Cargo &nbsp| {{Auth::User()->cargo}}</h5>
								</div>
					             <div class="box-body">
					               <div class="info_perfil">
					              	 <strong ><i class="fuente-icon margin-r-5">p</i> Encargado &nbsp| <span>{{$user_encargado}}</span> </strong>
					              	 <strong class="correo"><i class="fuente-icon margin-r-5">b</i> Correo<span> |&nbsp{{Auth::user()->email}}</span> </strong>
					              	 <strong><i class="fuente-icon margin-r-5">t</i> Teléfono &nbsp|  <span>{{Auth::user()->telefono}}</span></strong>
					              	 <strong><i class="fuente-icon margin-r-5">d</i> Cumpleaños &nbsp| <span> {{Auth::user()->getFechaNacimiento(Auth::user()->fecha_nacimiento) }}</span> </strong>
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
		    <tareas_perfil lista_tareas="{{$tareas}}"></tareas_perfil>

			</div>
		</div>
	</div>
@endsection
