import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuMiddleware extends StatelessWidget {
  final String title;
  FuMiddleware(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuMiddleware,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuMiddleware = """
<div style='font-size: 14.2px;'>
<h1>Middleware</h1>
<ul>
    <li>Introducción</li>
    <li>Definiendo un Middleware</li>
    <li>
        Registrando un Middleware
        <ul>
            <li>Middleware Globales</li>
            <li>Asignando un Middleware a una Ruta</li>
            <li>Middleware Grupales</li>
            <li>Clasificación de Middleware</li>
        </ul>
    </li>
    <li>Parámetros en los Middleware</li>
    <li>Middleware Terminable</li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>Los Middleware proporcionan un mecanismo conveniente para filtrar consultas HTTP en toda tu
    aplicación. Por ejemplo, Laravel incluye un middleware que verifica si el usuario de tu
    aplicación está autenticado. Si el usuario no está autenticado, el middleware redireccionará al
    usuario a la pantalla de inicio de sesión. Sin embargo, si el usuario es autenticado, el
    middleware permitirá que la consulta proceda dentro de la aplicación.</p>
<p>Middleware adicionales pueden ser escritos para realizar una variedad de tareas además de
    autenticar. Un núcleo de un middleware podría ser responsable de agregar los encabezados
    apropiados para todas las respuestas que va dejando tu aplicación. Un middleware de registro
    podría registrar todas las consultas entrantes en tu aplicación.</p>
<p>Hay varios middleware incluidos en el framework Laravel, incluyendo middleware para autenticación
    y protección CSRF. Todos esos middleware están localizados en el directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Middleware</span>.
</p>
<p></p>
<h2>Definiendo un Middleware</h2>
<p>Para crear un nuevo middleware, usa el comando de Artisan: <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:middleware</span>
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:middleware CheckAge
</code></pre>

<p>Este comando ubicará una nueva clase <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">CheckAge</span>
    dentro de tu directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Middleware</span>.
    En este middleware, nosotros solo permitiremos el acceso a la ruta si la <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">edad</span>
    suministrada es mayor que 200. De otra forma, redireccionaremos a los usuarios de vuelta a la
    URL <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">home</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Middleware;

use Closure;

class CheckAge
{
    /**
    * Handle an incoming request.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @param  \Closure  \$next
    * @return mixed
    */
    public function handle(\$request, Closure \$next)
    {
        if (\$request-&gt;age &lt;= 200) {
            return redirect('home');
        }

        return \$next(\$request);
    }
}
</code></pre>

<p>Como puedes ver, si la <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">edad</span> dada
    es menor o igual a <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">200</span>,
    el middleware retornará una redirección HTTP al cliente; de otra forma, la solicitud pasará más
    adentro de la aplicación. Para pasar la solicitud más profundo dentro de la aplicación
    (permitiendo al middleware "pasar") llama al callback <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$next</span>
    con el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$request</span>.
</p>
<p>Es mejor visualizar el middleware como una serie de "capas" que deben pasar las solicitudes HTTP
    antes de que lleguen a tu aplicación. Cada capa puede examinar la solicitud e incluso rechazarla
    por completo.</p>

<p>TIP</p>
<p>
    Todos los middleware son resueltos a través del
    contenedor de servicio
    , de esta forma, puedes declarar el tipo de cualquier dependencia que necesites dentro del
    constructor del middleware.
</p>


<h3>Middleware Before y After</h3>
<p>Que un middleware se ejecute antes o después de una solicitud depende del middleware en sí mismo.
    Por ejemplo, el siguiente middleware podría realizar alguna tarea <strong>antes</strong> que la
    solicitud sea manejada por la aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Middleware;

use Closure;

class BeforeMiddleware
{
    public function handle(\$request, Closure \$next)
    {
        // Perform action

        return \$next(\$request);
    }
}
</code></pre>

<p>Sin embargo, este middleware podría realizar esta tarea <strong>despúes</strong> de que la
    solicitud sea manejada por la aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Middleware;

use Closure;

class AfterMiddleware
{
    public function handle(\$request, Closure \$next)
    {
        \$response = \$next(\$request);

        // Perform action

        return \$response;
    }
}
</code></pre>

<p></p>
<h2>Registrando un Middleware</h2>
<p></p>
<h3>Middleware Globales</h3>
<p>Si tu quieres que un middleware corra durante cada solicitud HTTP a tu aplicación, lista la clase
    del middleware en la propiedad <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$middleware</span>
    de tu clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Kernel.php</span>.
</p>
<p></p>
<h3>Asignando un Middleware a las Rutas</h3>
<p>Si te gustaría asignar un middleware a rutas específicas, deberías primero asignar una clave al
    middleware en tu archivo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Kernel.php</span>.
    Por defecto, la propiedad<span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$routeMiddleware</span>
    de esta clase contiene entradas para los middleware incluidos con Laravel. Para agregar uno
    propio, adjúntalo a esta lista y asígnale una clave de tu elección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Within App\Http\Kernel Class...

protected \$routeMiddleware = [
    'auth' =&gt; \App\Http\Middleware\Authenticate::class,
    'auth.basic' =&gt; \Illuminate\Auth\Middleware\AuthenticateWithBasicAuth::class,
    'bindings' =&gt; \Illuminate\Routing\Middleware\SubstituteBindings::class,
    'cache.headers' =&gt; \Illuminate\Http\Middleware\SetCacheHeaders::class,
    'can' =&gt; \Illuminate\Auth\Middleware\Authorize::class,
    'guest' =&gt; \App\Http\Middleware\RedirectIfAuthenticated::class,
    'signed' =&gt; \Illuminate\Routing\Middleware\ValidateSignature::class,
    'throttle' =&gt; \Illuminate\Routing\Middleware\ThrottleRequests::class,
    'verified' =&gt; \Illuminate\Auth\Middleware\EnsureEmailIsVerified::class,
];
</code></pre>

<p>Una vez el middleware ha sido definido en el núcleo HTTP, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">middleware</span>
    para asignar un middleware a una ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('admin/profile', function () {
    //
})-&gt;middleware('auth');
</code></pre>

<p>Puedes además asignar multiples middleware a la ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/', function () {
    //
})-&gt;middleware('first', 'second');
</code></pre>

<p>Cuando asignas middleware, puedes además pasar un nombre de clase plenamente calificado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Http\Middleware\CheckAge;

Route::get('admin/profile', function () {
    //
})-&gt;middleware(CheckAge::class);
</code></pre>

<p></p>
<h3>Grupos de Middleware</h3>
<p>Algunas veces puedes querer agrupar varios middleware bajo una sola clave para hacerlos más
    fáciles de asignar a las rutas. Puedes hacer esto usando la propiedad <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$middlewareGroups</span>
    de tu kernel HTTP.</p>
<p>Por defecto, Laravel viene con los grupos de middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api</span> que
    contienen middleware comunes que puedes aplicar a la UI de tu web y a las rutas de tu API:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The application's route middleware groups.
*
* @var array
*/
protected \$middlewareGroups = [
    'web' =&gt; [
        \App\Http\Middleware\EncryptCookies::class,
        \Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse::class,
        \Illuminate\Session\Middleware\StartSession::class,
        \Illuminate\View\Middleware\ShareErrorsFromSession::class,
        \App\Http\Middleware\VerifyCsrfToken::class,
        \Illuminate\Routing\Middleware\SubstituteBindings::class,
    ],

    'api' =&gt; [
        'throttle:60,1',
        'auth:api',
    ],
];
</code></pre>

<p>Los grupos de Middleware pueden ser asignados a las rutas y las acciones de los controladores
    usando la misma sintaxis como los middleware individuales. De nuevo, los grupos de middleware
    hacen más conveniente asignar muchos middleware a una ruta a la vez:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/', function () {
    //
})-&gt;middleware('web');

Route::group(['middleware' =&gt; ['web']], function () {
    //
});
</code></pre>


<p>TIP</p>
<p>Por defecto, el grupo de middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span> es
    automaticamente aplicado a tu archivo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/web.php</span>
    por el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>.
</p>

<p></p>
<h3>Clasificación de Middleware</h3>
<p>Raramente, necesitarás que tu middleware se ejecute en un orden específico pero no tienes control
    sobre su orden cuando son asignados a una ruta. En este caso, puedes especificar la prioridad de
    tu middleware usando la propiedad <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$middlewarePriority</span>
    de tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Kernel.php</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The priority-sorted list of middleware.
*
* This forces non-global middleware to always be in the given order.
*
* @var array
*/
protected \$middlewarePriority = [
    \Illuminate\Session\Middleware\StartSession::class,
    \Illuminate\View\Middleware\ShareErrorsFromSession::class,
    \App\Http\Middleware\Authenticate::class,
    \Illuminate\Session\Middleware\AuthenticateSession::class,
    \Illuminate\Routing\Middleware\SubstituteBindings::class,
    \Illuminate\Auth\Middleware\Authorize::class,
];
</code></pre>

<p></p>
<h2>Parámetros en los middleware</h2>
<p>Los middleware pueden además recibir parámetros adicionales. Por ejemplo, si tu aplicación
    necesita verificar que el usuario autenticado tiene un "rol" dado antes de ejecutar una acción
    dada, podrías crear un middleware <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">CheckRole</span>
    que reciba un nombre de rol como un argumento adicional.</p>
<p>Los parámetros adicionales en el middleware serán pasados al middleware después del argumento
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$next</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Middleware;

use Closure;

class CheckRole
{
    /**
    * Handle the incoming request.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @param  \Closure  \$next
    * @param  string  \$role
    * @return mixed
    */
    public function handle(\$request, Closure \$next, \$role)
    {
        if (! \$request-&gt;user()-&gt;hasRole(\$role)) {
            // Redirect...
        }

        return \$next(\$request);
    }

}
</code></pre>

<p>Los parámetros en los middleware pueden ser especificados al definir la ruta separando el nombre
    del middleware y los parámetros con <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:</span>.
    Múltiples parámetros deben ser delimitados por comas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::put('post/{id}', function (\$id) {
    //
})-&gt;middleware('role:editor');
</code></pre>

<p></p>
<h2>Middleware terminable</h2>
<p>Algunas veces un middleware puede necesitar hacer algún trabajo después de que la respuesta HTTP
    ha sido preparada. Por ejemplo, el middleware "session" incluído con Laravel escribe los datos
    de la sesión para almacenarlos después de que la respuesta ha sido totalmente preparada. Si
    defines un método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">terminate</span>
    en tu middleware, este automáticamente será llamado despúes de que la respuesta esté lista para
    ser enviada al navegador.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace Illuminate\Session\Middleware;

use Closure;

class StartSession
{
    public function handle(\$request, Closure \$next)
    {
        return \$next(\$request);
    }

    public function terminate(\$request, \$response)
    {
        // Store the session data...
    }
}
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">terminate</span>
    debería recibir tanto la consulta como la respuesta. Una vez has definido el middleware
    terminable, deberías agregarlo a la lista de rutas o como un middleware global en el archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Kernel.php</span>.
</p>
<p>Cuando llamas al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">terminate</span>
    en tu middleware, Laravel resolverá una instancia fresca del middleware del contenedor de
    servicio. Si deseas utilizar la misma instancia del middleware cuando los métodos <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span>
    y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">terminate</span>
    sean llamados, registra el middleware con el contenedor usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">singleton</span>
    del contenedor.</p>
    </div>
""";