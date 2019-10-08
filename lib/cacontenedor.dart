import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class CaContenedor extends StatelessWidget {
  final String title;
  CaContenedor(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmCaContenedor,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmCaContenedor = """
<div style='font-size: 14.2px;'>
<h1> Contenedor de servicios</h1>
<ul>
    <li>Introducción</li>
    <li>
        Enlaces
        <ul>
            <li>Fundamentos de los enlaces</li>
            <li>Enlazando interfaces a implementaciones</li>
            <li>Enlaces contextuales</li>
            <li>Etiquetado</li>
            <li>Extendiendo enlaces</li>
        </ul>
    </li>
    <li>
        Resolviendo
        <ul>
            <li>Método make</li>
            <li>Inyección automática</li>
        </ul>
    </li>
    <li>Eventos del contenedor</li>
    <li>PSR-11</li>
</ul>

<h2> Introducción</h2>
<p>El contenedor de servicios de Laravel es una herramienta poderosa para administrar dependencias de clases y realizar inyección de dependencias. La inyección de dependencias es una frase bonita para básicamente decir: las dependencias de clases son "inyectadas" en la clase mediante el constructor o, en algunos casos, métodos "setter".</p>
<p>Echemos un vistazo a un ejemplo sencillo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\User;
use App\Repositories\UserRepository;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
    * The user repository implementation.
    *
    * @var UserRepository
    */
    protected \$users;

    /**
    * Create a new controller instance.
    *
    * @param  UserRepository  \$users
    * @return void
    */
    public function __construct(UserRepository \$users)
    {
        \$this-&gt;users = \$users;
    }

    /**
    * Show the profile for the given user.
    *
    * @param  int  \$id
    * @return Response
    */
    public function show(\$id)
    {
        \$user = \$this-&gt;users-&gt;find(\$id);

        return view('user.profile', ['user' =&gt; \$user]);
    }
}
</code></pre>

<p>
    En este ejemplo, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserController</span> necesita retornar usuarios desde una fuente de datos. Así que, <strong>inyectaremos</strong> un servicio que es capaz de retornar los usuarios. En este conexto, nuestro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserRepository</span> probablemente usa
    Eloquent
    para retornar la información de los usuarios desde la base de datos. Sin embargo, dado que el repositorio es inyectado, somos capaces de cambiarlo fácilmente con otra implementación. También somos capaces de "simular" o crear una implementación de ejemplo de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserRepository</span> al probar nuestra aplicación.
</p>
<p>Un conocimiento profundo del contenedor de servicios de Laravel es esencial para construir aplicaciones grandes y poderosas así como también contribuir al núcleo de Laravel.</p>

<h2> Enlaces</h2>

<h3> Fundamentos de los enlaces</h3>
<p>
    La mayoría de los enlaces de tu contenedor de servicios serán registrados dentro de
    proveedores de servicios
    , así que la mayoría de estos ejemplos muestra el uso del contenedor en ese contexto.
</p>

<p>TIP</p>
<p>No hay necesidad de enlazar clases al contenedor si no dependen de ninguna interfaz. El contenedor no necesita ser instruido en cómo construir esos objetos, dado que puede resolver dichos objetos automáticamente usando reflejos.</p>


<h4> Enlaces sencillos</h4>
<p>Dentro de un proveedor de servicios, siempre tienes acceso al contenedor mediante la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;app</span>. Podemos registrar un enlace usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bind</span>, pasando el nombre de la clase o interfaz que deseamos registrar junto con una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> que retorna una instancia de la clase:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;app-&gt;bind('HelpSpot\API', function (\$app) {
    return new HelpSpot\API(\$app-&gt;make('HttpClient'));
});
</code></pre>

<p>Observa que recibimos el contenedor como argumento. Podemos entonces usar el contenedor para resolver sub-dependencias del objeto que estamos construyendo.</p>
<h4> Enlazando un singleton</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">singleton</span> enlaza una clase o interfaz al contenedor que debería ser resuelto una sola vez. Una vez que el enlace de un singleton es resuelto, la misma instancia de objeto será retornada en llamadas siguientes al contenedor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;app-&gt;singleton('HelpSpot\API', function (\$app) {
    return new HelpSpot\API(\$app-&gt;make('HttpClient'));
});
</code></pre>

<h4> Enlazando instancias</h4>
<p>También puedes enlazar una instancia de objeto existente al contenedor usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">instance</span>. La instancia dada siempre será retornada en llamadas siguientes al contenedor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$api = new HelpSpot\API(new HttpClient);

\$this-&gt;app-&gt;instance('HelpSpot\API', \$api);
</code></pre>

<h4> Enlazando valores primitivos</h4>
<p>Algunas veces tendrás una clase que recibe algunas clases inyectadas, pero que también necesita un valor primitivo inyectado, como un entero. Puedes fácilmente usar enlaces contextuales para inyectar cualquier valor que tu clase pueda necesitar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;app-&gt;when('App\Http\Controllers\UserController')
          -&gt;needs('\$variableName')
          -&gt;give(\$value);
</code></pre>


<h3> Enlazando interfaces a implementaciones</h3>
<p>Una característica muy poderosa del contenedor de servicios es su habilidad para enlazar una interfaz a una implementación dada. Por ejemplo, vamos a suponer que tenemos una interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventPusher</span> y una implementación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RedisEventPusher</span>. Una vez que hemos programado nuestra implementación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RedisEventPusher</span> de esta interfaz, podemos registrarla con el contenedor de servicios de la siguiente manera:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;app-&gt;bind(
    'App\Contracts\EventPusher',
    'App\Services\RedisEventPusher'
);
</code></pre>

<p>Esta sentencia le dice al contenedor que debe inyectar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RedisEventPusher</span> cuando una clase necesita una implementación de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventPusher</span>. Ahora podemos determinar el tipo de la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventPusher</span> en un constructor o cualquier otra ubicación donde las dependencias son inyectadas por el contenedor de servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Contracts\EventPusher;

/**
* Create a new class instance.
*
* @param  EventPusher  \$pusher
* @return void
*/
public function __construct(EventPusher \$pusher)
{
    \$this-&gt;pusher = \$pusher;
}
</code></pre>


<h3> Enlaces contextuales</h3>
<p>Algunas veces tendrás dos clases que usan la misma interfaz, pero quieres inyectar diferentes implementaciones en cada clase. Por ejemplo, dos controladores pueden depender de diferentes implementaciones del contrato <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Filesystem\Filesystem</span>. Laravel proporciona una simple y fluida interfaz para definir este comportamiento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\PhotoController;
use App\Http\Controllers\VideoController;
use Illuminate\Contracts\Filesystem\Filesystem;

\$this-&gt;app-&gt;when(PhotoController::class)
          -&gt;needs(Filesystem::class)
          -&gt;give(function () {
              return Storage::disk('local');
          });

\$this-&gt;app-&gt;when([VideoController::class, UploadController::class])
          -&gt;needs(Filesystem::class)
          -&gt;give(function () {
              return Storage::disk('s3');
          });
</code></pre>


<h3> Etiquetado</h3>
<p>Ocasionalmente, puedes necesitar resolver todo de una determinada "categoría" de enlaces. Por ejemplo, puede que estés construyendo un agregador de reportes que recibe un arreglo de diferentes implementaciones de la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Report</span>. Luego de registrar las implementaciones de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Report</span>, puedes asignarles una etiqueta usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tag</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;app-&gt;bind('SpeedReport', function () {
    //
});

\$this-&gt;app-&gt;bind('MemoryReport', function () {
    //
});

\$this-&gt;app-&gt;tag(['SpeedReport', 'MemoryReport'], 'reports');
</code></pre>

<p>Una vez que los servicios han sido etiquetados, puedes resolverlos fácilmente mediante el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tagged</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;app-&gt;bind('ReportAggregator', function (\$app) {
    return new ReportAggregator(\$app-&gt;tagged('reports'));
});
</code></pre>


<h3> Extendiendo enlaces</h3>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> te permite modificar servicios resueltos. Por ejemplo, cuando un servicio es resuelto, puedes ejecutar código adicional para decorar o configurar el servicio. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> acepta un Closure, que debe retornar el servicio modificado, como único argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;app-&gt;extend(Service::class, function (\$service) {
    return new DecoratedService(\$service);
});
</code></pre>


<h2> Resolviendo</h2>

<h4> Método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span></h4>
<p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> para resolver una instancia de clase fuera del contenedor. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> acepta el nombre de la clase o interfaz que deseas resolver:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$api = \$this-&gt;app-&gt;make('HelpSpot\API');
</code></pre>

<p>Si estás en una ubicación de tu código que no tiene acceso a la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$app</span>, puedes usar el helper global <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resolve</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$api = resolve('HelpSpot\API');
</code></pre>

<p>Si algunas de las dependencias de tu clase no son resueltas mediante el contenedor, puedes inyectarlas pasándolas como un arreglo asociativo al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeWith</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$api = \$this-&gt;app-&gt;makeWith('HelpSpot\API', ['id' =&gt; 1]);
</code></pre>


<h4> Inyección automática</h4>
<p>Alternativamente, y de forma importante, puedes "determinar el tipo" de la dependencia en el constructor de una clase que es resuelta por el contenedor, incluyendo controladores, listeners de eventos, colas, middleware y más. En la práctica, así es como la mayoría de tus objetos deben ser resueltos por el contenedor.</p>
<p>Por ejemplo, puedes determinar el tipo de un repositorio definido por tu aplicación en el constructor de un controlador. El repositorio será automáticamente resuelto e inyectado en la clase:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Users\Repository as UserRepository;

class UserController extends Controller
{
    /**
    * The user repository instance.
    */
    protected \$users;

    /**
    * Create a new controller instance.
    *
    * @param  UserRepository  \$users
    * @return void
    */
    public function __construct(UserRepository \$users)
    {
        \$this-&gt;users = \$users;
    }

    /**
    * Show the user with the given ID.
    *
    * @param  int  \$id
    * @return Response
    */
    public function show(\$id)
    {
        //
    }
}
</code></pre>


<h2> Eventos del contenedor</h2>
<p>El contenedor de servicios ejecuta un evento cada vez que resuelve un objeto. Puedes escuchar a este evento usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resolving</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;app-&gt;resolving(function (\$object, \$app) {
    // Called when container resolves object of any type...
});

\$this-&gt;app-&gt;resolving(HelpSpot\API::class, function (\$api, \$app) {
    // Called when container resolves objects of type "HelpSpot\API"...
});
</code></pre>

<p>Como puedes ver, el objeto siendo resuelto será pasado a la función de retorno, permitiéndote establecer cualquier propiedad adicional en el objeto antes de que sea entregado a su consumidor.</p>

<h2> PSR-11</h2>
<p>
    El contenedor de servicios de Laravel implementa la interfaz

    PSR-11
    . Por lo tanto, puedes determinar el tipo de la interfaz de contenedor PSR-11 para obtener una instancia del contenedor de Laravel:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Psr\Container\ContainerInterface;

Route::get('/', function (ContainerInterface \$container) {
    \$service = \$container-&gt;get('Service');

    //
});
</code></pre>

<p>Una excepción es mostrada si el identificador dado no puede ser resuelto. La excepción será una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Psr\Container\NotFoundExceptionInterface</span> si el identificador nunca fue enlazado. Si el identificador fue enlazado pero ha sido incapaz de resolver, una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Psr\Container\ContainerExceptionInterface</span> será mostrada.</p>
</div>
""";