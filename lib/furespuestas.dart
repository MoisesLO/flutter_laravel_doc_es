import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuRespuestas extends StatelessWidget {
  final String title;
  FuRespuestas(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuRespuestas,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuRespuestas = """
<div style='font-size: 14.2px;'>
<h1>Respuestas HTTP</h1>
<ul>
    <li>
        Creando respuestas
        <ul>
            <li>Adjuntando encabezados a las respuestas</li>
            <li>Adjuntando cookies a las respuestas</li>
            <li>Cookies &amp; Encriptación</li>
        </ul>
    </li>
    <li>
        Redirecciones
        <ul>
            <li>Redireccionando a rutas nombradas</li>
            <li>Redireccionando a acciones de controlador</li>
            <li>Redireccionando a dominios externos</li>
            <li>Redireccionando con los datos de una sesión movida rápidamente</li>
        </ul>
    </li>
    <li>
        Otros tipos de respuestas
        <ul>
            <li>Respuestas de vista</li>
            <li>Respuestas JSON</li>
            <li>Descargas de archivo</li>
            <li>Respuestas de archivo</li>
        </ul>
    </li>
    <li>Macros de respuesta</li>
</ul>
<p></p>
<h2>Creando respuestas</h2>
<h4>Cadenas &amp; Arreglos</h4>
<p>Todas las rutas y controladores deberían devolver una respuesta para ser enviada de regreso al
    navegador del usuario. Laravel proporciona diferentes formas de devolver respuestas. La
    respuesta más básica es devolver una cadena desde una ruta o controlador. El framework
    convertirá la cadena en una respuesta HTTP completa:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/', function () {
    return 'Hello World';
});
</code></pre>

<p>Además de devolver cadenas desde tus rutas y controladores, también puedes devolver arreglos. El
    framework convertirá automáticamente el arreglo en una respuesta JSON:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/', function () {
    return [1, 2, 3];
});
</code></pre>


<p>TIP</p>
<p>
    ¿Sabías que también puedes devolver
    colecciones de Eloquent
    desde tus rutas o controladores? Estas serán convertidas automáticamente a JSON. ¡Inténtalo!
</p>


<h4>Objetos de respuesta</h4>
<p>Típicamente, no sólo estarás devolviendo cadenas básicas o arreglos desde tus acciones de ruta.
    Además, estarás devolviendo instancias <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Response</span>
    completas o vistas.</p>
<p>Devolver una instancia <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Response</span>
    completa te permite personalizar el código de estado y los encabezados HTTP de la respuesta. Una
    instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Response</span>
    hereda desde la clase <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Symfony\Component\HttpFoundation\Response</span>,
    la cual proporciona una variedad de métodos para construir respuestas HTTP:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('home', function () {
    return response('Hello World', 200)
                  -&gt;header('Content-Type', 'text/plain');
});
</code></pre>

<p></p>
<h4>Adjuntando encabezados a las respuestas</h4>
<p>Ten en cuenta que la mayoría de los métodos de respuestas son encadenables, permitiendo la
    construcción fluida de instancias de respuesta. Por ejemplo, puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">header</span>
    para agregar una serie de encabezados para la respuesta antes de enviarla de regreso al usuario:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response(\$content)
            -&gt;header('Content-Type', \$type)
            -&gt;header('X-Header-One', 'Header Value')
            -&gt;header('X-Header-Two', 'Header Value');
</code></pre>

<p>O, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withHeaders</span>
    para especificar un arreglo de encabezados para que sean agregados a la respuesta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response(\$content)
            -&gt;withHeaders([
                'Content-Type' =&gt; \$type,
                'X-Header-One' =&gt; 'Header Value',
                'X-Header-Two' =&gt; 'Header Value',
            ]);
</code></pre>

<p></p>
<h4>Adjuntando cookies a las respuestas</h4>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span> en
    las instancias de respuesta permite que adjuntes fácilmente cookies a la respuesta. Por ejemplo,
    puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span>
    para generar una cookie y adjuntarla fluidamente a la instancia de respuesta, de la siguiente
    manera:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response(\$content)
                -&gt;header('Content-Type', \$type)
                -&gt;cookie('name', 'value', \$minutes);
</code></pre>

<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span>
    también acepta unos cuantos argumentos los cuales son usados con menos frecuencia. Generalmente,
    estos argumentos tienen el mismo propósito y significado que los argumentos que serán dados al
    método nativo de PHP

    setcookie

    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>-&gt;cookie(\$name, \$value, \$minutes, \$path, \$domain, \$secure, \$httpOnly)
</code></pre>

<p>Alternativamente, puedes usar la clase facade <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie</span>
    para agregar cookies a la cola y adjuntarlas a la respuesta saliente de tu aplicación. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span>
    acepta una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie</span>
    o los argumentos que se necesitan para crear una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie</span>.
    Estas cookies serán adjuntadas a la respuesta saliente antes de que sea enviada al navegador:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cookie::queue(Cookie::make('name', 'value', \$minutes));

Cookie::queue('name', 'value', \$minutes);
</code></pre>

<p></p>
<h4>Cookies &amp; Encriptación</h4>
<p>De forma predeterminada, todos los cookies generados por Laravel son encriptados y firmados de
    modo que no puedan ser modificados o leídos por el cliente. Si prefieres deshabilitar la
    encriptación para un subconjunto de cookies generados por tu aplicación, puedes usar la
    propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$except</span>
    del middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Middleware\EncryptCookies</span>,
    el cual es localizado en el directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Middleware</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The names of the cookies that should not be encrypted.
*
* @var array
*/
protected \$except = [
    'cookie_name',
];
</code></pre>

<p></p>
<h2>Redirecciones</h2>
<p>Las respuestas redireccionadas son instancias de la clase <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\RedirectResponse</span>
    y contienen los encabezados apropiados que se necesitan para redireccionar al usuario a otra
    URL. Hay varias formas de generar una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RedirectResponse</span>.
    El método más simple es usar el helper global <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirect</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('dashboard', function () {
    return redirect('home/dashboard');
});
</code></pre>

<p>Algunas veces podrás querer redireccionar al usuario a su página previa, tal como cuando un
    formulario enviado no es válido. Puedes hacer eso usando la función helper global <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">back</span>.
    Ya que esta característica utiliza la sesión, asegurate de que la ruta llamando a la función
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">back</span>
    está usando el grupo de middleware <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span> o
    tiene todos los middleware de sesión aplicados.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::post('user/profile', function () {
    // Validate the request...

    return back()-&gt;withInput();
});
</code></pre>

<p></p>
<h3>Redireccionando a rutas nombradas</h3>
<p>Cuando ejecutas el helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirect</span>
    sin parámetros, una instancia de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Routing\Redirector</span>
    es devuelta, permitiendo que ejecutes cualquier método en la instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Redirector</span>.
    Por ejemplo, para generar una <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RedirectResponse</span>
    para una ruta nombrada, puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return redirect()-&gt;route('login');
</code></pre>

<p>Si tu ruta tiene parámetros, puedes pasarlos como segundo argumento del método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// For a route with the following URI: profile/{id}

return redirect()-&gt;route('profile', ['id' =&gt; 1]);
</code></pre>

<h4>Rellenando parámetros a través de modelos de Eloquent</h4>
<p>Si estás redireccionando a una ruta con un parámetro "ID" que está siendo rellenado desde un
    modelo Eloquent, puedas pasar el modelo como tal. El ID será extraído automáticamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// For a route with the following URI: profile/{id}

return redirect()-&gt;route('profile', [\$user]);
</code></pre>

<p>Si prefieres personalizar el valor que es colocado en el parámetro de la ruta, deberías
    sobrescribir el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getRouteKey</span>
    en tu modelo Eloquent:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the value of the model's route key.
*
* @return mixed
*/
public function getRouteKey()
{
    return \$this-&gt;slug;
}
</code></pre>

<p></p>
<h3>Redireccionando a acciones de controlador</h3>
<p>También puedes generar redirecciones a acciones de controlador. Para hacer eso, pasa el
    controlador y nombre de acción al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">action</span>.
    Recuerda, no necesitas especificar el espacio de nombres completo del controlador ya que el
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>
    de Laravel establecerá el espacio de nombres del controlador base:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return redirect()-&gt;action('HomeController@index');
</code></pre>

<p>Si tu ruta de controlador requiere parámetros, puedes pasarlos como segundo argumento del método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">action</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return redirect()-&gt;action(
    'UserController@profile', ['id' =&gt; 1]
);
</code></pre>

<p></p>
<h3>Redireccionando a dominios externos</h3>
<p>Algunas veces puedes necesitar redireccionar a un dominio fuera de tu aplicación. Puedes hacer
    eso ejecutando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">away</span>,
    el cual crea una instancia de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RedirectResponse</span>
    sin alguna codificación, validación o verificación de URL adicional:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return redirect()-&gt;away('https://www.google.com');
</code></pre>

<p></p>
<h3>Redireccionando con datos de sesión</h3>
<p>El redireccionamiento a una nueva URL y el envío de los datos de la sesión son hechos usualmente
    al mismo tiempo. Típicamente, esto es hecho después de ejecutar una acción exitosamente cuando
    mueves rápidamente un mensaje de éxito de la sesión. Por conveniencia, puedes crear una
    instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RedirectResponse</span>
    y mover rápidamente los datos de la sesión en un solo encadenamiento de método fluido:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::post('user/profile', function () {
    // Update the user's profile...

    return redirect('dashboard')-&gt;with('status', 'Profile updated!');
});
</code></pre>

<p>Después de que el usuario es redireccionado, puedes mostrar el mensaje enviado desde la sesión.
    Por ejemplo, usando la sintaxis de Blade:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@if (session('status'))
    &lt;div class="alert alert-success"&gt;
        {{ session('status') }}
    &lt;/div&gt;
@endif
</code></pre>

<p></p>
<h2>Otros tipos de respuesta</h2>
<p>El helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">response</span>
    puede ser usado para generar otros tipos de instancias de respuesta. Cuando el helper <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">response</span>
    es ejecutado sin argumentos, una implementación del contrato <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Routing\ResponseFactory</span>
    es devuelta. Este contrato proporciona varios métodos útiles para generar respuestas.</p>
<p></p>
<h3>Respuestas de vista</h3>
<p>Si necesitas control sobre el estado y encabezados de la respuesta pero también necesitas
    devolver una vista como el contenido de la respuesta, deberías usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response()
            -&gt;view('hello', \$data, 200)
            -&gt;header('Content-Type', \$type);
</code></pre>

<p>Ciertamente, si no necesitas pasar un código de estado HTTP o encabezados personalizados,
    deberías usar la función helper global <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>.
</p>
<p></p>
<h3>Respuestas JSON</h3>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">json</span>
    establecerá automáticamente el encabezado <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Content-Type</span>
    a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">application/json</span>,
    al igual que convertirá el arreglo dado a JSON usando la función de PHP <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">json_enspan</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response()-&gt;json([
    'name' =&gt; 'Abigail',
    'state' =&gt; 'CA'
]);
</code></pre>

<p>Si prefieres crear una respuesta JSONP, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">json</span> en
    combinación con el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withCallback</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response()
            -&gt;json(['name' =&gt; 'Abigail', 'state' =&gt; 'CA'])
            -&gt;withCallback(\$request-&gt;input('callback'));
</code></pre>

<p></p>
<h3>Descargas de archivo</h3>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">download</span>
    puede ser usado para generar una respuesta que fuerza al navegador del usuario a descargar el
    archivo a una ruta dada. El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">download</span>
    acepta un nombre de archivo como segundo argumento del método, el cual determinará el nombre del
    archivo que es visto por el usuario que esté descargando el archivo. Finalmente, puedes pasar un
    arreglo de encabezados HTTP como tercer argumento del método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response()-&gt;download(\$pathToFile);

return response()-&gt;download(\$pathToFile, \$name, \$headers);

return response()-&gt;download(\$pathToFile)-&gt;deleteFileAfterSend();
</code></pre>


<p>Nota</p>
<p>Symfony HttpFoundation, la cual administra las descargas de archivo, requiere que el archivo que
    esté siendo descargado tenga un nombre de archivo ASCII.</p>

<h4>Descargas en streaming</h4>
<p>Algunas veces puedes querer convertir la cadena de respuesta de una operación dada a una
    respuesta descargable sin tener que escribir los contenidos de la operación al disco. Puedes
    usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">streamDownload</span>
    en este escenario. Este método acepta un callback, un nombre de archivo y un arreglo opcional de
    encabezados como argumentos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response()-&gt;streamDownload(function () {
    echo GitHub::api('repo')
                -&gt;contents()
                -&gt;readme('laravel', 'laravel')['contents'];
}, 'laravel-readme.md');
</code></pre>

<p></p>
<h3>Respuestas de archivo</h3>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">file</span> puede
    ser usado para mostrar un archivo, tal como una imagen o PDF, directamente en el navegador del
    usuario en lugar de iniciar una descarga. Este método acepta la ruta del archivo como su primer
    argumento y un arreglo de encabezados como segundo argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response()-&gt;file(\$pathToFile);

return response()-&gt;file(\$pathToFile, \$headers);
</code></pre>

<p></p>
<h2>Macros de respuesta</h2>
<p>Si prefieres definir una respuesta personalizada que puedas volver a usar en múltiples rutas y
    controladores, puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">macro</span>
    de la clase facade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Response</span>.
    Por ejemplo, desde un método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    del proveedor de servicio</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Response;

class ResponseMacroServiceProvider extends ServiceProvider
{
    /**
    * Register the application's response macros.
    *
    * @return void
    */
    public function boot()
    {
        Response::macro('caps', function (\$value) {
            return Response::make(strtoupper(\$value));
        });
    }
}
</code></pre>

<p>La función <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">macro</span>
    acepta un nombre como su primer argumento y una Closure como segundo. La Closure de la macro
    será ejecutada al momento de ejecutar el nombre de la macro desde una implementación <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ResponseFactory</span>
    o el helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">response</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response()-&gt;caps('foo');
</code></pre>
</div>
""";