import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuErrores extends StatelessWidget {
  final String title;
  FuErrores(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuErrores,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuErrores = """
<div style='font-size: 14.2px;'>
<h1>Manejo de Errores</h1>
<ul>
    <li>Introducción</li>
    <li>Configuración</li>
    <li>
        Manejador de excepciones
        <ul>
            <li>Método report</li>
            <li>Método render</li>
            <li>Excepciones renderizables y reportables</li>
        </ul>
    </li>
    <li>
        Excepciones HTTP
        <ul>
            <li>Páginas de error HTTP personalizadas</li>
        </ul>
    </li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>Cuando comienzas un nuevo proyecto de Laravel, el manejo de excepciones y errores ya está
    configurado para ti. La clase <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Exceptions\Handler</span>
    es donde todas las excepciones disparadas por tu aplicación son registradas y después
    renderizadas de vuelta al usuario. Revisaremos más profundamente dentro de esta clase a través
    de esta documentación.</p>
<p></p>
<h2>Configuración</h2>
<p>La opción <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">debug</span> en
    tu archivo de configuración <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>
    determina cuanta información sobre un error se muestra realmente al usuario. Por defecto, esta
    opción es establecida para respetar el valor de la variable de entorno <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">APP_DEBUG</span>,
    la cual es almacenada en tu archivo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span>.
</p>
<p>Para desarrollo local, deberías establecer la variable de entorno a <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>. En
    tu entorno de producción, este valor debería estar siempre <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>.
    Si el valor es establecido a <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>
    en producción, te arriesgas a exponer valores de configuración sensitivos a los usuarios finales
    de tu aplicación.</p>
<p></p>
<h2>Manejador de excepciones</h2>
<p></p>
<h3>Método report</h3>
<p>
    Todas las excepciones son manejadas por la clase <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Exceptions\Handler</span>.
    Esta clase contiene dos métodos: <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">render</span>.
    Examinaremos cada uno de estos métodos en detalle. El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span> se
    usa para registrar excepciones o enviarlas a un servicio externo como

    Bugsnag
    <outboundlink></outboundlink>

    o

    Sentry
    <outboundlink></outboundlink>

    . De forma predeterminada, el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span>
    pasa la excepción a la clase base donde la excepción es registrada. Sin embargo, eres libre de
    registrar excepciones en la forma que desees.
</p>
<p>Por ejemplo, si necesitas reportar distintos tipos de excepciones en diferentes formas, puedes
    usar el operador de comparación <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">instanceof</span>
    de PHP:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Report or log an exception.
*
* This is a great spot to send exceptions to Sentry, Bugsnag, etc.
*
* @param  \Exception  \$exception
* @return void
*/
public function report(Exception \$exception)
{
    if (\$exception instanceof CustomException) {
        //
    }

    parent::report(\$exception);
}
</code></pre>


<p>TIP</p>
<p>
    En lugar de hacer uso de muchos <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">instanceof</span>
    en tu método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span>,
    considera usar
    excepciones reportables
</p>


<h4>Contexto de log global</h4>
<p>De estar disponible, Laravel automáticamente agrega el ID del usuario actual al mensaje de log de
    cada excepción como datos contextuales. Puedes definir tus propios datos contextuales
    sobrescribiendo el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">context</span>
    de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Exceptions\Handler</span>
    de tu aplicación. Esta información será incluida en cada mensaje de log de excepción escrito por
    tu aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the default context variables for logging.
*
* @return array
*/
protected function context()
{
    return array_merge(parent::context(), [
        'foo' =&gt; 'bar',
    ]);
}
</code></pre>

<h4>Helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span>
</h4>
<p>Algunas veces puede que necesites reportar una execpción pero continuar manejando la solicitud
    actual. La función helper <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span>
    permite que reportes rápidamente una excepción usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span>
    de tu manejador de excepción sin renderizar una página de error:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>public function isValid(\$value)
{
    try {
        // Validate the value...
    } catch (Exception \$e) {
        report(\$e);

        return false;
    }
}
</code></pre>

<h4>Ignorando excepciones por tipo</h4>
<p>La propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$dontReport</span>
    del manejador de excepción contiene un arreglo de tipos de excepción que no serán registrados.
    Por ejemplo, excepciones que resulten de errores 404, al igual que otros varios tipos de
    errores, no son escritos a tus archivos de log. Puedes agregar otros tipos de excepción a este
    arreglo cuando lo necesites:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* A list of the exception types that should not be reported.
*
* @var array
*/
protected \$dontReport = [
    \Illuminate\Auth\AuthenticationException::class,
    \Illuminate\Auth\Access\AuthorizationException::class,
    \Symfony\Component\HttpKernel\Exception\HttpException::class,
    \Illuminate\Database\Eloquent\ModelNotFoundException::class,
    \Illuminate\Validation\ValidationException::class,
];
</code></pre>

<p></p>
<h3>Método render</h3>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">render</span> es
    responsable de convertir una excepción dada en una respuesta HTTP que debería ser devuelta al
    navegador. De forma predeterminada, la excepción es pasada a la clase base la cual genera una
    respuesta para ti. Sin embargo, eres libre de revisar el tipo de excepción o devolver tu propia
    respuesta personalizada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Render an exception into an HTTP response.
*
* @param  \Illuminate\Http\Request  \$request
* @param  \Exception  \$exception
* @return \Illuminate\Http\Response
*/
public function render(\$request, Exception \$exception)
{
    if (\$exception instanceof CustomException) {
        return response()-&gt;view('errors.custom', [], 500);
    }

    return parent::render(\$request, \$exception);
}
</code></pre>

<p></p>
<h3>Excepciones renderizables y reportables</h3>
<p>En lugar de hacer verificaciones por tipo de excepciones en los métodos <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">render</span>
    del manejador de excepción, puedes definir métodos <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">render</span>
    directamente en tu excepción personalizada. Cuando estos métodos existen, serán ejecutados
    automáticamente por el framework:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Exceptions;

use Exception;

class RenderException extends Exception
{
    /**
    * Report the exception.
    *
    * @return void
    */
    public function report()
    {
        //
    }

    /**
    * Render the exception into an HTTP response.
    *
    * @param  \Illuminate\Http\Request
    * @return \Illuminate\Http\Response
    */
    public function render(\$request)
    {
        return response(...);
    }
}
</code></pre>


<p>TIP</p>
<p>Puedes declarar el tipo de cualquier dependencia requerida en el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span> y
    el contenedor de servicios las inyectará automáticamente en el método.</p>

<p></p>
<h2>Excepciones HTTP</h2>
<p>Algunas excepciones describen códigos de error HTTP del servidor. Por ejemplo, esto puede ser un
    error "página no encontrada" (404), un "error no autorizado" (401) o incluso un error 500
    generado por el desarrollador. Con el propósito de generar tal respuesta desde cualquier lugar
    en tu aplicación, puedes usar el helper <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>abort(404);
</code></pre>

<p>El helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort</span>
    provocará inmediatamente una excepción la cual será renderizada por el manejador de excepción.
    Opcionalmente, puedes proporcionar el texto de la respuesta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>abort(403, 'Unauthorized action.');
</code></pre>

<p></p>
<h3>Páginas de error HTTP personalizadas</h3>
<p>Laravel hace fácil mostrar páginas de error personalizadas para varios códigos de estado HTTP.
    Por ejemplo, si deseas personalizar la página de error para los códigos de estado HTTP 404, crea
    una vista <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/errors/404.blade.php</span>.
    Este archivo será servido en todos los errores 404 generados por tu aplicación. La vista dentro
    de este directorio debería ser nombrada para coincidir con el código de estado HTTP que les
    corresponde. La instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">HttpException</span>
    provocada por la función <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort</span>
    será pasada a la vista como una variable <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$exception</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;h2&gt;{{ \$exception-&gt;getMessage() }}&lt;/h2&gt;
</code></pre>

<p>Puedes publicar las plantillas de página de error de Laravel usando el comando de Artisan <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vender:publish</span>.
    Una vez que las plantillas han sido publicadas, puedes personalizarlas de la forma que quieras:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan vendor:publish --tag=laravel-errors
</code></pre>
</div>
""";