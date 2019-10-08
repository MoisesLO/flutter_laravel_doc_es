import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrNotificaciones extends StatelessWidget {
  final String title;
  PrNotificaciones(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrNotificaciones,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrNotificaciones = """
<div style='font-size: 14.2px;'>
<h1>Notificaciones</h1>
<ul>
    <li>Introducción</li>
    <li>Crear notificaciones</li>
    <li>
        Enviar notificaciones
        <ul>
            <li>Utilizar el atributo notifiable</li>
            <li>Utilizar la facade notification</li>
            <li>Especificar canales de entrega</li>
            <li>Notificaciones en cola</li>
            <li>Notificaciones bajo demanda</li>
        </ul>
    </li>
    <li>
        Notificaciones por correo
        <ul>
            <li>Formato para mensajes por correo</li>
            <li>Personalizar el remitente</li>
            <li>Personalizar el destinatario</li>
            <li>Personalizar el asunto</li>
            <li>Personalizar las plantillas</li>
            <li>Previsualizar notificaciones de correo</li>
        </ul>
    </li>
    <li>
        Notificaciones por correo en markdown
        <ul>
            <li>Generar el mensaje</li>
            <li>Escribir el mensaje</li>
            <li>Personalizar los componentes</li>
        </ul>
    </li>
    <li>
        Notificaciones de la base de datos
        <ul>
            <li>Prerrequisitos</li>
            <li>Formato de notificaciones de base de datos</li>
            <li>Acceder a las notificaciones</li>
            <li>Marcar notificaciones como leídas</li>
        </ul>
    </li>
    <li>
        Notificaciones de difusión
        <ul>
            <li>Prerrequisitos</li>
            <li>Formato de notificaciones de difusión</li>
            <li>Escuchar notificaciones</li>
        </ul>
    </li>
    <li>
        Notificaciones por SMS
        <ul>
            <li>Prerrequisitos</li>
            <li>Formato de notificaciones por SMS</li>
            <li>Personalizar el número remitente</li>
            <li>Enrutar notificaciones por SMS</li>
        </ul>
    </li>
    <li>
        Notificaciones por Slack
        <ul>
            <li>Prerrequisitos</li>
            <li>Formato de notificaciones por Slack</li>
            <li>Archivos adjuntos en Slack</li>
            <li>Enrutar notificaciones por Slack</li>
        </ul>
    </li>
    <li>Configuración regional de notificaciones</li>
    <li>Eventos de notificación</li>
    <li>Canales personalizados</li>
</ul>

<h2>Introducción</h2>
<p>
    Además de soporte para
    enviar correos electrónicos
    , Laravel brinda soporte para el envío de notificaciones mediante una variedad de canales de
    entrega, incluyendo correo, SMS (a través de

    Nexmo


    ) y

    Slack


    . Las notificaciones pueden ser también almacenadas en una base de datos para que puedan ser
    mostradas en la interfaz de tu página web.
</p>
<p>Generalmente, las notificaciones deben ser mensajes cortos e informativos que notifiquen a los
    usuarios que algo ocurrió en tu aplicación. Por ejemplo, si estás escribiendo una aplicación de
    facturación, podrías enviar una notificación de "Recibo de Pago" a tus usuarios mediante correo
    electrónico y por SMS.</p>

<h2>Crear notificaciones</h2>
<p>En Laravel, cada notificación está representada por una sola clase (generalmente almacenada en el
    directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Notifications</span>). No te preocupes si no ves este directorio en tu
    aplicación, será creada por ti cuando ejecutes el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:notification</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:notification InvoicePaid
</code></pre>

<p>Este comando colocará una clase de notificación nueva en tu directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Notifications</span>. Cada clase de notificación contiene un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">via</span> y
    un número variable de métodos de construcción de mensaje (tales como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toMail</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toDatabase</span>) que convierten la notificación en un mensaje optimizado para ese canal
    en particular.</p>

<h2>Enviar notificaciones</h2>

<h3># Usar el atributo notifiable</h3>
<p>
    Las notificaciones pueden ser enviadas en dos formas: usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notify</span> del
    atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notifiable</span> o usando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notification</span>
    facade
    . Primero, exploremos el uso del atributo:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;
}
</code></pre>

<p>Este atributo es utilizado por el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> por defecto y contiene un método
    que puede ser usado para enviar notificaciones: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notify</span>. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notify</span> espera recibir una instancia de notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Notifications\InvoicePaid;

\$user-&gt;notify(new InvoicePaid(\$invoice));
</code></pre>


<p>TIP</p>
<p>Recuerda que puedes usar el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Notifiable</span> en
    cualquiera de tus modelos. No estás limitado a incluirlo solamente en tu modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>.</p>



<h3># Usar la facade notification</h3>
<p>Alternativamente, puedes enviar notificaciones mediante la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notification</span>. Esto
    es útil principalmente cuando necesitas enviar una notificación a múltiples entidades
    notificables, como un grupo de usuarios. Para enviar notificaciones usando la facade, pasa todas
    las entidades notificables y la instancia de notificación al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">send</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Notification::send(\$users, new InvoicePaid(\$invoice));
</code></pre>


<h3># Especificar canales de entrega</h3>
<p>Cada clase de notificación tiene un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">via</span> que determina mediante cuáles canales
    será entregada la notificación. Las notificaciones pueden ser enviadas por los canales <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mail</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">nexmo</span>, y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slack</span>.</p>

<p>TIP</p>
<p>
    Si estás interesado en utilizar otros canales de entrega como Telegram o Pusher, revisa el sitio
    dirigido por la comunidad

    Laravel Notification Channels


    .
</p>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">via</span> recibe una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notifiable</span> la cual será una
    instancia de la clase a la cual la notificación está siendo enviada. Puedes usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notifiable</span>
    para determinar mediante cuáles canales debería ser entregada la notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the notification's delivery channels.
*
* @param  mixed  \$notifiable
* @return array
*/
public function via(\$notifiable)
{
    return \$notifiable-&gt;prefers_sms ? ['nexmo'] : ['mail', 'database'];
}
</code></pre>


<h3># Notificaciones en cola</h3>

<p>Nota</p>
<p>Antes de poner notificaciones en cola, se debe configurar una cola y activar un worker.</p>

<p>Enviar notificaciones puede tomar tiempo, especialmente si el canal necesita una API externa para
    llamar o entregar la notificación. Para acelerar el tiempo de respuesta de tu notificación,
    permite que sea puesta en cola añadiendo la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldQueue</span> y el atributo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Queueable</span> a tu clase. La interfaz y el atributo son importados para todas las
    notificaciones generadas usando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:notification</span>, así que puedesn añadir de
    inmediato a tu clase de notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;

class InvoicePaid extends Notification implements ShouldQueue
{
    use Queueable;

    // ...
}
</code></pre>

<p>Una vez que la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldQueue</span> haya sido agregada a tu notificación, puedes
    enviarla con normalidad. Laravel detectará <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldQueue</span> en la clase y
    automáticamente pondrá en cola la entrega de la notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user-&gt;notify(new InvoicePaid(\$invoice));
</code></pre>

<p>Si quisieras retrasar la entrega de la notificación, puedes encadenar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delay</span> al instanciar tu notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$when = now()-&gt;addMinutes(10);

\$user-&gt;notify((new InvoicePaid(\$invoice))-&gt;delay(\$when));
</code></pre>


<h3># Notificaciones bajo demanda</h3>
<p>A veces puede que necesites enviar una notificación a alguien que no está almacenado como
    "usuario" de tu aplicación. Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notification::route</span>, puedes
    especificar información de enrutamiento para una notificación ad-hoc antes de enviarla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Notification::route('mail', 'taylor@example.com')
            -&gt;route('nexmo', '5555555555')
            -&gt;notify(new InvoicePaid(\$invoice));
</code></pre>


<h2>Notificaciones por correo</h2>

<h3># Formato de mensajes por correo</h3>
<p>Si una notificación tiene soporte para ser enviada por correo, se debe definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toMail</span>
    en la clase de la notificación. Este método recibirá una entidad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notifiable</span> y
    debe devolver una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Messages\MailMessage</span>. Los
    mensajes por correo pueden contener líneas de texto, así como una "llamada a la acción".
    Observemos un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toMail</span> de ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the mail representation of the notification.
*
* @param  mixed  \$notifiable
* @return \Illuminate\Notifications\Messages\MailMessage
*/
public function toMail(\$notifiable)
{
    \$url = url('/invoice/'.\$this-&gt;invoice-&gt;id);

    return (new MailMessage)
                -&gt;greeting('Hello!')
                -&gt;line('One of your invoices has been paid!')
                -&gt;action('View Invoice', \$url)
                -&gt;line('Thank you for using our application!');
}
</code></pre>


<p>TIP</p>
<p>Nota que se está usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;invoice-&gt;id</span> en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toMail</span>.
    Puedes pasar cualquier dato que la notificación necesite para generar su mensaje dentro del
    constructor de la notificación.</p>

<p>En este ejemplo, registramos un saludo, una línea de texto, un llamado a la acción y luego otra
    línea de texto. Estos elementos proporcionados por el objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MailMessage</span> hacen que
    sea rápido y sencillo dar formato a pequeños correos transaccionales. El canal de correo
    entonces traducirá los componentes del mensaje en una plantilla HTML agradable y con capacidad
    de respuesta, justo con su contraparte de texto simple. He aquí un ejemplo de un correo generado
    por el canal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mail</span>:</p>
<img src="https://laravel.com/assets/img/notification-example.png" width="551" height="596">

<p>TIP</p>
<p>Al enviar notificaciones por correo, asegúrate de establecer el valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> en tu
    archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>. Este valor será usado en el encabezado y pie de los
    mensajes de notificación por correo.</p>

<h4># Otras opciones de formato para notificaciones</h4>
<p>En lugar de definir las "líneas" de texto en la clase notification, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>
    para especificar una plantilla personalizada que debe ser usada para renderizar el correo de
    notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the mail representation of the notification.
*
* @param  mixed  \$notifiable
* @return \Illuminate\Notifications\Messages\MailMessage
*/
public function toMail(\$notifiable)
{
    return (new MailMessage)-&gt;view(
        'emails.name', ['invoice' =&gt; \$this-&gt;invoice]
    );
}
</code></pre>

<p>Además, puedes devolver un objeto mailable desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toMail</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Mail\InvoicePaid as Mailable;

/**
* Get the mail representation of the notification.
*
* @param  mixed  \$notifiable
* @return Mailable
*/
public function toMail(\$notifiable)
{
    return (new Mailable(\$this-&gt;invoice))-&gt;to(\$this-&gt;user-&gt;email);
}
</code></pre>


<h4># Mensajes de error</h4>
<p>Algunas notificaciones informan a los usuarios acerca de errores, como un pago fallido. puedes
    indicar que un mensaje por correo se refiere a un error llamando al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">error</span>
    cuando se construye el mensaje. Al usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">error</span> en un mensaje por correo,
    el botón de llamado a la acción será rojo en vez de azul:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the mail representation of the notification.
*
* @param  mixed  \$notifiable
* @return \Illuminate\Notifications\Message
*/
public function toMail(\$notifiable)
{
    return (new MailMessage)
                -&gt;error()
                -&gt;subject('Notification Subject')
                -&gt;line('...');
}
</code></pre>


<h3># Personalizar el remitente</h3>
<p>Por defecto, el remitente del correo electrónico es definido en el archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/mail.php</span>. Sin embargo, también puedes definir un remitente a través de una
    notificación específica:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the mail representation of the notification.
*
* @param  mixed  \$notifiable
* @return \Illuminate\Notifications\Messages\MailMessage
*/
public function toMail(\$notifiable)
{
    return (new MailMessage)
                -&gt;from('noreply@laravel.com', 'Laravel')
                -&gt;line('...');
}
</code></pre>


<h3># Personalizar el destinatario</h3>
<p>Al enviar notificaciones mediante el canal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mail</span>, el sistema de notificaciones
    automáticamente buscará una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">email</span> en tu entidad notificable. Puedes
    personalizar la dirección de correo electrónico usada para entregar la notificación definiendo
    el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routeNotificationForMail</span> en la entidad:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
    * Route notifications for the mail channel.
    *
    * @param  \Illuminate\Notifications\Notification  \$notification
    * @return string
    */
    public function routeNotificationForMail(\$notification)
    {
        return \$this-&gt;email_address;
    }
}
</code></pre>


<h3># Personalizar el asunto</h3>
<p>Por defecto, el asunto del correo electrónico es el nombre de la clase de notificación formateada
    a "title case". Así que si tu clase de notificación se llama <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">InvoicePaid</span>, el asunto
    del correo será <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Invoice Paid</span>. Si se prefiere especificar un asunto explícito para
    el mensaje, puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subject</span> al construir el mensaje:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the mail representation of the notification.
*
* @param  mixed  \$notifiable
* @return \Illuminate\Notifications\Messages\MailMessage
*/
public function toMail(\$notifiable)
{
    return (new MailMessage)
                -&gt;subject('Notification Subject')
                -&gt;line('...');
}
</code></pre>


<h3># Personalizar las plantillas</h3>
<p>Puedes modificar las plantillas HTML y de texto simple usadas por las notificaciones de correo
    publicando los recursos del paquete de notificación. Luego de ejecutar este comando, las
    plantillas de notificación de correo estarán ubicadas en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor/notifications</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan vendor:publish --tag=laravel-notifications
</code></pre>


<h3># Previsualizar notificaciones de correo</h3>
<p>Al diseñar una plantilla de notificación de correo, es conveniente previsualizar rápidamente el
    mensaje de correo renderizado en tu navegador como una plantilla normal de Blade. Por esta
    razón, Laravel te permite retornar cualquier mensaje de correo generado por una notificación de
    correo directamente desde un Closure de ruta o un controlador. Cuando un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MailMessage</span> es retornado, este será renderizado y mostrado en el navegador,
    permitiendote previsualizar rápidamente su diseño sin necesidad de enviarlo a un correo
    electrónico real:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('mail', function () {
    \$invoice = App\Invoice::find(1);
    return (new App\Notifications\InvoicePaid(\$invoice))
                -&gt;toMail(\$invoice-&gt;user);
});
</code></pre>


<h2>Notificaciones por correo markdown</h2>
<p>Las notificaciones por correo Markdown permiten tomar ventaja de las plantillas prefabricadas
    para notificaciones por correo, dando a su vez libertad para escribir mensajes más largos y
    personalizados. Como los mensajes están escritos en Markdown, Laravel puede renderizar
    plantillas HTML bellas y responsivas para los mensajes y a la vez generar automáticamente su
    contraparte en texto simple.</p>

<h3># Generar el mensaje</h3>
<p>Para generar una notificación con su plantilla Markdown correspondiente, puedes usar la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--markdown</span> del comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:notification</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:notification InvoicePaid --markdown=mail.invoice.paid
</code></pre>

<p>Como todas las otras notificaciones, aquellas que usan plantillas Markdown deben definir un
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toMail</span> en su clase de notificación. Sin embargo, en lugar de usar los
    modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">line</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">action</span> para construir la notificación, se usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">markdown</span> para especificar el nombre de la plantilla Markdown a ser usada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the mail representation of the notification.
*
* @param  mixed  \$notifiable
* @return \Illuminate\Notifications\Messages\MailMessage
*/
public function toMail(\$notifiable)
{
    \$url = url('/invoice/'.\$this-&gt;invoice-&gt;id);

    return (new MailMessage)
                -&gt;subject('Invoice Paid')
                -&gt;markdown('mail.invoice.paid', ['url' =&gt; \$url]);
}
</code></pre>


<h3># Escribir el mensaje</h3>
<p>Las notificaciones por correo Markdown usan una combinación de componentes Blade y sintaxis
    Markdown que te permiten construir fácilmente notificaciones a la vez que se apalancan los
    componentes de notificación prefabricados por Laravel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('mail::message')
# Invoice Paid

Your invoice has been paid!

@component('mail::button', ['url' =&gt; \$url])
View Invoice
@endcomponent

Thanks,&lt;br&gt;
{{ config('app.name') }}
@endcomponent
</code></pre>

<h4># Componente button</h4>
<p>El componente button renderiza un enlace a un botón centrado. El componente acepta dos
    argumentos, una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> y un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">color</span> opcional. LOs colores disponibles son
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">blue</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">green</span>, y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">red</span>. Puedes añadir tantos componentes de
    botón a una notificación como desees:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('mail::button', ['url' =&gt; \$url, 'color' =&gt; 'green'])
View Invoice
@endcomponent
</code></pre>

<h4># Componente panel</h4>
<p>El componente panel renderiza el bloque de texto dado en un panel que tiene un color de fondo
    ligeramente distinto al resto de la notificación. Esto permite poner énfasis en un determinado
    bloque de texto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('mail::panel')
This is the panel content.
@endcomponent
</code></pre>

<h4># Componente table</h4>
<p>El componente table permite transformar una tabla Markdown en una tabla HTML. El componente
    acepta la tabla Markdown como contenido. La alineación de columnas es soportada usando la
    sintaxis de alineación de tablas de Markdown por defecto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('mail::table')
| Laravel       | Table         | Example  |
| ------------- |:-------------:| --------:|
| Col 2 is      | Centered      | \$10      |
| Col 3 is      | Right-Aligned | \$20      |
@endcomponent
</code></pre>


<h3># Personalizar los componentes</h3>
<p>Puedes exportar todos los componentes de notificación de Markdown a tu propia aplicación para
    personalización. Para exportar los componentes, se usa el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span> para publicar la etiqueta del asset <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel-mail</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan vendor:publish --tag=laravel-mail
</code></pre>

<p>Este comando publicará los componentes de correo de Markdown al directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor/mail</span>.
    El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mail</span> contendrá los directorios <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">html</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">text</span>,
    cada uno contiene sus respectivas representaciones de cada componente disponible. Eres libre de
    personalizar estos componentes de acuerdo a su preferencia.</p>
<h3># Personalizar CSS</h3>
<p>Después de exportar los componentes, el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor/mail/html/themes</span> contendrá un archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">default.css</span>. Puedes personalizar el CSS en este archivo y los estilos
    automáticamente se alinearán con las representaciones HTML de las notificaciones Markdown.</p>
<p>Si te gustaría construir un nuevo tema para los componentes Markdown de Laravel, puedes colocar
    un archivo CSS dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">html/themes</span>. Luego de nombrar y guardar tus
    archivos de CSS, actualiza la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">theme</span> del archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mail</span> para que coincida con el nombre de tu nuevo tema.</p>
<p>Para personalizar un tema para una notificación individual, puedes llamar al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">theme</span> al momento de construir el mensaje de la notificación. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">theme</span> acepta el nombre del tema que debería ser usado al momento de enviar la
    notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the mail representation of the notification.
*
* @param  mixed  \$notifiable
* @return \Illuminate\Notifications\Messages\MailMessage
*/

public function toMail(\$notifiable)
{
    return (new MailMessage)
                -&gt;theme('invoices')
                -&gt;theme('invoice')
                -&gt;subject('Invoice Paid')
                -&gt;markdown('mail.invoice.paid', ['url' =&gt; \$url]);
}
</code></pre>


<h2>Notificaciones de base de datos</h2>

<h3># Prerrequisitos</h3>
<p>El canal de notificaciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span> guarda la información de notificación en una
    tabla de base de datos. Esta tabla contendrá información como el tipo de notificación así como
    datos JSON personalizados que describen la notificación.</p>
<p>Puedes buscar en la tabla para mostrar las notificaciones en la interfaz de usuario de la
    aplicación. Pero, antes de poder hacer esto, necesitarás crear una tabla de base de datos para
    almacenar las notificaciones. Puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notifications:table</span> para
    generar una migración con el esquema de tabla apropiado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan notifications:table

php artisan migrate
</code></pre>


<h3># Agregar formato a las notificaciones de la base de datos</h3>
<p>Si una notificación posee soporte para ser almacenada en una tabla de base de datos, debes
    definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toDatabase</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span> en la clase de notificación.
    Este método recibirá una entidad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notifiable</span> y debería devolver un arreglo PHP
    sencillo. El arreglo devuelto estará codificado como JSON y almacenado en la columna
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span>de la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notifications</span>. Observemos un ejemplo del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the array representation of the notification.
*
* @param  mixed  \$notifiable
* @return array
*/
public function toArray(\$notifiable)
{
    return [
        'invoice_id' =&gt; \$this-&gt;invoice-&gt;id,
        'amount' =&gt; \$this-&gt;invoice-&gt;amount,
    ];
}
</code></pre>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toDatabase</span> Vs. <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span> también es usado por el canal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span> para
    determinar cuáles datos difundir al cliente JavaScript. Si prefieres tener dos representaciones
    de arreglos para los canales <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span>, debes definir un
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toDatabase</span> en lugar de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span>.</p>

<h3># Acceder a las notificaciones</h3>
<p>Una vez que las notificaciones se almacenan en la base de datos, necesitas una forma conveniente
    de acceder a ellas desde tus entidades notificables. El atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Notifiable</span>,
    el cual está incluido en el modelo de Laravel <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> por defecto, incluye una
    relación Eloquent <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notifications</span> que devuelve las notificaciones para la entidad.
    Para conseguir las notificaciones, puedes acceder a este método como a cualquier otra relación
    Eloquent. Por defecto, las notificaciones serán clasificadas por el timestamp
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = App\User::find(1);

foreach (\$user-&gt;notifications as \$notification) {
    echo \$notification-&gt;type;
}
</code></pre>

<p>Si quieres recibir sólo las notificaciones "no leídas (unread)", puedes usar la relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unreadNotifications</span>.
    Nuevamente, las notificaciones serán clasificadas por el timestamp <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = App\User::find(1);

foreach (\$user-&gt;unreadNotifications as \$notification) {
    echo \$notification-&gt;type;
}
</code></pre>


<p>TIP</p>
<p>Para acceder a las notificaciones desde el cliente JavaScript, se debe definir un controlador de
    notificaciones para tu aplicación que devuelva las notificaciones para una entidad notificable,
    como el usuario actual. puedes entonces elaborar una petición HTTP al URI de ese controlador
    desde el cliente JavaScript.</p>


<h3># Marcar notificaciones como leídas</h3>
<p>Normalmente, querrás marcar una notificación como "leída (read)" cuando un usuario la ve. El
    atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Notifiable</span> provee un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">markAsRead</span> el cual actualiza la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">read_at</span> en el registro de base
    de datos de las notificaciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = App\User::find(1);

foreach (\$user-&gt;unreadNotifications as \$notification) {
    \$notification-&gt;markAsRead();
}
</code></pre>

<p>Sin embargo, en lugar de hacer bucle a través de cada notificación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">markAsRead</span>
    directamente en un grupo de notificaciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user-&gt;unreadNotifications-&gt;markAsRead();
</code></pre>

<p>Asimismo, puedes utilizar una consulta de actualización masiva para marcar todas las
    notificaciones como leídas sin necesidad de recuperarlas de la base de datos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = App\User::find(1);

\$user-&gt;unreadNotifications()-&gt;update(['read_at' =&gt; now()]);
</code></pre>

<p>Puedes hacer <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> a las notificaciones para removerlas por completo de la tabla:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user-&gt;notifications()-&gt;delete();
</code></pre>


<h2>Notificaciones de difusión</h2>

<h3># Prerrequisitos</h3>
<p>Antes de difundir notificaciones, debes configurar y familiarizarse con los servicios
    broadcasting de eventos de Laravel. La difusión de eventos brinda una forma de reaccionar a los
    eventos de Laravel disparados por el servidor, desde el cliente JavaScript.</p>

<h3># Formato de notificaciones de difusión</h3>
<p>EL canal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span> difunde notificaciones usando los servicios broadcasting de
    eventos de Laravel, permitiéndole al cliente JavaScript capturar notificaciones en tiempo real.
    Si una notificación posee soporte para difusión, debes definir un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toBroadcast</span> en la clase de notificación. Este método recibirá una entidad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notifiable</span>
    y debe devolver una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">BroadcastMessage</span>. Si el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toBroadcast</span> no existe, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span> será usado para recopilar los
    datos que deberían ser transmitidos. Los datos devueltos estarán codificados como JSON y se
    difundirán al cliente JavaScript. Observemos un ejemplo del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toBroadcast</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Notifications\Messages\BroadcastMessage;

/**
* Get the broadcastable representation of the notification.
*
* @param  mixed  \$notifiable
* @return BroadcastMessage
*/
public function toBroadcast(\$notifiable)
{
    return new BroadcastMessage([
        'invoice_id' =&gt; \$this-&gt;invoice-&gt;id,
        'amount' =&gt; \$this-&gt;invoice-&gt;amount,
    ]);
}
</code></pre>

<h4># Configuración de la cola de difusión</h4>
<p>Todas las notificaciones de difusión son puestas en cola para ser difundidas. Si prefieres
    configurar la conexión a la cola o el nombre de la cola usada para las operaciones de difusión,
    puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onConnection</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onQueue</span> de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">BroadcastMessage</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return (new BroadcastMessage(\$data))
                -&gt;onConnection('sqs')
                -&gt;onQueue('broadcasts');
</code></pre>


<p>TIP</p>
<p>Adicional a los datos especificados, las notificaciones de difusión contendrán también un campo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">type</span> que contiene el nombre de clase de la notificación.</p>


<h3># Escuchar notificaciones</h3>
<p>Las notificaciones se difundirán en un canal privado formateado utilizando la convención <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{notifiable}.{id}</span>.
    Por lo tanto, si estás enviando una notificación a una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> con una
    ID de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">1</span>, la notificación será difundida en el canal privado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App.User.1</span>.
    Al usar Laravel Echo, puedes fácilmente escuchar notificaciones en un canal utilizando el método
    helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notification</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.private('App.User.' + userId)
    .notification((notification) =&gt; {
        console.log(notification.type);
    });
</code></pre>

<h4># Personalizar el canal de notificación</h4>
<p>Si quieres personalizar los canales mediante los cuales una entidad notificable recibe sus
    notificaciones de difusión, puedes definir un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">receivesBroadcastNotificationsOn</span> en la entidad notificable:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
    * The channels the user receives notification broadcasts on.
    *
    * @return string
    */
    public function receivesBroadcastNotificationsOn()
    {
        return 'users.'.\$this-&gt;id;
    }
}
</code></pre>


<h2>Notificaciones por SMS</h2>

<h3># Prerrequisitos</h3>
<p>
    El envío de notificaciones por SMS en Laravel trabaja con

    Nexmo


    . Antes de poder enviar notificaciones mediante Nexmo, necesitas instalar el paquete Composer
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel/nexmo-notification-channel</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require laravel/nexmo-notification-channel
</code></pre>

<p>Luego, necesitas agregar algunas opciones de configuración al archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/services.php</span>. Puedes copiar el ejemplo de configuración siguiente para
    empezar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'nexmo' =&gt; [
    'key' =&gt; env('NEXMO_KEY'),
    'secret' =&gt; env('NEXMO_SECRET'),
    'sms_from' =&gt; '15556666666',
],
</code></pre>

<p>La opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sms_from</span> es el número de teléfono remitente de los mensajes SMS. Se debe
    generar un número de teléfono para la aplicación en el panel de control de Nexmo.</p>

<h3># Formato de notificaciones de SMS</h3>
<p>Si una notificación tiene soporte para ser enviada mediante SMS, debes definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toNexmo</span>
    en la clase de notificación. Este método recibirá una entidad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notifiable</span> y debe
    devolver una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Messages\NexmoMessage</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Nexmo / SMS representation of the notification.
*
* @param  mixed  \$notifiable
* @return NexmoMessage
*/
public function toNexmo(\$notifiable)
{
    return (new NexmoMessage)
                -&gt;content('Your SMS message content');
}
</code></pre>

<h4># Contenido unispan</h4>
<p>Si el mensaje SMS contiene caracteres Unispan, debes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unispan</span> al
    construir la instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">NexmoMessage</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Nexmo / SMS representation of the notification.
*
* @param  mixed  \$notifiable
* @return NexmoMessage
*/
public function toNexmo(\$notifiable)
{
    return (new NexmoMessage)
                -&gt;content('Your unispan message')
                -&gt;unispan();
}
</code></pre>


<h3># Personalizando el número remitente</h3>
<p>Si deseas enviar algunas notificaciones desde un número telefónico diferente al especificado en
    el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/services.php</span>, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">from</span> en una
    instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">NexmoMessage</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Nexmo / SMS representation of the notification.
*
* @param  mixed  \$notifiable
* @return NexmoMessage
*/
public function toNexmo(\$notifiable)
{
    return (new NexmoMessage)
                -&gt;content('Your SMS message content')
                -&gt;from('15554443333');
}
</code></pre>


<h3># Enrutar notificaciones por SMS</h3>
<p>Al enviar notificaciones a través del canal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">nexmo</span>, el sistema de notificaciones
    buscará automáticamente por un atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phone_number</span> en la entidad notificable. Si
    deseas personalizar el número telefónico al cual la notificación será entregada, define un
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routeNotificationForNexmo</span> en la entidad:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
    * Route notifications for the Nexmo channel.
    *
    * @param  \Illuminate\Notifications\Notification  \$notification
    * @return string
    */
    public function routeNotificationForNexmo(\$notification)
    {
        return \$this-&gt;phone;
    }
}
</code></pre>


<h2>Notificaciones por Slack</h2>

<h3># Prerrequisitos</h3>
<p>Antes de poder enviar notificaciones mediante Slack, debes instalar el paquete para el canal de
    notificación mediante Composer:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require laravel/slack-notification-channel
</code></pre>

<p>
    También necesitarás configurar una integración

    "Incoming Webhook"


    para tu equipo en Slack. Esta integración proveerá una URL utilizable para enrutamiento de
    notificaciones de Slack.
</p>

<h3># Formato de notificaciones por Slack</h3>
<p>Si una notificación tiene soporte para ser enviada como mensaje por Slack, debes definir un
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toSlack</span> en la clase de notificación. EL método recibirá una entidad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notifiable</span>
    y debe devolver una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Messages\SlackMessage</span>. Los
    mensajes de Slack pueden contener texto así como un "archivo adjunto" que formatea texto
    adicional o un arreglo de campos. Observemos un ejemplo básico de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toSlack</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Slack representation of the notification.
*
* @param  mixed  \$notifiable
* @return SlackMessage
*/
public function toSlack(\$notifiable)
{
    return (new SlackMessage)
                -&gt;content('One of your invoices has been paid!');
}
</code></pre>

<p>En este ejemplo estamos solamente enviando una línea de texto a Slack, la cual creará un mensaje
    que luce como éste:</p>
<img src="https://laravel.com/assets/img/basic-slack-notification.png">
<h4># Personalizar el remitente y destinatario</h4>
<p>Puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">from</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">to</span> para personalizar el remitente y el
    destinatario. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">from</span> acepta un nombre de usuario y un identificador emoji,
    mientras que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">to</span> acepta un canal y un usuario:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Slack representation of the notification.
*
* @param  mixed  \$notifiable
* @return SlackMessage
*/
public function toSlack(\$notifiable)
{
    return (new SlackMessage)
                -&gt;from('Ghost', ':ghost:')
                -&gt;to('#other')
                -&gt;content('This will be sent to #other');
}
</code></pre>

<p>También puedes utilizar una imagen como logo en vez de un emoji:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Slack representation of the notification.
*
* @param  mixed  \$notifiable
* @return SlackMessage
*/
public function toSlack(\$notifiable)
{
    return (new SlackMessage)
                -&gt;from('Laravel')
                -&gt;image('https://laravel.com/favicon.png')
                -&gt;content('This will display the Laravel logo next to the message');
}
</code></pre>


<h3># Archivos adjuntos en Slack</h3>
<p>También puedes añadir "adjuntos" a los mensajes en Slack. Éstos brindan opciones de formato más
    amplias que mensajes de texto simple. En este ejemplo, enviaremos una notificación de error
    acerca de una excepción que ocurrió en una aplicación, incluyendo un enlace para ver más
    detalles sobre la excepción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Slack representation of the notification.
*
* @param  mixed  \$notifiable
* @return SlackMessage
*/
public function toSlack(\$notifiable)
{
    \$url = url('/exceptions/'.\$this-&gt;exception-&gt;id);

    return (new SlackMessage)
                -&gt;error()
                -&gt;content('Whoops! Something went wrong.')
                -&gt;attachment(function (\$attachment) use (\$url) {
                    \$attachment-&gt;title('Exception: File Not Found', \$url)
                                -&gt;content('File [background.jpg] was not found.');
                });
}
</code></pre>

<p>El ejemplo anterior generará un mensaje en Slack como el siguiente:</p>
<img src="https://laravel.com/assets/img/basic-slack-attachment.png">
<p>Los adjuntos te permitirán especificar un arreglo de datos que deben ser presentados al usuario.
    Los datos dados serán presentados en forma de tabla para su fácil lectura:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Slack representation of the notification.
*
* @param  mixed  \$notifiable
* @return SlackMessage
*/
public function toSlack(\$notifiable)
{
    \$url = url('/invoices/'.\$this-&gt;invoice-&gt;id);

    return (new SlackMessage)
                -&gt;success()
                -&gt;content('One of your invoices has been paid!')
                -&gt;attachment(function (\$attachment) use (\$url) {
                    \$attachment-&gt;title('Invoice 1322', \$url)
                                -&gt;fields([
                                    'Title' =&gt; 'Server Expenses',
                                    'Amount' =&gt; '\$1,234',
                                    'Via' =&gt; 'American Express',
                                    'Was Overdue' =&gt; ':-1:',
                                ]);
                });
}
</code></pre>

<p>El ejemplo anterior generará un mensaje en Slack como el siguiente:</p>
<img src="https://laravel.com/assets/img/slack-fields-attachment.png">
<h4># Contenido adjunto en markdown</h4>
<p>
    Si algunos de tus campos adjuntos contienen Markdown, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">markdown</span> para instruir a Slack procesar y mostrar los campos proporcionados como
    texto formateado en Markdown. Los valores aceptados por este método son: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pretext</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">text</span>, y / o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fields</span>. Para más información sobre formato de adjuntos de
    Slack, revisa la

    documentación del API de Slack


    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the Slack representation of the notification.
*
* @param  mixed  \$notifiable
* @return SlackMessage
*/
public function toSlack(\$notifiable)
{
    \$url = url('/exceptions/'.\$this-&gt;exception-&gt;id);

    return (new SlackMessage)
                -&gt;error()
                -&gt;content('Whoops! Something went wrong.')
                -&gt;attachment(function (\$attachment) use (\$url) {
                    \$attachment-&gt;title('Exception: File Not Found', \$url)
                                -&gt;content('File [background.jpg] was *not found*.')
                                -&gt;markdown(['text']);
                });
}
</code></pre>


<h3># Enrutar notificaciones de slack</h3>
<p>Para enrutar notificaciones de Slack a la ubicación apropiada, debes definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routeNotificationForSlack</span>
    en tu entidad notificable. Esto debería devolver un webhook URL al cual debe ser entregada la
    notificación. Las Webhook URLs puedn ser generadas añadiendo un servicio "Incoming Webhook" a tu
    equipo Slack:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
    * Route notifications for the Slack channel.
    *
    * @param  \Illuminate\Notifications\Notification  \$notification
    * @return string
    */
    public function routeNotificationForSlack(\$notification)
    {
        return 'https://hooks.slack.com/services/...';
    }
}
</code></pre>


<h2>Configuración regional de notificaciones</h2>
<p>Laravel te permite enviar notificaciones en una configuración regional distinta al idioma actual
    e incluso recordará esta configuración si la notificación está encolada.</p>
<p>Para lograr esto, la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Notification</span> ofrece un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locale</span> para establecer el idioma deseado. La aplicación cambiará a esta
    configuración cuando la notificación esté siendo formateada y luego se revertirá a la
    configuración regional previa cuando el formato esté completo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user-&gt;notify((new InvoicePaid(\$invoice))-&gt;locale('es'));
</code></pre>

<p>La configuración regional de múltiples entradas notificables también puede ser logradas mediante
    la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notification</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Notification::locale('es')-&gt;send(\$users, new InvoicePaid(\$invoice));
</code></pre>

<h3># Configuración regional preferida por el usuario</h3>
<p>A veces, las aplicaciones almacenan la configuración regional preferida de cada usuario. Al
    implementar la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">HasLocalePreference</span> en tu modelo notificable, puedes
    instruir a Laravel que use esta configuración almacenada al enviar una notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Contracts\Translation\HasLocalePreference;

class User extends Model implements HasLocalePreference
{
    /**
    * Get the user's preferred locale.
    *
    * @return string
    */
    public function preferredLocale()
    {
        return \$this-&gt;locale;
    }
}
</code></pre>

<p>Una vez esté implementada la interfaz, Laravel usará automáticamentela configuración regional
    preferida al enviar notificaciones y mailables al modelo. Por lo tanto, no es necesario llamar
    al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locale</span> cuando usas esta interfaz:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user-&gt;notify(new InvoicePaid(\$invoice));
</code></pre>


<h2>Eventos de notificación</h2>
<p>Cuando una notificación es enviada, el evento <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Events\NotificationSent</span>
    es desencadenado por el sistema de notificación. Esto contiene la entidad "notifiable" y la
    instancia de ntificación en sí. Puedes registrar listeners para este evento en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The event listener mappings for the application.
*
* @var array
*/
protected \$listen = [
    'Illuminate\Notifications\Events\NotificationSent' =&gt; [
        'App\Listeners\LogNotification',
    ],
];
</code></pre>


<p>TIP</p>
<p>Luego de registrar listeners en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>, usa el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:generate</span> para generar rápidamente clases de listeners.</p>

<p>Dentro de un listener de eventos, puedes acceder a las propiedades <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notifiable</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notification</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">channel</span> del evento para aprender más acerca de el
    destinatario de la notificación o sobre la notificación en sí:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Handle the event.
*
* @param  NotificationSent  \$event
* @return void
*/
public function handle(NotificationSent \$event)
{
    // \$event-&gt;channel
    // \$event-&gt;notifiable
    // \$event-&gt;notification
    // \$event-&gt;response
}
</code></pre>


<h2>Canales personalizados</h2>
<p>Laravel viene una gran cantidad de canales de notificación, pero puedes ser deseable escribir
    controladores propios para entregar notificaciones mediante otros canales. Laravel hace de esto
    algo sencillo. Para empezar, debes definir una clase que contenga un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">send</span> El
    método debe recibir dos argumentos: un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notifiable</span> y un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$notification</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Channels;

use Illuminate\Notifications\Notification;

class VoiceChannel
{
    /**
    * Send the given notification.
    *
    * @param  mixed  \$notifiable
    * @param  \Illuminate\Notifications\Notification  \$notification
    * @return void
    */
    public function send(\$notifiable, Notification \$notification)
    {
        \$message = \$notification-&gt;toVoice(\$notifiable);

        // Send notification to the \$notifiable instance...
    }
}
</code></pre>

<p>Una vez que la clase de notificación ha sido definida, puedes devolver el nombre de la clase
    desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">via</span> de cualquier notificación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use App\Channels\VoiceChannel;
use App\Channels\Messages\VoiceMessage;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;

class InvoicePaid extends Notification
{
    use Queueable;

    /**
    * Get the notification channels.
    *
    * @param  mixed  \$notifiable
    * @return array|string
    */
    public function via(\$notifiable)
    {
        return [VoiceChannel::class];
    }

    /**
    * Get the voice representation of the notification.
    *
    * @param  mixed  \$notifiable
    * @return VoiceMessage
    */
    public function toVoice(\$notifiable)
    {
        // ...
    }
}
</code></pre>
</div>
""";