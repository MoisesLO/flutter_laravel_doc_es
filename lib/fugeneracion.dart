import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuGeneracion extends StatelessWidget {
  final String title;
  FuGeneracion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuGeneracion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuGeneracion = """
<div style='font-size: 14.2px;'>
<h1>Generación de URLs</h1>
<ul>
    <li>Introducción</li>
    <li>
        Fundamentos
        <ul>
            <li>Generando URLs básicas</li>
            <li>Accediendo la URL actual</li>
        </ul>
    </li>
    <li>
        URLs para rutas nombradas
        <ul>
            <li>URLs firmadas</li>
        </ul>
    </li>
    <li>URLs para acciones de controlador</li>
    <li>Valores predeterminados</li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>Laravel proporciona varios helpers para asistirte en la generación de URLs para tu aplicación.
    Éstos son útiles principalmente al momento de construir enlaces en tus plantillas y respuestas
    de API, o al momento de generar respuestas redireccionadas a otra parte de tu aplicación.</p>
<p></p>
<h2>Fundamentos</h2>
<p></p>
<h3>Generando URLs básicas</h3>
<p>El helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> puede
    ser usado para generar URLs arbitrarias en tu aplicación. La URL generada utilizará
    automáticamente el esquema (HTTP o HTTPS) y el host de la solicitud actual:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$post = App\Post::find(1);

echo url("/posts/{\$post-&gt;id}");

// http://example.com/posts/1
</code></pre>

<p></p>
<h3>Accediendo la URL actual</h3>
<p>Si ninguna ruta es proporcionada al helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span>, una
    instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Routing\UrlGenerator</span>
    es devuelta, permitiéndote que accedas información sobre la URL actual:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Obtener la URL actual sin la cadena de consulta...
echo url()-&gt;current();

// Obtener la URL actual incluyendo la cadena de consulta...
echo url()-&gt;full();

// Obtener la URL completa de la solicitud anterior...
echo url()-&gt;previous();
</code></pre>

<p>
    Cada uno de estos métodos también puede ser accedido por medio del
    facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">URL</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\URL;

echo URL::current();
</code></pre>

<p></p>
<h2>URLs para rutas nombradas</h2>
<p>El helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>
    puede ser usado para generar URLs para rutas nombradas. Las rutas nombradas permiten generar
    URLs sin estar acopladas a la URL real definida en la ruta. Por lo tanto, si la URL de la ruta
    cambia, no es necesario realizar cambios en las llamadas a la función <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>.
    Por ejemplo, imagina que tu aplicación contiene una ruta definida de la siguiente forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/post/{post}', function () {
    //
})-&gt;name('post.show');
</code></pre>

<p>Para generar una URL a esta ruta, puedes usar el helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span> así:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo route('post.show', ['post' =&gt; 1]);

// http://example.com/post/1
</code></pre>

<p>
    Con frecuencia estarás generando URLs usando la clave primaria de
    modelos de Eloquent
    . Por esta razón, puedes pasar modelos de Eloquent como valores de parámetros. El helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>
    extraerá automáticamente la clave primaria del modelo:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo route('post.show', ['post' =&gt; \$post]);
</code></pre>

<p>El helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>
    también se puede usar para generar URL para rutas con múltiples parámetros:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/post/{post}/comment/{comment}', function () {
    //
})-&gt;name('comment.show');

echo route('comment.show', ['post' =&gt; 1, 'comment' =&gt; 3]);

// http://example.com/post/1/comment/3
</code></pre>

<p></p>
<h3>URLs firmadas</h3>
<p>Laravel te permite crear fácilmente URLs "firmadas" para rutas nombradas. Estas URLs tienen un
    hash de "firma" añadido a la cadena de solicitud que le permite a Laravel verificar que la URL
    no haya sido modificada desde que fue creada. Las URLs firmadas son especialmente útiles para
    rutas que están disponibles públicamente pero necesitan una capa de protección contra la
    manipulación de URLs.</p>
<p>Por ejemplo, puedes usar URLs firmadas para implementar un enlace público de "anular suscripción"
    que es enviado por correo electrónico a tus clientes. Para crear una URL firmada para una ruta
    nombrada, usa el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">signedRoute</span>
    del facade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">URL</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\URL;

return URL::signedRoute('unsubscribe', ['user' =&gt; 1]);
</code></pre>

<p>Si te gustaría generar una ruta firmada temporal que expira, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">temporarySignedRoute</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\URL;

return URL::temporarySignedRoute(
    'unsubscribe', now()-&gt;addMinutes(30), ['user' =&gt; 1]
);
</code></pre>

<h4>Validando solicitudes a rutas firmadas</h4>
<p>Para verificar que una solicitud entrate tiene una firma válida, debes llamar al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasValidSignature</span>
    en el <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Request</span>
    entrante:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Http\Request;

Route::get('/unsubscribe/{user}', function (Request \$request) {
    if (! \$request-&gt;hasValidSignature()) {
        abort(401);
    }

    // ...
})-&gt;name('unsubscribe');
</code></pre>

<p>Alternativamente, puedes asignar el middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Routing\Middleware\ValidateSignature</span>
    a la ruta. Si aún no está presente, debes asignar una clave a este middleware en el arreglo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routeMiddleware</span>
    de tu kernel HTTP:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The application's route middleware.
*
* These middleware may be assigned to groups or used individually.
*
* @var array
*/
protected \$routeMiddleware = [
    'signed' =&gt; \Illuminate\Routing\Middleware\ValidateSignature::class,
];
</code></pre>

<p>Una vez que has registrado el middleware en tu kernel, puedes adjuntarlo a una ruta. Si la
    solicitud entrante no tiene una firma válida, el middleware automáticamente retornará una
    respuesta de error <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">403</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::post('/unsubscribe/{user}', function (Request \$request) {
    // ...
})-&gt;name('unsubscribe')-&gt;middleware('signed');
</code></pre>

<p></p>
<h2>URLs para acciones de controlador</h2>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">action</span>
    genera una URL para la acción de controlador dada. No necesitarás pasar el espacio de nombre
    completo del controlador. En lugar de eso, pasa el nombre de clase del controlador relativo al
    espacio de nombre <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = action('HomeController@index');
</code></pre>

<p>También puedes hacer referencia a acciones con una sintaxis de arreglo "callable":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Http\Controllers\HomeController;

\$url = action([HomeController::class, 'index']);
</code></pre>

<p>Si el método del controlador acepta parámetros de ruta, puedes pasarlos como segundo argumento de
    la función:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = action('UserController@profile', ['id' =&gt; 1]);
</code></pre>

<p></p>
<h2>Valores predeterminados</h2>
<p>Para algunas aplicaciones, puedes querer especificar valores predeterminados para toda la
    solicitud en los parámetros de ciertas URL. Por ejemplo, imagina que muchas de tus rutas definen
    un parámetro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{locale}</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/{locale}/posts', function () {
    //
})-&gt;name('post.index');
</code></pre>

<p>
    Es complicado pasar siempre el parámetro <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locale</span>
    cada vez que ejecutas el helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>.
    Así, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">URL::defaults</span>
    para definir un valor predeterminado para este parámetro que siempre será aplicado durante la
    solicitud actual. Puedes querer ejecutar este método desde un
    middleware de ruta
    de modo que tengas acceso a la solicitud actual:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\URL;

class SetDefaultLocaleForUrls
{
    public function handle(\$request, Closure \$next)
    {
        URL::defaults(['locale' =&gt; \$request-&gt;user()-&gt;locale]);

        return \$next(\$request);
    }
}
</code></pre>

<p>Una vez que el valor predeterminado para el parámetro <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locale</span> ha
    sido establecido, ya no estás obligado a pasar su valor al momento de generar URLs por medio del
    helper <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>.
</p>
</div>
""";