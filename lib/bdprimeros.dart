import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class BdPrimeros extends StatelessWidget {
  final String title;
  BdPrimeros(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmBdPrimeros,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmBdPrimeros = """
<!-- Bases de datos: primeros pasos -->
<div style='font-size: 14.2px;'>
  <h1>Bases de datos: primeros pasos</h1>
  <ul>
    <li>
      Introducción
      <ul>
        <li>Configuración</li>
        <li>Conexiones de lectura y escritura</li>
        <li>Usando múltiples conexiones de bases de datos</li>
      </ul>
    </li>
    <li>Ejecutando consultas SQL nativas</li>
    <li>Listeners de eventos de consultas</li>
    <li>Transacciones de bases de datos</li>
  </ul>

  <h2>Introducción</h2>
  <p>
    Laravel hace que la interacción con las bases de datos sea extremadamente fácil a través de una variedad de backends de bases de datos usando SQL nativo, el constructor de consultas query builder y el ORM Eloquent . Actualmente, Laravel soporta cuatro bases de datos.
  </p>
  <ul>
    <li>MySQL</li>
    <li>PostgreSQL</li>
    <li>SQLite</li>
    <li>SQL Server</li>
  </ul>

  <h3>Configuración</h3>
  <p>La configuración de base de datos para tu aplicación está localizada en
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database.php</span>. Puedes definir todo lo concerniente a tus conexiones de bases de datos, y también especificar qué conexión debería ser usada por defecto. Ejemplos para la mayoría de los sistemas de bases de datos soportados son proporcionados en este archivo.</p>
  <p>
    Por defecto, la configuración de entorno de muestra de Laravel está lista para usar con Laravel Homestead , la cual es una máquina virtual conveniente para el desarrollo con Laravel en tu máquina local. Eres libre de modificar esta configuración de acuerdo a tus necesidades de tu base de datos local.
  </p>
  <h4>Configuración de SQLite</h4>
  <p>Después de la creación de una nueva base de datos SQLite usando un comando tal como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">touch
  database/database.sqlite</span>, puedes configurar fácilmente tus variables de entorno para apuntar a esta base de datos creada recientemente al usar la ruta absoluta a la base de datos.
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB_CONNECTION=sqlite
DB_DATABASE=/absolute/path/to/database.sqlite
</code></pre>

  <p>Para habilitar las claves foráneas en conexiones de SQLite, debes agregar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">foreign_key_constraints</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'sqlite' =&gt; [
    // ...
    'foreign_key_constraints' =&gt; true,
],
</code></pre>

  <h4>Configuración usando URLs</h4>
  <p>Típicamente, las conexiones a bases de datos son configuradas usando múltiples valores de configuración como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">host</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">username</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">password</span>, etc. Cada uno de esos valores de configuración tiene su propia variable de entorno correspondiente. Esto quiere decir que al configurar tu información de conexión a la base de datos en un servidor de producción, necesitas administrar múltiples variables de entorno.</p>
  <p>Algunos proveedores de bases de datos administrados como Heroku proporcionan una única "URL" de base de datos que contiene toda la información de conexión para la base de datos en una única cadena. Una URL de base de datos de ejemplo podría verse de la siguiente manera:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>mysql://root:password@127.0.0.1/forge?charset=UTF-8
</code></pre>

  <p>Estas URLs típicamente siguen una convención de esquema estándar:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>driver://username:password@host:port/database?options
</code></pre>

  <p>Por conveniencia, Laravel soporta dichas URLs como alternativa a configurar tu base de datos con múltiples opciones de configuración. Si la opción de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> (o variable de entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DATABASE_URL</span> correspondiente) está presente, esta será usada para extraer la conexión a la base de datos y la información de credenciales.</p>
  <h3>Conexiones de lectura y escritura</h3>
  <p>Algunas veces puedes desear contar con una conexión de base de datos para los comandos SELECT y otra para los comandos UPDATE y DELETE. Laravel hace esto una tarea fácil, y las conexiones propias siempre serán usadas si estás usando consultas nativas, el constructor de consultas Query Builder o el ORM Eloquent.</p>
  <p>Para ver cómo las conexiones de lectura / escritura deberían ser configuradas, vamos a mirar este ejemplo:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'mysql' =&gt; [
    'read' =&gt; [
        'host' =&gt; [
            '192.168.1.1',
            '196.168.1.2',
        ],
    ],
    'write' =&gt; [
        'host' =&gt; [
            '196.168.1.3',
        ],
    ],
    'sticky'    =&gt; true,
    'driver'    =&gt; 'mysql',
    'database'  =&gt; 'database',
    'username'  =&gt; 'root',
    'password'  =&gt; '',
    'charset'   =&gt; 'utf8mb4',
    'collation' =&gt; 'utf8mb4_unispan_ci',
    'prefix'    =&gt; '',
],
</code></pre>

  <p>Observa que tres claves han sido agregadas al arreglo de configuración: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">read</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">write</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sticky</span>. Las claves <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">read</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">write</span> tienen valores de arreglo conteniendo una sola clave: la dirección ip del <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">host</span>. El resto de las opciones de la base de datos para las conexiones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">read</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">write</span> serán tomadas del arreglo principal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mysql</span>.</p>
  <p>Únicamente necesitas colocar elementos en los arreglos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">read</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">write</span> si deseas sobreescribir los valores del arreglo principal. Así, en este caso,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">192.168.1.1</span> será usado como la máquina para la conexión de "lectura", mientras que
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">192.168.1.3</span> será usada para la conexión de "escritura". Las credenciales de bases de datos, prefijo, conjunto de caracteres, y todas las demás opciones en el arreglo principal
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mysql</span> serán compartidas a través de ambas conexiones.</p>
  <h4>La opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sticky</span></h4>
  <p>La opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sticky</span> es un valor <em>opcional</em> que puede ser usado para permitir la lectura inmediata de registros que han sido escritos a la base de datos durante el ciclo de solicitudes actual. Si la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sticky</span> está habilitada y una operación de "escritura" ha sido ejecutada contra la base de datos durante el ciclo de solicitudes actual, cualquiera de las operaciones de "lectura" hasta aquí usarán la conexión "write". Esto asegura que cualquier dato escrito durante el ciclo de solicitud pueda ser leído inmediatamente de la base de datos durante la misma solicitud. Es posible para ti decidir si este es el comportamiento deseado para tu aplicación.</p>

  <h3>Usando conexiones de bases de datos múltiples</h3>
  <p>Cuando estamos usando conexiones múltiples, puedes acceder a cada conexión por medio del método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">connection</span> en el Facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span>. El nombre <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> pasado al método de conexión <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">connection</span> debería corresponder a una de las conexiones listadas en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::connection('foo')-&gt;select(...);
</code></pre>

  <p>También puedes acceder a los datos nativos de la instancia PDO subyacente que usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getPdo</span> en una instancia de conexión:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$pdo = DB::connection()-&gt;getPdo();
</code></pre>

  <h2>Ejecutando consultas SQL nativas</h2>
  <p>Una vez que has configurado tu conexión de base de datos, puedes ejecutar consultas usando el Facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span>. La clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span> proporciona métodos para cada tipo de consulta: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insert</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">statement</span>.</p>
  <h4>Ejecutando una consulta select</h4>
  <p>Para ejecutar una consulta básica, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
    * Muestra una lista de todos los usuarios de la aplicación.
    *
    * @return Response
    */
    public function index()
    {
        \$users = DB::select('select * from users where active = ?', [1]);

        return view('user.index', ['users' =&gt; \$users]);
    }
}
</code></pre>

  <p>El primer argumento pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span> es la consulta SQL nativa; en este caso está parametrizada, mientras el segundo argumento es cualquier parámetro a enlazar que necesita estar conectado a la consulta. Típicamente, estos son los valores de las restricciones de cláusula <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>. El enlazamiento de parámetro proporciona protección contra ataques de inyección SQL.</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span> siempre devolverá un arreglo de resultados. Cada resultado dentro del arreglo será un objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stdClass</span> de PHP, permitiendo que accedas a los valores de los resultados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>foreach (\$users as \$user) {
    echo \$user-&gt;name;
}
</code></pre>

  <h4>Usando enlaces nombrados</h4>
  <p>En lugar de usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">?</span> para representar tus enlaces (bindings) de parámetros, puedes ejecutar una consulta usando enlaces nombrados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$results = DB::select('select * from users where id = :id', ['id' =&gt; 1]);
</code></pre>

  <h4>Ejecutando una instrucción insert</h4>
  <p>Para ejecutar una instrucción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insert</span>, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insert</span> en la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span>. Igual que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>, este método toma la consulta SQL nativa como su argumento inicial y lo enlaza con su argumento secundario:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::insert('insert into users (id, name) values (?, ?)', [1, 'Dayle']);
</code></pre>

  <h4>Ejecutando una instrucción update</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span> debería ser usado para actualizar los registros existentes en la base de datos. El número de filas afectadas por la instrucción serán devueltas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$affected = DB::update('update users set votes = 100 where name = ?', ['John']);
</code></pre>

  <h4>Ejecutando una instrucción delete</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> debería ser usado para eliminar registros de la base de datos. Al igual que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span>, el número de filas afectadas será devuelto:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$deleted = DB::delete('delete from users');
</code></pre>

  <h4>Ejecutando una instrucción general</h4>
  <p>Algunas instrucciones de bases de datos no devuelven algún valor. Para estos tipos de operaciones, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">statement</span> en la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::statement('drop table users');
</code></pre>

  <h2>Listeners de eventos de consultas</h2>
  <p>
    Si prefieres recibir cada consulta SQL ejecutada por tu aplicación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">listen</span>. Este método es útil para registrar consultas o depurar. Puedes registrar tus listeners de consultas en un proveedor de servicio :
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Inicializa cualquiera de los servicios de la aplicación.
    *
    * @return void
    */
    public function boot()
    {
        DB::listen(function (\$query) {
            // \$query-&gt;sql
            // \$query-&gt;bindings
            // \$query-&gt;time
        });
    }

    /**
    * Registra el proveedor de servicio.
    *
    * @return void
    */
    public function register()
    {
        //
    }
}
</code></pre>

  <h2>Transacciones de bases de datos</h2>
  <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transaction</span> en la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span> para ejecutar un conjunto de operaciones dentro de una transacción de base de datos. Si un error de excepción es arrojado dentro del código <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> de la transacción, la transacción automáticamente terminará con un rollback. Si el código <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> se ejecuta correctamente, la transacción terminará automáticamente con un commit. No necesitas preocuparte por hacer rollback o commit manualmente mientras estés usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transaction</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::transaction(function () {
    DB::table('users')-&gt;update(['votes' =&gt; 1]);

    DB::table('posts')-&gt;delete();
});
</code></pre>

  <h4>Manejando deadlocks (bloqueo mutuo)</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transaction</span> acepta un segundo argumento opcional el cual define el número de veces que la ejecución de una transacción debería ser reintentada cuando un ocurra un deadlock. Una vez que estos intentos hayan sido completados sin éxito, un error de excepción será arrojado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::transaction(function () {
    DB::table('users')-&gt;update(['votes' =&gt; 1]);

    DB::table('posts')-&gt;delete();
}, 5);
</code></pre>

  <h4>Usando transacciones manualmente</h4>
  <p>Si prefieres empezar una transacción manualmente y tener control total sobre rollbacks y commits, podrías usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">beginTransaction</span> de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::beginTransaction();
</code></pre>

  <p>Puedes hacer rollback de la transacción por medio del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rollback</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::rollBack();
</code></pre>

  <p>Finalmente, puedes confirmar una transacción por medio del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">commit</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::commit();
</code></pre>

  <p>TIP</p>
  <p>
    Los métodos de transacción del Facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span> controlan las transacciones para ambos backends de bases de datos del constructor de consultas query builder y el ORM Eloquent .
  </p>
</div>
""";