import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PqTelescope extends StatelessWidget {
  final String title;
  PqTelescope(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmPqTelescope,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmPqTelescope = """
<!-- Laravel Telescope -->
<div style='font-size: 14.2px;'>
  <h1>Laravel Telescope</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Instalación
      <ul>
        <li>Configuración</li>
        <li>Remover datos de entradas de Telescope</li>
        <li>Personalizar la migración</li>
      </ul>
    </li>
    <li>Autorización para el panel de control</li>
    <li>
      Filtros
      <ul>
        <li>Entradas</li>
        <li>Lotes</li>
      </ul>
    </li>
    <li>
      Etiquetado
      <ul>
        <li>Agregar etiquetas personalizadas</li>
      </ul>
    </li>
    <li>
      Observadores disponibles
      <ul>
        <li>Observador De caché</li>
        <li>Observador De comandos</li>
        <li>Observador De variables</li>
        <li>Observador De eventos</li>
        <li>Observador De excepciones</li>
        <li>Observador De gates</li>
        <li>Observador De trabajos</li>
        <li>Observador De registros (log)</li>
        <li>Observador De correos</li>
        <li>Observador De modelos</li>
        <li>Observador De notificaciones</li>
        <li>Observador De consultas De Bases De Datos</li>
        <li>Observador De Redis</li>
        <li>Observador De solicitudes (request)</li>
        <li>Observador De tareas programadas</li>
      </ul>
    </li>
  </ul>

  <h2>Introducción</h2>
  <p>Telescope de Laravel es un elegante asistente para depurar código para el framework de Laravel. Telescope proporciona información detallada de las solicitudes entrantes de tu aplicación, excepciones, entradas de log, consultas de bases de datos, trabajos en cola, correos, notificaciones, operaciones de caché, tareas programadas, valores de variables y mucho más. Telescope acompaña maravillosamente tu entorno de desarrollo de Laravel.</p>
  <p></p>

  <h2>Instalación</h2>
  <p>Puedes usar Composer para instalar Telescope dentro de tu proyecto de Laravel:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require laravel/telescope
</code></pre>

  <p>Después de instalar Telescope, publica sus recursos usando el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">telescope:install</span>. Después de instalar Telescope, también deberías ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan telescope:install

php artisan migrate
</code></pre>

  <h4>Actualizando Telescope</h4>
  <p>Si haces una actualización de Telescope, deberías volver a publicar los recursos de Telescope:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan telescope:publish
</code></pre>

  <h3>Instalando únicamente en entornos específicos</h3>
  <p>Si planeas usar Telescope solamente para apoyar tu desarrollo local, puedes instalar Telescope usando la bandera <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--dev</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require laravel/telescope --dev
</code></pre>

  <p>Después de ejecutar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">telescope:install</span>, deberías remover el registro de proveedor de servicio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">TelescopeServiceProvider</span> de tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span>. En su lugar, registra manualmente el proveedor de servicio en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\Providers\TelescopeServiceProvider;

/**
* Register any application services.
*
* @return void
*/
public function register()
{
    if (\$this-&gt;app-&gt;isLocal()) {
        \$this-&gt;app-&gt;register(TelescopeServiceProvider::class);
    }
}
</code></pre>

  <h3>Personalización de la migración</h3>
  <p>Si no vas a usar las migraciones predeterminadas de Telescope, deberías ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Telescope::ignoreMigrations</span> en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>. Puedes exportar las migraciones predeterminadas usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan vendor:publish
  --tag=telescope-migrations</span>.</p>

  <h3>Configuración</h3>
  <p>Después de publicar los recursos de Telescope, su archivo de configuración principal estará ubicado en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/telescope.php</span>. Este archivo de configuración permite que configures tus opciones de observador (watcher) y cada opción de configuración incluye una descripción de su propósito, así que asegúrate de examinar meticulosamente este archivo.</p>
  <p>Si lo deseas, puedes deshabilitar completamente la colección de datos de Telescope usando la opción de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">enabled</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'enabled' =&gt; env('TELESCOPE_ENABLED', true),
</code></pre>

  <h3>Remover datos de entradas de Telescope</h3>
  <p>Sin la remoción, la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">telescope_entries</span> puede acumular registros muy rápidamente. Para mitigar esto, deberías programar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">telescope:prune</span> para que se ejecute diariamente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$schedule-&gt;command('telescope:prune')-&gt;daily();
</code></pre>

  <p>De forma predeterminada, aquellas entradas con más de 24 horas serán removidas. Puedes usar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hours</span> al momento de ejecutar el comando para indicar cuánto tiempo retiene los datos Telescope. Por ejemplo, el siguiente comando eliminará todos los registros con más de 48 horas desde que fueron creados.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$schedule-&gt;command('telescope:prune --hours=48')-&gt;daily();
</code></pre>

  <h2>Autorización para el panel de control</h2>
  <p>Telescope viene con un panel de control en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/telescope</span>. De forma predeterminada, solamente serás capaz de acceder este panel de control en el entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>. Dentro de tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Providers/TelescopeServiceProvider.php</span>, hay un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">gate</span>. Esta gate de autorización controla el acceso a Telescope en los entornos
    <strong>que no son locales</strong>. Eres libre de modificar este gate de acuerdo a tus necesidades para restringir el acceso a tu instalación de Telescope:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Register the Telescope gate.
*
* This gate determines who can access Telescope in non-local environments.
*
* @return void
*/
protected function gate()
{
    Gate::define('viewTelescope', function (\$user) {
        return in_array(\$user-&gt;email, [
            'taylor@laravel.com',
        ]);
    });
}
</code></pre>

  <h2>Filtros</h2>

  <h3>Entradas</h3>
  <p>Puedes filtrar los datos que son guardados por Telescope por medio de la función de retorno (callback) <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filter</span> que está registrada en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">TelescopeServiceProvider</span>. De forma predeterminada, esta función de retorno guarda todos los datos en el entorno
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span> y las excepciones, trabajos que fallan, tareas programadas, y datos de las etiquetas monitoreadas en los demás entornos.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Register any application services.
*
* @return void
*/
public function register()
{
    \$this-&gt;hideSensitiveRequestDetails();

    Telescope::filter(function (IncomingEntry \$entry) {
        if (\$this-&gt;app-&gt;isLocal()) {
            return true;
        }

        return \$entry-&gt;isReportableException() ||
            \$entry-&gt;isFailedJob() ||
            \$entry-&gt;isScheduledTask() ||
            \$entry-&gt;hasMonitoredTag();
    });
}
</code></pre>

  <h3>Lotes</h3>
  <p>Mientras la función de retorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filter</span> filtra datos por entradas individuales, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filterBatch</span> para registrar una función de retorno que filtra todos los datos para un comando de consola o solicitud dado. Si la función de retorno devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>, la totalidad de las entradas son guardadas por Telescope:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Support\Collection;

/**
* Register any application services.
*
* @return void
*/
public function register()
{
    \$this-&gt;hideSensitiveRequestDetails();

    Telescope::filterBatch(function (Collection \$entries) {
        if (\$this-&gt;app-&gt;isLocal()) {
            return true;
        }

        return \$entries-&gt;contains(function (\$entry) {
            return \$entry-&gt;isReportableException() ||
                \$entry-&gt;isFailedJob() ||
                \$entry-&gt;isScheduledTask() ||
                \$entry-&gt;hasMonitoredTag();
            });
    });
}
</code></pre>

  <h2>Etiquetado</h2>
  <p>Telescope te permite buscar entradas por "etiqueta". A menudo, las etiquetas son nombres de clases de modelos de Eloquent o IDs de usuarios autenticados que Telescope automáticamente agrega a entradas. Ocasionalmente, puede que quieras adjuntar tus propias etiquetas personalizadas a entradas. Para lograr esto, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Telescope::tag</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tags</span> acepta un callback que debe retornar un arreglo de etiquetas. Las etiquetas retornadas por el callback se fusionarán con cualquier etiqueta que Telescope automáticamente agregaría a la entrada. Debes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tags</span> dentro de tu
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">TelescopeServiceProvider</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Laravel\Telescope\Telescope;
/**
* Register any application services.
*
* @return void
*/
public function register()
{
    \$this-&gt;hideSensitiveRequestDetails();
    Telescope::tag(function (IncomingEntry \$entry) {
        if (\$entry-&gt;type === 'request') {
            return ['status:'.\$entry-&gt;content['response_status']];
        }
        return [];
    });
}
</code></pre>

  <h2>Observadores disponibles</h2>
  <p>Los observadores de Telescope coleccionan los datos de la aplicación cuando una solicitud o comando de consola es ejecutado. Puedes personalizar la lista de observadores que deseas habilitar dentro de tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/telescope.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'watchers' =&gt; [
    Watchers\CacheWatcher::class =&gt; true,
    Watchers\CommandWatcher::class =&gt; true,
    ...
],
</code></pre>

  <p>Algunos observadores también permiten que agregues opciones de personalización extra:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'watchers' =&gt; [
    Watchers\QueryWatcher::class =&gt; [
        'enabled' =&gt; env('TELESCOPE_QUERY_WATCHER', true),
        'slow' =&gt; 100,
    ],
    ...
],
</code></pre>

  <h3>Observador de caché</h3>
  <p>El observador de caché (Cache Watcher) guarda datos cuando una clave está presente, falta, es actualizada u olvidada en caché.</p>

  <h3>Observador de comandos</h3>
  <p>El observador de comandos (command watcher) guarda los argumentos, opciones, códigos de salida, información enviada a la pantalla cada vez que se ejecuta un comando Artisan. Si deseas excluir ciertos comandos para que no sean grabados por el observador, puedes especificar el comando junto con la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ignore</span> en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/telescope.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'watchers' =&gt; [
    Watchers\CommandWatcher::class =&gt; [
        'enabled' =&gt; env('TELESCOPE_COMMAND_WATCHER', true),
        'ignore' =&gt; ['key:generate'],
    ],
    ...
],
</code></pre>

  <h3>Observador de variables</h3>
  <p>El observador de variables (dump watcher) guarda y muestra los valores de tus variables en Telescope. Al momento de usar Laravel, los valores de las variables pueden ser mostrados usando la función global <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span>. La pestaña del observador de variables debe estar abierta en un navegador para que los valores sean guardados, de lo contrario serán ignorados por el observador.
  </p>

  <h3>Observador de eventos</h3>
  <p>El observador de eventos (event watcher) guarda la carga, oyentes (listeners) y los datos de difusión (broadcast) para cualquier evento que sea despachado por tu aplicación. Los eventos internos del framework de Laravel son ignorados por el observador de eventos.</p>

  <h3>Observador de excepciones</h3>
  <p>El observador de excepciones (exception watcher) guarda los datos y el seguimiento de la pila para cualquier excepción reportable que sea lanzada por tu aplicación.</p>

  <h3>Observador de gates</h3>
  <p>El observador de gate (gate watcher) guarda los datos y el resultado de verificaciones de gates y políticas hechas por tu aplicación. Si deseas excluir ciertas habilidades para que no sean guardadas por el observador, puedes especificar aquellas en la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ignore_abilities</span> en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/telescope.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'watchers' =&gt; [
    Watchers\GateWatcher::class =&gt; [
        'enabled' =&gt; env('TELESCOPE_GATE_WATCHER', true),
        'ignore_abilities' =&gt; ['viewNova'],
    ],
    ...
],
</code></pre>

  <h3>Observador de trabajos</h3>
  <p>El observador de trabajos (job watcher) guarda los datos y estado de los trabajos despachado por tu aplicación.</p>

  <h3>Observador de registros</h3>
  <p>El observador de registros (log watcher) guarda datos de los registros escritos por tu aplicación.
  </p>

  <h3>Observador de correos</h3>
  <p>El observador de correos (mail watcher) permite que veas una pre-visualización en el navegador de los correos junto con sus datos adjuntados. También puedes descargar los correos como un archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.eml</span>.</p>

  <h3>Observador de modelos</h3>
  <p>El observador de modelos (model watcher) guarda los cambios del modelo cada vez que se despacha un evento <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">restored</span>, o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted</span> de Eloquent. Puedes especificar cuáles eventos de modelos deberían ser guardados por medio de la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">events</span> del observador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'watchers' =&gt; [
    Watchers\ModelWatcher::class =&gt; [
        'enabled' =&gt; env('TELESCOPE_MODEL_WATCHER', true),
        'events' =&gt; ['eloquent.created*', 'eloquent.updated*'],
    ],
    ...
],
</code></pre>

  <h3>Observador de notificaciones</h3>
  <p>El observador de notificaciones (notification watcher) guarda todas las notificaciones enviadas por tu aplicación. Si la notificación dispara un correo y tienes el observador de correos habilitado, el correo también estará disponible para pre-visualizar en la pantalla del observador de correos.</p>

  <h3>Observador de consultas de bases de datos</h3>
  <p>El observador de consultas de bases de datos (query watcher) guarda los comandos SQL, enlaces, y tiempo de ejecución para todas las consultas de bases de datos que sean ejecutadas por tu aplicación. El observador también coloca una etiqueta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slow</span> a las consultas más lentas, aquellas que tardan más de 100 micro segundos. Puedes personalizar el umbral para las consultas lentas usando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slow</span> del observador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'watchers' =&gt; [
    Watchers\QueryWatcher::class =&gt; [
        'enabled' =&gt; env('TELESCOPE_QUERY_WATCHER', true),
        'slow' =&gt; 50,
    ],
    ...
],
</code></pre>

  <h3>Observador de Redis</h3>

  <p>Nota</p>
  <p>Los eventos de Redis deben ser habilitados por el observador de Redis (Redis watcher) para que funcione de forma correcta. Puedes habilitar los eventos de Redis ejecutando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Redis::enableEvents()</span> en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Providers/AppServiceProvider.php</span>.
  </p>

  <p>El observador de Redis (redis watcher) guarda todos los comandos de Redis ejecutados por tu aplicación. Si estás usando Redis para el almacenamiento de caché, también los comandos de caché serán guardados por el observador de Redis.</p>

  <h3>Observador de solicitudes</h3>
  <p>El observador de solicitudes (request watcher) guarda la solicitud, encabezados, la sesión y los datos de respuesta asociados con las solicitudes manejadas por la aplicación. Puedes limitar tus datos de respuesta por medio de la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size_limit</span> (en KB):</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'watchers' =&gt; [
    Watchers\RequestWatcher::class =&gt; [
        'enabled' =&gt; env('TELESCOPE_REQUEST_WATCHER', true),
        'size_limit' =&gt; env('TELESCOPE_RESPONSE_SIZE_LIMIT', 64),
    ],
    ...
],
</code></pre>

  <h3>Observador de tareas programadas</h3>
  <p>El observador de tareas programadas (schedule watcher) guarda el comando y la información enviada a la pantalla de las tareas programadas que ejecuta tu aplicación.</p>
</div>
""";