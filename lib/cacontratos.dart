import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class CaContratos extends StatelessWidget {
  final String title;
  CaContratos(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmCaContratos,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmCaContratos = """
<div style='font-size: 14.2px;'>
<h1> Contratos</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Contratos vs. facades</li>
        </ul>
    </li>
    <li>
        Cuando usar contratos
        <ul>
            <li>Bajo acoplamiento</li>
            <li>Simplicidad</li>
        </ul>
    </li>
    <li>Cómo usar contratos</li>
    <li>Referencia de contratos</li>
</ul>

<h2> Introducción</h2>
<p>Los Contratos de Laravel son un conjunto de interfaces que definen los servicios principales proporcionados por el framework. Por ejemplo, un contrato <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Queue\Queue</span> define los métodos necesarios para las colas de trabajo, mientras que el contrato <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Mail\Mailer</span> define los métodos necesarios para el envío de correos electrónicos.</p>
<p>
    Cada contrato tiene una implementación correspondiente provista por el framework. Por ejemplo, laravel proporciona una implementación de cola con una variedad de conductores (drivers), y una implementación de envío de correo electrónico que funciona con

    SwiftMailer
    <outboundlink></outboundlink>

    .
</p>
<p>
    Todos los contratos de Laravel viven en

    su repositorio de GitHub propio
    <outboundlink></outboundlink>

    . Esto proporciona un punto de referencia rápido para todos los contratos disponibles, así como un paquete único y desacoplado que puede ser utilizado por los desarrolladores de paquetes.
</p>

<h3> Contratos vs. facades</h3>
<p>
    Los
    facades
    de Laravel y las funciones de ayuda (helpers) proporcionan una forma sencilla de utilizar los servicios de Laravel sin necesidad de determinar el tipo y resolver contratos fuera del contenedor de servicios. En la mayoría de los casos, cada facade tiene un contrato equivalente.
</p>
<p>A diferencia de las facades, que no necesitan que las requieras en el constructor de su clase, los contratos te permiten definir dependencias explícitas para tus clases. Algunos desarrolladores prefieren definir explícitamente sus dependencias de esta manera y, por lo tanto, prefieren usar contratos, mientras que otros desarrolladores disfrutan de la conveniencia de las facades.</p>

<p>TIP</p>
<p>La mayoría de las aplicaciones funcionarán bien sin importar si prefieres facades o contratos. Sin embargo, si estás construyendo un paquete, debes considerar seriamente el uso de contratos, ya que será más fáciles de probar en un contexto paquete.</p>



<h2> Cuando usar contratos</h2>
<p>Como se discutió en otro lugar, gran parte de la decisión de usar contratos o facades se reducirá a los gustos personales y los gustos de su equipo de desarrollo. Tanto los contratos como las facades se pueden utilizar para crear aplicaciones Laravel robustas y bien probadas. Mientras mantengas enfocadas las responsabilidades de tu clase, notarás muy pocas diferencias prácticas entre el uso de contratos y facades.</p>
<p>Sin embargo, todavía puede tener varias preguntas con respecto a los contratos. Por ejemplo, ¿por qué usar interfaces? ¿No es más complicado usar interfaces? Detallemos las razones para utilizar interfaces en los siguientes encabezados: bajo acoplamiento y simplicidad.</p>

<h3> Bajo acoplamiento</h3>
<p>Primero, revisemos algunos códigos que están estrechamente acoplado a una implementación de caché. Considera lo siguiente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Orders;

class Repository
{
    /**
    * The cache instance.
    */
    protected \$cache;

    /**
    * Create a new repository instance.
    *
    * @param  \SomePackage\Cache\Memcached  \$cache
    * @return void
    */
    public function __construct(\SomePackage\Cache\Memcached \$cache)
    {
        \$this-&gt;cache = \$cache;
    }

    /**
    * Retrieve an Order by ID.
    *
    * @param  int  \$id
    * @return Order
    */
    public function find(\$id)
    {
        if (\$this-&gt;cache-&gt;has(\$id)) {
            //
        }
    }
}
</code></pre>

<p>En esta clase, el código está estrechamente acoplado a una implementación de caché determinada. Está estrechamente acoplado porque dependemos de una clase de caché concreta de un proveedor de paquetes. Si la API de ese paquete cambia, nuestro código también debe cambiar.</p>
<p>Del mismo modo, si queremos reemplazar nuestra tecnología de caché subyacente (Memcached) con otra tecnología (Redis), nuevamente tendremos que modificar nuestro repositorio. Nuestro repositorio no debe tener tanto conocimiento sobre quién les proporciona los datos o cómo los proporcionan.</p>
<p><strong>En lugar de este enfoque, podemos mejorar nuestro código dependiendo de una interfaz simple e independiente del proveedor:</strong></p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Orders;

use Illuminate\Contracts\Cache\Repository as Cache;

class Repository
{
    /**
    * The cache instance.
    */
    protected \$cache;

    /**
    * Create a new repository instance.
    *
    * @param  Cache  \$cache
    * @return void
    */
    public function __construct(Cache \$cache)
    {
        \$this-&gt;cache = \$cache;
    }
}
</code></pre>

<p>Ahora el código no está acoplado a ningún proveedor específico, ni siquiera a Laravel. Dado que el paquete de contratos no contiene implementación ni dependencias, puede escribir fácilmente una implementación alternativa de cualquier contrato dado, lo que le permite reemplazar su implementación de caché sin modificar ninguno de los códigos que consumen caché.</p>

<h3> Simplicidad</h3>
<p>Cuando todos los servicios de Laravel están claramente definidos dentro de interfaces simples, es muy fácil determinar la funcionalidad ofrecida por un servicio dado. <strong>Los contratos sirven como documentación sucinta de las características del framework.</strong></p>
<p>Además, cuando dependes de interfaces simples, tu código es más fácil de entender y mantener. En lugar de rastrear qué métodos están disponibles dentro de una clase grande y complicada, puedes hacer referencia a una interfaz sencilla y limpia.</p>

<h2> Cómo usar contratos</h2>
<p>Entonces, ¿Cómo se obtiene una implementación de un contrato? En realidad es bastante simple.</p>
<p>Muchos tipos de clases en Laravel se resuelven a través del contenedor de servicio, incluyendo controladores, los escuchadores de eventos, middleware, trabajos de cola e incluso una Closure de ruta. Por lo tanto, para obtener una implementación de un contrato, puede simplemente "declarar el tipo" de la interfaz en el constructor de la clase que se está resolviendo.</p>
<p>Por ejemplo, veamos este listener de eventos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Listeners;

use App\User;
use App\Events\OrderWasPlaced;
use Illuminate\Contracts\Redis\Factory;

class CacheOrderInformation
{
    /**
    * The Redis factory implementation.
    */
    protected \$redis;

    /**
    * Create a new event handler instance.
    *
    * @param  Factory  \$redis
    * @return void
    */
    public function __construct(Factory \$redis)
    {
        \$this-&gt;redis = \$redis;
    }

    /**
    * Handle the event.
    *
    * @param  OrderWasPlaced  \$event
    * @return void
    */
    public function handle(OrderWasPlaced \$event)
    {
        //
    }
}
</code></pre>

<p>Cuando se resuelve el escuchador de evento, el contenedor de servicios leerá las declaraciones de tipo en el constructor de la clase e inyectará el valor apropiado. Para obtener más información sobre cómo registrar cosas en el contenedor de servicios, consulte su documentación.</p>

<h2> Referencia de contratos</h2>
<p>Esta tabla proporciona una referencia rápida a todos los contratos de Laravel y sus facades equivalentes:</p>
<table style="border: 1px solid #CFD8DC">
    <thead>
    <tr>
        <th>Contrato</th>
        <th>Referencias de la Facade</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>

            Illuminate\Contracts\Auth\Access\Authorizable


        </td>
        <td></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\Access\Gate


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Gate</span></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\Authenticatable


        </td>
        <td></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\CanResetPassword


        </td>
        <td></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\Factory


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\Guard


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth::guard()</span></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\PasswordBroker


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Password::broker()</span></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\PasswordBrokerFactory


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Password</span></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\StatefulGuard


        </td>
        <td></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\SupportsBasicAuth


        </td>
        <td></td>
    </tr>
    <tr>
        <td>

            Illuminate\Contracts\Auth\UserProvider


        </td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Bus\Dispatcher</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Bus</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Bus\QueueingDispatcher</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Bus::dispatchToQueue()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Broadcasting\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Broadcast</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Broadcasting\Broadcaster</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Broadcast::connection()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Broadcasting\ShouldBroadcast</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Broadcasting\ShouldBroadcastNow</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Cache\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Cache\Lock</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Cache\LockProvider</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Cache\Repository</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache::driver()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Cache\Store</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Config\Repository</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Config</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Console\Application</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Console\Kernel</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Artisan</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Container\Container</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Cookie\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Cookie\QueueingFactory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie::queue()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Database\ModelIdentifier</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Debug\ExceptionHandler</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Encryption\Encrypter</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Crypt</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Events\Dispatcher</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Event</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Filesystem\Cloud</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage::cloud()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Filesystem\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Filesystem\Filesystem</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage::disk()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Foundation\Application</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Hashing\Hasher</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Hash</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Http\Kernel</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Mail\MailQueue</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail::queue()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Mail\Mailable</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Mail\Mailer</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Notifications\Dispatcher</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notification</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Notifications\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notification</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Pagination\LengthAwarePaginator</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Pagination\Paginator</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Pipeline\Hub</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Pipeline\Pipeline</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Queue\EntityResolver</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Queue\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Queue</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Queue\Job</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Queue\Monitor</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Queue</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Queue\Queue</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Queue::connection()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Queue\QueueableCollection</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Queue\QueueableEntity</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Queue\ShouldQueue</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Redis\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Redis</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Routing\BindingRegistrar</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Routing\Registrar</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Routing\ResponseFactory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Response</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Routing\UrlGenerator</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">URL</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Routing\UrlRoutable</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Session\Session</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Session::driver()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Support\Arrayable</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Support\Htmlable</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Support\Jsonable</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Support\MessageBag</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Support\MessageProvider</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Support\Renderable</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Support\Responsable</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Translation\Loader</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Translation\Translator</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Lang</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Validation\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Validation\ImplicitRule</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Validation\Rule</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Validation\ValidatesWhenResolved</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\Validation\Validator</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator::make()</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\View\Engine</td>
        <td></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\View\Factory</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">View</span></td>
    </tr>
    <tr>
        <td>Illuminate\Contracts\View\View</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">View::make()</span></td>
    </tr>
    </tbody>
</table>
</div>
""";