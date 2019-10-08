import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class BdConsultas extends StatelessWidget {
  final String title;
  BdConsultas(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmBdConsultas,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmBdConsultas = """
<!-- Base de datos: constructor de consultas (query builder) -->
<div style='font-size: 14.2px;'>
  <h1>Base de datos: constructor de consultas (query builder)</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Obteniendo los resultados
      <ul>
        <li>Particionando los resultados</li>
        <li>Agrupamientos</li>
      </ul>
    </li>
    <li>Selects</li>
    <li>Expresiones sin procesar (raw)</li>
    <li>Joins</li>
    <li>Uniones</li>
    <li>
      Cláusulas where
      <ul>
        <li>Agrupamiento de parámetros</li>
        <li>Cláusulas exists where</li>
        <li>Cláusulas where JSON</li>
      </ul>
    </li>
    <li>Ordenamiento, agrupamiento, límite y desplazamiento</li>
    <li>Cláusulas condicionales</li>
    <li>Inserciones</li>
    <li>
      Actualizaciones
      <ul>
        <li>Actualizando columnas JSON</li>
        <li>Incremento y decremento</li>
      </ul>
    </li>
    <li>Eliminaciones</li>
    <li>Bloqueo pesimista</li>
    <li>Depuración</li>
  </ul>

  <h2>Introducción</h2>
  <p>El constructor de consultas (query builder) de Base de datos de Laravel, proporciona una interface fluida y conveniente para la creación y ejecución de consultas de bases de datos. Puede ser usado para ejecutar las principales operaciones de bases de datos en tu aplicación y funciona en todos los sistemas de bases de datos soportados.</p>
  <p>El constructor de consultas de Laravel usa enlazamiento de parámetros PDO para proteger tu aplicación contra ataques de inyección SQL. No hay necesidad de limpiar cadenas que están siendo pasadas como enlaces.</p>

  <p>Nota</p>
  <p>PDO no admite nombres de columna de enlace (binding). Por lo tanto, nunca debes permitir que la entrada de usuario dicte los nombres de columna a los que hacen referencia tus consultas, incluidas las columnas "ordenar por", etc. Si debes permitir que el usuario seleccione ciertas columnas para consultar, valida siempre los nombres de las columnas con un una lista blanca de columnas permitidas.</p>

  <h2>Obteniendo los resultados</h2>
  <h4>Obteniendo todas las filas de una tabla</h4>
  <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">table</span> de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB</span> para empezar una consulta. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">table</span> devuelve una instancia para construir consultas fáciles de entender para la tabla dada, permitiendo que encadenes más restricciones dentro de la consulta y recibas finalmente los resultados usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
    * Show a list of all of the application's users.
    *
    * @return Response
    */
    public function index()
    {
        \$users = DB::table('users')-&gt;get();

        return view('user.index', ['users' =&gt; \$users]);
    }
}
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> devuelve una colección de la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Collection</span> que contiene los resultados donde cada resultado es una instancia del objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">StdClass</span> de PHP. Puedes acceder al valor de cada columna accediendo a la columna como una propiedad del objeto:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>foreach (\$users as \$user) {
    echo \$user-&gt;name;
}
</code></pre>

  <h4>Obteniendo una sola fila / columna de una tabla</h4>
  <p>Si solamente necesitas recuperar una sola fila de la tabla de la base de datos, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first</span>. Este método devolverá un solo objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">StdClass</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = DB::table('users')-&gt;where('name', 'John')-&gt;first();

echo \$user-&gt;name;
</code></pre>

  <p>Si no necesitas una fila completa, puedes extraer un solo valor de un registro usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">value</span>. Este método devolverá directamente el valor de la columna:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$email = DB::table('users')-&gt;where('name', 'John')-&gt;value('email');
</code></pre>

  <p>Para obtener una sola fila por su valor de columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span>, use el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">find</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = DB::table('users')-&gt;find(3);
</code></pre>

  <h4>Obteniendo una lista de valores de columna</h4>
  <p>Si prefieres obtener una Colección que contenga los valores de una sola columna, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pluck</span>. En el siguiente ejemplo, obtendrémos una colección de títulos de rol:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$titles = DB::table('roles')-&gt;pluck('title');

foreach (\$titles as \$title) {
    echo \$title;
}
</code></pre>

  <p>También puedes especificar una columna clave personalizada para la colección retornada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$roles = DB::table('roles')-&gt;pluck('title', 'name');

foreach (\$roles as \$name =&gt; \$title) {
    echo \$title;
}
</code></pre>

  <h3>Particionando los resultados</h3>
  <p>Si nececesitas trabajar con miles de registros de bases de datos, considera usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chunk</span>. Este método obtiene una partición pequeña de los resultados cada vez y pone cada partición dentro de un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> para su procesamiento. Este método es muy útil para escribir comandos de Artisan que procesan miles de registros. Por ejemplo, vamos a trabajar con la tabla completa <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span> en particiones de 100 registros cada vez:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;orderBy('id')-&gt;chunk(100, function (\$users) {
    foreach (\$users as \$user) {
        //
    }
});
</code></pre>

  <p>Puedes parar de obtener particiones para que no sean procesadas al devolver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> en el código <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;orderBy('id')-&gt;chunk(100, function (\$users) {
    // Process the records...

    return false;
});
</code></pre>

  <p>Si estás actualizando registros de base de datos mientras particionas resultados, los resultados de particiones podrían cambiar en formas inesperadas. Entonces, cuando se actualicen los registros mientras se particiona, siempre es mejor usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chunkById</span> en su lugar. Este método paginará automáticamente los resultados basándose en la llave primaria del registro:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;where('active', false)
    -&gt;chunkById(100, function (\$users) {
        foreach (\$users as \$user) {
            DB::table('users')
                -&gt;where('id', \$user-&gt;id)
                -&gt;update(['active' =&gt; true]);
        }
    });
</code></pre>

  <p>Nota</p>
  <p>Al actualizar o eliminar registros dentro del callback de la partición, cualquier cambio en la clave primaria o claves foráneas podría afectar a la consulta de la partición. Esto podría potencialmente dar lugar a que los registros no se incluyan en los resultados particionados.</p>

  <h3>Agrupamientos</h3>
  <p>El constructor de consultas también proporciona una variedad de métodos de agrupamiento tales como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">count</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">max</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">min</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">avg</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sum</span>. Puedes ejecutar cualquiera de estos métodos después de construir tu consulta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')-&gt;count();

\$price = DB::table('orders')-&gt;max('price');
</code></pre>

  <p>Puedes combinar estos métodos con otras cláusulas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$price = DB::table('orders')
                -&gt;where('finalized', 1)
                -&gt;avg('price');
</code></pre>

  <h4>Determinando si existen registros</h4>
  <p>EN vez de usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">count</span> para determinar si existen registros que coincidan con los límites de tu consulta, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exists</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">doesntExist</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return DB::table('orders')-&gt;where('finalized', 1)-&gt;exists();

return DB::table('orders')-&gt;where('finalized', 1)-&gt;doesntExist();
</code></pre>

  <h2>Selects</h2>
  <h4>Especificando una cláusula select</h4>
  <p>No siempre desearás seleccionar todas las columnas de una tabla de la base de datos. Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>, puedes especificar una cláusula <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span> personalizada para la consulta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')-&gt;select('name', 'email as user_email')-&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">distinct</span> te permite forzar la consulta para que devuelva solamente resultados que sean distintos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')-&gt;distinct()-&gt;get();
</code></pre>

  <p>Si ya tienes una instancia del constructor de consultas y deseas añadir una columna a su cláusula
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span> existente, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">addSelect</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$query = DB::table('users')-&gt;select('name');

\$users = \$query-&gt;addSelect('age')-&gt;get();
</code></pre>

  <h2>Expresiones sin procesar (raw)</h2>
  <p>Algunas veces puedes necesitar usar una expresión sin procesar en una consulta. Para crear una expresión sin procesar, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB::raw</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                     -&gt;select(DB::raw('count(*) as user_count, status'))
                     -&gt;where('status', '&lt;&gt;', 1)
                     -&gt;groupBy('status')
                     -&gt;get();
</code></pre>

  <p>Nota</p>
  <p>Las instrucciones sin procesar serán inyectadas dentro de la consulta como cadenas, así que deberías ser extremadamente cuidadoso para no crear vulnerabilidades de inyección SQL.</p>

  <h3>Métodos Raw</h3>
  <p>En lugar de usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DB::raw</span>, también puedes usar los siguientes métodos para insertar una expresión sin procesar dentro de varias partes de tu consulta.</p>
  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">selectRaw</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">selectRaw</span> puede ser usado en lugar de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select(DB::raw(...))</span>. Este método acepta un arreglo opcional de enlaces como su segundo argumento:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = DB::table('orders')
                -&gt;selectRaw('price * ? as price_with_tax', [1.0825])
                -&gt;get();
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereRaw / orWhereRaw</span></h4>
  <p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereRaw</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhereRaw</span> pueden ser usados para inyectar una cláusula <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> sin procesar dentro de tu consulta. Estos métodos aceptan un arreglo opcional de enlaces como segundo argumento:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = DB::table('orders')
                -&gt;whereRaw('price &gt; IF(state = "TX", ?, 100)', [200])
                -&gt;get();
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">havingRaw / orHavingRaw</span></h4>
  <p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">havingRaw</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orHavingRaw</span> pueden ser usados para establecer una cadena sin procesar como el valor de la cláusula <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">having</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = DB::table('orders')
                -&gt;select('department', DB::raw('SUM(price) as total_sales'))
                -&gt;groupBy('department')
                -&gt;havingRaw('SUM(price) &gt; 2500')
                -&gt;get();
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orderByRaw</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orderByRaw</span> puede ser usado para establecer una cadena sin procesar como el valor de la cláusula <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">order by</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = DB::table('orders')
                -&gt;orderByRaw('updated_at - created_at DESC')
                -&gt;get();
</code></pre>

  <h2>Joins</h2>
  <h4>Cláusula inner join</h4>
  <p>El constructor de consultas también puede ser usado para escribir instrucciones joins. Para ejecutar un "inner join" básico, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span> en una instancia del constructor de consultas. El primer argumento pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span> es el nombre de la tabla que necesitas juntar, mientras que los argumentos restantes especifican las restricciones de columna para el join. Ciertamente, como puedes ver, puedes hacer un join de múltiples tablas en una sola consulta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
            -&gt;join('contacts', 'users.id', '=', 'contacts.user_id')
            -&gt;join('orders', 'users.id', '=', 'orders.user_id')
            -&gt;select('users.*', 'contacts.phone', 'orders.price')
            -&gt;get();
</code></pre>

  <h4>Cláusula left join / right join</h4>
  <p>Si prefieres ejecutar un "left join" o un "right join" en vez de un "inner join", usa los métodos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">leftJoin</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rightJoin</span>. Estos métodos tienen la misma forma de uso de los argumentos que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
            -&gt;leftJoin('posts', 'users.id', '=', 'posts.user_id')
            -&gt;get();

\$users = DB::table('users')
            -&gt;rightJoin('posts', 'users.id', '=', 'posts.user_id')
            -&gt;get();
</code></pre>

  <h4>Cláusula cross join</h4>
  <p>Para ejecutar un cláusula "cross join" usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">crossJoin</span> con el nombre de la tabla a la que deseas hacerle un cross join. Los cross join generan un producto cartesiano entre la primera tabla y la tabla juntada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('sizes')
            -&gt;crossJoin('colours')
            -&gt;get();
</code></pre>

  <h4>Cláusulas de join avanzadas</h4>
  <p>También puedes especificar cláusulas join más avanzadas. Para empezar, pasa una función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> como el segundo argumento dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span>. La <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> recibirá un objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">JoinClause</span> el cual permitirá que especifiques restricciones en la cláusula <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')
        -&gt;join('contacts', function (\$join) {
            \$join-&gt;on('users.id', '=', 'contacts.user_id')-&gt;orOn(...);
        })
        -&gt;get();
</code></pre>

  <p>Si prefieres usar una cláusula estilo "where" en tus joins, puedes usar los métodos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhere</span> en un join. En lugar de comparar dos columnas, estos métodos compararán la columna contra un valor:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')
        -&gt;join('contacts', function (\$join) {
            \$join-&gt;on('users.id', '=', 'contacts.user_id')
                    -&gt;where('contacts.user_id', '&gt;', 5);
        })
        -&gt;get();
</code></pre>

  <h4>Subconsultas joins</h4>
  <p>Puedes utilizar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">joinSub</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">leftJoinSub</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rightJoinSub</span> para unir una consulta a una subconsulta. Cada uno de estos métodos recibe tres argumentos: la subconsulta, su alias de tabla y una Closure que define las columnas relacionadas:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$latestPosts = DB::table('posts')
                    -&gt;select('user_id', DB::raw('MAX(created_at) as last_post_created_at'))
                    -&gt;where('is_published', true)
                    -&gt;groupBy('user_id');

\$users = DB::table('users')
        -&gt;joinSub(\$latestPosts, 'latest_posts', function (\$join) {
            \$join-&gt;on('users.id', '=', 'latest_posts.user_id');
        })-&gt;get();
</code></pre>

  <h2>Uniones</h2>
  <p>El constructor de consultas también proporciona una forma rápida para "unir" dos consultas. Por ejemplo, puedes crear una consulta inicial y usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">union</span> para unirlo con una segunda consulta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$first = DB::table('users')
            -&gt;whereNull('first_name');

\$users = DB::table('users')
            -&gt;whereNull('last_name')
            -&gt;union(\$first)
            -&gt;get();
</code></pre>

  <p>TIP</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unionAll</span> también está disponible y tiene la misma forma de uso que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">union</span>.
  </p>

  <h2>Cláusulas where</h2>
  <h4>Cláusula where simple</h4>
  <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> en una instancia del constructor de consultas para añadir cláusulas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> a la consulta. La ejecución más básica de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> requiere tres argumentos. El primer argumento es el nombre de la columna. El segundo argumento es un operador, el cual puede ser cualquiera de los operadores soportados por la base de datos. Finalmente, el tercer argumento es el valor a evaluar contra la columna.</p>
  <p>Por ejemplo, aquí está una consulta que verifica que el valor de la columna "votes" sea igual a 100:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')-&gt;where('votes', '=', 100)-&gt;get();
</code></pre>

  <p>Por conveniencia, si quieres verificar que una columna sea igual a un valor dado, puedes pasar directamente el valor como el segundo argumento del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')-&gt;where('votes', 100)-&gt;get();
</code></pre>

  <p>Puedes usar otros operadores cuando estés escribiendo una cláusula <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;where('votes', '&gt;=', 100)
                -&gt;get();

\$users = DB::table('users')
                -&gt;where('votes', '&lt;&gt;', 100)
                -&gt;get();

\$users = DB::table('users')
                -&gt;where('name', 'like', 'T%')
                -&gt;get();
</code></pre>

  <p>También puedes pasar un arreglo de condiciones a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')-&gt;where([
    ['status', '=', '1'],
    ['subscribed', '&lt;&gt;', '1'],
])-&gt;get();
</code></pre>

  <h4>Instrucciones or</h4>
  <p>Puedes encadenar en conjunto las restricciones where así como añadir cláusulas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">or</span> a la consulta. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhere</span> acepta los mismos argumentos que el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                    -&gt;where('votes', '&gt;', 100)
                    -&gt;orWhere('name', 'John')
                    -&gt;get();
</code></pre>

  <h4>Cláusulas where adicionales</h4>
  <p><strong>whereBetween / orWhereBetween</strong></p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereBetween</span> verifica que un valor de columna esté en un intervalo de valores:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                    -&gt;whereBetween('votes', [1, 100])-&gt;get();
</code></pre>

  <p><strong>whereNotBetween / orWhereNotBetween</strong></p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotBetween</span> verifica que un valor de columna no esté en un intervalo de valores:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                    -&gt;whereNotBetween('votes', [1, 100])
                    -&gt;get();
</code></pre>

  <p><strong>whereIn / whereNotIn / orWhereIn / orWhereNotIn</strong></p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereIn</span> verifica que un valor de una columna dada esté contenido dentro del arreglo dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                    -&gt;whereIn('id', [1, 2, 3])
                    -&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotIn</span> verifica que el valor de una columna dada <strong>no</strong> esté contenido en el arreglo dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                    -&gt;whereNotIn('id', [1, 2, 3])
                    -&gt;get();
</code></pre>

  <p><strong>whereNull / whereNotNull / orWhereNull / orWhereNotNull</strong></p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNull</span> verifica que el valor de una columna dada sea <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">NULL</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                    -&gt;whereNull('updated_at')
                    -&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotNull</span> verifica que el valor dado de una columna no sea
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">NULL</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                    -&gt;whereNotNull('updated_at')
                    -&gt;get();
</code></pre>

  <p><strong>whereDate / whereMonth / whereDay / whereYear / whereTime</strong></p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereDate</span> puede ser usado para comparar el valor de una columna contra una fecha:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereDate('created_at', '2016-12-31')
                -&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereMonth</span> puede ser usado para comparar el valor de una columna contra un mes específico de un año:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereMonth('created_at', '12')
                -&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereDay</span> puede ser usado para comparar el valor de una columna contra un día especíco de un mes:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereDay('created_at', '31')
                -&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereYear</span> puede ser usado para comparar el valor de una columna contra un año específico:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereYear('created_at', '2016')
                -&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereTime</span> puede ser usado para comparar el valor de una columna contra una hora específica:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereTime('created_at', '=', '11:20')
                -&gt;get();
</code></pre>

  <p><strong>whereColumn / orWhereColumn</strong></p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereColumn</span> puede ser usado para verificar que dos columnas son iguales:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereColumn('first_name', 'last_name')
                -&gt;get();
</code></pre>

  <p>También puedes pasar un operador de comparación al método:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereColumn('updated_at', '&gt;', 'created_at')
                -&gt;get();
</code></pre>

  <p>Al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereColumn</span> también le puede ser pasado un arreglo de condiciones múltiples. Estas condiciones serán juntadas usando el operador <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">and</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereColumn([
                    ['first_name', '=', 'last_name'],
                    ['updated_at', '&gt;', 'created_at']
                ])-&gt;get();
</code></pre>

  <h3>Agrupando parámetros</h3>
  <p>Algunas veces puedes necesitar crear cláusulas where más avanzadas como cláusulas "where exists" o grupos de parámetros anidados. El constructor de consultas de Laravel puede manejar éstos también. Para empezar, vamos a mirar un ejemplo de grupos de restricciones encerrado por llaves:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')
            -&gt;where('name', '=', 'John')
            -&gt;where(function (\$query) {
                \$query-&gt;where('votes', '&gt;', 100)
                        -&gt;orWhere('title', '=', 'Admin');
            })
            -&gt;get();
</code></pre>

  <p>Como puedes ver, al pasar una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhere</span>, instruyes al constructor de consultas para empezar un grupo de restricción. La
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> recibirá una instancia del constructor de consultas la cual puedes usar para establecer las restricciones que deberían estar contenidas dentro del grupo encerrado por llaves. El ejemplo de arriba producirá la siguiente instrucción SQL:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>select * from users where name = 'John' and (votes &gt; 100 or title = 'Admin')
</code></pre>

  <p>TIP</p>
  <p>Siempre debes agrupar llamadas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhere</span> para evitar comportamiento inesperado cuando se apliquen alcances globales.</p>

  <h3>Cláusulas where exists</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereExists</span> permite que escribas cláusulas de SQL <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereExists</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereExists</span> acepta un argumento de tipo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>, el cual recibirá una instancia del constructor de consultas permitiendo que definas la consulta que debería ser puesta dentro de la cláusula "exists":</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')
            -&gt;whereExists(function (\$query) {
                \$query-&gt;select(DB::raw(1))
                        -&gt;from('orders')
                        -&gt;whereRaw('orders.user_id = users.id');
            })
            -&gt;get();
</code></pre>

  <p>La consulta anterior producirá el siguiente SQL:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>select * from users
where exists (
    select 1 from orders where orders.user_id = users.id
)
</code></pre>

  <h3>Cláusulas where JSON</h3>
  <p>
    Laravel también soporta consultar tipos de columna JSON en bases de datos que proporcionan soporte para tipos de columna JSON. Actualmente, esto incluye MySQL 5.7, PostgresSQL, SQL Server 2016, y SQLite 3.9.0 (con la extensión JSON1 ). Para consultar una columna JSON, usa el operador <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;where('options-&gt;language', 'en')
                -&gt;get();

\$users = DB::table('users')
                -&gt;where('preferences-&gt;dining-&gt;meal', 'salad')
                -&gt;get();
</code></pre>

  <p>Puedes usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereJsonContains</span> para consultar arreglos JSON (sin soporte en SQLite):
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereJsonContains('options-&gt;languages', 'en')
                -&gt;get();
</code></pre>

  <p>MySQL and PostgreSQL proveen soporte para <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereJsonContains</span> con múltiples valores:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereJsonContains('options-&gt;languages', ['en', 'de'])
                -&gt;get();
</code></pre>

  <p>Puedes usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereJsonLength</span> para consultar arreglos JSON por su longitud:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;whereJsonLength('options-&gt;languages', 0)
                -&gt;get();

\$users = DB::table('users')
                -&gt;whereJsonLength('options-&gt;languages', '&gt;', 1)
                -&gt;get();
</code></pre>

  <h2>Ordenamiento, agrupamiento, límite y desplazamiento</h2>
  <h4>orderBy</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orderBy</span> permite que ordenes los resultados de la consulta por una columna dada. El primer argumento para el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orderBy</span> debería ser la columna por la cual deseas ordenar, mientra que el segundo argumento controla la dirección del ordenamiento y puede ser <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">asc</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">desc</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;orderBy('name', 'desc')
                -&gt;get();
</code></pre>

  <h4>latest / oldest</h4>
  <p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">latest</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">oldest</span> te permiten ordenar fácilmente los resultados por fecha. Por defecto, el resultado será ordenado por la columna
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span>. También, puedes pasar el nombre de la columna por la cual deseas ordenar:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = DB::table('users')
                -&gt;latest()
                -&gt;first();
</code></pre>

  <h4>inRandomOrder</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">inRandomOrder</span> puede ser usado para ordenar los resultados de la consulta aletoriamente. Por ejemplo, puedes usar este método para obtener un usuario aleatorio:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$randomUser = DB::table('users')
                -&gt;inRandomOrder()
                -&gt;first();
</code></pre>

  <h4>groupBy / having</h4>
  <p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">groupBy</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">having</span> pueden ser usados para agrupar los resultados de la consulta. La forma que distingue el uso del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">having</span> es similar a la que tiene el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;groupBy('account_id')
                -&gt;having('account_id', '&gt;', 100)
                -&gt;get();
</code></pre>

  <p>Puedes pasar argumentos múltiples al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">groupBy</span> para agrupar por múltiples columnas:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;groupBy('first_name', 'status')
                -&gt;having('account_id', '&gt;', 100)
                -&gt;get();
</code></pre>

  <p>Para instrucciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">having</span> más avanzadas, echa un vistazo al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">havingRaw</span>.</p>
  <h4>skip / take</h4>
  <p>Para limitar el número de resultados devueltos desde la consulta, o para avanzar un número dado de resultados en la consulta, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">skip</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">take</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')-&gt;skip(10)-&gt;take(5)-&gt;get();
</code></pre>

  <p>Alternativamente, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">limit</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">offset</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')
                -&gt;offset(10)
                -&gt;limit(5)
                -&gt;get();
</code></pre>

  <h2>Cláusulas condicionales</h2>
  <p>Algunas podrías querer que las cláusulas apliquen solamente a una consulta cuando alguna cosa más se cumple. Por ejemplo, puedes querer que solamente se aplique una instrucción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> si un valor de entrada dado está presente en la solicitud entrante. Puedes acompañar esto usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$role = \$request-&gt;input('role');

\$users = DB::table('users')
                -&gt;when(\$role, function (\$query) use (\$role) {
                    return \$query-&gt;where('role_id', \$role);
                })
                -&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span> ejecuta solamente la Closure dada cuando el primer parámetro es
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>. Si el primer parámetro es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>, la Closure no será ejecutada.
  </p>
  <p>Puedes pasar otra Closure como tercer parámetro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span>. Esta Closure se ejecutará si el primer parámetro se evalúa como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>. Para ilustrar cómo esta característica puede ser usada, la usaremos para configurar el ordenamiento predeterminado de una consulta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$sortBy = null;

\$users = DB::table('users')
                -&gt;when(\$sortBy, function (\$query) use (\$sortBy) {
                    return \$query-&gt;orderBy(\$sortBy);
                }, function (\$query) {
                    return \$query-&gt;orderBy('name');
                })
                -&gt;get();
</code></pre>

  <h2>Inserciones</h2>
  <p>El constructor de consultas también proporciona un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insert</span> para insertar registros dentro de la base de datos. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insert</span> acepta un arreglo de nombres de columna y valores:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;insert(
    ['email' =&gt; 'john@example.com', 'votes' =&gt; 0]
);
</code></pre>

  <p>Incluso puedes insertar varios registros dentro de la tabla con una sola llamada a
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insert</span> pasando un arreglo de arreglos. Cada arreglo representa una fila a ser insertada dentro de la tabla:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;insert([
    ['email' =&gt; 'taylor@example.com', 'votes' =&gt; 0],
    ['email' =&gt; 'dayle@example.com', 'votes' =&gt; 0]
]);
</code></pre>

  <h4>IDs de auto-incremento</h4>
  <p>Si la tabla tiene un id de auto-incremento, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insertGetId</span> para insertar un registro y recibir el ID:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$id = DB::table('users')-&gt;insertGetId(
    ['email' =&gt; 'john@example.com', 'votes' =&gt; 0]
);
</code></pre>

  <p>Nota</p>
  <p>Cuando estás usando PostgreSQL el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insertGetId</span> espera que la columna de auto-incremento sea llamada <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span>. Si prefieres obtener el ID con una "secuencia" distinta, puedes pasar el nombre de la columna como segundo parámetro del método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insertGetId</span>.
  </p>

  <h2>Actualizaciones</h2>
  <p>Además de insertar registros dentro de la base de datos, el constructor de consultas también puede actualizar registros existentes usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span>. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span>, como el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">insert</span>, acepta un arreglo de pares de columna y valor que contienen las columnas a ser actualizadas. Puedes restringir la consulta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span> usando cláusulas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')
            -&gt;where('id', 1)
            -&gt;update(['votes' =&gt; 1]);
</code></pre>

  <h4>Actualizar o insertar</h4>
  <p>A veces es posible que desees actualizar un registro existente en la base de datos o crearlo si no existe un registro coincidente. En este escenario, se puede usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateOrInsert</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateOrInsert</span> acepta dos argumentos: un arreglo de condiciones para encontrar el registro y un arreglo de columnas y pares de valores que contienen las columnas que se actualizarán.</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateOrInsert</span> intentará primero buscar un registro de base de datos que coincida con los pares de columna y valor del primer argumento. Si el registro existe, se actualizará con los valores del segundo argumento. Si no se encuentra el registro, se insertará un nuevo registro con los atributos combinados de ambos argumentos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')
    -&gt;updateOrInsert(
        ['email' =&gt; 'john@example.com', 'name' =&gt; 'John'],
        ['votes' =&gt; '2']
    );
</code></pre>

  <h2>Actualizando columnas JSON</h2>
  <p>Cuando estamos actualizando una columna JSON, deberías usar la sintaxis <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;</span> para acceder a la clave apropiada en el objeto JSON. Esta operación es soportada solamente en MySQL 5.7+ y PostgreSQL 9.5+:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')
            -&gt;where('id', 1)
            -&gt;update(['options-&gt;enabled' =&gt; true]);
</code></pre>

  <h3>Incremento y decremento</h3>
  <p>El constructor de consultas también proporciona métodos convenientes para incrementar o decrementar el valor de una columna dada. Esto es un atajo, que proporciona una interfaz más expresiva y concisa en comparación con la escritura manual de la declaración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span>.
  </p>
  <p>Ambos métodos aceptan al menos un argumento: la columna a modificar. Un segundo argumento puede ser pasado opcionalmente para controlar la cantidad con la cual la columna debería ser incrementada o decrementada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;increment('votes');

DB::table('users')-&gt;increment('votes', 5);

DB::table('users')-&gt;decrement('votes');

DB::table('users')-&gt;decrement('votes', 5);
</code></pre>

  <p>También puedes especificar columnas adicionales para actualizar durante la operación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;increment('votes', 1, ['name' =&gt; 'John']);
</code></pre>

  <h2>Eliminaciones</h2>
  <p>El constructor de consultas también puede ser usado para eliminar registros de la tabla por medio del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span>. Puedes restringir instrucciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> al agregar cláusulas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> antes de ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;delete();

DB::table('users')-&gt;where('votes', '&gt;', 100)-&gt;delete();
</code></pre>

  <p>Si deseas truncar la tabla completa, lo cual remueve todas las filas y reinicia el ID de auto-incremento a cero, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">truncate</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;truncate();
</code></pre>

  <h2>Bloqueo pesimista</h2>
  <p>El constructor de consultas también incluye algunas funciones que ayudan a que hagas el "bloqueo pesimista" en tus instrucciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>. Para ejecutar la instrucción con un "bloqueo compartido", puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sharedLock</span> en una consulta. Un bloqueo compartido previene las filas seleccionadas para que no sean modificadas hasta que tu transacción se confirme:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;where('votes', '&gt;', 100)-&gt;sharedLock()-&gt;get();
</code></pre>

  <p>Alternativamente, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">lockForUpdate</span>. Un bloqueo "para actualización" evita que las filas se modifiquen o que se seleccionen con otro bloqueo compartido:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;where('votes', '&gt;', 100)-&gt;lockForUpdate()-&gt;get();
</code></pre>

  <p>Puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dd</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span> al construir una consulta para vaciar los enlaces de consulta y SQL. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dd</span> mostrará la información de depuración y luego dejará de ejecutar la solicitud. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span> mostrará la información de depuración pero permitirá que la solicitud se siga ejecutando:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>DB::table('users')-&gt;where('votes', '&gt;', 100)-&gt;dd();

DB::table('users')-&gt;where('votes', '&gt;', 100)-&gt;dump();
</code></pre>
</div>
""";