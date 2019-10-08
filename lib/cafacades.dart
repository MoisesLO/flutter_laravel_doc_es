import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class CaFacades extends StatelessWidget {
  final String title;
  CaFacades(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmCaFacades,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmCaFacades = """
<div style='font-size: 14.2px;'>
<h1> Facades</h1>
<ul>
    <li>Introducción</li>
    <li>
        Cuándo usar facades
        <ul>
            <li>Facades vs. inyección de dependencias</li>
            <li>Facades vs. funciones helper</li>
        </ul>
    </li>
    <li>Cómo funcionan las facades</li>
    <li>Facades en tiempo real</li>
    <li>Referencia de clases de facades</li>
</ul>

<h2> Introducción</h2>
<p>
    Las Facades proveen una interfaz "estática" a las clases disponibles en el
    contenedor de servicios
    de la aplicación. Laravel viene con numerosas facades, las cuales brindan acceso a casi todas las características de Laravel. Las facades de Laravel sirven como "proxies estáticas" a las clases subyacentes en el contenedor de servicios, brindando el beneficio de una sintaxis tersa y expresiva, mantieniendo mayor verificabilidad y flexibilidad que los métodos estáticos tradicionales.
</p>
<p>Todas las facades de Laravel se definen en el namespace <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Facades</span> . Entonces, podemos fácilmente acceder a una facade de esta forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Cache;

Route::get('/cache', function () {
    return Cache::get('key');
});
</code></pre>

<p>A través de la documentación de Laravel, muchos de los ejemplos usarán facades para demostrar varias características del framework.</p>

<h2> Cuándo usar facades</h2>
<p>Las Facades tienen múltiples beneficios. Brindan una sintaxis tersa y memorizable que permite utilizar las características de Laravel sin tener que recordar nombres de clase largos que deben ser inyectados o configurados manualmente. Además, debido a su uso único de los métodos dinámicos PHP, son fáciles de probar.</p>
<p>Sin embargo, deben guardarse ciertas precauciones al hacer uso de facades. El peligro principal de las facades es la corrupción de alcance de clases. Como las facades son tan fáciles de usar y no requieren inyección, puede resultar fácil dejar que tus clases sigan creciendo y usar muchas facades en una sola clase. Usando inyección de dependencias, este potencial es mitigado por la retroalimentación visual que un constructor grande te da cuando tu clase está creciendo demasiado. Entonces, al usar facades, pon especial atención al tamaño de tu clase para que su alcance de responsabilidades permanezca limitado.</p>

<p>TIP</p>
<p>
    Cuando se construye un paquete de terceros que interactúa con Laravel, es mejor inyectar
    contratos de Laravel
    en vez de usar facades. Como los paquetes son construidos fuera de Laravel, no tendrás acceso a las funciones (helpers) de testing para facades de Laravel.
</p>



<h3> Facades vs. inyección de dependencias</h3>
<p>Uno de los principales beneficios de la inyección de dependencias es la habilidad de intercambiar implementaciones de la clase inyectada. Esto es útil durante las pruebas debido a que puedes inyectar un mock o un stub y comprobar que esos métodos son llamados en el stub.</p>
<p>Típicamente, no sería posible imitar (mock) o sustituir (stub) un método de clase verdaderamente estático. Sin embargo, como las facades utilizan métodos dinámicos para hacer proxy de llamadas de método a objetos resueltos desde el contenedor de servicios, podemos de hecho probar las facades exactamente cómo probaríamos una instancia de clase inyectada. Por ejemplo, dada la siguiente ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Cache;

Route::get('/cache', function () {
    return Cache::get('key');
});
</code></pre>

<p>Podemos escribir la siguiene prueba para verificar que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache::get</span> fue llamado con el argumento esperado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Cache;

/**
* A basic functional test example.
*
* @return void
*/
public function testBasicExample()
{
    Cache::shouldReceive('get')
            -&gt;with('key')
            -&gt;andReturn('value');

    \$this-&gt;visit('/cache')
            -&gt;see('value');
}
</code></pre>


<h3> Facades vs. funciones helper</h3>
<p>Además de las facades, Laravel incluye una variedad de funciones "helper", las cuales pueden realizar tareas comunes como generar vistas, disparar eventos, despachar trabajos, o mandar respuestas HTTP. Muchas de estas funciones helper realizan la misma función que su facade correspondiente. Por ejemplo, éstas llamadas facade y helper son equivalentes:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return View::make('profile');

return view('profile');
</code></pre>

<p>No hay diferencia práctica en lo absoluto entre facades y funciones helper. Al usar funciones helper, aún se pueden probar como se probaría la facade correspondiente. Por ejemplo, dada la siguiente ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/cache', function () {
    return cache('key');
});
</code></pre>

<p>Bajo la superficie, el helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> llamará al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> en la clase subyacente a la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span>. Entonces, aún cuando estamos usando la función helper, podemos escribir la siguiente prueba para verificar que el método fue llamado con el argumento esperado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Cache;

/**
* A basic functional test example.
*
* @return void
*/
public function testBasicExample()
{
    Cache::shouldReceive('get')
         -&gt;with('key')
         -&gt;andReturn('value');

    \$this-&gt;visit('/cache')
         -&gt;see('value');
}
</code></pre>


<h2> Cómo funcionan las facades</h2>
<p>En una aplicación Laravel, una facade es una clase que provee acceso a un objeto desde el contenedor. La maquinaria que hace este trabajo está en la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Facade</span>. Las facades de Laravel y cualquier facade personalizada que crees, extenderá la clase base <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Facades\Facade</span>.</p>
<p>La clase base <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Facade</span> hace uso del método mágico <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__callStatic()</span> para aplazar las llamadas desde tu facade a un objeto resuelto desde el contenedor. En el ejemplo siguiente, se realiza una llamada al sistema de caché de Laravel. Al mirar este código, se puede suponer que se llama al método estático <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> en la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    /**
    * Show the profile for the given user.
    *
    * @param  int  \$id
    * @return Response
    */
    public function showProfile(\$id)
    {
        \$user = Cache::get('user:'.\$id);

        return view('profile', ['user' =&gt; \$user]);
    }
}
</code></pre>

<p>Nótese que cerca del inicio del archivo estamos "importando" la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span> Esta facade sirve como proxy para acceder a la implementación subyacente de la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Cache\Factory</span>. Cualquier llamada que hagamos usando la facade será pasada a la instancia subyacente del servicio de caché de Laravel.</p>
<p>Si observamos la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Facades\Cache</span> verás que no hay método estático <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>class Cache extends Facade
{
    /**
    * Get the registered name of the component.
    *
    * @return string
    */
    protected static function getFacadeAccessor() { return 'cache'; }
}
</code></pre>

<p>En su lugar, la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span> extiende la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Facade</span> y define el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getFacadeAccessor()</span>. El trabajo de este método es devolver el nombre de un enlace de contenedor de servicios. Cuando un usuario referencia cualquier método estático en la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span>, Laravel resuelve el enlace <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> desde el contenedor de servicios y ejecuta el método solicitado (en este caso, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span>) contra ese objeto.</p>

<h2> Facades en tiempo real</h2>
<p>Usando facades en tiempo real, puedes tratar cualquier clase en tu aplicación como si fuera una facade. Para ilustrar cómo esto puede ser utilizado, examinemos una alternativa. Por ejemplo, asumamos que nuestro modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Podcast</span> tiene un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publish</span>. Sin embargo, para publicar el podcast, necesitamos inyectar una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Publisher</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App;

use App\Contracts\Publisher;
use Illuminate\Database\Eloquent\Model;

class Podcast extends Model
{
    /**
    * Publish the podcast.
    *
    * @param  Publisher  \$publisher
    * @return void
    */
    public function publish(Publisher \$publisher)
    {
        \$this-&gt;update(['publishing' =&gt; now()]);

        \$publisher-&gt;publish(\$this);
    }
}
</code></pre>

<p>Inyectar una implementación de publisher dentro del método nos permite probar fácilmente el método aislado porque podemos imitar (mock) el publisher inyectado. Sin embargo, requiere que pasemos una instancia publisher cada vez que llamamos al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publish</span>. Usando facades en tiempo real, podemos mantener la misma verificabilidad sin que se requiera pasar explícitamente una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Publisher</span>. Para generar una facade en tiempo real, se añade el prefijo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Facades</span> al namespace de la clase importada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App;

use Facades\App\Contracts\Publisher;
use Illuminate\Database\Eloquent\Model;

class Podcast extends Model
{
    /**
    * Publish the podcast.
    *
    * @return void
    */
    public function publish()
    {
        \$this-&gt;update(['publishing' =&gt; now()]);

        Publisher::publish(\$this);
    }
}
</code></pre>

<p>Cuando la facade en tiempo real es utilizada, la implementación publisher será resuelta en el contenedor de servicios usando la porción de la interfaz o nombre de clase que aparece después del prefijo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Facades</span>. Al probar, podemos usar las funciones helpers de testing para facades integradas en Laravel para imitar (mock) esta llamada de método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace Tests\Feature;

use App\Podcast;
use Tests\TestCase;
use Facades\App\Contracts\Publisher;
use Illuminate\Foundation\Testing\RefreshDatabase;

class PodcastTest extends TestCase
{
    use RefreshDatabase;

    /**
    * A test example.
    *
    * @return void
    */
    public function test_podcast_can_be_published()
    {
        \$podcast = factory(Podcast::class)-&gt;create();

        Publisher::shouldReceive('publish')-&gt;once()-&gt;with(\$podcast);

        \$podcast-&gt;publish();
    }
}
</code></pre>


<h2> Referencia de clases de facades</h2>
<p>A continuación encontrarás cada facade y su clase subyacente. Esta es una herrameinta útil para explorar rápidamente dentro de la documentación API para cualquier raíz de facade dada. La llave service container binding también ha sido incluida donde aplica.</p>
<table style="border: 1px solid #CFD8DC">
    <thead>
    <tr>
        <th>Facade</th>
        <th>Class</th>
        <th>Service Container Binding</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>App</td>
        <td>Illuminate\Foundation\Application</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span></td>
    </tr>
    <tr>
        <td>Artisan</td>
        <td>

            Illuminate\Contracts\Console\Kernel
        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">artisan</span></td>
    </tr>
    <tr>
        <td>Auth</td>
        <td>

            Illuminate\Auth\AuthManager

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth</span></td>
    </tr>
    <tr>
        <td>Auth (Instance)</td>
        <td>

            Illuminate\Contracts\Auth\Guard
        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.driver</span></td>
    </tr>
    <tr>
        <td>Blade</td>
        <td>

            Illuminate\View\Compilers\BladeCompiler

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">blade.compiler</span></td>
    </tr>
    <tr>
        <td>Broadcast</td>
        <td>

            Illuminate\Contracts\Broadcasting\Factory
        </td>
        <td></td>
    </tr>
    <tr>
        <td>Broadcast (Instance)</td>
        <td>

            Illuminate\Contracts\Broadcasting\Broadcaster

        </td>
        <td></td>
    </tr>
    <tr>
        <td>Bus</td>
        <td>

            Illuminate\Contracts\Bus\Dispatcher

        </td>
        <td></td>
    </tr>
    <tr>
        <td>Cache</td>
        <td>

            Illuminate\Cache\CacheManager

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span></td>
    </tr>
    <tr>
        <td>Cache (Instance)</td>
        <td>

            Illuminate\Cache\Repository

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache.store</span></td>
    </tr>
    <tr>
        <td>Config</td>
        <td>

            Illuminate\Config\Repository

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span></td>
    </tr>
    <tr>
        <td>Cookie</td>
        <td>

            Illuminate\Cookie\CookieJar

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span></td>
    </tr>
    <tr>
        <td>Crypt</td>
        <td>

            Illuminate\Encryption\Encrypter

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">encrypter</span></td>
    </tr>
    <tr>
        <td>DB</td>
        <td>

            Illuminate\Database\DatabaseManager

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">db</span></td>
    </tr>
    <tr>
        <td>DB (Instance)</td>
        <td>

            Illuminate\Database\Connection

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">db.connection</span></td>
    </tr>
    <tr>
        <td>Event</td>
        <td>

            Illuminate\Events\Dispatcher

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">events</span></td>
    </tr>
    <tr>
        <td>File</td>
        <td>

            Illuminate\Filesystem\Filesystem

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">files</span></td>
    </tr>
    <tr>
        <td>Gate</td>
        <td>

            Illuminate\Contracts\Auth\Access\Gate

        </td>
        <td></td>
    </tr>
    <tr>
        <td>Hash</td>
        <td>

            Illuminate\Contracts\Hashing\Hasher

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hash</span></td>
    </tr>
    <tr>
        <td>Lang</td>
        <td>

            Illuminate\Translation\Translator

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">translator</span></td>
    </tr>
    <tr>
        <td>Log</td>
        <td>

            Illuminate\Log\LogManager

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">log</span></td>
    </tr>
    <tr>
        <td>Mail</td>
        <td>

            Illuminate\Mail\Mailer

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mailer</span></td>
    </tr>
    <tr>
        <td>Notification</td>
        <td>

            Illuminate\Notifications\ChannelManager

        </td>
        <td></td>
    </tr>
    <tr>
        <td>Password</td>
        <td>

            Illuminate\Auth\Passwords\PasswordBrokerManager

        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.password</span></td>
    </tr>
    <tr>
        <td>Password (Instance)</td>
        <td>

            Illuminate\Auth\Passwords\PasswordBroker


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.password.broker</span></td>
    </tr>
    <tr>
        <td>Queue</td>
        <td>

            Illuminate\Queue\QueueManager


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span></td>
    </tr>
    <tr>
        <td>Queue (Instance)</td>
        <td>

            Illuminate\Contracts\Queue\Queue


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue.connection</span></td>
    </tr>
    <tr>
        <td>Queue (Base Class)</td>
        <td>

            Illuminate\Queue\Queue


        </td>
        <td></td>
    </tr>
    <tr>
        <td>Redirect</td>
        <td>

            Illuminate\Routing\Redirector


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirect</span></td>
    </tr>
    <tr>
        <td>Redis</td>
        <td>

            Illuminate\Redis\RedisManager


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span></td>
    </tr>
    <tr>
        <td>Redis (Instance)</td>
        <td>

            Illuminate\Redis\Connections\Connection


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis.connection</span></td>
    </tr>
    <tr>
        <td>Request</td>
        <td>

            Illuminate\Http\Request


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">request</span></td>
    </tr>
    <tr>
        <td>Response</td>
        <td>

            Illuminate\Contracts\Routing\ResponseFactory


        </td>
        <td></td>
    </tr>
    <tr>
        <td>Response (Instance)</td>
        <td>

            Illuminate\Http\Response


        </td>
        <td></td>
    </tr>
    <tr>
        <td>Route</td>
        <td>

            Illuminate\Routing\Router


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">router</span></td>
    </tr>
    <tr>
        <td>Schema</td>
        <td>

            Illuminate\Database\Schema\Builder


        </td>
        <td></td>
    </tr>
    <tr>
        <td>Session</td>
        <td>

            Illuminate\Session\SessionManager


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span></td>
    </tr>
    <tr>
        <td>Session (Instance)</td>
        <td>

            Illuminate\Session\Store


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session.store</span></td>
    </tr>
    <tr>
        <td>Storage</td>
        <td>

            Illuminate\Filesystem\FilesystemManager


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filesystem</span></td>
    </tr>
    <tr>
        <td>Storage (Instance)</td>
        <td>

            Illuminate\Contracts\Filesystem\Filesystem


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filesystem.disk</span></td>
    </tr>
    <tr>
        <td>URL</td>
        <td>

            Illuminate\Routing\UrlGenerator


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span></td>
    </tr>
    <tr>
        <td>Validator</td>
        <td>

            Illuminate\Validation\Factory


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validator</span></td>
    </tr>
    <tr>
        <td>Validator (Instance)</td>
        <td>

            Illuminate\Validation\Validator


        </td>
        <td></td>
    </tr>
    <tr>
        <td>View</td>
        <td>

            Illuminate\View\Factory


        </td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span></td>
    </tr>
    <tr>
        <td>View (Instance)</td>
        <td>

            Illuminate\View\View


        </td>
        <td></td>
    </tr>
    </tbody>
</table>
</div>
""";