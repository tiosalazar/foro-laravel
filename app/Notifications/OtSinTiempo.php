<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class OtSinTiempo extends Notification
{
    use Queueable;

    public $user;
    public $ot;

    /**
     * Create a new notification instance.
     * @param App/User $user
     * @param App/Ot $ot
     * @return void
     */
    public function __construct($user,$tiempos_area)
    {
        $this->user = $user;
        $this->tiempos_area = $tiempos_area;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['broadcast','database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', 'https://laravel.com')
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'id_tarea'      => $this->tiempos_area->ots->id,
            'nombre'        => $this->user->nombre,
            'cargo'         => $this->user->cargo,
            'descripcion'   => $this->user->nombre. ' intento crear una tarea en la OT '.$this->tiempos_area->ots->nombre.' pero no posee más tiempo disponible.',
            'created_at'    => date('Y-m-d H:i:s'),
            'img_perfil'    => $this->user->img_perfil,
            'link'          => '/ots/visualizar/'.$this->tiempos_area->ots->id
        ];
    }
}
