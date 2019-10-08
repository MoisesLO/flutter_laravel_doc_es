import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuSolicitudes extends StatelessWidget {
  final String title;
  FuSolicitudes(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuSolicitudes,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuSolicitudes = """
<div style='font-size: 14.2px;'>
<h1>Solicitudes HTTP</h1>
<ul>
    <li>
        Accediendo a la solicitud
        <ul>
            <li>Ruta y método de la solicitud</li>
            <li>Solicitudes PSR-7</li>
        </ul>
    </li>
    <li>Recorte y normalización de entrada</li>
    <li>
        Obteniendo datos ingresados
        <ul>
            <li>Datos antiguos</li>
            <li>Cookies</li>
        </ul>
    </li>
    <li>
        Archivos
        <ul>
            <li>Obteniendo archivos cargados</li>
            <li>Almacenando archivos cargados</li>
        </ul>
    </li>
    <li>Configurando proxies de confianza</li>
</ul>
<p></p>
<h2>Accediendo a la solicitud</h2>
<p>
    Para obtener una instancia de la solicitud HTTP actual por medio de una inyección de
    dependencia, deberías poner la referencia de la clase <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    en tu método de controlador. La instancia de la solicitud entrante automáticamente será
    inyectada por el
    contenedor de servicio
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
    * Store a new user.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        \$name = \$request-&gt;input('name');

        //
    }
}
</code></pre>

<h4>Inyección de dependencias Y parametros de rutas</h4>
<p>Si tu método de controlador también está esperando la entrada de un parámetro de ruta deberías
    listar tus parámetros de ruta después de tus otras dependencias. Por ejemplo, si tu ruta es
    definida como sigue:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::put('user/{id}', 'UserController@update');
</code></pre>

<p>Todavía puedes poner la referencia de la clase <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    y acceder a tu parámetro de ruta <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> al
    definir tu método de controlador como sigue:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
    * Update the specified user.
    *
    * @param  Request  \$request
    * @param  string  \$id
    * @return Response
    */
    public function update(Request \$request, \$id)
    {
        //
    }
}
</code></pre>

<h4>Accediendo la solicitud a través de closures de rutas</h4>
<p>También puedes poner la referencia de la clase <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    en una Closure de ruta. El contenedor de servicio automáticamente inyectará la solicitud
    entrante dentro de la Closure que es ejecutada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Http\Request;

Route::get('/', function (Request \$request) {
    //
});
</code></pre>

<p></p>
<h3>Ruta y método de la solicitud</h3>
<p>La instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    proporciona una variedad de métodos para examinar la solicitud HTTP para tu aplicación y
    extiende la clase <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Symfony\Component\HttpFoundation\Request</span>.
    Discutiremos algunos de los métodos más importantes a continuación.</p>
<h4>Obteniendo la ruta de la solicitud</h4>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">path</span>
    devuelve la información de ruta de la solicitud. Así, si la solicitud entrante tiene como
    destino <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://domain.com/foo/bar</span>,
    el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">path</span>
    devolverá <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">foo/bar</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$uri = \$request-&gt;path();
</code></pre>

<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">is</span> te
    permite verificar que la ruta de la solicitud entrante coincide con un patrón dado. Puedes usar
    el caracter <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*</span> para
    especificar que cualquier cadena puede coincidir al momento de utilizar este método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$request-&gt;is('admin/*')) {
    //
}
</code></pre>

<h4>Obteniendo la URL de la solicitud</h4>
<p>Para obtener la URL completa de la solicitud entrante puedes usar los métodos <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fullUrl</span>.
    El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span>
    devolverá la URL sin la cadena de la consulta, mientras que el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fullUrl</span>
    si la incluye:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Without Query String...
\$url = \$request-&gt;url();

// With Query String...
\$url = \$request-&gt;fullUrl();
</code></pre>

<h4>Obteniendo el método de la solicitud</h4>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">method</span>
    devolverá el verbo HTTP de la solicitud. Puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isMethod</span>
    para verificar que el verbo HTTP coincida con una cadena dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$method = \$request-&gt;method();

if (\$request-&gt;isMethod('post')) {
    //
}
</code></pre>

<p></p>
<h3>Solicitudes PSR-7</h3>
<p>
    El

    estándar PSR-7
    <outboundlink></outboundlink>

    específica interfaces para mensajes HTTP, incluyendo solicitudes y respuestas. Si prefieres
    obtener una instancia de una solicitud PSR-7 en lugar de una solicitud de Laravel, primero
    necesitarás instalar algunos paquetes de terceros. Laravel usa el componente <em>Symfony HTTP
    Message Bridge</em> para convertir solicitudes y respuestas típicas de Laravel en
    implementaciones compatibles con PSR-7:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require symfony/psr-http-message-bridge
composer require zendframework/zend-diactoros
</code></pre>

<p>Una vez que has instalado estos paquetes, puedes obtener una solicitud PSR-7 al colocar la
    referencia de la interface de solicitud en tu Closure de ruta o método de controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Psr\Http\Message\ServerRequestInterface;

Route::get('/', function (ServerRequestInterface \$request) {
    //
});
</code></pre>


<p>TIP</p>
<p>Si devuelves una instancia de respuesta PSR-7 desde una ruta o controlador, automáticamente será
    convertida de vuelta a una instancia de respuesta de Laravel y será mostrada por el
    framework.</p>


<p></p>
<h2>Recorte y normalización de entrada</h2>
<p>De forma predeterminada, Laravel incluye los middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">TrimStrings</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ConvertEmptyStringsToNull</span>
    en la pila de middleware global de tu aplicación. Estos middleware son listados en la pila por
    la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Kernel</span>.
    Estos middleware automáticamente recortarán todos los campos de cadena entrantes en la
    solicitud, así como convertirán cualquier campo de cadena vacío a <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>.
    Esto permite que no tengas que preocuparte sobre estos asuntos de normalización en tus rutas y
    controladores.</p>
<p>Si prefieres deshabilitar este comportamiento, puedes remover los dos middleware de tu pila de
    middleware de tu aplicación al eliminarlos de la propiedad <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$middleware</span>
    de tu clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Kernel</span>.
</p>
<p></p>
<h2>Obteniendo datos ingresados</h2>
<h4>Obteniendo todos los datos ingresados</h4>
<p>También puedes obtener todos los datos ingresados en forma de arreglo usando el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$input = \$request-&gt;all();
</code></pre>

<h4>Obteniendo el valor de un campo</h4>
<p>Usando unos pocos métodos básicos, puedes acceder a todos los datos ingresados por el usuario
    desde la instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    sin preocuparte por cuál verbo HTTP fue usado por la solicitud. Sin importar el verbo HTTP, el
    método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">input</span>
    puede ser usado para obtener la entrada de usuario:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$request-&gt;input('name');
</code></pre>

<p>Puedes pasar un valor predeterminado como segundo argumento del método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">input</span>.
    Este valor será devuelto si el valor de entrada solicitado no está presente en la solicitud:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$request-&gt;input('name', 'Sally');
</code></pre>

<p>Al momento de trabajar con formularios que contienen arreglos de campos, usa notación de "punto"
    para acceder a estos arreglos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$request-&gt;input('products.0.name');

\$names = \$request-&gt;input('products.*.name');
</code></pre>

<p>Puedes llamar al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">input</span> sin
    ningún argumento para retornar todos los valores como arreglo asociativo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$input = \$request-&gt;input();
</code></pre>

<h4>Obteniendo datos desde la cadena de consulta</h4>
<p>Mientras el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">input</span>
    obtiene valores de la porción de datos de la solicitud completa (incluyendo la cadena de
    consulta), el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">query</span>
    solamente obtendrá valores de la cadena de consulta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$request-&gt;query('name');
</code></pre>

<p>Si los datos de los valores de la cadena de consulta solicitada no están presentes, el segundo
    argumento de este método será devuelto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$request-&gt;query('name', 'Helen');
</code></pre>

<p>Puedes ejecutar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">query</span> sin
    ningún argumento con el propósito de obtener todos los valores de la cadena de consulta como un
    arreglo asociativo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$query = \$request-&gt;query();
</code></pre>

<h4>Recuperando datos por medio de propiedades dinámicas</h4>
<p>También puedes acceder a los datos ingresados por el usuario usando propiedades dinámicas en la
    instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>.
    Por ejemplo, si uno de los formularios de tu aplicación contiene un campo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span>,
    puedes acceder al valor del campo de la siguiente forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$request-&gt;name;
</code></pre>

<p>Al momento de usar propiedades dinámicas, Laravel primero buscará por el valor del parámetro en
    la porción de datos de la solicitud. Si no está presente, buscará el campo en los parámetros de
    ruta.</p>
<h4>Obteniendo valores JSON</h4>
<p>Al momento de enviar solicitudes JSON a tu aplicación, puedes acceder a los datos JSON por medio
    del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">input</span>
    al tiempo que el encabezado <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Content-Type</span>
    de la solicitud sea establecido apropiadamente a <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">application/json</span>.
    Incluso puedes usar sintaxis "." para buscar adentro de los arreglos JSON:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$request-&gt;input('user.name');
</code></pre>

<h4>Obteniendo una porción de los datos ingresados</h4>
<p>Si necesitas obtener un subconjunto de los datos ingresados, puedes usar los métodos <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">only</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">except</span>.
    Ambos métodos aceptan un solo arreglo o una lista dinámica de argumentos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$input = \$request-&gt;only(['username', 'password']);

\$input = \$request-&gt;only('username', 'password');

\$input = \$request-&gt;except(['credit_card']);

\$input = \$request-&gt;except('credit_card');
</code></pre>


<p>TIP</p>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">only</span>
    devuelve todos los pares clave / valor que solicites; sin embargo, no devolverá pares clave /
    valor que no estén presentes en la solicitud.</p>

<h4>Determinando si un Valor ingresado está presente</h4>
<p>Deberías usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span> para
    determinar si un valor está presente en la solicitud. El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span>
    devuelve <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>
    si el valor está presente en la solicitud:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$request-&gt;has('name')) {
    //
}
</code></pre>

<p>Cuando es dado un arreglo, el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span>
    determinará si todos los valores especificados están presentes:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$request-&gt;has(['name', 'email'])) {
    //
}
</code></pre>

<p>Si prefieres determinar si un valor está presente en la solicitud y no esté vacío, puedes usar el
    método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filled</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$request-&gt;filled('name')) {
    //
}
</code></pre>

<p></p>
<h3>Entrada antigua</h3>
<p>Laravel permite que mantengas los datos de una solicitud durante la próxima solicitud. Esta
    característica es útil particularmente para volver a llenar los formularios después de detectar
    errores de validación. Sin embargo, si estás usando las características de validación incluidas
    con Laravel, es poco probable que necesites usar manualmente estos métodos, ya que algunas de
    las facilidades de validación integradas con Laravel las ejecutarán automáticamente.</p>
<h4>Enviando datos a la sesión</h4>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flash</span> en
    la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    enviará los datos ingresados a la sesión para que así estén disponibles durante la próxima
    solicitud realizada por el usuario:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;flash();
</code></pre>

<p>También puedes usar los métodos <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flashOnly</span>
    y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flashExcept</span>
    para enviar un subconjunto de datos de la solicitud a la sesión. Estos métodos son útiles para
    mantener información sensible tales como contraseñas fuera de la sesión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;flashOnly(['username', 'email']);

\$request-&gt;flashExcept('password');
</code></pre>

<h4>Enviando datos y redirigir</h4>
<p>Ya que con frecuencia querrás enviar datos a la sesión y luego redirigir a la página anterior
    puedes encadenar datos a una redirección usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withInput</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return redirect('form')-&gt;withInput();

return redirect('form')-&gt;withInput(
    \$request-&gt;except('password')
);
</code></pre>

<h4>Obteniendo datos antiguos</h4>
<p>Para obtener los datos de la sesión anterior, usa el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">old</span> en la
    instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Request</span>.
    El método old extrarerá los datos de la solicitiud y sesión anterior:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$username = \$request-&gt;old('username');
</code></pre>

<p>Laravel también proporciona un helper global <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">old</span>. Si
    estás mostrando datos antiguos dentro de una plantilla Blade, es más conveniente usar el helper
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">old</span>. Si
    no existen datos antiguos para el campo dado, será devuelto <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;input type="text" name="username" value="{{ old('username') }}"&gt;
</code></pre>

<p></p>
<h3>Cookies</h3>
<h4>Obteniendo cookies de las solicitudes</h4>
<p>Todos las cookies creados por el framework Laravel son encriptadas y firmadas con un código de
    autenticación, significa que serán consideradas no válidas si han sido cambiados por el cliente.
    Para obtener el valor de una cookie de la solicitud, usa el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span>
    en una instancia de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = \$request-&gt;cookie('name');
</code></pre>

<p>Alternativamente, puedes usar la clase facade <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie</span>
    para acceder a los valores de las cookies:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Cookie;

\$value = Cookie::get('name');
</code></pre>

<h4>Adjuntando cokies a las respuestas</h4>
<p>Puedes adjuntar una cookie a una instancia saliente de <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Response</span>
    usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span>.
    Debes pasar el nombre, valor y el número de minutos en los cuales dicha cookie debería ser
    válida:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response('Hello World')-&gt;cookie(
    'name', 'value', \$minutes
);
</code></pre>

<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span>
    también acepta unos cuantos argumentos los cuales son usados con menos frecuencia. Generalmente,
    estos argumentos tienen el mismo propósito y significan lo mismo que los argumentos que deberían
    ser dados al método

    setcookie


    nativo de PHP:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response('Hello World')-&gt;cookie(
    'name', 'value', \$minutes, \$path, \$domain, \$secure, \$httpOnly
);
</code></pre>

<p>Alternativamente, puedes usar la clase facade <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie</span>
    para "encolar" cookies para adjuntar a la respuesta saliente de tu aplicación. El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span>
    acepta una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie</span>
    o los argumentos necesarios para crear una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cookie</span>.
    Estas cookies serán adjuntadas a la respuesta saliente antes de que sea enviada al navegador:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cookie::queue(Cookie::make('name', 'value', \$minutes));

Cookie::queue('name', 'value', \$minutes);
</code></pre>

<h4>Generando instancias cookie</h4>
<p>Si prefieres generar una instancia <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Symfony\Component\HttpFoundation\Cookie</span>
    que pueda ser dada a una instancia de respuesta en un momento posterior, puedes usar el helper
    global <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span>.
    Este cookie no será enviado de regreso al cliente a menos que sea adjuntado a una instancia de
    respuesta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$cookie = cookie('name', 'value', \$minutes);

return response('Hello World')-&gt;cookie(\$cookie);
</code></pre>

<p></p>
<h2>Archivos</h2>
<p></p>
<h3>Obteniendo archivos cargados</h3>
<p>Puedes acceder los archivos cargados de una instancia <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">file</span> o
    usando propiedades dinámicas. El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">file</span>
    devuelve una instancia de la clase <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\UploadedFile</span>,
    la cual extiende la clase <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SplFileInfo</span>
    de PHP y proporciona una variedad de métodos para interactuar con el archivo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$file = \$request-&gt;file('photo');

\$file = \$request-&gt;photo;
</code></pre>

<p>Puedes determinar si un archivo está presente en la solicitud usando el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasFile</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$request-&gt;hasFile('photo')) {
    //
}
</code></pre>

<h4>Validando cargas exitosas</h4>
<p>Además de verficar si el archivo está presente, puedes verificar que no ocurrieron problemas
    cargando el archivo por medio del método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isValid</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$request-&gt;file('photo')-&gt;isValid()) {
    //
}
</code></pre>

<h4>Rutas y extensiones de archivo</h4>
<p>La clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UploadedFile</span>
    también contiene métodos para acceder a la ruta completa del archivo y su extensión. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extension</span>
    intentará adivinar la extensión del archivo en base a su contenido. Esta extensión puede ser
    diferente de la extensión que fue suministrada por el cliente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = \$request-&gt;photo-&gt;path();

\$extension = \$request-&gt;photo-&gt;extension();
</code></pre>

<h4>Otros métodos de archivo</h4>
<p>
    Hay una variedad de otros métodos disponibles en instancias <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UploadedFile</span>.
    Revisa la

    documentación de la API para la clase


    para más información concerniente a estos métodos.
</p>
<p></p>
<h3>Almacenando archivos cargados</h3>
<p>Para almacenar un archivo cargado, típicamente usarás uno de tus sistemas de archivos
    configurados. La clase <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UploadedFile</span>
    tiene un método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span>
    el cual moverá un archivo cargado a uno de tus discos, el cual puede ser una ubicación de tu
    sistema de archivo local o incluso una ubicación de almacenamiento en la nube como Amazon S3.
</p>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span>
    acepta la ruta dónde el archivo debería ser almacenado relativa al directorio raíz configurado
    del sistema de archivo. Esta ruta no debería contener un nombre de archivo, ya que un ID único
    será generado automáticamente para servir como el nombre del archivo.</p>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span>
    acepta un segundo argumento opcional para el nombre del disco que debería ser usado para
    almacenar el archivo. El método devolverá la ruta relativa del archivo al directorio raíz del
    disco:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = \$request-&gt;photo-&gt;store('images');

\$path = \$request-&gt;photo-&gt;store('images', 's3');
</code></pre>

<p>Si no quieres que un nombre de archivo sea generado automáticamente, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storeAs</span>,
    el cual acepta la ruta, el nombre de archivo y el nombre del disco como sus argumentos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = \$request-&gt;photo-&gt;storeAs('images', 'filename.jpg');

\$path = \$request-&gt;photo-&gt;storeAs('images', 'filename.jpg', 's3');
</code></pre>

<p></p>
<h2>Configurando proxies de confianza</h2>
<p>Al momento de administrar tus aplicaciones detrás de un balanceador de carga que finaliza los
    certificados TLS / SSL, puedes notar que algunas veces tu aplicación no genera enlaces HTTPS.
    Típicamente esto es debido a que el tráfico de tu aplicación está siendo dirigido desde tu
    balanceador de carga por el puerto 80 y no sabe que debería generar enlaces seguros.</p>
<p>Para solucionar esto, puedes usar el middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Middleware\TrustProxies</span>
    que es incluido en tu aplicación de Laravel, el cual permite que rápidamente personalices los
    balanceadores de carga o proxies que deberían ser de confianza en tu aplicación. Tus proxies de
    confianza deberían ser listados como un arreglo en la propiedad <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$proxies</span>
    de este middleware. Además de la configuración de los proxies de confianza, puedes configurar
    los encabezados que están siendo enviados por tu proxy con información sobre la solicitud
    original:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Middleware;

use Illuminate\Http\Request;
use Fideloper\Proxy\TrustProxies as Middleware;

class TrustProxies extends Middleware
{
    /**
    * The trusted proxies for this application.
    *
    * @var array
    */
    protected \$proxies = [
        '192.168.1.1',
        '192.168.1.2',
    ];

    /**
    * The headers that should be used to detect proxies.
    *
    * @var string
    */
    protected \$headers = Request::HEADER_X_FORWARDED_ALL;
}
</code></pre>


<p>TIP</p>
<p>
    Si estás usando Balanceo de Carga Elástico AWS, tu valor <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$headers</span>
    debe ser <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Request::HEADER_X_FORWARDED_AWS_ELB</span>.
    Para más información de las constantes que pueden ser usadas en la propiedad <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$headers</span>,
    revisa la documentación de Symfony sobre

    proxies de confianza

    .
</p>

<h4>Confiar en todos los proxies</h4>
<p>Si estás usando Amazon AWS u otro proveedor de balanceador de carga de la "nube", no puedes saber
    las direcciones IP de tus balanceadores reales. En este caso, puedes usar <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">**</span>
    para confiar en todos los proxies:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The trusted proxies for this application.
*
* @var array
*/
protected \$proxies = '**';
</code></pre>
</div>
""";