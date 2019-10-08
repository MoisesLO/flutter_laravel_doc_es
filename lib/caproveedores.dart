import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class CaProveedores extends StatelessWidget {
  final String title;
  CaProveedores(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmCaProveedores,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmCaProveedores = """
<div style='font-size: 14.2px;'>
<h1> Proveedores de Servicios</h1>
<ul>
    <li>Introducción</li>
    <li>
        Escribiendo proveedores de servicios
        <ul>
            <li>Método register</li>
            <li>Método boot</li>
        </ul>
    </li>
    <li>Registrando proveedores</li>
    <li>Proveedores diferidos</li>
</ul>

<h2> Introducción</h2>
<p>Los proveedores de servicios son la parte central de la maquetación de una aplicación Laravel. Tu propia aplicación, así como todos los servicios principales de Laravel son maquetados usando proveedores de servicios.</p>
<p>Pero, ¿qué queremos decir por "maquetación"? En general, nos referimos a <strong>registrar</strong> cosas, incluyendo registrar enlaces de contenedores de servicios, listeners de eventos, middleware e incluso rutas. Los proveedores de servicios son el lugar principal para configurar tu aplicación.</p>
<p>Si abres el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span> incluido con Laravel, verás un arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">providers</span>. Estos son todos los proveedores de servicio que serán cargados para tu aplicación. Observa que muchos de éstos son proveedores "diferidos", lo que significa que no serán cargados en cada solicitud, sino sólo cuando los servicios que proporcionan sean necesarios.</p>
<p>En este resumen aprendarás a escribir tus propios proveedores de servicio y registrarlos en tu aplicación de Laravel.</p>

<h2> Escribiendo proveedores de servicios</h2>
<p>
    Todos los proveedores de servicios extienden de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\ServiceProvider</span>. La mayoría de los proveedores de servicio contienen un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>. Dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span>, debes
    <strong>
        enlazar cosas sólo al
        contenedor de servicios
    </strong>
    . Nunca debes tratar de registrar ningún listener de eventos, rutas o cualquier otra pieza de funcionalidad dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span>.
</p>
<p>La línea de comandos Artisan puede generar un nuevo proveedor mediante el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:provider</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:provider RiakServiceProvider
</code></pre>


<h3> Método register</h3>
<p>
    Como mencionamos anteriormente, dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span>, debes sólo enlazar cosas al
    contenedor de servicio
    . Nunca debes intentar registrar ningún listener de eventos, rutas o cualquier otra pieza de funcionalidad dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span>. De lo contrario, puedes accidentalmente usar un servicio que es proporcionado por un proveedor de servicio que no aún no  se ha cargado.
</p>
<p>Vamos a echar un vistazo a un proveedor de servicio básico. Dentro de cualquiera de los métodos de tu proveedor de servicios, siempre tienes acceso a la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$app</span> que proporciona acceso al contenedor de servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Riak\Connection;
use Illuminate\Support\ServiceProvider;

class RiakServiceProvider extends ServiceProvider
{
    /**
    * Register bindings in the container.
    *
    * @return void
    */
    public function register()
    {
        \$this-&gt;app-&gt;singleton(Connection::class, function (\$app) {
            return new Connection(config('riak'));
        });
    }
}
</code></pre>

<p>
    Este proveedor de servicios sólo define un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span> y usa dicho método para definir una implementación de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Riak\Connection</span> en el contenedor de servicios. Si no entiendes cómo el contenedor de servicios funciona, revisa
    su documentación
    .
</p>
<h4> Propiedades <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bindings</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">singletons</span></h4>
<p>Si tu proveedor de servicios registra muchos bindings simples, puedes querer usar las propiedades <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bindings</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">singletons</span> en lugar de manualmente registrar cada binding de contenedor. Cuando el proveedor de servicios es cargado por el framework, automáticamente comprobará dichas propiedades y registrará sus bindings:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use App\Contracts\ServerProvider;
use App\Contracts\DowntimeNotifier;
use App\Services\ServerToolsProvider;
use Illuminate\Support\ServiceProvider;
use App\Services\PingdomDowntimeNotifier;
use App\Services\DigitalOceanServerProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
    * All of the container bindings that should be registered.
    *
    * @var array
    */
    public \$bindings = [
        ServerProvider::class =&gt; DigitalOceanServerProvider::class,
    ];

    /**
    * All of the container singletons that should be registered.
    *
    * @var array
    */
    public \$singletons = [
        DowntimeNotifier::class =&gt; PingdomDowntimeNotifier::class,
        ServerToolsProvider::class =&gt; ServerToolsProvider::class,
    ];
}
</code></pre>


<h3> Método boot</h3>
<p>
    Entonces, ¿qué sucede si necesitamos registrar un
    view composer
    dentro de nuestro proveedor de servicios? Esto debería ser hecho dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>. <strong>Este método es llamado luego de que todos los demás proveedores de servicio sean registrados</strong>, lo que quiere decir que tienes acceso a todos los demás proveedores de servicio que han sido registrados por el framework:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider
{
    /**
    * Bootstrap any application services.
    *
    * @return void
    */
    public function boot()
    {
        view()-&gt;composer('view', function () {
            //
        });
    }
}
</code></pre>

<h4> Inyección de dependencias en el método boot</h4>
<p>
    Puedes escribir manualmente las dependencias para el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu proveedor de servicios. El
    contenedor de servicios
    inyectará automáticamente cualquier dependencia que necesites:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Contracts\Routing\ResponseFactory;

public function boot(ResponseFactory \$response)
{
    \$response-&gt;macro('caps', function (\$value) {
        //
    });
}
</code></pre>


<h2> Registrando proveedores</h2>
<p>Todos los proveedores de servicios son registrados en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>. Este archivo contiene un arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">providers</span> donde puedes listar los nombres de clase de tus proveedores de servicios. Por defecto, una serie de proveedores de servicios principales de Laravel son listados en este arreglo. Estos proveedores maquetan los componentes principales de Laravel, como mailer, queue, cache entre otros.</p>
<p>Para registrar tu proveedor, agregalo al arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'providers' =&gt; [
    // Other Service Providers

    App\Providers\ComposerServiceProvider::class,
],
</code></pre>


<h2> Proveedores diferidos</h2>
<p>
    Si tu proveedor <strong>sólo</strong> está registrando enlaces en el
    contenedor de servicios
    , puedes elegir diferir su registro hasta que uno de los enlaces registrados sea necesario. Diferir la carga de dicho proveedor mejorará el rendimiento de tu aplicación, ya que no es cargado desde el sistema de archivos en cada solicitud.
</p>
<p>Laravel compila y almacena una lista de todos los servicios suministrados por proveedores de servicios diferidos, junto con el nombre de clase de su proveedor de servicio. Luego, sólo cuando intentas resolver uno de estos servicios Laravel carga el proveedor de servicio.</p>
<p>Para diferir la carga de un proveedor, Implementa la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\Illuminate\Contracts\Support\DeferrableProvider</span> y define un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">provides</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">provides</span> debe retornar los enlaces del contenedor de servicio registrados por el proveedor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Riak\Connection;
use Illuminate\Support\ServiceProvider;
use Illuminate\Contracts\Support\DeferrableProvider;

class RiakServiceProvider extends ServiceProvider implements DeferrableProvider
{
    /**
    * Register the service provider.
    *
    * @return void
    */
    public function register()
    {
        \$this-&gt;app-&gt;singleton(Connection::class, function (\$app) {
            return new Connection(\$app['config']['riak']);
        });
    }

    /**
    * Get the services provided by the provider.
    *
    * @return array
    */
    public function provides()
    {
        return [Connection::class];
    }
}
</code></pre>

</div>
""";