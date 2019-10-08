import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class BdRedis extends StatelessWidget {
  final String title;
  BdRedis(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmBdRedis,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmBdRedis = """
<!-- Redis -->
<div style='font-size: 14.2px;'>
  <h1>Redis</h1>
  <ul>
    <li>
      Introducción
      <ul>
        <li>Configuración</li>
        <li>Predis</li>
        <li>PhpRedis</li>
      </ul>
    </li>
    <li>
      Interactuar con redis
      <ul>
        <li>Canalizar comandos</li>
      </ul>
    </li>
    <li>Pub / Sub</li>
  </ul>

  <h2>Introducción</h2>
  <p>

    Redis
    <outboundlink></outboundlink>
    es un almacenamiento avanzado de pares clave-valor y de código abierto. A menudo se le denomina como un servidor de estructura de datos ya que los pares pueden contener cadenas
    <outboundlink></outboundlink>
    , hashes
    <outboundlink></outboundlink>
    , listas
    <outboundlink></outboundlink>
    , sets
    <outboundlink></outboundlink>
    y sets ordenados
    <outboundlink></outboundlink>
    .
  </p>
  <p>Antes de utilizar Redis con Laravel, deberás instalar el paquete <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">predis/predis</span> por medio de Composer:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require predis/predis
</code></pre>

  <p>
    Alternativamente, puedes instalar la extensión de PHP PhpRedis
    <outboundlink></outboundlink>
    por medio de PECL. La extensión puede ser más compleja de instalar pero puede ofrecer un mejor rendimiento para las aplicaciones que hacen uso extensivo de Redis.
  </p>

  <h3>Configuración</h3>
  <p>La configuración de redis para tu aplicación está ubicada en el archivo de cofiguración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database</span>. Dentro de este archivo, podrás ver el arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span> que contiene los servidores de Redis utilizados por tu aplicación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'redis' =&gt; [

    'client' =&gt; 'predis',

    'default' =&gt; [
        'host' =&gt; env('REDIS_HOST', '127.0.0.1'),
        'password' =&gt; env('REDIS_PASSWORD', null),
        'port' =&gt; env('REDIS_PORT', 6379),
        'database' =&gt; env('REDIS_DB', 0),
    ],

    'cache' =&gt; [
        'host' =&gt; env('REDIS_HOST', '127.0.0.1'),
        'password' =&gt; env('REDIS_PASSWORD', null),
        'port' =&gt; env('REDIS_PORT', 6379),
        'database' =&gt; env('REDIS_CACHE_DB', 1),
    ],

],
</code></pre>

  <p>La configuración del servidor por defecto deberá ser suficiente para el entorno de desarrollo. Sin embargo, puedes modificar este arreglo según tu entorno. Cada servidor de Redis definido en tu configuración debe contener un nombre, host y puerto.</p>
  <h4>Configuración de clusters</h4>
  <p>Si tu aplicación está utilizando un cluster de servidores Redis, debes definir este cluster en la clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">clusters</span> de tu configuración de Redis:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'redis' =&gt; [

    'client' =&gt; 'predis',

    'clusters' =&gt; [
        'default' =&gt; [
            [
                'host' =&gt; env('REDIS_HOST', 'localhost'),
                'password' =&gt; env('REDIS_PASSWORD', null),
                'port' =&gt; env('REDIS_PORT', 6379),
                'database' =&gt; 0,
            ],
        ],
    ],

],
</code></pre>

  <p>Por defecto, los clusters realizarán la división del lado del cliente en sus nodos, permitiéndote agrupar nodos y crear una gran cantidad de RAM disponible. Sin embargo, ten en cuenta que la división del lado del cliente no gestiona el failover; por lo tanto, es principalmente adecuado para datos en caché que estén disponibles desde otro almacenamiento de datos primario. Su deseas utilizar el agrupamiento nativo de Redis, debes especificarlo en la clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">options</span> de tu configuración de Redis:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'redis' =&gt; [

    'client' =&gt; 'predis',

    'options' =&gt; [
        'cluster' =&gt; 'redis',
    ],

    'clusters' =&gt; [
        // ...
    ],

],
</code></pre>

  <h3>Predis</h3>
  <p>
    Además de las opciones predeterminadas de la configuración del servidor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">host</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">port</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">password</span>, Predis admite parámetros de conexión
    <outboundlink></outboundlink>
    adicionales que pueden ser definidos para cada uno de tus servidores de Redis. Para utilizar estas opciones de configuración adicionales, agrégalos a la configuración del servidor de Redis en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database.php</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'default' =&gt; [
    'host' =&gt; env('REDIS_HOST', 'localhost'),
    'password' =&gt; env('REDIS_PASSWORD', null),
    'port' =&gt; env('REDIS_PORT', 6379),
    'database' =&gt; 0,
    'read_write_timeout' =&gt; 60,
],
</code></pre>

  <h3>PhpRedis</h3>
  <p>Para utilizar la extensión PhpRedis, deberás cambiar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">client</span> de tu configuración de Redis a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpredis</span>. Puedes encontrar esta opción en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'redis' =&gt; [

    'client' =&gt; 'phpredis',

    // Resto de la configuración de Redis...
],
</code></pre>

  <p>Además de las opciones predeterminadas de configuración del servidor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">host</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">port</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">password</span>, PhpRedis admite los siguientes parámetros de conexión adicionales: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">persistent</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">prefix</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">read_timeout</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">timeout</span>. Puedes agregar cualquiera de estas opciones a la configuración del servidor de Redis en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'default' =&gt; [
    'host' =&gt; env('REDIS_HOST', 'localhost'),
    'password' =&gt; env('REDIS_PASSWORD', null),
    'port' =&gt; env('REDIS_PORT', 6379),
    'database' =&gt; 0,
    'read_timeout' =&gt; 60,
],
</code></pre>

  <h2>Interactuar con redis</h2>
  <p>
    Puedes interactuar con Redis llamando varios métodos en el facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Redis</span>. El facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Redis</span> admite métodos dinámicos, lo que significa que puedes llamar a cualquier comando de Redis
    <outboundlink></outboundlink>
    en el facade y el comando será pasado directamente a Redis. En este ejemplo, vamos a llamar al comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">GET</span> de Redis llamando al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> en el facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Redis</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Redis;

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
        \$user = Redis::get('user:profile:'.\$id);

        return view('user.profile', ['user' =&gt; \$user]);
    }
}
</code></pre>

  <p>Como lo mencionamos anteriormente, puedes llamar a cualquier comando de Redis en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Redis</span>. Laravel utiliza métodos mágicos para pasar los comandos al servidor de Redis, para que pases los argumentos que espera el comando de Redis:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Redis::set('name', 'Taylor');

\$values = Redis::lrange('names', 5, 10);
</code></pre>

  <p>Alternativamente, también puedes pasar comandos al servidor usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">command</span>, el cual acepta el nombre del comando como primer argumento, y un arreglo de valores como segundo argumento:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$values = Redis::command('lrange', ['name', 5, 10]);
</code></pre>

  <h4>Utilizar múltiples conexiones de Redis</h4>
  <p>Puedes obtener una instancia de Redis llamando al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Redis::connection</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$redis = Redis::connection();
</code></pre>

  <p>Esto te dará una instancia del servidor de Redis predeterminado. También puedes pasar la conexión o nombre del cluster al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">connection</span> para obtener un servidor o cluster en específico según lo definido en tu configuración de Redis:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$redis = Redis::connection('my-connection');
</code></pre>

  <h3>Canalizar comandos</h3>
  <p>La canalización debe ser utilizada cuando envíes muchos comandos al servidor en una sola operación. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pipeline</span> acepta un argumento: un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> que reciba una instancia de Redis. Puedes emitir todos tus comandos a esta instancia de Redis y después éstos serán ejecutados dentro de una sola operación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Redis::pipeline(function (\$pipe) {
    for (\$i = 0; \$i &lt; 1000; \$i++) {
        \$pipe-&gt;set("key:\$i", \$i);
    }
});
</code></pre>

  <h2>Pub / Sub</h2>
  <p>Laravel proporciona una interfaz conveniente para los comandos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publish</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribe</span> de Redis. Estos comandos de Redis te permiten escuchar mensajes en un "canal" dado. Puedes publicar mensajes en el canal desde otra aplicación, o incluso utilizando otro lenguaje de programación, lo que permite una comunicación sencilla entre aplicaciones y procesos.</p>
  <p>
    Primero, configuremos un listener para el canal usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribe</span>. Vamos a colocar una llamada a este método en un comando de Artisan ya que llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribe</span> comienza un proceso de larga ejecución:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Redis;

class RedisSubscribe extends Command
{
    /**
    * The name and signature of the console command.
    *
    * @var string
    */
    protected \$signature = 'redis:subscribe';

    /**
    * The console command description.
    *
    * @var string
    */
    protected \$description = 'Subscribe to a Redis channel';

    /**
    * Execute the console command.
    *
    * @return mixed
    */
    public function handle()
    {
        Redis::subscribe(['test-channel'], function (\$message) {
            echo \$message;
        });
    }
}
</code></pre>

  <p>Ahora podemos publicar mensajes en el canal usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publish</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::get('publish', function () {
    // Route logic...

    Redis::publish('test-channel', json_enspan(['foo' =&gt; 'bar']));
});
</code></pre>

  <h4>Suscripciones de comodines</h4>
  <p>Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">psubscribe</span>, puedes suscribirte a un canal comodín, el cual puede ser útil para capturar todos los mensajes en todos los canales. El nombre del canal
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$channel</span> será pasado como segundo argumento al callback <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> proporcionado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Redis::psubscribe(['*'], function (\$message, \$channel) {
    echo \$message;
});

Redis::psubscribe(['users.*'], function (\$message, \$channel) {
    echo \$message;
});
</code></pre>
</div>
""";