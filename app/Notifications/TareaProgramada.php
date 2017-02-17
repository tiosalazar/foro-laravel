<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class TareaProgramada extends Notification
{
    use Queueable;

    public $user;
    public $tarea;

    /**
     * Create a new notification instance.
     * @param App/User $user
     * @param App/Tarea $tarea
     * @return void
     */
    public function __construct($user,$tarea)
    {
        $this->user = $user;
        $this->tarea = $tarea;
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
            'id_tarea' => $this->tarea->id,
            'nombre' => $this->user->nombre,
            'cargo' => $this->user->cargo,
            'descripcion' => $this->user->nombre. ' a creado una Tarea',
            'created_at' => date('Y-m-d H:i:s'),
            'img_perfil' => $this->user->img_perfil,
        ];
    }
}
