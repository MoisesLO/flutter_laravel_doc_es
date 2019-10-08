import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PqEnvoy extends StatelessWidget {
  final String title;
  PqEnvoy(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPqEnvoy,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPqEnvoy = """
<!-- Laravel Envoy -->
<div style='font-size: 14.2px;'>
  <h1>Laravel Envoy</h1>
  <ul>
    <li>
      Introducción
      <ul>
        <li>Instalación</li>
      </ul>
    </li>
    <li>
      Escribir tareas
      <ul>
        <li>Setup</li>
        <li>Variables</li>
        <li>Historias</li>
        <li>Múltiples servidores</li>
      </ul>
    </li>
    <li>
      Ejecutar tareas
      <ul>
        <li>Confirmar ejecución de tarea</li>
      </ul>
    </li>
    <li>
      Notificaciones
      <ul>
        <li>Slack</li>
        <li>Discord</li>
      </ul>
    </li>
  </ul>

  <h2>Introducción</h2>
  <p>

    Laravel Envoy
    <outboundlink></outboundlink>
    proporciona una sintaxis limpia y mínima para definir las tareas comunes que ejecutas en tus servidores remotos. Utilizando el estilo de sintaxis de Blade, puedes configurar fácilmente tareas para deploy, comandos de Artisan y más. Envoy solamente es compatible con sistemas operativos Mac y Linux.
  </p>

  <h3>Instalación</h3>
  <p>Primero, instala Envoy utilizando el comando de composer <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">global require</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer global require laravel/envoy
</code></pre>

  <p>
    Dado que las librerías globales de Composer ocasionalmente pueden causar conflictos en la versión del paquete, puedes considerar utilizar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cgr</span>, el cual es un reemplazo directo para el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer global require</span>. Las instrucciones de instalación de la librería <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">gcr</span> pueden ser encontradas en GitHub
    <outboundlink></outboundlink>
    .
  </p>

  <p>Nota</p>
  <p>Asegurate de colocar el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">~/.composer/vendor/bin</span> en tu PATH para que el ejecutable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">envoy</span> pueda ser localizado cuando se ejecute el comando
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">envoy</span> en tu terminal.</p>

  <h4>Actualizar envoy</h4>
  <p>También puedes usar Composer para mantener tu instalación de Envoy actualizada. Ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer global update</span> actualizará todos tus paquetes de Composer instalados globalmente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer global update
</code></pre>

  <h2>Escribir tareas</h2>
  <p>Todas tus tareas de Envoy deberán definirse en un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Envoy.blade.php</span> en la raíz de tu proyecto. Aquí un ejemplo para comenzar:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@servers(['web' =&gt; ['user@192.168.1.1']])

@task('foo', ['on' =&gt; 'web'])
    ls -la
@endtask
</code></pre>

  <p>Como puedes ver, un arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@servers</span> es definido en la parte superior del archivo, permitiéndote hacer referencia a estos servidores en la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">on</span> en la declaración de tus tareas. Dentro de tus declaraciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@task</span>, deberás colocar el código Bash que se deberá ejecutar en tu servidor una vez que la tarea sea ejecutada.</p>
  <p>Puedes forzar que un script se ejecute localmente especificando la dirección IP del servidor como
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">127.0.0.1</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@servers(['localhost' =&gt; '127.0.0.1'])
</code></pre>

  <h3>Setup</h3>
  <p>En ocasiones, puede que necesites ejecutar algún código PHP antes de tus tareas de Envoy. Puedes hacer uso de la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@setup</span> para declarar variables y hacer uso de PHP en general antes de que tus otras tareas sean ejecutadas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@setup
    \$now = new DateTime();

    \$environment = isset(\$env) ? \$env : "testing";
@endsetup
</code></pre>

  <p>Si necesitas de otros archivos PHP antes de ejecutar tus tareas, puedes utilizar la directiva
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@include</span> en la parte superior de tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Envoy.blade.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@include('vendor/autoload.php')

@task('foo')
    # ...
@endtask
</code></pre>

  <h3>Variables</h3>
  <p>Si es necesario, puedes pasar valores de opciones a las tareas de Envoy usando la línea de comandos:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>envoy run deploy --branch=master
</code></pre>

  <p>Puedes acceder a las opciones en tus tareas por medio de la sintaxis "echo" de Blade. También puedes usar declaraciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">if</span> y bucles dentro de tus tareas. Por ejemplo, para verificar la presencia de la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$branch</span> antes de ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">git
  pull</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@servers(['web' =&gt; '192.168.1.1'])

@task('deploy', ['on' =&gt; 'web'])
    cd site

    @if (\$branch)
        git pull origin {{ \$branch }}
    @endif

    php artisan migrate
@endtask
</code></pre>

  <h3>Historias</h3>
  <p>Las historias agrupan un conjunto de tareas con un nombre único y conveniente, permitiendo agrupar tareas pequeñas enfocandose en tareas más grandes. Por ejemplo, una historia
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deploy</span> puede ejecutar las tareas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">git</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer</span> al listar los nombres de las tareas en tu definición:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@servers(['web' =&gt; '192.168.1.1'])

@story('deploy')
    git
    composer
@endstory

@task('git')
    git pull origin master
@endtask

@task('composer')
    composer install
@endtask
</code></pre>

  <p>Una vez que hayas finalizado de escribir tu historia, puedes ejecutarla como una tarea típica:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>envoy run deploy
</code></pre>

  <h3>Múltiples servidores</h3>
  <p>Envoy te permite fácilmente ejecutar tareas a través de múltiples servidores. Primero, agrega servidores adicionales a tu declaración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@servers</span>. A cada servidor se le debe asignar un nombre único. Una vez definidos los servidores adicionales, deberás indicar en cuáles servidores se van a ejecutar las tareas, esto puede hacerse en el arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">on</span> de cada tarea:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@servers(['web-1' =&gt; '192.168.1.1', 'web-2' =&gt; '192.168.1.2'])

@task('deploy', ['on' =&gt; ['web-1', 'web-2']])
    cd site
    git pull origin {{ \$branch }}
    php artisan migrate
@endtask
</code></pre>

  <h4>Ejecución paralela</h4>
  <p>Por defecto, las tareas serán ejecutadas en cada servidor en serie. En otras palabras, una tarea finaliza su ejecución en el primer servidor antes de proceder a ejecutarse en el segundo servidor. Si deseas ejecutar una tarea a través de múltiples servidores en paralelo, agrega la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">parallel</span> a la declaración de tu tarea:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@servers(['web-1' =&gt; '192.168.1.1', 'web-2' =&gt; '192.168.1.2'])

@task('deploy', ['on' =&gt; ['web-1', 'web-2'], 'parallel' =&gt; true])
    cd site
    git pull origin {{ \$branch }}
    php artisan migrate
@endtask
</code></pre>

  <h2>Ejecutar tareas</h2>
  <p>Para ejecutar una tarea o historia que esté definida en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Envoy.blade.php</span>, ejecuta el comando de Envoy <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">run</span>, pasando el nombre de la tarea o historia que deseas ejecutar. Envoy va a ejecutar la tarea y mostrará el resultado de los servidores mientras se ejecuta la tarea:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>envoy run deploy
</code></pre>

  <h3>Confirmar ejecución de tarea</h3>
  <p>Si deseas que se solicite confirmación antes de ejecutar una tarea en tus servidores, deberás añadir la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">confirm</span> a la declaración de tu tarea. Esta opción es particularmente útil para operaciones destructivas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@task('deploy', ['on' =&gt; 'web', 'confirm' =&gt; true])
    cd site
    git pull origin {{ \$branch }}
    php artisan migrate
@endtask
</code></pre>

  <h2>Notificaciones</h2>

  <h3>Slack</h3>
  <p>
    Envoy también permite enviar notificaciones a Slack después de ejecutar cada tarea. La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@slack</span> acepta una URL de webhook a Slack y un nombre de canal. Puedes recuperar tu URL de webhook creando una integración "Incoming WebHooks" en el panel de control de Slack. Debes pasar la URL de webhook completa en la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@slack</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@finished
    @slack('webhook-url', '#bots')
@endfinished
</code></pre>

  <p>Puedes proporcionar uno de los siguientes como el argumento del canal:</p>
  <ul>
    <li>Para enviar notificaciones a un canal: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">#canal</span></li>
    <li>Para enviar notificaciones a un usuario: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@usuario</span></li>
  </ul>

  <h3>Discord</h3>
  <p>
    Envoy también soporta el envío de notificaciones a Discord después de que cada tarea es ejecutada. La dirctiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@discord</span> acepta una URL WebHook y un mensaje de Discord. Puedes recuperar tu URL webhook creando una "Webhook" en los ajustes de tu servidor y seleccionando en cuál canal publicar la webhook. También deberías pasar la URL de Webhook completa en la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@discord</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>@finished
    @discord('discord-webhook-url')
@endfinished
</code></pre>
</div>
""";