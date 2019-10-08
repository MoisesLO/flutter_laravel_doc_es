import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrBroadcasting extends StatelessWidget {
  final String title;
  PrBroadcasting(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrBroadcasting,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrBroadcasting = """
<div style='font-size: 14.2px;'>
<h1>Broadcasting</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Configuración</li>
            <li>Prerrequisitos del driver</li>
        </ul>
    </li>
    <li>
        Descripción general
        <ul>
            <li>Usando una aplicación de ejemplo</li>
        </ul>
    </li>
    <li>
        Definiendo eventos de transmisión
        <ul>
            <li>Nombre de la transmisión</li>
            <li>Datos de la transmisión</li>
            <li>Cola de la transmisión</li>
            <li>Condiciones de la transmisión</li>
        </ul>
    </li>
    <li>
        Autorizando canales
        <ul>
            <li>Definiendo rutas de autorización</li>
            <li>Definiendo callbacks de autorización</li>
            <li>Definiendo clases de canales</li>
        </ul>
    </li>
    <li>
        Transmitiendo eventos
        <ul>
            <li>Sólo a otros</li>
        </ul>
    </li>
    <li>
        Recibiendo transmisiones
        <ul>
            <li>Instalando Laravel Echo</li>
            <li>Escuchando eventos</li>
            <li>Dejando un canal</li>
            <li>Nombres de espacio</li>
        </ul>
    </li>
    <li>
        Canales de presencia
        <ul>
            <li>Autorizando canales de presencia</li>
            <li>Uniéndose a canales de presencia</li>
            <li>Transmitiendo a canales de presencia</li>
        </ul>
    </li>
    <li>Eventos del cliente</li>
    <li>Notificaciones</li>
</ul>

<h2>Introducción</h2>
<p>En muchas aplicaciones web modernas, los WebSockets son usados para implementar interfaces de
    usuarios actualizadas en tiempo real. Cuando algún dato es actualizado en el servidor, un
    mensaje es típicamente enviado a través de una conexión WebSocket para ser manejado por el
    cliente. Esto proporciona una alternativa más robusta y eficiente para monitorear continuamente
    tu aplicación en busca de cambios.</p>
<p>
    Para asistirte en la construcción de ese tipo de aplicaciones, Laravel hace fácil "emitir" tus
    eventos
    a través de una conexión WebSocket. Emitir tus eventos te permite compartir los mismos nombres
    de eventos entre tu código del lado del servidor y tu aplicación JavaScript del lado de cliente.
</p>

<p>TIP</p>
<p>
    Antes de sumergirnos en la emisión de eventos, asegurate de haber leído toda la documentación de
    Laravel sobre
    eventos y listeners
    .
</p>



<h3># Configuración</h3>
<p>
    Toda la configuración de transmisión de eventos de tu aplicación está almacenada en el archivo
    de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/broadcasting.php</span>. Laravel soporta múltiples drivers de
    transmisión:

    canales de Pusher


    , Redis y un driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">log</span> para desarrollo local y depuración. Adicionalmente, un
    driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span> es incluido, que te permite deshabilitar totalmente las emisiones. Un
    ejemplo de configuración para cada uno de los drivers está incluido en el archivo de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/broadcasting.php</span>.
</p>
<h4># Proveedor de servicios Broadcast</h4>
<p>Antes de transmitir cualquier evento, necesitarás primero registrar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Providers\BroadcastServiceProvider</span>.
    En aplicaciones de Laravel nuevas, sólo necesitas descomentar este proveedor en el arreglo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">providers</span> de tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>. Este
    proveedor te permitirá registrar las rutas de autorización del broadcast y los callbacks.</p>
<h4># Token CSRF</h4>
<p>Laravel Echo necesitará acceso al token CSRF de la sesión actual. Debes verificar que el elemento
    HTML <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">head</span> de tu aplicación define una etiqueta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">meta</span> que contiene el
    token CSRF:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;meta name="csrf-token" content="{{ csrf_token() }}"&gt;
</code></pre>


<h3># Prerrequisitos del driver</h3>
<h4># Canales de Pusher</h4>
<p>
    Si estás transmitiendo tus eventos mediante

    canales de Pusher


    , debes instalar el SDK de PHP para canales de Pusher mediante el administrador de paquetes
    Composer:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require pusher/pusher-php-server "~4.0"
</code></pre>

<p>Luego, debes configurar tus credenciales del canal en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/broadcasting.php</span>.
    Un ejemplo de configuración de canal está incluido en este archivo, permitiéndote especificar
    rápidamente la clave del canal, contraseña y ID de la aplicación. La configuración de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pusher</span>
    del archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/broadcasting.php</span> también te permite especificar
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">options</span> adicionales que son soportadas por canales, como el cluster:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'options' =&gt; [
    'cluster' =&gt; 'eu',
    'useTLS' =&gt; true
],
</code></pre>

<p>Al usar canales y Laravel Echo, debes especificar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pusher</span> como tu transmisor deseado
    al instanciar la instancia de Echo en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/bootstrap.js</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>import Echo from "laravel-echo";

window.Pusher = require('pusher-js');

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'your-pusher-channels-key'
});
</code></pre>

<h4># Redis</h4>
<p>Si estás usando el transmisor de Redis, debes instalar la librería Predis:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require predis/predis
</code></pre>

<p>El transmisor de Redis transmitirá mensajes usando las característica pub / sub de Redis; sin
    embargo, necesitarás unir esto con un servidor de WebSocket que puede recibir mensajes desde
    Redis y emitirlos a tus canales de WebSocket.</p>
<p>Cuando el transmisor de Redis publica un evento, éste será publicado en los nombres de canales
    especificados en el evento y la carga será una cadena codificada de JSON que contiene el nombre
    del evento, una carga <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span> y el usuario que genero el ID de socket del evento (si
    aplica).</p>
<h4># Socket.IO</h4>
<p>Si vas a unir el transmisor de Redis con un servidor Socket.IO, necesitarás incluir la librería
    de Socket.IO en tu aplicación. Puedes instalarla mediante el gestor de paquetes NPM:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm install --save socket.io-client
</code></pre>

<p>Luego, necesitarás instanciar Echo con el conector <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">socket.io</span> y un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">host</span>.
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>import Echo from "laravel-echo"

window.io = require('socket.io-client');

window.Echo = new Echo({
    broadcaster: 'socket.io',
    host: window.location.hostname + ':6001'
});
</code></pre>

<p>
    Finalmente, necesitarás ejecutar un servidor de Socket.IO compatible. Laravel no incluye la
    implementación de un servidor Socket.IO; sin embargo, un servidor de Socket.IO de la comunidad
    es actualmente mantenido en el repositorio de GitHub

    tlaverdure/laravel-echo-server


    .
</p>
<h4># Prerrequisitos de la cola</h4>
<p>Antes de transmitir eventos, también necesitarás configurar y ejecutar un listener de colas. Toda
    la transmisión de eventos es realizada mediante trabajos en cola para que el tiempo de respuesta
    de tu aplicación no se vea necesariamente afectado.</p>

<h2>Descripción general</h2>
<p>
    La transmisión de eventos de Laravel te permite transmitir tus eventos del lado del servidor de
    Laravel a tu aplicación JavaScript del lado del cliente usando un enfoque basado en drivers a
    los WebSockets. Actualmente, Laravel viene con drivers de

    canales de Pusher


    y Redis. Los eventos pueden ser fácilmente consumidos en el lado del cliente usando el paquete
    de JavaScript Laravel Echo.
</p>
<p>Los eventos son transmitidos mediante "canales", que pueden ser definidos como públicos o
    privados. Cualquier visitante en tu aplicación puede suscribirse a una canal público sin
    necesidad de autenticación o autorización; sin embargo, para poder suscribirse a canales
    privados, un usuario debe estar autenticado y autorizado para escuchar en dicho canal.</p>

<h3># Usando una aplicación de ejemplo</h3>
<p>
    Antes de sumergirnos en cada componente de la transmisión de eventos, vamos a ver un resumen
    usando una tienda virtual como ejemplo. No discutiremos los detalles sobre configurar

    canales de Pusher


    o Laravel Echo dado que éstos será discutido a detalle en otras secciones de esta documentación.
</p>
<p>En nuestra aplicación, vamos a asumir que tenemos una página que permite a los usuarios ver el
    estado de envío de sus ordenes. Vamos también a asumir que un evento
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShippingStatusUpdated</span> es ejecutado cuando un estado de envío es procesado por la
    aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>event(new ShippingStatusUpdated(\$update));
</code></pre>

<h4># Interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldBroadcast</span></h4>
<p>Cuando un usuario está viendo una de sus ordenes, no que queremos que tengan que refrescar la
    página para ver las actualizaciones del estado. En su lugar, queremos transmitir las
    actualizaciones a la aplicación a medida que son creadas. Así que, necesitamos marcar el evento
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShippingStatusUpdated</span> con la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldBroadcast</span>. Esto instruirá
    a Laravel para que transmita el evento cuando es ejecutado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class ShippingStatusUpdated implements ShouldBroadcast
{
    /**
    * Information about the shipping status update.
    *
    * @var string
    */
    public \$update;
}
</code></pre>

<p>La interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldBroadcast</span> requiere que nuestro evento defina un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastOn</span>.
    Este método es responsable de retornar los canales en los que el evento debería transmitir. Un
    stub vacío para este metodo está definido en las clases de eventos generadas, así que sólo
    necesitamos rellenar sus detalles. Sólo queremos que el creador de la orden sea capaz de ver las
    actualizaciones de estado, así que transmitiremos el evento en un canal privado que está
    enlazado a la orden:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the channels the event should broadcast on.
*
* @return \Illuminate\Broadcasting\PrivateChannel
*/
public function broadcastOn()
{
    return new PrivateChannel('order.'.\$this-&gt;update-&gt;order_id);
}
</code></pre>

<h4># Autorizando canales</h4>
<p>Recuerda, los usuarios deben ser autorizados para escuchar en canales privados. Podemos definir
    las reglas de autorización de nuestro canal en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/channels.php</span>. En
    este ejemplo, necesitamos verificar que cualquier usuario intentando escuchar en el canal
    privado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">order.1</span> es realmente el creador de la orden:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Broadcast::channel('order.{orderId}', function (\$user, \$orderId) {
    return \$user-&gt;id === Order::findOrNew(\$orderId)-&gt;user_id;
});
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">channel</span> acepta dos argumentos: el nombre del canal y un callback que
    retorna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> indicando si el usuario está autorizado para
    escuchar en el canal.</p>
<p>Todos los callbacks de autorización recibien al usuario actualmente autenticado como primer
    argumento y cualquier paremetro adicional como siguientes argumentos. En este ejemplo, estamos
    usando el placeholder <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{orderId}</span> para indicar que la porción "ID" del nombre del
    canal es un wildcard.</p>
<h4># Escuchar transmisiones de eventos</h4>
<p>Luego, todo lo que queda es escuchar el evento en nuestra aplicación de JavaScript. Podemos hacer
    esto usando Laravel Echo. Primero, usaremos el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">private</span> para suscribirnos a
    un canal privado. Luego, podemos usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listen</span> para escuchar el evento
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShippingStatusUpdated</span>. Por defecto, todas las propiedades públicas del evento serán
    incluidas en el evento de transmisión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.private(`order.\${orderId}`)
    .listen('ShippingStatusUpdated', (e) =&gt; {
        console.log(e.update);
    });
</code></pre>


<h2>Definiendo la transmisión de eventos</h2>
<p>Para informar a Laravel que un evento dado debería ser transmitido, implementa la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Broadcasting\ShouldBroadcast</span>
    en la clase del evento. Esta interfaz ya está importada en todas las clases de eventos generadas
    por el framework para que así puedas agregarla fácilmente a tus eventos.</p>
<p>La interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldBroadcast</span> requiere que implementes un sólo método: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastOn</span>.
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastOn</span> debería retornar un canal o un arreglo de canales en los que
    el evento debería transmitirse. Los canales deben ser instancias de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Channel</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PrivateChannel</span>
    o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PresenceChannel</span>. Las instancias de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Channel</span> representan canales
    públicos a los que cualquier usuario puede suscribirse mientras que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PrivateChannels</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PresenceChannels</span> representan canales privados que requieren autorización:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Events;

use App\User;
use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class ServerCreated implements ShouldBroadcast
{
    use SerializesModels;

    public \$user;

    /**
    * Create a new event instance.
    *
    * @return void
    */
    public function __construct(User \$user)
    {
        \$this-&gt;user = \$user;
    }

    /**
    * Get the channels the event should broadcast on.
    *
    * @return Channel|array
    */
    public function broadcastOn()
    {
        return new PrivateChannel('user.'.\$this-&gt;user-&gt;id);
    }
}
</code></pre>

<p>Luego, sólo necesitas ejecutar el evento como normalmente lo harías. Una vez que el evento ha
    sido ejecutado, un trabajo en cola transmitirá automáticamente el evento a través de tu driver
    de transmisión especificado.</p>

<h3># Nombre de la transmisión</h3>
<p>Por defecto, Laravel transmitirá el evento usando el nombre de clase del evento. Sin embargo,
    puedes personalizar el nombre de la transmisión definiendo un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastAs</span> en
    el evento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The event's broadcast name.
*
* @return string
*/
public function broadcastAs()
{
    return 'server.created';
}
</code></pre>

<p>Si personalizas el nombre de la transmisión usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastAs</span>, debes
    asegurarte de registrar tu listener prefijándolo con un caracter <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.</span>. Esto instruíra
    a Echo a no agregar el nombre de espacio de la aplicación al evento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>.listen('.server.created', function (e) {
    ....
});
</code></pre>


<h3># Datos de la transmisión</h3>
<p>Cuando un evento es transmitido, todas sus propiedades <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span> son automáticamente
    serializadas y transmitidas como carga del evento, permitiéndote acceder a cualquiera de sus
    datos públicos desde tu aplicación de JavaScript. Así que, por ejemplo, si tu evento tiene una
    sola propiedad pública <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$user</span> que contiene un modelo de Eloquent, la carga de
    transmisión del evento sería:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>{
    "user": {
        "id": 1,
        "name": "Patrick Stewart"
        ...
    }
}
</code></pre>

<p>Sin embargo, si deseas tener mayor control sobre la carga transmitida, puedes agregar un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastWith</span> a tu evento. Este método debería retornar el arreglo de datos que
    deseas transmitir como la carga del evento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the data to broadcast.
*
* @return array
*/
public function broadcastWith()
{
    return ['id' =&gt; \$this-&gt;user-&gt;id];
}
</code></pre>


<h3># Cola de transmisión</h3>
<p>Por defecto, cada evento transmitido es colocado en la cola por defecto para la conexión de cola
    por defecto especificada en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue.php</span>. Puedes
    personalizar la cola usada por el transmisor definiendo una propiedad
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastQueue</span> en la clase de tu evento. Esta propiedad debería especificar el
    nombre de la cola que deseas usar al transmitir:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The name of the queue on which to place the event.
*
* @var string
*/
public \$broadcastQueue = 'your-queue-name';
</code></pre>

<p>Si quieres transmitir tu evento usando la cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sync</span> en lugar del driver de cola por
    defecto, puedes implementar la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldBroadcastNow</span> en lugar de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldBroadcast</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

use Illuminate\Contracts\Broadcasting\ShouldBroadcastNow;

class ShippingStatusUpdated implements ShouldBroadcastNow
{
    //
}
</code></pre>


<h3># Condiciones de la transmisión</h3>
<p>Algunas veces quieres transmitir tu evento sólo si una condición dada es verdadera. Puedes
    definir estas condiciones agregando un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastWhen</span> a la clase de tu
    evento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Determine if this event should broadcast.
*
* @return bool
*/
public function broadcastWhen()
{
    return \$this-&gt;value &gt; 100;
}
</code></pre>


<h2>Autorizando canales</h2>
<p>Los canales privados requieren que autorizes que el usuario actualmente autenticado puede
    escuchar en el canal privado. Esto es logrado haciendo una solicitud HTTP a tu aplicación de
    Laravel con el nombre del canal y permitiendo a tu aplicación de terminar si el usuario puede
    escuchar en dicho canal. Al usar Laravel Echo, la solicitud HTTP para autorizar suscripciones a
    canales privados será realizada automáticamente; sin embargo, si necesitas definir las rutas
    necesarias para responder a estas solicitudes.</p>

<h3># Definiendo rutas de autorización</h3>
<p>Afortunadamente, Laravel hace que sea fácil definir las rutas para responder a las solicitudes de
    autorización de canales. En el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">BroadcastServiceProvider</span> incluido con tu aplicación
    de Laravel, verás una llamada al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Broadcast::routes</span>. Este método registrará
    la ruta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/broadcasting/auth</span> para manejar las solicitudes de autorización:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Broadcast::routes();
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Broadcast::routes</span> automáticamente coloca sus rutas dentro del grupo de
    middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>; sin embargo, puedes pasar un arreglo de atributos de ruta al método
    si te gustaría personalizar los atributos asignados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Broadcast::routes(\$attributes);
</code></pre>

<h4># Personalizando endpoints de autorización</h4>
<p>Por defecto, Echo usará el endpoint <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/broadcasting/auth</span> para autorizar acceso a
    canales. Sin embargo, puedes especificar tus propios endpoints de autorización pasando la opción
    de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authEndpoint</span> a tu instancia de Echo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'your-pusher-channels-key',
    authEndpoint: '/custom/endpoint/auth'
});
</code></pre>


<h3># Definiendo callbacks de autorización</h3>
<p>Luego, necesitamos definir la lógica que realizará la autorización del canal. Esto es hecho en el
    archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/channels.php</span> que es incluido con tu aplicación. En este archivo,
    puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Broadcast::channel</span> para registrar callbacks de autorización
    de canales:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Broadcast::channel('order.{orderId}', function (\$user, \$orderId) {
    return \$user-&gt;id === Order::findOrNew(\$orderId)-&gt;user_id;
});
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">channel</span> acepta dos argumentos: el nombre del canal y un callback que
    retorna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> indicando si el usuario está autorizado para
    escuchar el canal.</p>
<p>Todos los callbacks de autorización reciben al usuario actualmente autenticado como primer
    argumento y cualquier parametro wildcard como sus argumentos siguientes. En este ejemplo,
    estamos usando el placeholder <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{orderId}</span> para indicar la porción "ID" del nombre del
    canal es un wildcard.</p>
<h4># Enlace de modelos del callback de autorización</h4>
<p>Igual que las rutas HTTP, las rutas de los canales pueden tomar ventaja de modelo de enlace de
    rutas de forma implícita y explícita. Por ejemplo, en lugar de recibir la cadena o ID númerico
    de la orden, puedes solicitar una instancia del modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Order</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Order;

Broadcast::channel('order.{order}', function (\$user, Order \$order) {
    return \$user-&gt;id === \$order-&gt;user_id;
});
</code></pre>

<h4># Autenticación del callback de autorización</h4>
<p>Los canales privados y de presencia autentican al usuario actual a través de la protección de
    autenticación por defecto de la aplicacion. Si el usuario no está autenticado, la autorizacion
    del canal es automáticamente negada y el callback de autorización nunca se ejecuta. Sin embargo,
    puedes asignar múltiples protecciones personalizadas que deben autenticar la solicitud entrante
    si es necesario:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Broadcast::channel('channel', function() {
    // ...
}, ['guards' =&gt; ['web', 'admin']]);
</code></pre>


<h3># Definiendo clases de canales</h3>
<p>Si tu aplicación está consumiendo muchos canales diferentes, tu archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/channels.php</span> podría volverse voluminoso. Así que, en lugar de usar Closures
    para autorizar canales, puedes usar clases de canales. Para generar una clase de canal, usa el
    comando de artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:channel</span>. Este comando colocará una nueva clase de canal en
    el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App/Broadcasting</span>.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:channel OrderChannel
</code></pre>

<p>Luego, registra tu canal en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/channels.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Broadcasting\OrderChannel;

Broadcast::channel('order.{order}', OrderChannel::class);
</code></pre>

<p>Finalmente, puedes colocar la lógica de autorización para tu canal en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span>
    de la clase del canal. Este método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span> contendrá la misma lógica que típicamente
    habrías colocado en el Closure de tu canal de autorización. Puedes también tomar ventaja del
    modelo de enlace de canales:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Broadcasting;

use App\User;
use App\Order;

class OrderChannel
{
    /**
    * Create a new channel instance.
    *
    * @return void
    */
    public function __construct()
    {
        //
    }

    /**
    * Authenticate the user's access to the channel.
    *
    * @param  \App\User  \$user
    * @param  \App\Order  \$order
    * @return array|bool
    */
    public function join(User \$user, Order \$order)
    {
        return \$user-&gt;id === \$order-&gt;user_id;
    }
}
</code></pre>


<p>TIP</p>
<p>Como muchas otras clases en Laravel, las clases de canales automáticamente serán resueltas por el
    contenedor de servicios. Así que, puedes declarar el tipo de cualquier dependencia requerida por
    tu canal en su constructor.</p>


<h2>Transmitiendo eventos</h2>
<p>Una vez que has definido un evento y lo has marcado con la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldBroadcast</span>,
    sólo necesitas ejecutar el evento usando la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event</span>. El despachador de
    eventos notará que el evento está marcado con la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldBroadcast</span> y agrega
    el evento a la cola para transmisión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>event(new ShippingStatusUpdated(\$update));
</code></pre>


<h3># Sólo a otros</h3>
<p>Al construir una aplicación que usa la transmisión de eventos, puedes sustituir la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event</span>
    por la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span>. Como la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event</span>, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span>
    despacha el evento a tus listeners del lado del servidor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>broadcast(new ShippingStatusUpdated(\$update));
</code></pre>

<p>Sin embargo, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span> también expone el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toOthers</span> que
    te permite excluir al usuario actual de los recipientes de la transmisión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>broadcast(new ShippingStatusUpdated(\$update))-&gt;toOthers();
</code></pre>

<p>Para entender mejor cuando es posible que quieras usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toOthers</span>, vamos a
    imaginar una aplicación de lista de tareas donde un usuario puede crear una nueva tarea
    ingresando un nombre de tarea. Para crear una tarea, tu aplicación puede hacer una solicitud a
    un punto de salida <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/task</span> que transmite la creación de la tarea y retorna una
    representación JSON de la nueva tarea. Cuando tu aplicación de JavaScript recibe la respuesta
    del punto de salida, podría directamente insertar la nueva tarea en su lista de tareas de la
    siguiente forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>axios.post('/task', task)
    .then((response) =&gt; {
        this.tasks.push(response.data);
    });
</code></pre>

<p>Sin embargo, recuerda que también transmitimos la creación de la tarea. Si tu aplicación de
    JavaScript está escuchando este evento para agregar tareas a la lista de tareas, tendrás tareas
    duplicadas en tu lista: una del punto de salida y una de la transmisión. Puedes resolver esto
    usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toOthers</span> para instruir al transmisor para que no transmita el
    evento al usuario actual.</p>

<p>Nota</p>
<p>Tu evento debe usar el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Broadcasting\InteractsWithSockets</span> para poder
    llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toOthers</span>.</p>

<h4># Configuración</h4>
<p>
    Cuando incializas una instancia de Laravel Echo, un ID de socket es asignado a la conexión. Si
    estás usando

    Vue


    y

    Axios


    , el ID del socket será agregado automáticamente a cada solicitud saliente como un header <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">X-Socket-ID</span>.
    Entonces, cuando llamas al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toOthers</span>, Laravel extraerá el ID del socket desde
    el encabezado e instruirá al transmisor a no transmitir a ninguna conexión con dicho ID de
    socket.
</p>
<p>Si no estás usando Vue y Axios, necesitarás configurar manualmente tu aplicación de JavaScript
    para enviar el encabezado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">X-Socket-ID</span>. Puedes retornar el ID del socket usando el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Echo.socketId</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>var socketId = Echo.socketId();
</code></pre>


<h2>Recibiendo transmisiones</h2>

<h3># Instalando laravel echo</h3>
<p>Laravel Echo es una librería de JavaScript que hace que sea fácil suscribirse a canales y
    escuchar transmisiones de eventos en Laravel. Puedes instalar Echo mediante el administrador de
    paquetes NPM. En este ejemplo, también instalaremos el paquete <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pusher-js</span> dado que
    usaremos el transmisor de canales de Pusher:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm install --save laravel-echo pusher-js
</code></pre>

<p>Una vez que Echo es instalado, estás listo para crear una instancia nueva de Echo en el
    JavaScript de tu aplicación. Un buen lugar para hacer esto es en la parte inferior del archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/bootstrap.js</span> que es incluido con el framework Laravel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>import Echo from "laravel-echo"

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'your-pusher-channels-key'
});
</code></pre>

<p>Al crear una instancia de Echo que usa el conector <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pusher</span>, puedes especificar un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cluster</span> así como si la conexión debería ser realizada mediante TLS (por defecto,
    cuando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forceTLS</span> es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>, una conexión no-TLS será realizada si la
    página fue cargada mediante HTTP, o como fallback si la conexión TLS falla):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'your-pusher-channels-key',
    cluster: 'eu',
    forceTLS: true
});
</code></pre>

<h4># Usando una instancia de cliente existente</h4>
<p>Si ya tienes una instancia de cliente de canales de Pusher o Socket.io que te gustaría que Echo
    usara, puedes pasarla a Echo mediante la opción de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">client</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>const client = require('pusher-js');

window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'your-pusher-channels-key',
    client: client
});
</code></pre>


<h3># Escuchando eventos</h3>
<p>Una vez que has instalado e instanciado Echo, estás listo para comenzar a escuchar transmisiones
    de eventos. Primero, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">channel</span> para retornar una instancia de un canal,
    luego llama al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listen</span> para escuchar a un evento especificado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.channel('orders')
    .listen('OrderShipped', (e) =&gt; {
        console.log(e.order.name);
    });
</code></pre>

<p>Si te gustaría escuchar eventos en un canal privado, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">private</span> en su
    lugar. Puedes continuar encadenando llamadas al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listen</span> para escuchar
    múltiples eventos en un sólo canal:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.private('orders')
    .listen(...)
    .listen(...)
    .listen(...);
</code></pre>


<h3># Abandonando un canal</h3>
<p>Para abandonar un canal, puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">leaveChannel</span> en tu instancia de
    Echo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.leaveChannel('orders');
</code></pre>

<p>Si te gustaría abandonar un canal y también sus canales privados y presenciales asociados, puedes
    usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">leave</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.leave('orders');
</code></pre>


<h3># Nombres de espacio</h3>
<p>Puedes haber notado en los ejemplos superiores que no especificamos un nombre de espacio completo
    para las clases del evento. Esto es debido a que Echo automáticamente asumirá que los eventos
    están ubicados en el nombre de espacio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Events</span>. Sin embargo, puedes configurar
    el nombre de espacio principal cuando instancias Echo pasando una opción de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">namespace</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>window.Echo = new Echo({
    broadcaster: 'pusher',
    key: 'your-pusher-channels-key',
    namespace: 'App.Other.Namespace'
});
</code></pre>

<p>Alternativamente, puedes prefijar las clases del evento con un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.</span> al suscribrte a
    estos usando Echo. Esto te permitirá siempre especificar el nombre de clase completamente
    calificado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.channel('orders')
    .listen('.Namespace\\Event\\Class', (e) =&gt; {
        //
    });
</code></pre>


<h2>Canales de presencia</h2>
<p>Los Canales de Presencia son construidos sobre la seguridad de los canales privados mientras que
    exponen la característica adicional de saber quien está susbscrito al canal. Esto hace que sea
    fácil construir características de aplicación poderosas y colaborativas como notificar a
    usuarios cuando otro usuario está viendo la misma página.</p>

<h3># Autorizando canales de presencia</h3>
<p>Todos los canales de Presencia son también canales privados; por lo tanto, los usuarios deben
    estar autorizados para accederlos. Sin embargo, al definir callbacks de autorización para
    canales de presencia, no retornarás <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si el usuario está autorizado para unirse
    al canal. En su lugar, debes retornar un arreglo de datos sobre el usuario.</p>
<p>Los datos retornados por el callback de autorización estarán disponibles para los listeners de
    eventos de canales de presencia en tu aplicación de JavaScript. Si el usuario no está autorizado
    para unirse al canal de presencia, debes retornar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Broadcast::channel('chat.{roomId}', function (\$user, \$roomId) {
    if (\$user-&gt;canJoinRoom(\$roomId)) {
        return ['id' =&gt; \$user-&gt;id, 'name' =&gt; \$user-&gt;name];
    }
});
</code></pre>


<h3># Uniendose a canales de presencia</h3>
<p>Para unirse a un canal de presencia, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span> de Echo. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span> retornará una implementación de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PresenceChannel</span> que, junto con la
    exposición del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listen</span>, te permite suscribirte a los eventos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">here</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">joining</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">leaving</span>.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.join(`chat.\${roomId}`)
    .here((users) =&gt; {
        //
    })
    .joining((user) =&gt; {
        console.log(user.name);
    })
    .leaving((user) =&gt; {
        console.log(user.name);
    });
</code></pre>

<p>El callback <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">here</span> será ejecutado inmediatamente una vez que el canal se haya unido
    con éxito y recibirá un arreglo que contiene la información del usuario para todos los demás
    usuarios actualmente subscritos al canal. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">joining</span> será ejecutado cuando
    un nuevo usuario se une a un canal, mientras que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">leaving</span> será ejecutado
    cuando un usuario abandona el canal.</p>

<h3># Transmitiendo a canales de presencia</h3>
<p>Los canales de Presencia pueden recibir eventos igual que los canales públicos y privados. Usando
    el ejemplo de una sala de chat, podemos querer transmitir eventos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">NewMessage</span> al
    canal de presencia de la sala. Para hacer eso, retornaremos una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PresenceChannel</span>
    desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcastOn</span> del evento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the channels the event should broadcast on.
*
* @return Channel|array
*/
public function broadcastOn()
{
    return new PresenceChannel('room.'.\$this-&gt;message-&gt;room_id);
}
</code></pre>

<p>Como los eventos públicos o privados, los canales de presencia pueden ser transmitidos usando la
    función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span>. Como con otros eventos, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toOthers</span> para excluir al usuario actual de recibir las transmisiones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>broadcast(new NewMessage(\$message));

broadcast(new NewMessage(\$message))-&gt;toOthers();
</code></pre>

<p>Puedes escuchar el evento join mediante el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listen</span> de Echo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.join(`chat.\${roomId}`)
    .here(...)
    .joining(...)
    .leaving(...)
    .listen('NewMessage', (e) =&gt; {
        //
    });
</code></pre>


<h2>Eventos del cliente</h2>

<p>TIP</p>
<p>
    Al usar

    canales de Pusher


    , debes habilitar la opción "Client Events" en la sección "App Settings" del

    dashboard de tu aplicación


    para enviar eventos del cliente.
</p>

<p>Algunas veces puedes querer transmitir un evento a otros clientes conectados sin tocar tu
    aplicación en lo absoluto. Esto puede ser particularmente útil para cosas como "escribir"
    notificaciones, donde quieres advertir a los usuarios de tu aplicación que otro usuario está
    escribiendo un mensaje en una pantalla dada.</p>
<p>Para transmitir eventos del cliente, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whisper</span> de Echo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.private('chat')
    .whisper('typing', {
        name: this.user.name
    });
</code></pre>

<p>Para escuchar eventos del cliente, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listenForWhisper</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.private('chat')
    .listenForWhisper('typing', (e) =&gt; {
        console.log(e.name);
    });
</code></pre>


<h2>Notificaciones</h2>
<p>Al juntar transmisión de eventos con notificaciones, tu aplicación de JavaScript puede recibir
    nuevas notificaciones mientras ocurren sin necesidad de refrescar la página. Primero, asegurate
    de leer la documentación sobre el uso del canal de transmisión de notificaciones.</p>
<p>Una vez que has configurado una notificación para usar el canal de transmisión, puedes escuchar a
    los eventos de la transmisión usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notification</span> de Echo. Recuerda, el
    nombre del canal debe ser igual al nombre de la clase de la entidad recibiendo la
    notificaciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Echo.private(`App.User.\${userId}`)
    .notification((notification) =&gt; {
        console.log(notification.type);
    });
</code></pre>

<p>En este ejemplo, todas las notificaciones enviadas a instancias de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> mediante
    el canal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span> serán recibidas por el callback. Un callback de autorización de
    canal para el canal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App.User.{id}</span> es incluido en el
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">BroadcastServiceProvider</span> que viene con el framework Laravel por defecto.</p>
</div>
""";