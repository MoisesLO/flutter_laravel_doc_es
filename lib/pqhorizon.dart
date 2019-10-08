import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PqHorizon extends StatelessWidget {
  final String title;
  PqHorizon(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPqHorizon,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPqHorizon = """
<!-- Laravel Horizon -->
<div style='font-size: 14.2px;'>
  <h1>Laravel Horizon</h1>
  <ul>
    <li>Introducción</li>
    <li>Actualización de Horizon</li>
    <li>
      Instalación
      <ul>
        <li>Configuración</li>
        <li>Autorización del dashboard</li>
      </ul>
    </li>
    <li>
      Ejecutando Horizon
      <ul>
        <li>Usando Horizon</li>
      </ul>
    </li>
    <li>Etiquetas</li>
    <li>Notificaciones</li>
    <li>Métricas</li>
  </ul>

  <h2>Introducción</h2>
  <p>Horizon proporciona un bonito panel de control y sistema de configuración controlado por código para Laravel, potenciado por colas de Redis. Horizon te permite monitorear fácilmente métricas claves de tu sistema de colas tales como tasa de rendimiento, tiempo de ejecución y fallas de tareas.
  </p>
  <p>Toda la configuración de tu worker es almacenada en un solo archivo de configuración sencillo, permitiendo que tu configuración quede en el código fuente donde tu equipo completo pueda colaborar.
  </p>
  <p></p>

  <h2>Instalación</h2>

  <p>Nota</p>
  <p>Debes asegurarte de que tu conexión de cola está establecido a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span>.</p>

  <p>Puedes usar Composer para instalar Horizon en tu proyecto de Laravel:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require laravel/horizon
</code></pre>

  <p>Después de instalar Horizon, publica sus assets usando el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">horizon:install</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan horizon:install
</code></pre>

  <p>Debes también crear la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">failed_jobs</span> que Laravel usará para almacenar cualquier trabajo en cola fallido:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan queue:failed-table

php artisan migrate
</code></pre>

  <h4>Actualización de horizon</h4>
  <p>
    Al actualizar a una nueva versión mayor de Horizon, es importante que revises cuidadosamente la guía de actualización .
  </p>
  <p>Además, debes volver a publicar los assets de Horizon:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan horizon:assets
</code></pre>

  <h3>Configuración</h3>
  <p>Después de publicar los assets de Horizon, su principal archivo de configuración será colocado en
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/horizon.php</span>. Este archivo de configuración permite que configures las opciones del worker y cada opción de configuración incluye una descripción de su propósito, así que asegurate de explorar con gran detalle este archivo.</p>

  <p>Nota</p>
  <p>Debes asegurarte de que la porción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">environments</span> de tu archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">horizon</span> contiene una entrada para cada entorno en el que planeas ejecutrar Horizon.
  </p>

  <h4>Opciones de balance</h4>
  <p>Horizon permite que elijas entre tres estrategias de balance: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">simple</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auto</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>. La estrategia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">simple</span>, que es la opción por defecto del archivo de configuración, divide los trabajos entrantes de manera uniforme entre procesos:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'balance' =&gt; 'simple',
</code></pre>

  <p>La estrategia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auto</span> ajusta el número de procesos trabajadores por cola basado en la carga de trabajo de la cola. Por ejemplo, si tu cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notifications</span> tiene 1.000 trabajos esperando mientras tu cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">render</span> está vacía, Horizon asignará mas trabajadores a tu cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">notifications</span> hasta que esté vacía. Cuando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">balance</span> esté establecida a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>, el comportamiento predeterminado de Laravel será usado, el cual procesa las colas en el orden que son listadas en tu configuración.</p>
  <h4>Recorte de trabajos</h4>
  <p>El archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">horizon</span> te permite configurar cuánto tiempo los trabajos de recientes y fallidos deben ser persistidos (en minutos). Por defecto, los trabajos recientes son mantenidos por una hora mientras que los trabajos fallidos son mantenidos por una semana:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'trim' =&gt; [
    'recent' =&gt; 60,
    'failed' =&gt; 10080,
],
</code></pre>

  <h3>Autorización del dashboard</h3>
  <p>Horizon muestra un dashboard o panel de control en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/horizon</span>. Por defecto, sólo serás capaz de acceder a este dashboard en el entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>. Dentro de tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Providers/HorizonServiceProvider.php</span>, hay un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">gate</span>. Este gate de autorización controla el acceso a Horizon en entornos <strong>no locales</strong>. Eres libre de modificar este gate como sea necesario para restringir el acceso a tu instalación de Horizon:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Register the Horizon gate.
*
* This gate determines who can access Horizon in non-local environments.
*
* @return void
*/
protected function gate()
{
    Gate::define('viewHorizon', function (\$user) {
        return in_array(\$user-&gt;email, [
            'taylor@laravel.com',
        ]);
    });
}
</code></pre>

  <h2>Ejecutando Horizon</h2>
  <p>Una vez que has configurado tus workers en el archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/horizon.php</span>, puedes ejecutar Horizon usando el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">horizon</span>. Este único comando iniciará todos tus workers configurados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan horizon
</code></pre>

  <p>Puedes pausar los procesos de Horizon e instruirlo para continuar procesando trabajos usando los comandos Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">horizon:pause</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">horizon:continue</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan horizon:pause

php artisan horizon:continue
</code></pre>

  <p>Puedes terminar elegantemente el proceso maestro de Horizon en tu máquina usando el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">horizon:terminate</span>. Cualquiera de los trabajos que Horizon esté procesando actualmente será completado y después Horizon parará:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan horizon:terminate
</code></pre>

  <h3>Usando Horizon</h3>
  <p>Si estás usando Horizon en un servidor activo, deberías configurar un monitor de proceso para monitorear el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan horizon</span> y reiniciarlo si éste sale inesperadamente. Al momento de usar código reciente en tu servidor, necesitarás instruir el proceso maestro de Horizon para que termine así puede ser reiniciado por tu monitor de proceso y recibir tu cambios de código.</p>
  <h4>Configuración de Supervisor</h4>
  <p>Si estás usando el monitor de procesos de Supervisor para administrar tu proceso
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">horizon</span>, el siguiente archivo de configuración debería ser suficiente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>[program:horizon]
process_name=%(program_name)s
command=php /home/forge/app.com/artisan horizon
autostart=true
autorestart=true
user=forge
redirect_stderr=true
stdout_logfile=/home/forge/app.com/horizon.log
</code></pre>

  <p>TIP</p>
  <p>
    Si no estás cómodo administrando tus propios servidores, considera usar Laravel Forge . Forge aprovisiona tus propios servidores PHP 7+ con todo lo que necesitas para administrar modernas aplicaciones robustas de Laravel con Horizon.
  </p>

  <h2>Etiquetas</h2>
  <p>Horizon permite que asignes “etiquetas” a los trabajos, incluyendo correos válidos, difusiones de eventos, notificaciones y listeners de eventos encolados. De hecho, Horizon etiquetará inteligente y automáticamente la mayoría de los trabajos dependiendo de los modelos Eloquent que estén adjuntos al trabajo. Por ejemplo, echemos un vistazo al siguiente worker:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Jobs;

use App\Video;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class RenderVideo implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
    * The video instance.
    *
    * @var \App\Video
    */
    public \$video;

    /**
    * Create a new job instance.
    *
    * @param  \App\Video  \$video
    * @return void
    */
    public function __construct(Video \$video)
    {
        \$this-&gt;video = \$video;
    }

    /**
    * Execute the job.
    *
    * @return void
    */
    public function handle()
    {
        //
    }
}
</code></pre>

  <p>Si este trabajo es encolado con una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Video</span> que tenga un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">1</span>, recibirá automáticamente la etiqueta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Video:1</span>. Esto es debido a que Horizon examinará las propiedades del trabajo para cualquier modelo Eloquent. Si los modelos Eloquent son encontrados, Horizon etiquetará inteligentemente el trabajo usando el nombre de la clase y la clave primaria del modelo.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$video = App\Video::find(1);

App\Jobs\RenderVideo::dispatch(\$video);
</code></pre>

  <h4>Etiquetado manual</h4>
  <p>Si prefieres definir manualmente las etiquetas para uno de tus objetos encolables, puedes definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tags</span> en la clase:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>class RenderVideo implements ShouldQueue
{
    /**
    * Get the tags that should be assigned to the job.
    *
    * @return array
    */
    public function tags()
    {
        return ['render', 'video:'.\$this-&gt;video-&gt;id];
    }
}
</code></pre>

  <h2>Notificaciones</h2>
  <blockquote>
    <p><strong>Note:</strong> Al momento de configurar Horizon para enviar notificaciones de Slack o SMS, también deberías revisar los prerequisitos para el manejador de notificaciones relevante.
    </p>
  </blockquote>
  <p>Si prefieres ser notificado cuando una de tus colas tenga un largo tiempo de inactividad, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Horizon::routeMailNotificationsTo</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Horizon::routeSlackNotificationsTo</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Horizon::routeSmsNotificationsTo</span>. Puedes ejecutar estos métodos desde el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">HorizonServiceProvider</span> de tu aplicación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Horizon::routeMailNotificationsTo('example@example.com');
Horizon::routeSlackNotificationsTo('slack-webhook-url', '#channel');
Horizon::routeSmsNotificationsTo('15556667777');
</code></pre>

  <h4>Configurando las notificaciones de umbrales de tiempo de inactividad</h4>
  <p>Puedes configurar cuántos segundos son considerados un "tiempo de inactividad" dentro de tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/horizon.php</span>. La opción de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waits</span> dentro de este archivo permite que controles el umbral de tiempo de inactividad para cada combinación conexión / cola:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'waits' =&gt; [
    'redis:default' =&gt; 60,
],
</code></pre>

  <h2>Métricas</h2>
  <p>Horizon incluye un panel de métricas, el cual proporciona información de tus tiempos de trabajo y de espera en cola y tasa de rendimiento. Con el propósito de agregar contenido a este panel, deberías configurar el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">snapshot</span> de Horizon para que se ejecute cada 5 minutos por medio del planificador de tu aplicación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Define the application's command schedule.
*
* @param  \Illuminate\Console\Scheduling\Schedule  \$schedule
* @return void
*/
protected function schedule(Schedule \$schedule)
{
    \$schedule-&gt;command('horizon:snapshot')-&gt;everyFiveMinutes();
}
</code></pre>
</div>
""";