<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;

class RequerimientoCreado extends Notification
{
    use Queueable;

    public $user;
    public $requerimiento;

    /**
     * Create a new notification instance.
     * @param App/User $user
     * @param App/Ot $requerimiento
     * @return void
     */
    public function __construct($user,$requerimiento)
    {
        $this->user = $user;
        $this->requerimiento = $requerimiento;
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
            'id_tarea' => $this->requerimiento->id,
            'nombre' => $this->user->nombre,
            'cliente' => $this->requerimiento->cliente->nombre,
            'cargo' => $this->user->cargo,
            'descripcion' => $this->user->nombre.' - '.$this->requerimiento->cliente->nombre.', ha creado un Requerimiento. Para revisión de ejecutiva. Nombre Requerimiento: '.$this->requerimiento->nombre.'',
            'created_at' => date('Y-m-d H:i:s'),
            'img_perfil' => $this->user->img_perfil,
            'link'          => '/solicitud/ver/'.$this->requerimiento->id,
        ];
    }
}
