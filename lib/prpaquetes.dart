import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrPaquetes extends StatelessWidget {
  final String title;
  PrPaquetes(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrPaquetes,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrPaquetes = """
<div style='font-size: 14.2px;'>
<h1>Desarrollo de Paquetes</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Una nota sobre facades</li>
        </ul>
    </li>
    <li>Descubrimiento de paquetes</li>
    <li>Proveedores de servicios</li>
    <li>
        Recursos
        <ul>
            <li>Configuración</li>
            <li>Migraciones</li>
            <li>Rutas</li>
            <li>Traducciones</li>
            <li>Vistas</li>
        </ul>
    </li>
    <li>Comandos</li>
    <li>Archivos públicos</li>
    <li>Publicar grupos de archivos</li>
</ul>

<h2>Introducción</h2>
<p>
    Los paquetes son la forma principal de agregar funcionalidad a Laravel. Los paquetes pueden ser
    cualquier cosa, desde una estupenda manera de trabajar con fechas como

    Carbon


    , o un framework completo de pruebas BDD como

    Behat


    .
</p>
<p>Hay diferentes tipos de paquetes. Algunos paquetes son independientes, lo que significa que
    funcionan con cualquier framework de PHP. Carbon y Behat son ejemplos de paquetes
    independientes. Cualquiera de estos paquetes se puede usar con Laravel simplemente
    solicitándolos en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span>.</p>
<p>Por otro lado, otros paquetes están específicamente destinados para su uso con Laravel. Estos
    paquetes pueden tener rutas, controladores, vistas y configuraciones específicamente diseñadas
    para mejorar una aplicación Laravel. Esta guía cubre principalmente el desarrollo de aquellos
    paquetes que son específicos de Laravel.</p>

<h3># Una nota sobre facades</h3>
<p>
    Al escribir una aplicación Laravel, generalmente no importa si usas interfaces o facades ya que
    ambos brindan niveles esencialmente iguales de capacidad de pruebas. Sin embargo, al escribir
    paquetes, tu paquete normalmente no tendrá acceso a todos las funciones helpers de prueba de
    Laravel. Si deseas escribir pruebas para el paquete como si existiera dentro de una típica
    aplicación Laravel puedes usar el paquete

    Orchestral Testbench


    .
</p>

<h2>Descubrimiento de paquetes</h2>
<p>
    En el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span> de una aplicación Laravel, la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">providers</span> define una lista de proveedores de servicios que Laravel debe cargar.
    Cuando alguien instala tu paquete normalmente querrás que tu proveedor de servicio sea incluido
    en esta lista. En lugar de requerir que los usuarios agreguen manualmente su proveedor de
    servicios a la lista, puede definir el proveedor en la sección <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extra</span> del archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span> de tu paquete. Además de los proveedores de servicios, también puedes
    enumerar los
    facades
    que desees registrar:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>"extra": {
    "laravel": {
        "providers": [
            "Barryvdh\\Debugbar\\ServiceProvider"
        ],
        "aliases": {
            "Debugbar": "Barryvdh\\Debugbar\\Facade"
        }
    }
},
</code></pre>

<p>Una vez que tu paquete se haya configurado para su descubrimiento, Laravel registrará
    automáticamente sus proveedores de servicios y facades cuando esté instalado, creando una
    experiencia de instalación conveniente para los usuarios de tu paquete.</p>
<h3># Exclusión del descubrimiento de paquetes</h3>
<p>Si eres es el consumidor de un paquete y deseas deshabilitar el descubrimiento de paquetes para
    un paquete, puedes incluir el nombre del paquete en la sección <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extra</span> del archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span> de tu aplicación Laravel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>"extra": {
    "laravel": {
        "dont-discover": [
            "barryvdh/laravel-debugbar"
        ]
    }
},
</code></pre>

<p>Puede deshabilitar el descubrimiento de paquetes para todos los paquetes que usan el carácter
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*</span> dentro de la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dont-discover</span> de tu aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>"extra": {
    "laravel": {
        "dont-discover": [
            "*"
        ]
    }
},
</code></pre>


<h2>Proveedores de servicios</h2>
<p>
    Los
    Proveedores de Servicios
    son la conexión entre tu paquete y Laravel. Un proveedor de servicios es responsable de enlazar
    cosas a Laravel con el
    Contenedor de Servicios
    e informar a Laravel dónde cargar los recursos del paquete como vistas y archivos de
    configuración y de configuración regional.
</p>
<p>
    Un Proveedor de Servicios extiende de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\ServiceProvider</span> y
    contiene dos métodos: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>. La clase base <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ServiceProvider</span>
    está ubicada en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">illuminate/support</span>, donde debemos especificar todas las
    dependencias de nuestro paquete. Para obtener más información sobre la estructura y el propósito
    de los proveedores de servicios, visita su
    documentación
    .
</p>

<h2>Recursos</h2>

<h3># Configuración</h3>
<p>Por lo general, deberás publicar el archivo de configuración de tu paquete en el propio
    directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span> de la aplicación. Esto permitirá a los usuarios anular fácilmente
    sus opciones de configuración predeterminadas. Para permitir que se publiquen sus archivos de
    configuración, debes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publishes</span> desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    de tu proveedor de servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;publishes([
        __DIR__.'/path/to/config/courier.php' =&gt; config_path('courier.php'),
    ]);
}
</code></pre>

<p>Ahora, cuando los usuarios de tu paquete ejecutan el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span> de
    Laravel, su archivo se copiará a la ubicación de publicación especificada. Una vez que se haya
    publicado su configuración, se podrá acceder a sus valores como cualquier otro archivo de
    configuración:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = config('courier.option');
</code></pre>


<p>Nota</p>
<p>No debes definir funciones anónimas en tus archivos de configuración ya que no se pueden
    serializar correctamente cuando los usuarios ejecutan el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config:cache</span>.</p>


<h4># Configuración predeterminada del paquete</h4>
<p>También puedes fusionar tu propio archivo de configuración de paquete con la copia publicada de
    la aplicación. Esto permitirá que los usuarios definan solo las opciones que realmente desean
    anular en la copia publicada de la configuración. Para fusionar las configuraciones, use el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mergeConfigFrom</span> dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span> de tu proveedor de
    servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Register bindings in the container.
*
* @return void
*/
public function register()
{
    \$this-&gt;mergeConfigFrom(
        __DIR__.'/path/to/config/courier.php', 'courier'
    );
}
</code></pre>


<p>Nota</p>
<p>Este método solo combina el primer nivel de la matriz de configuración. Si los usuarios definen
    parcialmente una matriz de configuración multidimensional las opciones faltantes no se
    fusionarán.</p>


<h3># Rutas</h3>
<p>Si tu paquete contiene rutas, puede cargarlas usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadRoutesFrom</span>. Este
    método determinará automáticamente si las rutas de la aplicación se almacenan en caché y no
    cargarán el archivo de rutas si las rutas ya se han almacenado en caché:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;loadRoutesFrom(__DIR__.'/routes.php');
}
</code></pre>


<h3># Migraciones</h3>
<p>Si tu paquete contiene migraciones de base de datos, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadMigrationsFrom</span>
    para informarle a Laravel cómo cargarlas. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadMigrationsFrom</span> acepta la
    ruta a las migraciones de tu paquete como su único argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;loadMigrationsFrom(__DIR__.'/path/to/migrations');
}
</code></pre>

<p>Una vez que se hayan registrado las migraciones de tu paquete, éstas se ejecutarán
    automáticamente cuando se utilize el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan migrate</span>. Cabe destacar que
    no es necesario exportarlas al directorio principal de las migraciones en la aplicación.</p>

<h3># Traducciones</h3>
<p>Si tu paquete contiene archivos de traducción puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadTranslationsFrom</span> para informarle a Laravel cómo cargarlos. Por ejemplo, si tu
    paquete se llama <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">courier</span>, debes agregar lo siguiente al método<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de
    tu proveedor de servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;loadTranslationsFrom(__DIR__.'/path/to/translations', 'courier');
}
</code></pre>

<p>Las traducciones de paquetes se referencian usando la convención de sintaxis <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package::file.line</span>.
    Por lo tanto, puedes cargar la línea <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">welcome</span> del paquete <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">courier</span> del
    archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">messages</span> de la siguiente manera:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo trans('courier::messages.welcome');
</code></pre>

<h4># Publicación de traducciones</h4>
<p>Si deseas publicar las traducciones de tu paquete en el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang/vendor</span> de la aplicación, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publishes</span> del proveedor de servicios. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publishes</span> acepta un
    arreglo de rutas de paquetes y sus ubicaciones de publicación deseadas. Por ejemplo, para
    publicar los archivos de traducción para el paquete <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">courier</span>, puedes hacer lo
    siguiente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;loadTranslationsFrom(__DIR__.'/path/to/translations', 'courier');

    \$this-&gt;publishes([
        __DIR__.'/path/to/translations' =&gt; resource_path('lang/vendor/courier'),
    ]);
}
</code></pre>

<p>Ahora, cuando los usuarios de tu paquete ejecutan el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span>
    de Laravel, las traducciones de tu paquete se publicarán en la ubicación de publicación
    especificada.</p>

<h3># Vistas</h3>
<p>Para registrar las vistas de tu paquete con Laravel necesitas decirle a Laravel dónde están
    ubicadas. Puedes hacerlo utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadViewsFrom</span> del proveedor de
    servicios. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadViewsFrom</span> acepta dos argumentos: la ruta a sus plantillas
    de vista y el nombre de tu paquete. Por ejemplo, si el nombre de tu paquete es
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">courier</span>, debe agregar lo siguiente al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu proveedor de
    servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;loadViewsFrom(__DIR__.'/path/to/views', 'courier');
}
</code></pre>

<p>Las vistas de paquete se referencian usando la convención de sintaxis <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package::view</span>.
    Entonces, una vez que tu ruta de vista se registra en un proveedor de servicios, puedes cargar
    la vista <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">admin</span> del paquete <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">courier</span> de la siguiente manera:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('admin', function () {
    return view('courier::admin');
});
</code></pre>

<h4># Desactivar vistas del paquete</h4>
<p>Cuando utilizas el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadViewsFrom</span>, Laravel en realidad registra dos
    ubicaciones para sus vistas: el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor</span> de la aplicación
    y el directorio que tu especificas. Entonces, usando el ejemplo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">courier</span>, Laravel
    primero comprobará si el desarrollador ha proporcionado una versión personalizada de la vista en
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor/courier</span>. Entonces, si la vista no se ha personalizado,
    Laravel buscará en el directorio de las vistas del paquete que has colocado en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadViewsFrom</span>.
    Esto facilita a los usuarios del paquete personalizar o anular las vistas de tu paquete.</p>
<h4># Publicación de vistas</h4>
<p>Si desea que tus vistas estén disponibles para su publicación en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor</span>
    de la aplicación, puedes usar el método<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publishes</span> del proveedor de servicios. El
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publishes</span> acepta una matriz de rutas de vista de paquete y sus ubicaciones
    de publicación deseadas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;loadViewsFrom(__DIR__.'/path/to/views', 'courier');

    \$this-&gt;publishes([
        __DIR__.'/path/to/views' =&gt; resource_path('views/vendor/courier'),
    ]);
}
</code></pre>

<p>Ahora, cuando los usuarios de su paquete ejecutan el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span>
    de Laravel, las vistas de su paquete se copiarán en la ubicación especificada.</p>

<h2>Comandos</h2>
<p>Para registrar los comandos Artisan de tu paquete con Laravel puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">commands</span>.
    Este método espera un arreglo con los nombres de clases de comando. Una vez que los comandos han
    sido registrados, puedes ejecutarlos usando Artisan CLI:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Bootstrap the application services.
*
* @return void
*/
public function boot()
{
    if (\$this-&gt;app-&gt;runningInConsole()) {
        \$this-&gt;commands([
            FooCommand::class,
            BarCommand::class,
        ]);
    }
}
</code></pre>


<h2>Archivos públicos</h2>
<p>Tu paquete puede tener archivos como JavaScript, CSS e imágenes. Para publicar estos archivos en
    el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span> de la aplicación debes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publishes</span>
    del proveedor de servicios. En este ejemplo, también agregaremos una etiqueta de grupo de
    archivos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span>, que se puede usar para publicar grupos de archivos relacionados:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;publishes([
        __DIR__.'/path/to/assets' =&gt; public_path('vendor/courier'),
    ], 'public');
}
</code></pre>

<p>Ahora, cuando los usuarios de tu paquete ejecuten el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span> tus
    archivos se copiarán en la ubicación especificada. Como normalmente necesitarás sobrescribir los
    archivos cada vez que se actualice el paquete, puedes usar el indicador <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--force</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan vendor:publish --tag=public --force
</code></pre>


<h2>Publicar grupos de archivos</h2>
<p>Es posible que desees publicar grupos de archivos y recursos de paquetes por separado. Por
    ejemplo, es posible que desees permitir que los usuarios publiquen los archivos de configuración
    de su paquete sin verse obligados a publicar los archivos de tu paquete. Puede hacer esto
    "etiquetándolos" cuando llames al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publishes</span> del proveedor de servicios de un
    paquete. Por ejemplo, usemos etiquetas para definir dos grupos de publicación en el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de un proveedor de servicios de paquetes:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;publishes([
        __DIR__.'/../config/package.php' =&gt; config_path('package.php')
    ], 'config');

    \$this-&gt;publishes([
        __DIR__.'/../database/migrations/' =&gt; database_path('migrations')
    ], 'migrations');
}
</code></pre>

<p>Ahora tus usuarios pueden publicar estos grupos por separado al hacer referencia a su etiqueta
    cuando ejecuten el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan vendor:publish --tag=config
</code></pre>
</div>
""";