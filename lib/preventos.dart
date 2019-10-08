import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrEventos extends StatelessWidget {
  final String title;
  PrEventos(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrEventos,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrEventos = """
<div style='font-size: 14.2px;'>
<h1>Eventos</h1>
<ul>
    <li>Introducción</li>
    <li>
        Registro de eventos y oyentes
        <ul>
            <li>Generación de eventos y oyentes</li>
            <li>Registro manual de eventos</li>
            <li>Descubrimiento de eventos</li>
        </ul>
    </li>
    <li>Definiendo eventos</li>
    <li>Definiendo oyentes</li>
    <li>
        Oyentes de eventos en cola
        <ul>
            <li>Accediendo manualmente a la cola</li>
            <li>Manejo de trabajos fallidos</li>
        </ul>
    </li>
    <li>Despachando eventos</li>
    <li>
        Suscriptores de eventos
        <ul>
            <li>Escribiendo suscriptores de eventos</li>
            <li>Registrando suscriptores de eventos</li>
        </ul>
    </li>
</ul>

<h2>Introducción</h2>
<p>Los eventos de Laravel proporcionan una implementación de observador simple, lo que permite
    suscribirse y escuchar diversos eventos que ocurren en tu aplicación. Las clases de eventos
    normalmente se almacenan en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Events</span>, mientras que tus oyentes se
    almacenan en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Listeners</span>. No te preocupes si no ves estos directorios en tu
    aplicación, ya que se crearán para ti cuando generes eventos y oyentes utilizando los comandos
    de consola Artisan.</p>
<p>Los eventos sirven como una excelente manera de desacoplar varios aspectos de tu aplicación, ya
    que un solo evento puede tener múltiples oyentes que no dependen entre sí. Por ejemplo, es
    posible que desees enviar una notificación de Slack a tu usuario cada vez que se envíe un
    pedido. En lugar de acoplar tu código de procesamiento de pedidos a tu código de notificación
    Slack, puedes generar un evento <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">OrderShipped</span>, que un oyente puede recibir y
    transformar en una notificación Slack.</p>

<h2>Registro de eventos y oyentes</h2>
<p>El <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span> incluido en tu aplicación Laravel proporciona un lugar
    conveniente para registrar todos los oyentes de eventos de tu aplicación. La propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listen</span>
    contiene un arreglo de todos los eventos (claves) y sus oyentes (valores). Puedes agregar tantos
    eventos a este arreglo como lo requieras tu aplicación. Por ejemplo, agreguemos un evento <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">OrderShipped</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The event listener mappings for the application.
*
* @var array
*/
protected \$listen = [
    'App\Events\OrderShipped' =&gt; [
        'App\Listeners\SendShipmentNotification',
    ],
];
</code></pre>


<h3># Generación de eventos y oyentes</h3>
<p>Por supuesto, crear manualmente los archivos para cada evento y oyente es engorroso. En vez de
    eso, agrega oyentes y eventos a tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span> y usa el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:generate</span>.
    Este comando generará cualquier evento u oyente que esté listado en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>.
    Los eventos y oyentes que ya existen quedarán intactos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan event:generate
</code></pre>


<h3># Registro manual de eventos</h3>
<p>Normalmente, los eventos deberían registrarse a través del arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$listen</span> de
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>; sin embargo, también puedes registrar manualmente eventos
    basados en Closure en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Register any other events for your application.
*
* @return void
*/
public function boot()
{
    parent::boot();

    Event::listen('event.name', function (\$foo, \$bar) {
        //
    });
}
</code></pre>

<h4># Comodín de oyentes de un evento</h4>
<p>Puedes incluso registrar oyentes usando el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*</span> como un parámetro comodín, lo que te
    permite capturar múltiples eventos en el mismo oyente. Los comodines de oyentes reciben el
    nombre del evento como su primer argumento y el arreglo de datos de eventos completo como su
    segundo argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Event::listen('event.*', function (\$eventName, array \$data) {
    //
});
</code></pre>


<h3># Descubrimiento de eventos</h3>

<p>Nota</p>
<p>El Descubrimiento de Eventos está disponible para Laravel 5.8.9 o posterior.</p>


<p>En vez de registrar eventos y oyentes (listeners) manualmente en el arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$listen</span>
    del <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>, puedes habilitar la detección automática de eventos.
    Cuando se habilita la detección de eventos, Laravel encontrará y registrará automáticamente tus
    eventos y oyentes escaneando el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Listeners</span> de tu aplicación. Además,
    todos los eventos definidos explícitamente listados en el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>
    seguirán registrados.</p>
<p>Laravel encuentra los listeners de eventos mediante el escaneo de las clases listener usando
    reflexión. Cuando Laravel encuentra algun método de clase listener que empieza por
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span>, Laravel registrará dichos métodos como listeners de eventos para el evento
    que está escrito en la firma del método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Events\PodcastProcessed;
class SendPodcastProcessedNotification

{
    /**
    * Handle the given event.
    *
    * @param  \App\Events\PodcastProcessed
    * @return void
    */
    public function handle(PodcastProcessed \$event)
    {
        //
    }
}
</code></pre>

<p>La detección de eventos está deshabilitada de forma predeterminada, pero puedes habilitarla
    sobreescribiendo el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shouldDiscoverEvents</span> del
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span> de tu aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Determine if events and listeners should be automatically discovered.
*
* @return bool
*/
public function shouldDiscoverEvents()
{
    return true;
}
</code></pre>

<p>Por defecto, se escanearán todos los oyentes dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Listeners</span> de tu
    aplicación. Si deseas definir directorios adicionales para analizar, puedes sobreescribir el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">discoverEventsWithin</span> en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the listener directories that should be used to discover events.
*
* @return array
*/
protected function discoverEventsWithin()
{
    return [
        \$this-&gt;app-&gt;path('Listeners'),
    ];
}
</code></pre>

<p>En producción, es probable que no desees que el framework analice todos tus oyentes en cada
    petición. Por lo tanto, durante tu proceso de despliegue, debes ejecutar el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:cache</span> para almacenar en caché un manifiesto de todos los eventos y oyentes de
    tu aplicación. Este manifiesto será utilizado por el framework para acelerar el proceso de
    registro de eventos. El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:clear</span> puede ser usado para destruir la caché.
</p>

<p>TIP TIP</p>
<p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:list</span> puede ser usado para mostrar una lista de todos los eventos y
    oyentes registrados por tu aplicación.</p>


<h2>Definiendo eventos</h2>
<p>Una clase de evento es un contenedor de datos que guarda la información relacionada con el
    evento. Por ejemplo, supongamos que nuestro evento <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">OrderShipped</span> (orden enviada)
    generado recibe un objeto ORM Eloquent:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Events;

use App\Order;
use Illuminate\Queue\SerializesModels;

class OrderShipped
{
    use SerializesModels;

    public \$order;

    /**
    * Create a new event instance.
    *
    * @param  \App\Order  \$order
    * @return void
    */
    public function __construct(Order \$order)
    {
        \$this-&gt;order = \$order;
    }
}
</code></pre>

<p>Como puedes ver, esta clase de evento no contiene lógica. Es un contenedor para la instancia
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Order</span> que se compró. El trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SerializesModels</span> utilizado por el evento
    serializará con elegancia cualquier modelo Eloquent si el objeto del evento se serializa
    utilizando la función de PHP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">serialize</span>.</p>

<h2>Definiendo oyentes</h2>
<p>A continuación, echemos un vistazo al oyente de nuestro evento de ejemplo. Los oyentes de eventos
    reciben la instancia de evento en su método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span>. El comando
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:generate</span> importará automáticamente la clase de evento adecuada y declarará el
    tipo de evento en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span>. Dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span>, puedes
    realizar las acciones necesarias para responder al evento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Listeners;

use App\Events\OrderShipped;

class SendShipmentNotification
{
    /**
    * Create the event listener.
    *
    * @return void
    */
    public function __construct()
    {
        //
    }

    /**
    * Handle the event.
    *
    * @param  \App\Events\OrderShipped  \$event
    * @return void
    */
    public function handle(OrderShipped \$event)
    {
        // Access the order using \$event-&gt;order...
    }
}
</code></pre>


<p>TIP TIP</p>
<p>Tus oyentes de eventos también pueden declarar el tipo de cualquier dependencia que necesiten de
    sus constructores. Todos los oyentes de eventos se resuelven a través contenedor de servicio de
    Laravel, por lo que las dependencias se inyectarán automáticamente.</p>

<h4># Deteniendo la propagación de un evento</h4>
<p>A veces, es posible que desees detener la propagación de un evento a otros oyentes. Puede hacerlo
    devolviendo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> desde el método<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> de tu oyente.</p>

<h2>Oyentes de Eventos de Cola</h2>
<p>Los oyentes de colas pueden ser beneficiosos si tu oyente va a realizar una tarea lenta, como
    enviar un correo electrónico o realizar una solicitud HTTP. Antes de comenzar con oyentes de
    cola, asegúrate de configurar su cola e iniciar un oyente de colas en tu servidor o entorno de
    desarrollo local.</p>
<p>Para especificar que un oyente debe estar en cola, agrega la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldQueue</span> a
    la clase de oyente. Los oyentes generados por el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:generate</span>
    ya tienen esta interfaz importada en el espacio de nombres actual, por lo que puedes usarla
    inmediatamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Listeners;

use App\Events\OrderShipped;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendShipmentNotification implements ShouldQueue
{
    //
}
</code></pre>

<p>¡Eso es! Ahora, cuando este oyente es llamado por un evento, el despachador de eventos lo
    colocará en cola automáticamente usando el sistema de colas de Laravel. Si no se lanzan
    excepciones cuando la cola ejecuta el oyente, el trabajo en cola se eliminará automáticamente
    una vez que haya terminado de procesarse.</p>
<h4># Personalizando la conexión de la cola y el nombre de la cola</h4>
<p>Si deseas personalizar la conexión de cola, el nombre de la cola o el tiempo de demora de la cola
    de un oyente de eventos, puedes definir las propiedades <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$connection</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$queue</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$delay</span> en tu clase de oyente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Listeners;

use App\Events\OrderShipped;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendShipmentNotification implements ShouldQueue
{
    /**
    * The name of the connection the job should be sent to.
    *
    * @var string|null
    */
    public \$connection = 'sqs';

    /**
    * The name of the queue the job should be sent to.
    *
    * @var string|null
    */
    public \$queue = 'listeners';

    /**
    * The time (seconds) before the job should be processed.
    *
    * @var int
    */
    public \$delay = 60;
}
</code></pre>

<h4># Cola condicional de listeners</h4>
<p>Algunas veces, necesitarás determinar si un listener debe ser agregado a una cola en base a datos
    que sólo están disponibles en tiempo de ejecución. Para lograr esto, un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shouldQueue</span> puede ser agregar a un listener para determinar si el listener debe ser
    agregado a una cola y ejecutado de forma sincronica:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Listeners;

use App\Events\OrderPlaced;
use Illuminate\Contracts\Queue\ShouldQueue;

class RewardGiftCard implements ShouldQueue
{
    /**
    * Reward a gift card to the customer.
    *
    * @param  \App\Events\OrderPlaced  \$event
    * @return void
    */
    public function handle(OrderPlaced \$event)
    {
        //
    }

    /**
    * Determine whether the listener should be queued.
    *
    * @param  \App\Events\OrderPlaced  \$event
    * @return bool
    */
    public function shouldQueue(OrderPlaced \$event)
    {
        return \$event-&gt;order-&gt;subtotal &gt;= 5000;
    }
}
</code></pre>


<h3># Accediendo manualmente a la cola</h3>
<p>Si necesitas acceder manualmente a los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> y<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">release</span> de la
    cola de trabajo subyacente del oyente, puedes hacerlo utilizando el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Queue\InteractsWithQueue</span>.
    Este trait se importa de forma predeterminada en los oyentes generados y proporciona acceso a
    estos métodos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Listeners;

use App\Events\OrderShipped;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendShipmentNotification implements ShouldQueue
{
    use InteractsWithQueue;

    /**
        * Handle the event.
        *
        * @param  \App\Events\OrderShipped  \$event
        * @return void
        */
    public function handle(OrderShipped \$event)
    {
        if (true) {
            \$this-&gt;release(30);
        }
    }
}
</code></pre>


<h3># Manejo de trabajos fallidos</h3>
<p>A veces, tus oyentes de eventos en cola pueden fallar. Si el oyente en cola supera el número
    máximo de intentos según lo define tu trabajador de cola, se llamará al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">failed</span> en tu oyente. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">failed</span> recibe la instancia del evento y
    la excepción que causó el error:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Listeners;

use App\Events\OrderShipped;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendShipmentNotification implements ShouldQueue
{
    use InteractsWithQueue;

    /**
    * Handle the event.
    *
    * @param  \App\Events\OrderShipped  \$event
    * @return void
    */
    public function handle(OrderShipped \$event)
    {
        //
    }

    /**
    * Handle a job failure.
    *
    * @param  \App\Events\OrderShipped  \$event
    * @param  \Exception  \$exception
    * @return void
    */
    public function failed(OrderShipped \$event, \$exception)
    {
        //
    }
}
</code></pre>


<h2>Despachando eventos</h2>
<p>Para enviar un evento, puedes pasar una instancia del evento a la función de ayuda (helper)
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event</span>. El helper enviará el evento a todos tus oyentes registrados. Dado que el
    helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event</span> está disponible globalmente, puedes llamarlo desde cualquier lugar de
    tu aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Order;
use App\Events\OrderShipped;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
    /**
    * Ship the given order.
    *
    * @param  int  \$orderId
    * @return Response
    */
    public function ship(\$orderId)
    {
        \$order = Order::findOrFail(\$orderId);

        // Order shipment logic...

        event(new OrderShipped(\$order));
    }
}
</code></pre>


<p>TIP TIP</p>
<p>Al realizar pruebas, puede ser útil afirmar que ciertos eventos se enviaron sin activar realmente
    a tus oyentes. Las funciones de ayuda (helpers) incluidas en Laravel hace que sea fácil de
    hacerlo.</p>


<h2>Suscriptores de eventos</h2>

<h3># Escribiendo suscriptores de eventos</h3>
<p>Los suscriptores de eventos son clases que pueden suscribirse a múltiples eventos dentro de la
    misma clase, lo que te permite definir varios manejadores de eventos dentro de una sola clase.
    Los suscriptores deben definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribe</span>, al que se le pasará una
    instancia de despachador de eventos. Puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listen</span> en el
    despachador dado para registrar los oyentes de eventos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Listeners;

class UserEventSubscriber
{
    /**
    * Handle user login events.
    */
    public function handleUserLogin(\$event) {}

    /**
    * Handle user logout events.
    */
    public function handleUserLogout(\$event) {}

    /**
    * Register the listeners for the subscriber.
    *
    * @param  \Illuminate\Events\Dispatcher  \$events
    */
    public function subscribe(\$events)
    {
        \$events-&gt;listen(
            'Illuminate\Auth\Events\Login',
            'App\Listeners\UserEventSubscriber@handleUserLogin'
        );

        \$events-&gt;listen(
            'Illuminate\Auth\Events\Logout',
            'App\Listeners\UserEventSubscriber@handleUserLogout'
        );
    }
}
</code></pre>


<h3># Registrando suscriptores de eventos</h3>
<p>Después de escribir el suscriptor, estás listo para registrarlo con el despachador de eventos.
    Puede registrar suscriptores usando la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$subscribe</span> en el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>.
    Por ejemplo, vamos a agregar el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserEventSubscriber</span> a la lista:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;

class EventServiceProvider extends ServiceProvider
{
    /**
    * The event listener mappings for the application.
    *
    * @var array
    */
    protected \$listen = [
        //
    ];

    /**
    * The subscriber classes to register.
    *
    * @var array
    */
    protected \$subscribe = [
        'App\Listeners\UserEventSubscriber',
    ];
}
</code></pre>
</div>
""";