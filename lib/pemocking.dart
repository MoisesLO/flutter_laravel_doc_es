import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PeMocking extends StatelessWidget {
  final String title;
  PeMocking(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmPeMocking,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmPeMocking = """
<!-- Mocking -->
<div style='font-size: 14.2px;'>
  <h1>Mocking</h1>
  <ul>
    <li>Introducción</li>
    <li>Mocking de objectos</li>
    <li>Fake de trabajos (Jobs)</li>
    <li>
      Fake de eventos
      <ul>
        <li>Fake de eventos con alcance</li>
      </ul>
    </li>
    <li>Fake de correos electrónicos</li>
    <li>Fake de notificaciones</li>
    <li>Fake de colas</li>
    <li>Fake de almacenamiento de archivos</li>
    <li>Clases facade</li>
  </ul>

  <h2>Introducción</h2>
  <p>Al momento de probar aplicaciones de Laravel, puedes querer "simular" (mock) ciertos aspectos de tu aplicación de modo que realmente no sean ejecutados durante una prueba dada. Por ejemplo, al momento de probar un controlador que despacha un evento, puedes querer simular los listeners de eventos de modo que realmente no se ejecuten durante la prueba. Esto te permite probar solamente la respuesta HTTP del controlador sin preocuparte por la ejecución de los listeners de eventos, ya que los listeners de eventos pueden ser evaluados en sus propios casos de prueba.</p>
  <p>
    Laravel provee funciones helpers para simular eventos, tareas y clases facades predeterminadas. Estos helpers proporcionan principalmente una capa conveniente sobre la clase Mockery de modo que no tengas que hacer manualmente llamadas complicadas a métodos Mockery. Puedes también usar Mockery
    <outboundlink></outboundlink>
    o PHPUnit para crear tus propios mocks o spies.
  </p>

  <h2>Mocking de objetos</h2>
  <p>Cuando hagas mocking de un objeto que vas a inyectar en tu aplicación a través del contenedor de servicio de Laravel, debes enlazar tu instancia a la que le has hecho mocking al contenedor como un enlace de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">instance</span>. Esto le indicará al contenedor que use tu instancia "mockeada" del objeto en lugar de construir el propio objeto:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Mockery;
use App\Service;

\$this-&gt;instance(Service::class, Mockery::mock(Service::class, function (\$mock) {
    \$mock-&gt;shouldReceive('process')-&gt;once();
}));
</code></pre>

  <p>Para hacer esto más conveniente, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mock</span>, que es proporcionado por la clase TestCase base de Laravel:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\Service;

\$this-&gt;mock(Service::class, function (\$mock) {
    \$mock-&gt;shouldReceive('process')-&gt;once();
});
</code></pre>

  <p>De forma similar, si quieres espiar un objeto, la clase de prueba base de Laravel ofrece un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">spy</span> como un wrapper conveniente del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mockery::spy</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\Service;

\$this-&gt;spy(Service::class, function (\$mock) {
    \$mock-&gt;shouldHaveReceived('process');
});
</code></pre>

  <h2>Fake de trabajos (jobs)</h2>
  <p>Como una alternativa a mocking, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Bus</span> para evitar que determinadas tareas sean despachadas. Al momento de usar fakes, las aserciones serán hechas después de que el código bajo prueba sea ejecutado.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Jobs\ShipOrder;
use Illuminate\Support\Facades\Bus;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    public function testOrderShipping()
    {
        Bus::fake();

        // Perform order shipping...

        Bus::assertDispatched(ShipOrder::class, function (\$job) use (\$order) {
            return \$job-&gt;order-&gt;id === \$order-&gt;id;
        });

        // Comprueba que un trabajo no fue enviado...
        Bus::assertNotDispatched(AnotherJob::class);
    }
}
</code></pre>

  <h2>Fake de eventos</h2>
  <p>Como una alternativa a mocking, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Event</span> para prevenir la ejecución de todos los listeners de eventos. Después puedes comprobar que los eventos fueron despachados e incluso inspeccionar los datos que recibieron. Al momento de usar fakes, las aserciones son hechas después de que el código bajo prueba sea ejecutado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Events\OrderShipped;
use App\Events\OrderFailedToShip;
use Illuminate\Support\Facades\Event;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    /**
    * Test order shipping.
    */
    public function testOrderShipping()
    {
        Event::fake();

        // Perform order shipping...

        Event::assertDispatched(OrderShipped::class, function (\$e) use (\$order) {
            return \$e-&gt;order-&gt;id === \$order-&gt;id;
        });

        // Comprueba que un evento fue enviado dos veces...
        Event::assertDispatched(OrderShipped::class, 2);

        // Comprueba que un evento no fue enviado...
        Event::assertNotDispatched(OrderFailedToShip::class);
    }
}
</code></pre>

  <p>Nota</p>
  <p>Después de llamar a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Event::fake()</span>, no se ejecutarán listeners de eventos. Entonces, si tus pruebas usan model factories que dependen de eventos, cómo crear una UUID durante el evento de modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">creating</span>, debes llamar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Event::fake()</span>
    <strong>después</strong> de usar tus factories.</p>

  <h4>Haciendo fake a un subconjunto de eventos</h4>
  <p>Si sólo si deseas hacer fake a listeners de eventos para un grupo específico de eventos, puedes pasarlos a los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fakeFor</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Test order process.
*/
public function testOrderProcess()
{
    Event::fake([
        OrderCreated::class,
    ]);

    \$order = factory(Order::class)-&gt;create();

    Event::assertDispatched(OrderCreated::class);

    // Otros eventos se envían de forma normal...
    \$order-&gt;update([...]);
}
</code></pre>

  <h3>Fake de eventos con alcance</h3>
  <p>Si sólo quieres hacer fake a oyentes de eventos para una porción de la prueba, se puede usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fakeFor</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use App\Order;
use Tests\TestCase;
use App\Events\OrderCreated;
use Illuminate\Support\Facades\Event;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    /**
    * Test order process.
    */
    public function testOrderProcess()
    {
        \$order = Event::fakeFor(function () {
            \$order = factory(Order::class)-&gt;create();

            Event::assertDispatched(OrderCreated::class);

            return \$order;
        });

        // Los eventos se envían normalmente y los observadores se ejecutarán...
        \$order-&gt;update([...]);
    }
}
</code></pre>

  <h2>Fake de correos electrónicos</h2>
  <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail</span> para prevenir que los correos sean enviados. Después puedes comprobar qué correos de clases mailables fueron enviados a los usuarios e incluso inspeccionar los datos que recibieron. Al momento de usar fakes, las aserciones son hechas después de que el código bajo prueba sea ejecutado.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Mail\OrderShipped;
use Illuminate\Support\Facades\Mail;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    public function testOrderShipping()
    {
        Mail::fake();

        // Comprueba que no se enviaron mailables...
        Mail::assertNothingSent();

        // Perform order shipping...

        Mail::assertSent(OrderShipped::class, function (\$mail) use (\$order) {
            return \$mail-&gt;order-&gt;id === \$order-&gt;id;
        });

        // Comprueba que un mensaje fue enviado a los usuarios dados...
        Mail::assertSent(OrderShipped::class, function (\$mail) use (\$user) {
            return \$mail-&gt;hasTo(\$user-&gt;email) &amp;&amp;
                    \$mail-&gt;hasCc('...') &amp;&amp;
                    \$mail-&gt;hasBcc('...');
        });

        // Comprueba que un correo electrónico fue enviado dos veces...
        Mail::assertSent(OrderShipped::class, 2);

        // Comprueba que un correo electrónico no fue enviado...
        Mail::assertNotSent(AnotherMailable::class);
    }
}
</code></pre>

  <p>Si estás haciendo colas de mailables para su entrega en segundo plano, deberías usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertQueued</span> en lugar de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertSent</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Mail::assertQueued(...);
Mail::assertNotQueued(...);
</code></pre>

  <h2>Fake de notificaciones</h2>
  <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notification</span> para prevenir que se envíen las notificaciones. Después puedes comprobar qué notificaciones fueron enviadas a los usuarios e incluso inspeccionar los datos que recibieron. Al momento de usar fakes, las aserciones son hechas después de que el código bajo prueba es ejecutado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Notifications\OrderShipped;
use Illuminate\Support\Facades\Notification;
use Illuminate\Notifications\AnonymousNotifiable;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    public function testOrderShipping()
    {
        Notification::fake();

        // Comprueba que no se enviaron notificaciones...
        Notification::assertNothingSent();

        // Perform order shipping...

        Notification::assertSentTo(
            \$user,
            OrderShipped::class,
            function (\$notification, \$channels) use (\$order) {
                return \$notification-&gt;order-&gt;id === \$order-&gt;id;
            }
        );

        // Comprueba que una notificación fue enviada a los usuarios dados...
        Notification::assertSentTo(
            [\$user], OrderShipped::class
        );

        // Comprueba que una notificación no fue enviada...
        Notification::assertNotSentTo(
            [\$user], AnotherNotification::class
        );

        // Comprueba que se envió una notificación mediante el método Notification::route ()...
        Notification::assertSentTo(
            new AnonymousNotifiable, OrderShipped::class
        );
    }
}
</code></pre>

  <h2>Fake de colas</h2>
  <p>Como alternativa a mocking, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Queue</span> para prevenir que las tareas sean encoladas. Después puedes comprobar que tareas fueron agregadas a la cola e incluso inspeccionar los datos que recibieron. Al momento de usar fakes, las aserciones son hechas después de que el código bajo prueba es ejecutado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Jobs\ShipOrder;
use Illuminate\Support\Facades\Queue;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    public function testOrderShipping()
    {
        Queue::fake();

        // Comprueba que no se agregaron trabajos...
        Queue::assertNothingPushed();

        // Perform order shipping...

        Queue::assertPushed(ShipOrder::class, function (\$job) use (\$order) {
            return \$job-&gt;order-&gt;id === \$order-&gt;id;
        });

        // Comprueba que un trabajo fue agregado a una cola dada...
        Queue::assertPushedOn('queue-name', ShipOrder::class);

        // Comprueba que un trabajo fue agregado dos veces...
        Queue::assertPushed(ShipOrder::class, 2);

        // Comprueba que un trabajo no fue agregado...
        Queue::assertNotPushed(AnotherJob::class);

        // Comprueba que un trabajo fue agregado con una cadena específica...
        Queue::assertPushedWithChain(ShipOrder::class, [
            AnotherJob::class,
            FinalJob::class
        ]);
    }
}
</code></pre>

  <h2>Fake de almacenamiento de archivos</h2>
  <p>El método fake de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span> permite que generes fácilmente un disco falso que, combinado con las utilidades de generación de archivo de la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UploadedFile</span>, simplifica mucho la prueba de subidas de archivos. Por ejemplo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    public function testAlbumUpload()
    {
        Storage::fake('photos');

        \$response = \$this-&gt;json('POST', '/photos', [
            UploadedFile::fake()-&gt;image('photo1.jpg'),
            UploadedFile::fake()-&gt;image('photo2.jpg')
        ]);

        // Comprueba que uno o más archivos fueron almacenados...
        Storage::disk('photos')-&gt;assertExists('photo1.jpg');
        Storage::disk('photos')-&gt;assertExists(['photo1.jpg', 'photo2.jpg']);

        // Comprueba que uno o más archivos no fueron almacenados...
        Storage::disk('photos')-&gt;assertMissing('missing.jpg');
        Storage::disk('photos')-&gt;assertMissing(['missing.jpg', 'non-existing.jpg']);
    }
}
</code></pre>

  <p>TIP</p>
  <p>De forma predeterminada, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> borrará todos los archivos en su directorio temporal. Si prefieres mantener estos archivos, puedes usar en su lugar el método "persistentFake".
  </p>

  <h2>Las clases facade</h2>
  <p>Diferente de las llamadas de métodos estáticos tradicionales, las clases facade pueden ser simuladas (mock). Esto proporciona una gran ventaja sobre los métodos estáticos tradicionales y te concede la misma capacidad de prueba que tendrías si estuvieras usando inyección de dependencias. Al momento de probar, con frecuencia puedes querer simular una llamada a una clase facade de Laravel en uno de tus controladores. Por ejemplo, considera la siguiente acción de controlador:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    /**
    * Show a list of all users of the application.
    *
    * @return Response
    */
    public function index()
    {
        \$value = Cache::get('key');

        //
    }
}
</code></pre>

  <p>
    Podemos simular (mock) la ejecución de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span> usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shouldReceive</span>, el cual devolverá una instancia mock de la clase Mockery . Ya que las clases facades realmente son resueltas y administradas por el contenedor de servicios de Laravel, tendrán mucho más capacidad de prueba que una clase estática típica. Por ejemplo, vamos a simular (mock) nuestra llamada al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> de la clase facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Support\Facades\Cache;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class UserControllerTest extends TestCase
{
    public function testGetIndex()
    {
        Cache::shouldReceive('get')
                    -&gt;once()
                    -&gt;with('key')
                    -&gt;andReturn('value');

        \$response = \$this-&gt;get('/users');

        // ...
    }
}
</code></pre>

  <p>Nota</p>
  <p>No deberías hacer mock a la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Request</span>. En lugar de eso, pasa la entrada que deseas dentro de los métodos helper HTTP tales como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post</span> al momento de ejecutar tus pruebas. Del mismo modo, en lugar de simular (mock) la clase facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Config</span>, ejecuta el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Config::set</span> en tus pruebas.</p>
</div>
""";