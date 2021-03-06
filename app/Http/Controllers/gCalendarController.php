<?php

namespace App\Http\Controllers;
use Carbon\Carbon;
use Google_Client;
use Google_Service_Calendar;
use Google_Service_Calendar_Event;
use Google_Service_Calendar_EventDateTime;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Http\Response;
use Exception;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Validator;
use Illuminate\Support\Facades\Auth;
use App\Tarea;

class gCalendarController extends Controller
{
    protected $client;
    public function __construct()
    {


          // $userauth = Auth::user()->rol->name;

          // if ( $userauth !='coordinador') {
          //   return redirect()->action('HomeController@index');
          // }
          $client = new Google_Client();
          $client->setAuthConfig('client_secret.json');
          $client->addScope(Google_Service_Calendar::CALENDAR);
          $guzzleClient = new \GuzzleHttp\Client(array('curl' => array(CURLOPT_SSL_VERIFYPEER => false)));
          $client->setHttpClient($guzzleClient);
          $this->client = $client;
          $this->client->setAccessType('offline');
          $this->client->setApprovalPrompt ('force');

    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        session_start();
        if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
            $this->client->setAccessToken($_SESSION['access_token']);
            $service = new Google_Service_Calendar($this->client);
            $calendarId = 'primary';
            $results = $service->events->listEvents($calendarId);
            return $results->getItems();
        } else {
            return redirect()->route('oauthCallback');
        }
    }
    public function oauth()
    {
      //Id del area del usuario conectado
       $userauth = Auth::user();
        if ( $userauth->rol->name !='coordinador') {
            return redirect()->action('HomeController@index');
        }
        session_start();
        if (isset($_SESSION['access_token']) && $_SESSION['access_token'] != "" && $userauth->access_token != null && $userauth->access_token != "") {
            $access_token=json_decode($userauth->access_token, true);
            $this->client->setAccessToken($access_token);
            // Refresh the token if it's expired.
               if ( $this->client->isAccessTokenExpired()) {
                 $this->client->fetchAccessTokenWithRefreshToken($this->client->getRefreshToken());
                 $userauth->access_token= json_encode($this->client->getAccessToken());
                 $userauth->save();
                 return redirect()->action('HomeController@index');
           }else {
            return redirect()->action('HomeController@index');
           }
      } else {

         $rurl = action('gCalendarController@oauth');
         $this->client->setRedirectUri($rurl);

          if (!isset($_GET['code'])) {
              $auth_url = $this->client->createAuthUrl();
              $filtered_url = filter_var($auth_url, FILTER_SANITIZE_URL);
              return redirect($filtered_url);
          } else {
              $this->client->authenticate($_GET['code']);
              $_SESSION['access_token']=  $this->client->getAccessToken();
              $userauth->access_token= json_encode($_SESSION['access_token']);
              $userauth->save();
              return redirect()->action('HomeController@index');
          }

       }

    }
    public function oauthTarea($id)
    {
        //Datos para visualizar la Tarea.
        $tarea = Tarea::with(['ot.cliente','ot.usuario', 'estado', 'estado_prioridad','planeacion_fase','area','usuario','usuarioencargado'])->where('id',$id)->first();

        $descripcion=$tarea->descripcion;
        $comentario=$tarea->comentario;

        $tarea->descripcion="";
        $tarea->comentario="";

        $tarea->fecha_inicio_programar=json_decode($tarea->fecha_inicio_programar);
        $tarea->fecha_fin_programar=json_decode($tarea->fecha_fin_programar);
        //FIN

        //Id del area del usuario conectado
         $userauth = Auth::user();
          if ( $userauth->rol->name !='coordinador') {
              return view('admin.tareas.ver_tarea')->with('tareainfo',$tarea)->with('desctarea',$descripcion);
          }
          session_start();
          if (isset($_SESSION['access_token']) && $_SESSION['access_token'] != "" && $userauth->access_token != null && $userauth->access_token != "") {
              $access_token=json_decode($userauth->access_token, true);
              $this->client->setAccessToken($access_token);
              // Refresh the token if it's expired.
                 if ( $this->client->isAccessTokenExpired()) {
                  $this->client->fetchAccessTokenWithRefreshToken($this->client->getRefreshToken());
                   $userauth->access_token= json_encode($this->client->getAccessToken());
                   $userauth->save();
                     return view('admin.tareas.ver_tarea')->with('tareainfo',$tarea)->with('desctarea',$descripcion);
             }else {
                return view('admin.tareas.ver_tarea')->with('tareainfo',$tarea)->with('desctarea',$descripcion);
             }
        } else {

           $rurl = action('gCalendarController@oauth');
           $this->client->setRedirectUri($rurl);

            if (!isset($_GET['code'])) {
                $auth_url = $this->client->createAuthUrl();
                $filtered_url = filter_var($auth_url, FILTER_SANITIZE_URL);
                return redirect($filtered_url);
            } else {
                $this->client->authenticate($_GET['code']);
                $_SESSION['access_token']=  $this->client->getAccessToken();
                $userauth->access_token= json_encode($_SESSION['access_token']);
                $userauth->save();
                return view('admin.tareas.ver_tarea')->with('tareainfo',$tarea)->with('desctarea',$descripcion);
            }

         }
    }

    public function returnClient($user)
    {
        $usuario = User::findOrFail($user->id);
        $access_token=json_decode($usuario->access_token, true);
        $this->client->setAccessToken($access_token);
        // Refresh the token if it's expired.
           if ( $this->client->isAccessTokenExpired()) {
             $this->client->fetchAccessTokenWithRefreshToken($this->client->getRefreshToken());
             $usuario->access_token= json_encode($this->client->getAccessToken());
             $usuario->save();
             return  $this->client;
       }else {
          return  $this->client;
       }
    }
    public function ver_token()
    {
        session_start();
        var_dump($_SESSION['access_token']);
        var_dump($_SESSION['access_token']['refresh_token']);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('calendar.createEvent');
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        session_start();
        $startDateTime = $request->start_date;
        $endDateTime = $request->end_date;
        if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
            $this->client->setAccessToken($_SESSION['access_token']);
            $service = new Google_Service_Calendar($this->client);
            $calendarId = 'primary';
            $event = new Google_Service_Calendar_Event([
                'summary' => $request->title,
                'description' => $request->description,
                'start' => ['dateTime' => $startDateTime],
                'end' => ['dateTime' => $endDateTime],
                'reminders' => ['useDefault' => true],
            ]);
            $results = $service->events->insert($calendarId, $event);
            if (!$results) {
                return response()->json(['status' => 'error', 'message' => 'Something went wrong']);
            }
            return response()->json(['status' => 'success', 'message' => 'Event Created']);
        } else {
            return redirect()->route('oauthCallback');
        }
    }
    /**
     * Display the specified resource.
     *
     * @param $eventId
     * @return \Illuminate\Http\Response
     * @internal param int $id
     */
    public function show($eventId)
    {
        session_start();
        if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
            $this->client->setAccessToken($_SESSION['access_token']);
            $service = new Google_Service_Calendar($this->client);
            $event = $service->events->get('primary', $eventId);
            if (!$event) {
                return response()->json(['status' => 'error', 'message' => 'Something went wrong']);
            }
            return response()->json(['status' => 'success', 'data' => $event]);
        } else {
            return redirect()->route('oauthCallback');
        }
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param $eventId
     * @return \Illuminate\Http\Response
     * @internal param int $id
     */
    public function update(Request $request, $eventId)
    {
        session_start();
        if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
            $this->client->setAccessToken($_SESSION['access_token']);
            $service = new Google_Service_Calendar($this->client);
            $startDateTime = Carbon::parse($request->start_date)->toRfc3339String();
            $eventDuration = 30; //minutes
            if ($request->has('end_date')) {
                $endDateTime = Carbon::parse($request->end_date)->toRfc3339String();
            } else {
                $endDateTime = Carbon::parse($request->start_date)->addMinutes($eventDuration)->toRfc3339String();
            }
            // retrieve the event from the API.
            $event = $service->events->get('primary', $eventId);
            $event->setSummary($request->title);
            $event->setDescription($request->description);
            //start time
            $start = new Google_Service_Calendar_EventDateTime();
            $start->setDateTime($startDateTime);
            $event->setStart($start);
            //end time
            $end = new Google_Service_Calendar_EventDateTime();
            $end->setDateTime($endDateTime);
            $event->setEnd($end);
            $updatedEvent = $service->events->update('primary', $event->getId(), $event);
            if (!$updatedEvent) {
                return response()->json(['status' => 'error', 'message' => 'Something went wrong']);
            }
            return response()->json(['status' => 'success', 'data' => $updatedEvent]);
        } else {
            return redirect()->route('oauthCallback');
        }
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param $eventId
     * @return \Illuminate\Http\Response
     * @internal param int $id
     */
    public function destroy($eventId)
    {
        session_start();
        if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {
            $this->client->setAccessToken($_SESSION['access_token']);
            $service = new Google_Service_Calendar($this->client);
            $service->events->delete('primary', $eventId);
        } else {
            return redirect()->route('oauthCallback');
        }
    }

    public function pedir()
    {
        session_start();
        $startDateTime = '2017-06-02T10:54:00';
        $endDateTime = '2017-06-02T14:00:00';
        if (isset($_SESSION['access_token']) && $_SESSION['access_token']) {

            /*$this->client->refreshToken($_SESSION['access_token']['access_token']);

             $_SESSION['access_token']= $this->client->getAccessToken();

            $this->client->refreshToken($_SESSION['access_token']);
            $newtoken=$client->getAccessToken();
            $this->client->setAccessToken($newtoken);*/
            $this->client->setAccessToken($_SESSION['access_token']);
            $service = new Google_Service_Calendar($this->client);
            $calendarId = 'dsalazar@himalayada.com';
            //return var_dump($this->client);
            $event = new Google_Service_Calendar_Event([
                'summary' => 'Evento Prueba',
                'location'=>'Himalaya Digital Agency, Santa Teresita, Cali - Valle del Cauca, Colombia',
                'description' => 'Evento creado desde laravel',
                'start' => ['dateTime' => $startDateTime, 'timeZone' => 'America/Bogota'],
                'end' => ['dateTime' => $endDateTime, 'timeZone' => 'America/Bogota'],
                'reminders' => ['useDefault' => true],
                /*'attendees' => array(
                   array('email' => 'bcaldas@himalayada.com'),
                   array('email' => 'aborrero@himalayada.com'),
               ),*/
            ]);
            // return var_dump($event);
            $results = $service->events->insert($calendarId, $event);
            if (!$results) {
                return response()->json(['status' => 'error', 'message' => 'Something went wrong','evento'=>$results]);
            }
            return response()->json(['status' => 'success', 'message' => 'Event Created','evento'=>$results]);
        } else {
            return redirect()->route('oauthCallback');
        }

    }



}
