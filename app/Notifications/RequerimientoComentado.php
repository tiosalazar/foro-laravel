<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RequerimientoComentado extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     * @param App/User $user
     * @param App/Tarea $tarea
     * @return void
     */
    public function __construct($user,$requerimiento,$comentario)
    {
        $this->user = $user;
        $this->requerimiento = $requerimiento;
        $this->comentario = $comentario;
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
            'id_tarea'      => $this->requerimiento->id,
            'nombre'        => $this->user->nombre,
            'cargo'         => $this->user->cargo,
            'descripcion'   =>  $this->user->nombre.' - '.$this->requerimiento->cliente->nombre.' ha agregado un comentario en el Requerimiento: '.$this->requerimiento->nombre.' "'.substr($this->comentario->comentarios, 0, 15).'..."',
            'created_at'    => date('Y-m-d H:i:s'),
            'img_perfil'    => $this->user->img_perfil,
            'link'          => '/solicitud/ver/'.$this->requerimiento->id,
        ];
    }
}
