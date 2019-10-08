import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrCache extends StatelessWidget {
  final String title;
  PrCache(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrCache,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrCache = """
<div style='font-size: 14.2px;'>
<h1>Caché</h1>
<ul>
    <li>
        Configuración
        <ul>
            <li>Prerrequisitos del controlador</li>
        </ul>
    </li>
    <li>
        Uso de caché
        <ul>
            <li>Obtener una instancia de caché</li>
            <li>Recuperar elementos de caché</li>
            <li>Almacenar elementos de caché</li>
            <li>Eliminar elementos de caché</li>
            <li>Cierres atómicos</li>
            <li>El helper cache</li>
        </ul>
    </li>
    <li>
        Etiquetas de caché
        <ul>
            <li>Almacenar elementos de caché etiquetados</li>
            <li>Acceder a elementos de caché etiquetados</li>
            <li>Eliminar elementos de caché etiquetados</li>
        </ul>
    </li>
    <li>
        Agregar controladores de caché personalizados
        <ul>
            <li>Escribir el driver</li>
            <li>Registrar el driver</li>
        </ul>
    </li>
    <li>Eventos</li>
</ul>

<h2>Configuración</h2>
<p>
    Laravel proporciona una API expresiva y unificada para varios backends de almacenamiento de
    caché. La configuración de caché está ubicada en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/cache.php</span>. En este archivo
    puedes indicar el controlador de caché que desees utilizar por defecto en toda tu aplicación.
    Por defecto, Laravel es compatible con los almacenamientos en caché más populares, tales como

    Memcached


    y

    Redis


    .
</p>
<p>El archivo de configuración de caché contiene otras opciones adicionales, las cuales están
    documentadas dentro del mismo archivo, por lo que deberás asegurarte de revisar estas opciones.
    Por defecto, Laravel está configurado para utilizar el controlador de caché <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>,
    que almacena los objetos de caché serializados en el sistema de archivos. Para aplicaciones más
    grandes, es recomendable que utilices un controlador más robusto como Memcached o Redis. Incluso
    puedes configurar múltiples configuraciones de caché para el mismo controlador.</p>

<h3># Prerrequisitos del controlador</h3>
<h4># Base de datos</h4>
<p>Cuando utilices el controlador de caché <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>, necesitarás configurar una tabla
    que contenga los elementos de caché. Puedes encontrar un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Schema</span> de ejemplo en la
    tabla inferior:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Schema::create('cache', function (\$table) {
    \$table-&gt;string('key')-&gt;unique();
    \$table-&gt;text('value');
    \$table-&gt;integer('expiration');
});
</code></pre>


<p>TIP</p>
<p>También puedes utilizar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan cache:table</span> para generar una
    migración con el esquema apropiado.</p>


<h4># Memcached</h4>
<p>
    Utilizar el controlador Memcached requiere que tengas instalado el

    paquete de Memcached PECL


    . Puedes listar todos tus servidores de Memcached en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/cache.php</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'memcached' =&gt; [
    [
        'host' =&gt; '127.0.0.1',
        'port' =&gt; 11211,
        'weight' =&gt; 100
    ],
],
</code></pre>

<p>También puedes establecer la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">host</span> a la ruta de un socket de UNIX. Si haces
    esto, la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">port</span> se debe establecer a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">0</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'memcached' =&gt; [
    [
        'host' =&gt; '/var/run/memcached/memcached.sock',
        'port' =&gt; 0,
        'weight' =&gt; 100
    ],
],
</code></pre>

<h4># Redis</h4>
<p>Antes de comenzar a utilizar el caché con Redis en Laravel, deberás instalar ya sea la extensión
    de PHP PhpRedis mediante PECL o instalar el paquete <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">predis/predis</span> (~1.0) mediante
    Composer.</p>
<p>Para más información sobre cómo configurar Redis, consulta la página de la documentación de
    Laravel.</p>

<h2>Uso de daché</h2>

<h3># Obtener una instancia de caché</h3>
<p>Las interfaces <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Cache\Factory</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Cache\Repository</span>
    proporcionan acceso a los servicios de caché de Laravel. La interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Factory</span>
    proporciona acceso a todos los controladores de caché definidos para tu aplicación. La interfaz
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Repository</span> típicamente es una implementación del controlador de caché
    predeterminado para tu aplicación según lo especificado en tu archivo de configuración de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span>.
</p>
<p>Sin embargo, también puedes usar el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span>, que es lo que usaremos a lo largo
    de esta documentación. El facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span> proporciona acceso conveniente y directo a
    las implementaciones subyacientes de las interfaces de Laravel.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Cache;

class UserController extends Controller
{
    /**
    * Show a list of all users of the application.
    *
    * @return Response
    */
    public function index()
    {
        \$value = Cache::get('key');

        //
    }
}
</code></pre>

<h4># Acceder a múltiples almacenamientos de caché</h4>
<p>Usando el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span>, puedes acceder a varios almacenamientos de caché a través
    del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span>. La llave que se pasa al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span> debe
    corresponder a uno de los almacenamientos listados en el arreglo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stores</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = Cache::store('file')-&gt;get('foo');

Cache::store('redis')-&gt;put('bar', 'baz', 600); // 10 Minutes
</code></pre>


<h3># Recuperar elementos de caché</h3>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span> es utilizado para recuperar elementos
    desde la caché. Si el elemento no existe en caché, se va a regresar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>. Si lo
    deseas, puedes pasar un segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> indicando el valor
    predeterminado que deseas retornar en caso de que el elemento no exista:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = Cache::get('key');

\$value = Cache::get('key', 'default');
</code></pre>

<p>Incluso puedes pasar una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> como valor predeterminado. El resultado del <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>
    será devuelto si el elemento especificado no existe en caché. Pasar un Closure te permite
    diferir la recuperación de valores predeterminados de una base de datos a otro servicio externo:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = Cache::get('key', function () {
    return DB::table(...)-&gt;get();
});
</code></pre>

<h4># Comprobar la existencia de un elemento</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span> se puede utilizar para determinar la existencia de un elemento en
    caché. Este método devolverá <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> si el valor es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Cache::has('key')) {
    //
}
</code></pre>

<h4># Incrementando / Decrementando valores</h4>
<p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">increment</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decrement</span> se pueden usar para ajustar el valor
    de los elementos enteros en caché. Ambos métodos aceptan un segundo parámetro opcional que
    indica la cantidad por la cual incrementar o disminuir el valor del elemento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::increment('key');
Cache::increment('key', \$amount);
Cache::decrement('key');
Cache::decrement('key', \$amount);
</code></pre>

<h4># Recuperar y almacenar</h4>
<p>En ocasiones, es posible que desees recuperar un elemento de la memoria caché, pero también
    almacenar un valor predeterminado si el elemento no existe. Por ejemplo, puede que desees
    recuperar todos los usuarios de la memoria caché o, si no existen, recuperarlos desde la base de
    datos y agregarlos a la caché. Puedes hacer esto utilizando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache::remember</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = Cache::remember('users', \$seconds, function () {
    return DB::table('users')-&gt;get();
});
</code></pre>

<p>Si el elemento no existe en la memoria caché, se ejecutará el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> pasado al
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">remember</span> y su resultado se colocará en caché.</p>
<p>Puedes utilizar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rememberForever</span> para recuperar un elemento del caché o
    almacenarlo para siempre:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = Cache::rememberForever('users', function () {
    return DB::table('users')-&gt;get();
});
</code></pre>

<h4># Recuperar y eliminar</h4>
<p>Si necesitas recuperar un elemento del caché y después eliminarlo, puedes utilizar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pull</span>. Al igual que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span>, se devolverá <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span> si el
    elemento no existe en la memoria caché:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = Cache::pull('key');
</code></pre>


<h3># Almacenar elementos en caché</h3>
<p>Puedes utilizar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span> para almacenar
    elementos en caché:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::put('key', 'value', \$seconds);
</code></pre>

<p>Si el tiempo de almacenamiento no es pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span>, el elemento será
    almacenado indefinidamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::put('key', 'value');
</code></pre>

<p>En lugar de pasar el número de segundos como un entero, también puedes pasar una instancia de
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DateTime</span> que represente el tiempo de expiración del elemento almacenado en caché:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::put('key', 'value', now()-&gt;addMinutes(10));
</code></pre>

<h4># Almacenar si no está presente</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">add</span> solo agregará el elemento a caché si éste no existe todavia en la
    memoria caché. El metodo va a regresar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si el elemento realmente se agregó a la
    caché. De otra manera, el método va a regresar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>
<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::add('key', 'value', \$seconds);
</code></pre>
<h4># Almacenar elementos para siempre</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forever</span> puede ser utilizado para almacenar un elemento en la memoria caché
    de manera permanente. Como estos elementos no caducan, se deben eliminar de la memoria caché
    manualmente utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forget</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::forever('key', 'value');
</code></pre>


<p>TIP</p>
<p>Si utilizas el controlador de Memcached, los elementos almacenados "permanentemente" podrán ser
    eliminados una vez que la caché alcance su tamaño límite.</p>


<h3># Eliminar elementos de la caché</h3>
<p>Puedes eliminar elementos de caché utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forget</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::forget('key');
</code></pre>

<p>También puedes eliminar elementos de caché especificando un TTL cero o negativo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::put('key', 'value', 0);

Cache::put('key', 'value', -5);
</code></pre>

<p>Puedes borrar todo el caché utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flush</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::flush();
</code></pre>


<p>Nota</p>
<p>La limpieza de caché no respeta el prefijo del caché y borrará todas las entradas del caché.
    Considera esto cuidadosamente cuando borres un caché que sea compartido por otras
    aplicaciones.</p>


<h3># Bloqueos atómicos</h3>

<p>Nota</p>
<p>Para usar esta característica, tu aplicación debe estar haciendo uso de los drivers de caché
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">memcached</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dynamodb</span>, o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span> como el driver de caché por
    defecto de tu aplicación. Adicionalmente, todos los servidores deben estar comunicándose con el
    mismo servidor de caché central.</p>

<p>
    Los bloqueos atómicos permiten la manipulación de bloqueos distribuidos sin que tengas que
    preocuparte sobre las condiciones de la carrera. Por ejemplo,

    Laravel Forge


    usa bloqueos atómicos para asegurarse de que sólo una tarea remota está siendo ejecutada en un
    servidor a la vez. Puedes crear y administrar bloqueos usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache::lock</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Cache;

\$lock = Cache::lock('foo', 10);

if (\$lock-&gt;get()) {
    // Lock acquired for 10 seconds...

    \$lock-&gt;release();
}
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> también acepta una Closure. Luego de que la Closure sea ejecutada,
    Laravel automáticamente liberará el cierre:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::lock('foo')-&gt;get(function () {
    // Lock acquired indefinitely and automatically released...
});
</code></pre>

<p>Si el bloqueo no está disponible en el momento en que lo solicitas, puedes instruir a Laravel
    para que espere un número determinado de segundos. Si el bloqueo no puede ser adquirido dentro
    del tiempo límite especificado, una excepción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Cache\LockTimeoutException</span>
    será mostrada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Contracts\Cache\LockTimeoutException;

\$lock = Cache::lock('foo', 10);

try {
    \$lock-&gt;block(5);

    // Lock acquired after waiting maximum of 5 seconds...
} catch (LockTimeoutException \$e) {
    // Unable to acquire lock...
} finally {
    optional(\$lock)-&gt;release();
}

Cache::lock('foo', 10)-&gt;block(5, function () {
    // Lock acquired after waiting maximum of 5 seconds...
});
</code></pre>

<h4># Administrando bloqueos a través de procesos</h4>
<p>Algunas veces, necesitarás adquirir un bloqueo en un proceso para liberarlo en otro proceso
    distinto más adelante. Por ejemplo, podemos solicitar un bloqueo durante la ejecución de un
    proceso que hace una solicitud web pero queremos liberarlo después que se ejecute un trabajo que
    es despachado donde se hizo la solicitud a una cola de trabajos. En un escenario como éste,
    necesitaríamos tomar la identificación del propietario del bloqueo (owner token) en el ámbito
    donde se produce el mismo y pasarlo al trabajo que va a la cola de trabajos de modo que pueda
    volver a instanciar el bloqueo usando ese identificador.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Within Controller...
\$podcast = Podcast::find(\$id);

\$lock = Cache::lock('foo', 120);

if (\$result = \$lock-&gt;get()) {
    ProcessPodcast::dispatch(\$podcast, \$lock-&gt;owner());
}

// Within ProcessPodcast Job...
Cache::restoreLock('foo', \$this-&gt;owner)-&gt;release();
</code></pre>

<p>Si prefieres liberar un bloqueo sin necesidad de indicar su propietario, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forceRelease</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::lock('foo')-&gt;forceRelease();
</code></pre>


<h3># El helper cache</h3>
<p>Además de usar el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span> o la interfaz de caché, también puedes usar la
    función global <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> para recuperar y almacenar información a través del caché.
    Cuando se llama a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> con un solo argumento, devolverá el valor de la
    clave dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = cache('key');
</code></pre>

<p>Si proporcionas un arreglo de pares clave / valor y su tiempo de expiración a la función,
    almacenará los valores en caché durante la duración especificada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>cache(['key' =&gt; 'value'], \$seconds);

cache(['key' =&gt; 'value'], now()-&gt;addMinutes(10));
</code></pre>

<p>Cuando la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> es llamada sin ningún argumento, ésta retorna una instancia
    de la implementación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Cache\Factory</span>, permitiéndote llamar a
    otros métodos de almacenamiento en caché:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>cache()-&gt;remember('users', \$seconds, function () {
    return DB::table('users')-&gt;get();
});
</code></pre>


<p>TIP</p>
<p>Al realizar pruebas utilizando la función global <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span>, deberás usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache::shouldReceive</span> como si estuvieras probando un facade.</p>


<h2>Cache tags</h2>

<p>Nota</p>
<p>Las etiquetas de caché no son compatibles cuando usas los controladores de caché
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">file</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>. Además, cuando se utilicen múltiples etiquetas con
    cachés que son almacenados "permanentemente", el rendimiento será mejor si utilizas un
    controlador como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">memcached</span>, el cual automaticamente purga los registros obsoletos.
</p>


<h3># Almacenar Elementos De Caché Etiquetados</h3>
<p>Las etiquetas de caché te permiten etiquetar elementos relacionados en caché y después limpiar
    todos los valores almacenados en caché asignados a una etiqueta dada. Puedes acceder a un caché
    etiquetado al pasar un arreglo ordenado de nombres de etiquetas. Por ejemplo, vamos a acceder a
    un caché etiquetado y al valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span> en el caché:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::tags(['people', 'artists'])-&gt;put('John', \$john, \$seconds);

Cache::tags(['people', 'authors'])-&gt;put('Anne', \$anne, \$seconds);
</code></pre>


<h3># Acceder a elementos de caché etiquetados</h3>
<p>Para recuperar un elemento de caché etiquetado, pasa la misma lista ordenada de etiquetas al
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tags</span> y después haz un llamado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> con la clave que
    deseas recuperar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$john = Cache::tags(['people', 'artists'])-&gt;get('John');

\$anne = Cache::tags(['people', 'authors'])-&gt;get('Anne');
</code></pre>


<h3># Eliminar elementos de caché etiquetados</h3>
<p>Puedes borrar todos los elementos a los que se les asigna una etiqueta o lista de etiquetas. Por
    ejemplo, la siguiente sentencia eliminaría todos los cachés etiquetados tanto con
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">people</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authors</span> o ambos. Por lo tanto, tanto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Anne</span> como
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">John</span> serán eliminados de caché:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::tags(['people', 'authors'])-&gt;flush();
</code></pre>

<p>Por el contrario, la siguiente sentencia eliminará solamente los cachés con la etiqueta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authors</span>,
    por lo tanto se eliminará <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Anne</span>, pero <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">John</span> no:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::tags('authors')-&gt;flush();
</code></pre>


<h2>Agregar controladores de caché personalizados</h2>

<h3># Escribir el controlador</h3>
<p>Para crear el controlador de caché, primero se debe implementar la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Cache\Store</span>.
    Por lo tanto, una implementación de caché de MongoDB se vería de la siguiente manera:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Extensions;

use Illuminate\Contracts\Cache\Store;

class MongoStore implements Store
{
    public function get(\$key) {}
    public function many(array \$keys) {}
    public function put(\$key, \$value, \$seconds) {}
    public function putMany(array \$values, \$seconds) {}
    public function increment(\$key, \$value = 1) {}
    public function decrement(\$key, \$value = 1) {}
    public function forever(\$key, \$value) {}
    public function forget(\$key) {}
    public function flush() {}
    public function getPrefix() {}
}
</code></pre>

<p>Solo necesitas implementar cada uno de estos métodos utilizando una conexión de MongoDB. Para
    tener un ejemplo de cómo implementar cada uno de estos métodos, puedes echar un vistazo a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Cache\MemcachedStore</span>
    en el código fuente del framework. Una vez que completes la implementación, puedes finalizar con
    el registro de tu controlador personalizado.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Cache::extend('mongo', function (\$app) {
    return Cache::repository(new MongoStore);
});
</code></pre>


<p>TIP</p>
<p>Si te preguntas dónde puedes colocar el código de tu driver de caché personalizado, puedes crear
    un espacio de nombre <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Extensions</span> en tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span>. Sin embargo, ten
    en cuenta que Laravel no tiene una estructura de aplicación rígida y por tanto eres libre de
    organizar tu aplicación de acuerdo a tus preferencias.</p>


<h3># Registrando el driver</h3>
<p>Para registrar el controlador de caché personalizado con Laravel, debes utilizar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span>
    en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache</span>. La llamada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cache::extend</span> puede hacerse en el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> del <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Providers\AppServiceProvider</span> predeterminado que
    contiene cada aplicación nueva de Laravel, o puedes crear tu propio proveedor de servicios para
    alojar la extensión - solo recuerda registrar el proveedor en el arreglo de proveedores en
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use App\Extensions\MongoStore;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\ServiceProvider;

class CacheServiceProvider extends ServiceProvider
{
    /**
    * Perform post-registration booting of services.
    *
    * @return void
    */
    public function boot()
    {
        Cache::extend('mongo', function (\$app) {
            return Cache::repository(new MongoStore);
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

<p>El primer argumento pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> es el nombre del controlador. Esto
    corresponde a la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/cache.php</span>.
    El segundo argumento es un Closure que debe regresar una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Cache\Repository</span>.
    El Closure debe pasar una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$app</span>, que es una instancia del contenedor
    de servicios.</p>
<p>Una vez que hayas registrado tu extensión, actualiza la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> en tu archivo
    de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/cache.php</span> con el nombre de tu extensión.</p>

<h2>Eventos</h2>
<p>Para ejecutar código en cada operación de caché, puedes escuchar los eventos activados por el
    caché. Normalmente, debes colocar estos listener de eventos dentro de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The event listener mappings for the application.
*
* @var array
*/
protected \$listen = [
    'Illuminate\Cache\Events\CacheHit' =&gt; [
        'App\Listeners\LogCacheHit',
    ],

    'Illuminate\Cache\Events\CacheMissed' =&gt; [
        'App\Listeners\LogCacheMissed',
    ],

    'Illuminate\Cache\Events\KeyForgotten' =&gt; [
        'App\Listeners\LogKeyForgotten',
    ],

    'Illuminate\Cache\Events\KeyWritten' =&gt; [
        'App\Listeners\LogKeyWritten',
    ],
];
</code></pre>
</div>
""";