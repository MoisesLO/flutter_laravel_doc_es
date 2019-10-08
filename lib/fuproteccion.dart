import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuProteccion extends StatelessWidget {
  final String title;
  FuProteccion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuProteccion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuProteccion = """
<div style='font-size: 14.2px;'>
<h1>Protección CSRF</h1>
<ul>
    <li>Introducción</li>
    <li>Excluyendo URIs</li>
    <li>X-CSRF-Token</li>
    <li>X-XSRF-Token</li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>
    Laravel hace que sea fácil proteger tu aplicación de ataques de tipo

    cross-site request forgery
    <outboundlink></outboundlink>

    (CSRF). Los ataques de tipo CSRF son un tipo de explotación de vulnerabilidad malicioso por el
    cual comandos no autorizados son ejecutados en nombre de un usuario autenticado.
</p>
<p>Laravel genera automáticamente un "token" CSRF para cada sesión de usuario activa manejada por la
    aplicación. Este token es usado para verificar que el usuario autenticado es quien en realidad
    está haciendo la petición a la aplicación.</p>
<p>En cualquier momento que definas un formulario HTML en tu aplicación, debes incluir un campo de
    token CSRF en el formulario con el propósito de que el middleware para protección CSRF pueda
    validar la solicitud. Puedes usar la directiva de Blade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@csrf</span>
    para generar el campo de token:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;form method="POST" action="/profile"&gt;
    @csrf
    ...
&lt;/form&gt;
</code></pre>

<p>
    El
    middleware
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">VerifyCsrfToken</span>,
    el cual es incluido en el grupo de middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>,
    verificará automáticamente que el token en el campo de la solicitud coincida con el almacenado
    en la sesión.
</p>
<h4>Tokens CSRF &amp; JavaScript</h4>
<p>Cuando se crean aplicaciones controladas por JavaScript, es conveniente hacer que tu biblioteca
    HTTP de JavaScript agregue el token CSRF a cada petición saliente. Por defecto, el archivo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/bootstrap.js</span>
    registra el valor de la meta etiqueta <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">csrf-token</span>
    con la biblioteca HTTP Axios. Si no estás usando esta biblioteca, necesitarás configurar este
    comportamiento de forma manual para tu aplicación.</p>
<p></p>
<h2>Excluyendo las URIs de la protección CSRF</h2>
<p>
    Algunas veces puedes desear excluir un conjunto de URIs de la protección CSRF. Por ejemplo, si
    estás usando

    Stripe
    <outboundlink></outboundlink>

    para procesar pagos y estás utilizando su sistema webhook, necesitarás excluir tu ruta de
    manejador webhook de Stripe de la protección CSRF ya que Stripe no sabrá que token CSRF enviar a
    sus rutas.
</p>
<p>Típicamente, deberías colocar este tipo de rutas afuera del grupo de middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span> que el
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>
    aplica a todas las rutas en el archivo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/web.php</span>.
    Sin embargo, también puedes excluir las rutas al añadir sus URIs a la propiedad <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">except</span>
    del middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">VerifyCsrfToken</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Middleware;

use Illuminate\Foundation\Http\Middleware\VerifyCsrfToken as Middleware;

class VerifyCsrfToken extends Middleware
{
    /**
    * The URIs that should be excluded from CSRF verification.
    *
    * @var array
    */
    protected \$except = [
        'stripe/*',
        'http://example.com/foo/bar',
        'http://example.com/foo/*',
    ];
}
</code></pre>


<p>TIP</p>
<p>
    El middleware CSRF está deshabilitado automáticamente al
    ejecutar pruebas
    .
</p>


<p></p>
<h2>X-CSRF-TOKEN</h2>
<p>Además de comprobar el token CSRF como parámetro POST, el middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">VerifyCsrfToken</span>
    también comprobará el encabezado de solicitud <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">X-CSRF-TOKEN</span>.
    Podrías, por ejemplo, almacenar el token en una etiqueta <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">meta</span>
    de HTML:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;meta name="csrf-token" content="{{ csrf_token() }}"&gt;
</code></pre>

<p>Entonces, una vez que has creado la etiqueta <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">meta</span>,
    puedes instruir una biblioteca como jQuery para añadir automáticamente el token a todos los
    encabezados de las peticiones. Esto proporciona protección CSRF fácil y conveniente para tus
    aplicaciones basadas en AJAX.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': \$('meta[name="csrf-token"]').attr('content')
    }
});
</code></pre>


<p>TIP</p>
<p>Por defecto, el archivo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/bootstrap.js</span>
    registra el valor de la etiqueta meta <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">csrf-token</span>
    con la biblioteca HTTP Axios. Si no estás usando esta biblioteca, necesitarás configurar este
    comportamiento de forma manual para tu aplicación.</p>

<p></p>
<h2>X-XSRF-TOKEN</h2>
<p>Laravel almacena el token CSRF actual en una cookie <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">XSRF-TOKEN</span>
    que es incluida con cada respuesta generada por el framework. Puedes usar el valor del cookie
    para establecer el encabezado de la solicitud <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">X-XSRF-TOKEN</span>.
</p>
<p>Esta cookie primeramente es enviada por conveniencia ya que algunos frameworks JavaScript y
    librerías, como Angular y Axios colocan automáticamente su valor en el encabezado <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">X-XSRF-TOKEN</span>.
</p>
</div>
""";