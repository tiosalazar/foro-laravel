<head>
    <meta charset="UTF-8">
    <title> Gestor de Procesos HimalayaDA | @yield('htmlheader_title', 'Your title here') </title>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />
    <link href="{{ asset('/css/all.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('/css/app.css') }}" rel="stylesheet" type="text/css" />

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->



    <link href="{{url('/')}}/css/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="{{url('/')}}/css/responsive.dataTables.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="{{url('/')}}/css/font-awesome.css"/>
    <link rel="stylesheet" href="{{url('/')}}/css/build.css"/>


    <script>
        window.Laravel = {!! json_encode([
            'csrfToken' => csrf_token(),
            'baseUrl' => url('/'),
            'api_token' => (Auth::user())?Auth::user()->api_token:'',
        ]) !!};
    </script>
</head>
