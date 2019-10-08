import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class BdPaginacion extends StatelessWidget {
  final String title;
  BdPaginacion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmBdPaginacion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmBdPaginacion = """
<!-- Base de datos: Paginación -->
<div style='font-size: 14.2px;'>
  <h1>Base de datos: Paginación</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Uso básico
      <ul>
        <li>Paginando los resultados del constructor de consultas</li>
        <li>Paginando los resultados de Eloquent</li>
        <li>Creando un paginador manualmente</li>
      </ul>
    </li>
    <li>
      Mostrando los resultados de la paginación
      <ul>
        <li>Convirtiendo los resultados a JSON</li>
      </ul>
    </li>
    <li>Personalizando la vista de la paginación</li>
    <li>Métodos de instancia del paginador</li>
  </ul>

  <h2>Introducción</h2>
  <p>
    En otros frameworks, la paginación puede ser muy difícil. El paginador de Laravel está integrado con el constructor de consultas y el ORM Eloquent , proporcionando una conveniente y fácil manera de usar paginación de resultados de forma predeterminada. El HTML generado por el paginador es compatible con el Framework de CSS Bootstrap
    <outboundlink></outboundlink>
    .
  </p>

  <h2>Uso básico</h2>

  <h3>Paginando los resultados del constructor de consultas</h3>
  <p>
    Hay varias formas de paginar los elementos. La más simple es usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">paginate</span> en el constructor de consultas o una Consulta de Eloquent . El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">paginate</span> se encarga automáticamente de la configuración del límite y desplazamiento apropiado de la página actual que está siendo vista por el usuario. Por defecto, la página actual es detectada por el valor del argumento de cadena de consulta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">page</span> en la solicitud HTTP. Este valor es detectado automáticamente por Laravel y también es insertado automáticamente dentro de los enlaces generados por el paginador.
  </p>
  <p>En este ejemplo, el único argumento pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">paginate</span> es el número de elementos que prefieres que sean mostrados "por página". En este caso, vamos a especificar que nos gustaría mostrar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">15</span> elementos por página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
    * Show all of the users for the application.
    *
    * @return Response
    */
    public function index()
    {
        \$users = DB::table('users')-&gt;paginate(15);

        return view('user.index', ['users' =&gt; \$users]);
    }
}
</code></pre>

  <p>Nota</p>
  <p>Actualmente, las operaciones de paginación que usan una instrucción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">GroupBy</span> no pueden ser ejecutados eficientemente por Laravel. Si necesitas usar una cláusula
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">GroupBy</span> con un conjunto de resultados paginados, es recomendable que consultes la base de datos y crees un paginador manualmente.</p>

  <h4>Paginación sencilla</h4>
  <p>Si necesitas mostrar solamente enlaces "Siguiente" y "Anterior" en tu vista de paginación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">simplePaginate</span> para ejecutar una consulta más eficiente. Esto es muy útil para grandes colecciones de datos cuando no necesitas mostrar un enlace para cada número de página al momento de renderizar tu vista.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = DB::table('users')-&gt;simplePaginate(15);
</code></pre>

  <h3>Paginando resultados de eloquent</h3>
  <p>También puedes paginar consultas de Eloquent. En este ejemplo, paginaremos el modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">15</span> elementos por página. Como puedes ver, la sintaxis es casi idéntica a la paginación de los resultados del constructor de consultas.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = App\User::paginate(15);
</code></pre>

  <p>Puedes ejecutar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">paginate</span> después de configurar otras restricciones en la consulta, tal como las cláusulas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = User::where('votes', '&gt;', 100)-&gt;paginate(15);
</code></pre>

  <p>También puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">simplePaginate</span> al momento de paginar los modelos de Eloquent.
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = User::where('votes', '&gt;', 100)-&gt;simplePaginate(15);
</code></pre>

  <h3>Creando un paginador manualmente</h3>
  <p>Algunas veces puedes desear crear una instancia de paginación manualmente, pasándole un arreglo de elementos. Puedes hacer eso al crear una instancia de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Pagination\Paginator</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Pagination\LengthAwarePaginator</span>, dependiendo de tus necesidades.</p>
  <p>La clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Paginator</span> no necesita conocer el número total de elementos en el conjunto de resultados; sin embargo, debido a esto, la clase no tiene métodos para obtener el índice de la última página. La clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LengthAwarePaginator</span> acepta casi los mismos argumentos que la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Paginator</span>; sin embargo, si requiere una cuenta del total del número de elementos en el conjunto de resultados.</p>
  <p>En otras palabras, la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Paginator</span> corresponde al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">simplePaginate</span> en el constructor de consultas y Eloquent, mientras la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LengthAwarePaginator</span> corresponde al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">paginate</span>.</p>

  <p>Nota</p>
  <p>
    Cuando creas manualmente una instancia del paginador, deberías manualmente "recortar en partes" el arreglo de resultados que pasas al paginador. Si estás inseguro de cómo hacer esto, inspecciona la función de PHP array_slice .
  </p>

  <h2>Mostrando los resultados de la paginación</h2>
  <p>Cuando ejecutas el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">paginate</span>, recibirás una instancia de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Pagination\LengthAwarePaginator</span>. Cuando ejecutas el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">simplePaginate</span>, recibirás una instancia de la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Pagination\Paginator</span>. Estos objetos proporcionan varios métodos que afectan la presentación del conjunto de resultados. Además de estos métodos helpers, las instancias del paginador son iteradoras, es decir, pueden ser recorridas por un ciclo repetitivo igual que un arreglo. Así, una vez que has obtenido los resultados, puedes mostrar los resultados y renderizar los enlaces de página usando Blade:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;div class="container"&gt;
    @foreach (\$users as \$user)
        {{ \$user-&gt;name }}
    @endforeach
&lt;/div&gt;

{{ \$users-&gt;links() }}
</code></pre>

  <p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">links</span> renderizará los enlaces para el resto de las páginas en el conjunto de resultados. Cada uno de estos enlaces ya contendrá la variable de cadena de consulta
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">page</span> apropiada. Recuerda, el HTML generado por el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">links</span> es compatible con el Framework de CSS Boostrap .
  </p>
  <h4>Personalizando la URI del paginador</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withPath</span> permite personalizar la URI usada por el paginador al momento de generar enlaces. Por ejemplo, si quieres que el paginador genere enlaces como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://example.com/custom/url?page=N</span>, deberías pasar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">custom/url</span> al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withPath</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::get('users', function () {
    \$users = App\User::paginate(15);

    \$users-&gt;withPath('custom/url');

    //
});
</code></pre>

  <h4>Agregando enlaces de paginación</h4>
  <p>Puedes agregar la cadena de consulta a los enlaces de paginación usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">appends</span>. Por ejemplo, para agregar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sort=votes</span> a cada enlace de paginación, deberías hacer la siguiente ejecución del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">appends</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{{ \$users-&gt;appends(['sort' =&gt; 'votes'])-&gt;links() }}
</code></pre>

  <p>Si deseas agregar un "fragmento con el símbolo numeral <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">#</span>" a las URLs del paginador, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fragment</span>. Por ejemplo, para agregar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">#foo</span> al final de cada enlace de paginación, haz la siguiente ejecución del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fragment</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{{ \$users-&gt;fragment('foo')-&gt;links() }}
</code></pre>

  <h4>Ajustando la ventana de enlace de paginación</h4>
  <p>Puedes controlar cuántos enlaces adicionales son mostrados en cada lado de la "ventana" de la URL del paginador. Por defecto, tres enlaces son mostrados en cada lado de los enlaces primarios del paginador. Sin embargo, puedes controlar este número usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onEachSide</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{{ \$users-&gt;onEachSide(5)-&gt;links() }}
</code></pre>

  <h3>Convirtiendo resultados a JSON</h3>
  <p>Las clases resultantes del paginador de Laravel implementan la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Support\Jsonable</span> y exponen el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toJson</span>, así es muy fácil convertir los resultados de tu paginación a JSON. También puedes convertir una instancia del paginador al devolverlo desde una ruta o acción de controlador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::get('users', function () {
    return App\User::paginate();
});
</code></pre>

  <p>El JSON devuelto por el paginador incluirá meta información tal como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">total</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">current_page</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">last_page</span> y más. Los objetos de resultados reales estarán disponibles por medio de la clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span> en el arreglo JSON. Aquí está un ejemplo del JSON creado al regresar una instancia del paginador desde una ruta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{
    "total": 50,
    "per_page": 15,
    "current_page": 1,
    "last_page": 4,
    "first_page_url": "http://laravel.app?page=1",
    "last_page_url": "http://laravel.app?page=4",
    "next_page_url": "http://laravel.app?page=2",
    "prev_page_url": null,
    "path": "http://laravel.app",
    "from": 1,
    "to": 15,
    "data":[
        {
            // Result Object
        },
        {
            // Result Object
        }
    ]
}
</code></pre>

  <h2>Personalizando la vista de la paginación</h2>
  <p>De forma predeterminada, las vistas que son renderizadas para mostrar los enlaces de paginación son compatibles con el framework de CSS Bootstrap. Sin embargo, si no estás usando Bootstrap, eres libre de definir tus propias vistas para renderizar esos enlaces. Al momento de ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">links</span> en una instancia del paginador, pasa el nombre de la vista como primer argumento del método:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{{ \$paginator-&gt;links('view.name') }}

// Passing data to the view...
{{ \$paginator-&gt;links('view.name', ['foo' =&gt; 'bar']) }}
</code></pre>

  <p>Sin embargo, la forma más fácil de personalizar las vistas de paginación es exportándolas a tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor</span> usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan vendor:publish --tag=laravel-pagination
</code></pre>

  <p>Este comando ubicará las vistas dentro del directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor/pagination</span>. El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">default.blade.php</span> dentro de este directorio corresponde a la vista de paginación predeterminada. Edita este archivo para modificar el HTML de paginación.</p>
  <p>Si quieres designar un archivo distinto como la vista de paginación por defecto, se pueden usar los métodos de paginador <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">defaultView</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">defaultSimpleView</span> en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Pagination\Paginator;

public function boot()
{
    Paginator::defaultView('view-name');

    Paginator::defaultSimpleView('view-name');
}
</code></pre>

  <h2>Métodos de la instancia paginadora</h2>
  <p>Cada instancia del paginador proporciona información de paginación adicional por medio de los siguientes métodos:</p>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Método</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;count()</span></td>
      <td>Obtiene el número de elementos para la página actual.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;currentPage()</span></td>
      <td>Obtiene el número de la página actual.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;firstItem()</span></td>
      <td>Obtiene el número de resultado del primer elemento en los resultados.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;getOptions()</span></td>
      <td>Obtiene las opciones del paginador.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;getUrlRange(\$start, \$end)</span></td>
      <td>Crea un rango de URLs de paginación.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;hasMorePages()</span></td>
      <td>Determina si hay suficientes elementos para dividir en varias páginas.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;items()</span></td>
      <td>Obtener los elementos de la página actual.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;lastItem()</span></td>
      <td>Obtiene el número de resultado del último elemento en los resultados.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;lastPage()</span></td>
      <td>Obtiene el número de página de la última página disponible. (No disponible cuando se utiliza <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">simplePaginate</span>).
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;nextPageUrl()</span></td>
      <td>Obtiene la URL para la próxima página.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;onFirstPage()</span></td>
      <td>Determine si el paginador está en la primera página.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;perPage()</span></td>
      <td>El número de elementos a mostrar por página.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;previousPageUrl()</span></td>
      <td>Obtiene la URL de la página anterior.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;total()</span></td>
      <td>Determine el número total de elementos coincidentes en el almacén de datos. (No disponible cuando se utiliza <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">simplePaginate</span>).
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$results-&gt;url(\$page)</span></td>
      <td>Obtiene la URL para un número de página dado.</td>
    </tr>
    </tbody>
  </table>
</div>
""";