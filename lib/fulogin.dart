import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuLogin extends StatelessWidget {
  final String title;
  FuLogin(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuLogin,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],

        )
    );
  }
}

const HtmFuLogin = """
<div style='font-size: 14.2px;'>
<h1>Registro (Logging)</h1>
<ul>
    <li>Introducción</li>
    <li>
        Configuración
        <ul>
            <li>Construyendo stacks de registros</li>
        </ul>
    </li>
    <li>
        Escribiendo mensajes de registro
        <ul>
            <li>Escribiendo a canales específicos</li>
        </ul>
    </li>
    <li>
        Configuración avanzada del canal Monolog
        <ul>
            <li>Personalizando Monolog para canales</li>
            <li>Creando canales de manejador para Monolog</li>
            <li>Creando canales mediante factories</li>
        </ul>
    </li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>Para ayudarte a aprender más acerca de lo que está sucediendo dentro de tu aplicación, Laravel
    proporciona un robusto servicio de registro que te permite registrar mensajes en archivos, en el
    registro de errores del sistema e incluso en Slack para notificar a todo tu equipo.</p>
<p>
    De forma interna, Laravel usa la biblioteca

    Monolog
    <outboundlink></outboundlink>

    , que proporciona soporte para una variedad de poderosos manejadores de registros. Laravel hace
    que sea pan comido configurar dichos manejadores, permitiéndote mezclar y juntarlos para
    personalizar el manejo de registros en tu aplicación.
</p>
<p></p>
<h2>Configuración</h2>
<p>Toda la configuración para el sistema de registros de tu aplicación se encuentra en el archivo de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/logging.php</span>.
    Este archivo te permite configurar los canales de registros de tu aplicación, así que asegurarte
    de revisar cada uno de los canales disponibles y sus opciones. Revisaremos algunas opciones
    comunes a continuación.</p>
<p>Por defecto, Laravel usara el canal <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stack</span> al
    registrar mensajes. El canal <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stack</span>
    es usado para agregar múltiples canales de registros en un solo canal. Para más información
    sobre construir stacks, revisa la documentación debajo.</p>
<h4>Configurando el nombre del canal</h4>
<p>Por defecto, Monolog es instanciado con un "nombre de canal" que concuerda con el entorno actual,
    como <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">production</span>
    o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>.
    Para cambiar este valor, agrega una opción <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> a
    la configuración de tu canal:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'stack' =&gt; [
    'driver' =&gt; 'stack',
    'name' =&gt; 'channel-name',
    'channels' =&gt; ['single', 'slack'],
],
</code></pre>

<h4>Drivers de canales disponibles</h4>
<table>
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stack</span>
        </td>
        <td>Wrapper para facilitar la creación de canales "multi-canales"</td>
    </tr>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">single</span>
        </td>
        <td>Canal de registro de un sólo archivo o ubicación (<span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">StreamHandler</span>)
        </td>
    </tr>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">daily</span>
        </td>
        <td>Driver de Monolog basado en <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RotatingFileHandler</span>
            que rota diariamente
        </td>
    </tr>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slack</span>
        </td>
        <td>Driver de Monolog basado en <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SlackWebhookHandler</span>
        </td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">papertrail</span>
        </td>
        <td>Driver de Monolog basado en <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SyslogUdpHandler</span>
        </td>
    </tr>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">syslog</span>
        </td>
        <td>Driver de Monolog basado en <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SyslogHandler</span>
        </td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">errorlog</span>
        </td>
        <td>Driver de Monolog basado en <span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ErrorLogHandler</span>
        </td>
    </tr>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">monolog</span>
        </td>
        <td>Driver factory de Monolog que puede usar cualquier manejador de Monolog soportado</td>
    </tr>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">custom</span>
        </td>
        <td>Driver que llama a un factory especificado para crear un canal</td>
    </tr>
    </tbody>
</table>

<p>TIP</p>
<p>Comprueba la documentación en personalización avanzada de canales para aprender más sobre <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">monolog</span> y
    drivers <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">personalizados</span>.
</p>


<h4>Configuración de los canales single y daily</h4>
<p>Los canales <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">single</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">daily</span>
    tienen tres opciones de configuración opcionales: <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bubble</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">permission</span>
    y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locking</span>.
</p>
<table>
    <thead>
    <tr>
        <th>Nombre</th>
        <th>Descripción</th>
        <th>Default</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bubble</span>
        </td>
        <td>Indica si los mensajes deberían llegar a otros canales después de ser manejados</td>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>
        </td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">permission</span>
        </td>
        <td>Los permisos del archivo de registro</td>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">644</span>
        </td>
    </tr>
    <tr>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locking</span>
        </td>
        <td>Intenta bloquear el archivo de registro antes de escribirlo</td>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>
        </td>
    </tr>
    </tbody>
</table>
<h4>Configurando el canal de papertrail</h4>
<p>
    El canal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">papertrail</span>
    requiere de las opciones de configuración <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">port</span>.
    Puedes obtener estos valores desde

    Papertrail

</p>
<h4>Configurando el canal de Slack</h4>
<p>
    El canal <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slack</span>
    requiere una opción de configuración <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span>. Esta
    URL debe coincidir con una URL de un

    webhook entrante

    que has configurado para tu equipo de Slack.
</p>
<p></p>
<h3>Construyendo stacks de registros</h3>
<p>Como mencionamos anteriormente, el driver <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stack</span>
    permite que combines múltiples canales en un sólo canal de registro. Para ilustrar cómo usar
    stacks de registros, vamos a echar un vistazo a un ejemplo de configuración que podrías ver en
    una aplicación en producción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'channels' =&gt; [
    'stack' =&gt; [
        'driver' =&gt; 'stack',
        'channels' =&gt; ['syslog', 'slack'],
    ],

    'syslog' =&gt; [
        'driver' =&gt; 'syslog',
        'level' =&gt; 'debug',
    ],

    'slack' =&gt; [
        'driver' =&gt; 'slack',
        'url' =&gt; env('LOG_SLACK_WEBHOOK_URL'),
        'username' =&gt; 'Laravel Log',
        'emoji' =&gt; ':boom:',
        'level' =&gt; 'critical',
    ],
],
</code></pre>

<p>Vamos a examinar esta configuración. Primero, observa que nuestro canal <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stack</span>
    agrega dos canales más mediante su opción <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">channels</span>:
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">syslog</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slack</span>.
    Entonces, al registrar mensajes, ambos canales tendrán la oportunidad de registrar el mensaje.
</p>
<h4>Niveles de registro</h4>
<p>
    Observa la opción de configuración <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">level</span>
    presente en la configuración de los canales <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">syslog</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slack</span> en
    el ejemplo superior. Esta opción determina el "nivel" mínimo que un mensaje debe tener para
    poder ser registrado por el canal. Monolog, que hace funcionar los servicios de registros de
    Laravel, ofrece todos los niveles de registro definidos en la

    especificación RFC 5424

    : <strong>emergency</strong>, <strong>alert</strong>, <strong>critical</strong>,
    <strong>error</strong>, <strong>warning</strong>, <strong>notice</strong>, <strong>info</strong>
    y <strong>debug</strong>.
</p>
<p>Así que, imagina que registramos un mensaje usando el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">debug</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Log::debug('An informational message.');
</code></pre>

<p>Dada nuestra configuración, el canal <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">syslog</span>
    escribirá el mensaje al registro del sistema; sin embargo, dado que el mensaje de error no es
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">critical</span>
    o superior, no será enviado a Slack. Sin embargo, si registramos un mensaje <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">emergency</span>,
    será enviado tanto al registro del sistema como a Slack dado que el nivel <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">emergency</span>
    está por encima de nuestro umbral mínimo para ambos canales:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Log::emergency('The system is down!');
</code></pre>

<p></p>
<h2>Escribiendo mensajes de error</h2>
<p>
    Puedes escribir información a los registros usando el facade <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Log</span>. Como
    mencionamos anteriormente, el registrador proporciona los ocho niveles de registro definidos en
    la

    especificación RFC 5424

    : <strong>emergency</strong>, <strong>alert</strong>, <strong>critical</strong>,
    <strong>error</strong>, <strong>warning</strong>, <strong>notice</strong>, <strong>info</strong>
    y <strong>debug</strong>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Log::emergency(\$message);
Log::alert(\$message);
Log::critical(\$message);
Log::error(\$message);
Log::warning(\$message);
Log::notice(\$message);
Log::info(\$message);
Log::debug(\$message);
</code></pre>

<p>Así que, podrías llamar a cualquiera de esos métodos para registrar un mensaje para el nivel
    correspondiente. Por defecto, el mensaje será escrito al canal de registro por defecto tal y
    como está configurado en tu archivo de configuración <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/logging.php</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Support\Facades\Log;
use App\Http\Controllers\Controller;

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
        Log::info('Showing user profile for user: '.\$id);

        return view('user.profile', ['user' =&gt; User::findOrFail(\$id)]);
    }
}
</code></pre>

<h4>Información contextual</h4>
<p>Un arreglo de datos contextuales puede ser pasado a los métodos de registro. Estos datos
    contextuales serán formateados y mostrados con el mensaje registrado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Log::info('User failed to login.', ['id' =&gt; \$user-&gt;id]);
</code></pre>

<p></p>
<h3>Escribiendo a canales específicos</h3>
<p>Algunas veces podrías querer registrar un mensaje a un canal aparte del canal por defecto de tu
    aplicación. Podrías usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">channel</span>
    en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Log</span>
    para retornar y registrar a cualquier canal definido en tu archivo de configuración:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Log::channel('slack')-&gt;info('Something happened!');
</code></pre>

<p>Si quisieras crear un stack de registro a la carta consistiendo de múltiples canales, puedes usar
    el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stack</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Log::stack(['single', 'slack'])-&gt;info('Something happened!');
</code></pre>

<p></p>
<h2>Personalización avanzada de canales de Monolog</h2>
<p></p>
<h3>Personalizando Monolog para canales</h3>
<p>Algunas veces puede que necesites un control total sobre la forma en la que Monolog es
    configurado para un canal existente. Por ejemplo, podrías querer configurar una implementación
    personalizada para <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">FormatterInterface</span>
    de Monolog para los manejadores de un canal dado.</p>
<p>Para comenzar, define un arreglo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span> en la
    configuración del canal. El arreglo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span>
    debe contener una lista de clases que deben tener una oportunidad de personalizar (o hacerle
    "tap") a la instancia de Monolog luego de que es creada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'single' =&gt; [
    'driver' =&gt; 'single',
    'tap' =&gt; [App\Logging\CustomizeFormatter::class],
    'path' =&gt; storage_path('logs/laravel.log'),
    'level' =&gt; 'debug',
],
</code></pre>

<p>Una vez que has configurado la opción <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span> en tu
    canal, estás listo para definir la clase que personalizará tu instancia de Monolog. Esta clase
    sólo necesita un método: <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__invoke</span>,
    que recibe una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Log\Logger</span>.
    La instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Log\Logger</span>
    redirige todas las llamadas de métodos a la instancia base de Monolog:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Logging;

class CustomizeFormatter
{
    /**
    * Customize the given logger instance.
    *
    * @param  \Illuminate\Log\Logger  \$logger
    * @return void
    */
    public function __invoke(\$logger)
    {
        foreach (\$logger-&gt;getHandlers() as \$handler) {
            \$handler-&gt;setFormatter(...);
        }
    }
}
</code></pre>


<p>TIP</p>
<p>Todas tus clases "tap" son resultas por el contenedor de servicios, así que cualquier dependencia
    del constuctor que requieran será inyectada automáticamente.</p>

<p></p>
<h3>Creando canales para manejadores de Monolog</h3>
<p>
    Monolog tiene una variedad de

    manejadores disponibles

    . En algunos casos, el tipo de registro que quieres crear es simplemente un driver de Monolog
    con una instancia de un handler en específico. Estos canales pueden ser creados usando el driver
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">monolog</span>.
</p>
<p>Al usar el driver <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">monolog</span>,
    la opción de configuración <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handler</span>
    es usada para especificar que handler será instanciado. Opcionalmente, cualquier parámetros del
    constructor que el handler necesite puede ser especificado usando la opción de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'logentries' =&gt; [
    'driver'  =&gt; 'monolog',
    'handler' =&gt; Monolog\Handler\SyslogUdpHandler::class,
    'with' =&gt; [
        'host' =&gt; 'my.logentries.internal.datahubhost.company.com',
        'port' =&gt; '10000',
    ],
],
</code></pre>

<h4>Formateadores de Monolog</h4>
<p>Al usar el driver <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">monolog</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LineFormatter</span>
    de Monolog será usado como formateador por defecto. Sin embargo, puedes personalizar el tipo de
    formateador pasado al manejador usando las opciones de configuración <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">formatter</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">formatter_with</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'browser' =&gt; [
    'driver' =&gt; 'monolog',
    'handler' =&gt; Monolog\Handler\BrowserConsoleHandler::class,
    'formatter' =&gt; Monolog\Formatter\HtmlFormatter::class,
    'formatter_with' =&gt; [
        'dateFormat' =&gt; 'Y-m-d',
    ],
],
</code></pre>

<p>Si estás usando un manejador de Monolog que es capaz de proveer su propio formateador, puedes
    establecer el valor de la opción de configuración <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">formatter</span>
    a
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">default</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'newrelic' =&gt; [
    'driver' =&gt; 'monolog',
    'handler' =&gt; Monolog\Handler\NewRelicHandler::class,
    'formatter' =&gt; 'default',
],
</code></pre>

<p></p>
<h3>Creando canales mediante factories</h3>
<p>Si quieres definir un canal personalizado completo en el que tienes control total sobre la
    instanciación y configuración de Monolog, puedes especificar un driver personalizado en tu
    archivo de configuración <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/logging.php</span>.
    Tu configuración debe incluir una opción <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">via</span>
    que apunte a la clase factory que será invocada para crear la instancia de Monolog:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'channels' =&gt; [
    'custom' =&gt; [
        'driver' =&gt; 'custom',
        'via' =&gt; App\Logging\CreateCustomLogger::class,
    ],
],
</code></pre>

<p>Una vez que has configurado el canal personalizado, estás listo para definir la clase que creará
    tu instancia de Monolog. Esta clase sólo necesita un método: <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__invoke</span>,
    el cual debe retornar una instancia de Monolog:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Logging;

use Monolog\Logger;

class CreateCustomLogger
{
    /**
    * Create a custom Monolog instance.
    *
    * @param  array  \$config
    * @return \Monolog\Logger
    */
    public function __invoke(array \$config)
    {
        return new Logger(...);
    }
}
</code></pre>
</div>    
""";