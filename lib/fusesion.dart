import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuSession extends StatelessWidget {
  final String title;
  FuSession(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuSession,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuSession = """
<div style='font-size: 14.2px;'>
<h1>Sesión HTTP</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Configuración</li>
            <li>Prerequisitos de manejador</li>
        </ul>
    </li>
    <li>
        Usando la sesión
        <ul>
            <li>Obteniendo datos</li>
            <li>Almacenando datos</li>
            <li>Datos instantáneos</li>
            <li>Eliminando datos</li>
            <li>Regenerando el ID de la sesión</li>
        </ul>
    </li>
    <li>
        Agregando manejadores de sesión personalizada
        <ul>
            <li>Implementando el manejador</li>
            <li>Registrando el manejador</li>
        </ul>
    </li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>
    Ya que las aplicaciones manejadas por HTTP son sin estado, las sesiones proporcionan una forma
    de almacenar información sobre el usuario a través de múltiples solicitudes. Laravel viene con
    una variedad de backends de sesión que son accedidos a través de una expresiva API unificada. El
    soporte para los backends populares tales como

    Memcached
    <outboundlink></outboundlink>

    ,

    Redis
    <outboundlink></outboundlink>

    y bases de datos es incluido de forma predeterminada.
</p>
<p></p>
<h3>Configuración</h3>
<p>El archivo de configuración de sesión es almacenado en <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/session.php</span>.
    Asegurate de revisar las opciones disponibles para ti en este archivo. De forma predeterminada,
    Laravel es configurado para usar el manejador de sesión <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">file</span>,
    el cual trabajará bién para muchas aplicaciones. En aplicaciones de producción, puedes
    considerar usar los manejadores <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">memcached</span>
    o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span>
    para incluso alcanzar un desempeño de sesión más rápido.</p>
<p>La opción de configuración <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> de
    la sesión define donde los datos de la sesión serán almacenados para cada solicitud. Laravel
    viene con varios excelentes manejadores de forma predeterminada.</p>
<ul>
    <li><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">file</span>
        - las sesiones son almacenadas en <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage/framework/sessions</span>.
    </li>
    <li><span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span>
        - las sesiones son almacenadas en cookies encriptados seguros.
    </li>
    <li><span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>
        - las sesiones son almacenadas en una base de datos relacional.
    </li>
    <li><span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">memcached</span>
        /
        <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span>
        - las sesiones son almacenadas en rápidos almacenes basados en cache.
    </li>
    <li><span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span>
        - las sesiones son almacenadas en un arreglo de PHP y no serán guardadas de forma
        permanente.
    </li>
</ul>

<p>TIP</p>
<p>
    El driver array es usado durante
    las pruebas
    y previene que los datos almacenados en la sesión sean guardados de forma permanente.
</p>


<p></p>
<h3>Prerequisitos del driver</h3>
<h4>Base de datos</h4>
<p>Al momento de usar el driver de sesión <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>,
    necesitarás crear una tabla para contener los elementos de la sesión. A continuación se muestra
    una declaración de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Schema</span>
    de ejemplo para la tabla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Schema::create('sessions', function (\$table) {
    \$table-&gt;string('id')-&gt;unique();
    \$table-&gt;unsignedInteger('user_id')-&gt;nullable();
    \$table-&gt;string('ip_address', 45)-&gt;nullable();
    \$table-&gt;text('user_agent')-&gt;nullable();
    \$table-&gt;text('payload');
    \$table-&gt;integer('last_activity');
});
</code></pre>

<p>Puedes usar el comando Artisan <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session:table</span>
    para generar esta migración:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan session:table

php artisan migrate
</code></pre>

<h4>Redis</h4>
<p>Antes de usar sesiones Redis con Laravel, necesitarás instalar el paquete <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">predis/predis</span>
    (~1.0) por medio de Composer. Puedes configurar tus conexiones Redis en el archivo de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>.
    En el archivo de configuración de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span>,
    la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">connection</span>
    puede ser usada para especificar cuál conexión Redis es usada por la sesión.</p>
<p></p>
<h2>Usando la sesión</h2>
<p></p>
<h3>Obteniendo datos</h3>
<p>Hay dos formás principales de trabajar con datos de sesión en Laravel: el helper global <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span> y
    por medio de una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Request</span>.
    Primero, vamos a echar un vistazo al acceder a la sesión por medio de una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Request</span>,
    la cual puede ser referenciada en un método de controlador. Recuerda, las dependencias de
    métodos de controlador son inyectadas automáticamente por medio del contenedor de servicio de
    Laravel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
    * Show the profile for the given user.
    *
    * @param  Request  \$request
    * @param  int  \$id
    * @return Response
    */
    public function show(Request \$request, \$id)
    {
        \$value = \$request-&gt;session()-&gt;get('key');

        //
    }
}
</code></pre>

<p>Cuando obtienes un elemento de la sesión, también puedes pasar un valor predeterminado como
    segundo argumento del método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span>.
    Este valor predeterminado será devuelto si la clave especificada no existe en la sesión. Si
    pasas una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>
    como el valor predeterminado del método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> y
    la clave solicitada no existe, la <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>
    será ejecutada y su resultado devuelto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = \$request-&gt;session()-&gt;get('key', 'default');

\$value = \$request-&gt;session()-&gt;get('key', function () {
    return 'default';
});
</code></pre>

<h4>Helper global de sesión</h4>
<p>También puedes usar la función global de PHP <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span>
    para obtener y almacenar datos en la sesión. Cuando el helper <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span>
    es ejecutado con un solo argumento de cadena, devolverá el valor de esa clave de sesión. Cuando
    el helper es ejecutado con una arreglo de pares clave / valor, esos valores serán almacenados en
    la sesión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('home', function () {
    // Retrieve a piece of data from the session...
    \$value = session('key');

    // Specifying a default value...
    \$value = session('key', 'default');

    // Store a piece of data in the session...
    session(['key' =&gt; 'value']);
});
</code></pre>


<p>TIP</p>
<p>Hay una pequeña diferencia práctica entre usar la sesión por medio de una instancia de solicitud
    HTTP contra usar el helper global <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span>.
    Ambos métodos pueden ser probados por medio del método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertSessionHas</span>,
    el cual está disponible en todos tus casos de prueba.</p>

<h4>Obteniendo todos los datos de sesión</h4>
<p>Si prefieres obtener todos los datos en la sesión, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = \$request-&gt;session()-&gt;all();
</code></pre>

<h4>Determinando si un elemento existe en la sesión</h4>
<p>Para determinar si un elemento está presente en la sesión, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span>. El
    método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span>
    devuelve <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>
    si el valor está presente y no es <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$request-&gt;session()-&gt;has('users')) {
    //
}
</code></pre>

<p>Para determinar si un elemento está presente en la sesión, incluso si su valor es <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>,
    puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exists</span>.
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exists</span>
    devuelve <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>
    si el valor está presente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$request-&gt;session()-&gt;exists('users')) {
    //
}
</code></pre>

<p></p>
<h3>Almacenando datos</h3>
<p>Para almacenar datos en la sesión, típicamente usarás el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span> o el
    helper <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Via a request instance...
\$request-&gt;session()-&gt;put('key', 'value');

// Via the global helper...
session(['key' =&gt; 'value']);
</code></pre>

<h4>Agregar a valores del arreglo de sesión</h4>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">push</span> puede
    ser usado para agregar un nuevo valor a un valor de sesión que está en un arreglo. Por ejemplo,
    si la clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user.teams</span>
    contiene un arreglo de nombres de equipo, puedes agregar un nuevo valor al arreglo de la
    siguiente forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;session()-&gt;push('user.teams', 'developers');
</code></pre>

<h4>Obteniendo y eliminando un elemento</h4>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pull</span>
    obtendrá y eliminará un elemento de la sesión en una sola instrucción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = \$request-&gt;session()-&gt;pull('key', 'default');
</code></pre>

<p></p>
<h3>Datos instantáneos</h3>
<p>Algunas veces puedes querer almacenar varios elementos en la sesión para la próxima solicitud.
    Puedes hacer eso usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flash</span>.
    Los datos almacenados en la sesión usando este método solamente estarán disponibles durante la
    subsecuente solicitud HTTP, y luego serán eliminados. Los datos instantáneos son principalmente
    útiles para mensajes de estado con vida corta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;session()-&gt;flash('status', 'Task was successful!');
</code></pre>

<p>Si necesitas mantener tus datos instantáneos alrededor para varias solicitudes, puedes usar el
    método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reflash</span>,
    el cuál mantendrá todos los datos instantáneos para una solicitud adicional. Si solamente
    necesitas mantener datos instantáneos específicos, puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">keep</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;session()-&gt;reflash();

\$request-&gt;session()-&gt;keep(['username', 'email']);
</code></pre>

<p></p>
<h3>Eliminando datos</h3>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forget</span>
    removerá una porción de datos de la sesión. Si prefieres remover todos los datos de la sesión,
    puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flush</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Forget a single key...
\$request-&gt;session()-&gt;forget('key');

// Forget multiple keys...
\$request-&gt;session()-&gt;forget(['key1', 'key2']);

\$request-&gt;session()-&gt;flush();
</code></pre>

<p></p>
<h3>Regenerando el ID de la sesión</h3>
<p>
    Regenerar el ID de la sesión es hecho frecuentemente con el propósito de prevenir que usuarios
    maliciosos exploten un ataque de

    fijación de sesión

    en tu aplicación.
</p>
<p>Laravel regenera automáticamente el ID de la sesión durante la autenticación si estás usando el
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span>
    integrado; sin embargo, si necesitas regenerar manualmente el ID de la sesión, puedes usar el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">regenerate</span>.
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;session()-&gt;regenerate();
</code></pre>

<p></p>
<h2>Agregando manejadores de sesión personalizados</h2>
<p></p>
<h4>Implementando el manejador</h4>
<p>Tu manejador de sesión personalizado debería implementar la interface <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SessionHandlerInterface</span>.
    Esta interface contiene justo unos cuantos métodos que necesitamos implementar. Una
    implementación MongoDB truncada luce de forma similar a lo siguiente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Extensions;

class MongoSessionHandler implements \SessionHandlerInterface
{
    public function open(\$savePath, \$sessionName) {}
    public function close() {}
    public function read(\$sessionId) {}
    public function write(\$sessionId, \$data) {}
    public function destroy(\$sessionId) {}
    public function gc(\$lifetime) {}
}
</code></pre>


<p>TIP</p>
<p>Laravel no viene con un directorio para contener tus extensiones. Eres libre de colocarlos en
    cualquier parte que quieras. En este ejemplo, hemos creado un directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Extensions</span>
    para alojar el manejador <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MongoSessionHandler</span>.
</p>

<p>Ya que el propósito de estos métodos no es entendible rápidamente y sin dificultad, vamos a
    cubrir rápidamente lo que cada uno de estos métodos hace:</p>
<ul>
    <li>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">open</span>
        típicamente sería usado en sistemas de almacenamiento de sesión basada en archivo. Ya que
        Laravel viene con un manejador de sesión <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">file</span>,
        casi nunca necesitarás poner cualquier cosa en este método. Puedes dejarlo como un stub
        vacío. Es una característica de diseño de interface pobre (lo que discutiremos más tarde)
        que PHP nos oblige a implementar este método.
    </li>
    <li>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">close</span>,
        como el método <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">open</span>,
        también puede ser descartado. Para la mayoría de los drivers, no es necesario.
    </li>
    <li>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">read</span>
        debería devolver la versión de cadena de la sesión de datos asociada con la <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$sessionId</span>
        dada. No hay necesidad de hacer alguna serialización u otra codificación al momento de
        obtener o almacenar los datos de la sesión en tu manejador, ya que Laravel ejcutará la
        serialización por ti.
    </li>
    <li>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">write</span>
        debería escribir la cadena <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$data</span>
        asociada dada con la <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$sessionId</span>
        para algún sistema de almacenamiento persistente, tal como MongoDB, Dynamo, etc. Otra vez,
        no deberías ejecutar alguna serialización - Laravel ya ha manejado esto por ti.
    </li>
    <li>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">destroy</span>
        debería remover los datos asociados con la <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$sessionId</span>
        desde el almacenamiento persistente.
    </li>
    <li>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">gc</span>
        debería destruir todos los datos de la sesión que son más viejos que el <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$lifetime</span>
        dado, el cual es una marca de tiempo UNIX. Para los sistemas que se auto-expiran como
        Memcached y Redis, este método puede ser dejado vacío.
    </li>
</ul>
<p></p>
<h4>Registrando el manejador</h4>
<p>Una vez que tu manejador ha sido implementado, estás listo para registrarlo en el framework. Para
    agregar manejadores adicionales para el backend de sesión de Laravel, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span>
    del método en la <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Session</span>
    facade. Deberías ejecutar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span>
    desde el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    de un proveedor de servicio. Puedes hacer esto desde el existente <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>
    o crear un nuevo proveedor de servicios completo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use App\Extensions\MongoSessionHandler;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\ServiceProvider;

class SessionServiceProvider extends ServiceProvider
{
    /**
    * Perform post-registration booting of services.
    *
    * @return void
    */
    public function boot()
    {
        Session::extend('mongo', function (\$app) {
            // Return implementation of SessionHandlerInterface...
            return new MongoSessionHandler;
        });
    }

    /**
    * Register bindings in the container.
    *
    * @return void
    */
    public function register()
    {
        //
    }
}
</code></pre>

<p>Una vez que el manejador de la sesión ha sido registrado, puedes usar el manejador <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mongo</span> en
    tu archivo de configuración <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/session.php</span>.
</p>
</div>
""";