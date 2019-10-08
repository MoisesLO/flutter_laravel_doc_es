import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class OrPasos extends StatelessWidget {
  final String title;
  OrPasos(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmOrPasos,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmOrPasos = """
<!-- Eloquent: Primeros Pasos -->
<div style='font-size: 14.2px;'>
  <h1>Eloquent: Primeros Pasos</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Definiendo modelos
      <ul>
        <li>Convenciones del modelo Eloquent</li>
        <li>Valores de atributo predeterminados</li>
      </ul>
    </li>
    <li>
      Obteniendo modelos
      <ul>
        <li>Colecciones</li>
        <li>Resultados divididos en partes (chunk)</li>
      </ul>
    </li>
    <li>
      Obteniendo modelos individuales / Agrupamientos
      <ul>
        <li>Obteniendo agrupamientos</li>
      </ul>
    </li>
    <li>
      Insertando y actualizando modelos
      <ul>
        <li>Inserciones</li>
        <li>Actualizaciones</li>
        <li>Asignación masiva</li>
        <li>Otros métodos de creación</li>
      </ul>
    </li>
    <li>
      Eliminando modelos
      <ul>
        <li>Eliminación lógica</li>
        <li>Consultando modelos eliminados lógicamente</li>
      </ul>
    </li>
    <li>
      Alcances de consulta
      <ul>
        <li>Alcances globales</li>
        <li>Alcances locales</li>
      </ul>
    </li>
    <li>Comparando modelos</li>
    <li>
      Eventos
      <ul>
        <li>Observadores</li>
      </ul>
    </li>
  </ul>

  <h2>Introducción</h2>
  <p>El ORM Eloquent incluido con Laravel proporciona una genial y simple implentación básica de ActiveRecord para trabajar con tu base de datos. Cada tabla de base de datos tiene un correspondiente "Modelo" el cual es usado para interactuar con la tabla. Los modelos permiten que consultes los datos en tus tablas, así como también insertar nuevos registros dentro de la tabla.
  </p>
  <p>
    Antes de empezar, asegúrate de configurar una conexión de base de datos en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database.php</span>. Para mayor información sobre la configuración de tu base de datos, revisa la documentación .
  </p>

  <h2>Definiendo modelos</h2>
  <p>Para empezar, vamos a crear un modelo de Eloquent. Los modelos residen típicamente en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span>, pero eres libre de colocarlos en cualquier parte que pueda ser auto-cargada de acuerdo a tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span>. Todos los modelos de Eloquent extienden la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\Model</span>.</p>
  <p>
    La forma más fácil de crear una instancia del modelo es usando el Comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:model</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:model Flight
</code></pre>

  <p>
    Si prefieres generar una migración de base de datos cuando generes el modelo, puedes usar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--migration</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-m</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:model Flight --migration

php artisan make:model Flight -m
</code></pre>

  <h3>Convenciones del modelo Eloquent</h3>
  <p>Ahora, vamos a mirar un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Flight</span> de ejemplo, el cual usaremos para obtener y guardar información desde nuestra tabla de base de datos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flights</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    //
}
</code></pre>

  <h4>Nombres de tabla</h4>
  <p>Observa que no le dijimos a Eloquent cuál tabla usar para nuestro modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Flight</span>. Por convención, el nombre de la clase en plural y en formato "snake_case" será usado como el nombre de tabla a menos que otro nombre sea especificado expresamente. Así, en este caso, Eloquent asumirá que el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Flight</span> guarde los registros en la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flights</span>. Puedes especificar una tabla personalizada al definir una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">table</span> en tu modelo:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
    * The table associated with the model.
    *
    * @var string
    */
    protected \$table = 'my_flights';
}
</code></pre>

  <h4>Claves primarias</h4>
  <p>Eloquent asumirá que cada tabla tiene una columna de clave primaria denominada <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span>. Puedes definir una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$primaryKey</span> protegida para sobrescribir esta convención:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
    * The primary key associated with the table.
    *
    * @var string
    */
    protected \$primaryKey = 'flight_id';
}
</code></pre>

  <p>Además, Eloquent asume que la clave primaria es un valor entero autoincremental, lo que significa que de forma predeterminada la clave primaria será convertida a un tipo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">int</span> automáticamente. Si deseas usar una clave primaria que no sea de autoincremeneto o numérica debes establecer la propiedad pública <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$incrementing</span> de tu modelo a
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

class Flight extends Model
{
    /**
    * Indicates if the IDs are auto-incrementing.
    *
    * @var bool
    */
    public \$incrementing = false;
}
</code></pre>

  <p>Si tu clave primaria no es un entero, debes establecer la propiedad protegida
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$keyType</span> de tu modelo a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">string</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

class Flight extends Model
{
    /**
    * The "type" of the auto-incrementing ID.
    *
    * @var string
    */
    protected \$keyType = 'string';
}
</code></pre>

  <h4>Marcas de tiempo o timestamps</h4>
  <p>De forma predeterminada, Eloquent espera que las columnas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span> existan en tus tablas. Si no deseas tener estas columnas manejadas automáticamente por Eloquent, establece la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$timestamps</span> de tu modelo a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
    * Indicates if the model should be timestamped.
    *
    * @var bool
    */
    public \$timestamps = false;
}
</code></pre>

  <p>Si necesitas personalizar el formato de tus marcas de tiempo, establece la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$dateFormat</span> de tu modelo. Esta propiedad determina como los atributos de fecha son guardados en la base de datos, también como su formato cuando el modelo es serializado a un arreglo o JSON:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
    * The storage format of the model's date columns.
    *
    * @var string
    */
    protected \$dateFormat = 'U';
}
</code></pre>

  <p>Si necesitas personalizar los nombres de las columnas usadas para guardar las marcas de tiempo, puedes establecer las constantes <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">CREATED_AT</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UPDATED_AT</span>en tu modelo:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

class Flight extends Model
{
    const CREATED_AT = 'creation_date';
    const UPDATED_AT = 'last_update';
}
</code></pre>

  <h4>Conexión de base de datos</h4>
  <p>De forma predeterminada, todos los modelos Eloquent usarán la conexión de base de datos configurada por tu aplicación. Si quieres especificar una conexión diferente para el modelo, usa la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$connection</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
    * The connection name for the model.
    *
    * @var string
    */
    protected \$connection = 'connection-name';
}
</code></pre>

  <h3>Valores de atributo predeterminados</h3>
  <p>Si deseas definir los valores predeterminados para algunos de los atributos de su modelo, puedes definir una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$attributes</span> en tu modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
    * The model's default values for attributes.
    *
    * @var array
    */
    protected \$attributes = [
        'delayed' =&gt; false,
    ];
}
</code></pre>

  <h2>Obteniendo modelos</h2>
  <p>
    Una vez que has creado un modelo y su tabla de base de datos asociada , estás listo para empezar a obtener datos de tu base de datos. Piensa en cada modelo de Eloquent como un constructor de consultas muy poderoso que te permite consultar fluidamente la tabla de base de datos asociada con el modelo. Por ejemplo:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

\$flights = App\Flight::all();

foreach (\$flights as \$flight) {
    echo \$flight-&gt;name;
}
</code></pre>

  <h4>Añadiendo restricciones adicionales</h4>
  <p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all</span> de Eloquent devolverá todos los resultados en la tabla del modelo. Ya que cada modelo de Eloquent sirve como un constructor de consultas , también puedes añadir restricciones a las consultas y entonces usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> para obtener los resultados:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flights = App\Flight::where('active', 1)
                -&gt;orderBy('name', 'desc')
                -&gt;take(10)
                -&gt;get();
</code></pre>

  <p>TIP</p>
  <p>
    Ya que los modelos de Eloquent son constructores de consultas, deberías revisar todos los métodos disponibles en el constructor de consultas . Puedes usar cualquiera de estos métodos en tus consultas de Eloquent.
  </p>

  <h4>Actualizando modelos</h4>
  <p>Podemos actualizar modelos usando los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fresh</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">refresh</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fresh</span> volverá a recuperar el modelo de la base de datos. La instancia de modelo existente no será afectada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight = App\Flight::where('number', 'FR 900')-&gt;first();

\$freshFlight = \$flight-&gt;fresh();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">refresh</span> "rehidratará" el modelo existente usando datos nuevos de la base de datos. Además, todas sus relaciones cargadas previamente serán también actualizadas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight = App\Flight::where('number', 'FR 900')-&gt;first();

\$flight-&gt;number = 'FR 456';

\$flight-&gt;refresh();

\$flight-&gt;number; // "FR 900"
</code></pre>

  <h3>Colecciones</h3>
  <p>Para métodos de Eloquent como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> que obtienen varios resultados, se devolverá una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\Collection</span>. La clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> proporciona una variedad de métodos útiles para trabajar con los resultados de Eloquent:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flights = \$flights-&gt;reject(function (\$flight) {
    return \$flight-&gt;cancelled;
});
</code></pre>

  <p>También puedes recorrer la colección como un arreglo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>foreach (\$flights as \$flight) {
    echo \$flight-&gt;name;
}
</code></pre>

  <h3>Resultados divididos en partes (chunk)</h3>
  <p>Si necesitas procesar miles de registros de Eloquent, usa el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chunk</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chunk</span> obtendrá una "porción" de los modelos de Eloquent, incorporándolos a una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> dada para procesamiento. Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chunk</span> ahorrarás memoria al momento de trabajar con grandes conjuntos de resultados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Flight::chunk(200, function (\$flights) {
    foreach (\$flights as \$flight) {
        //
    }
});
</code></pre>

  <p>El primer argumento pasado al método es el número de registros que deseas obtener por cada "porción". La Closure pasada como segundo argumento será ejecutada para cada porción que sea obtenida de la base de datos. Una consulta de base de datos será ejecutada para obtener cada porción de registros pasados a la Closure.</p>
  <h4>Usando cursores</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cursor</span> permite que iteres a través de registros de tu base de datos usando un cursor, el cual ejecutará solamente una consulta única. Al momento de procesar grandes cantidades de datos, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cursor</span> para reducir en gran medida el uso de la memoria:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>foreach (Flight::where('foo', 'bar')-&gt;cursor() as \$flight) {
    //
}
</code></pre>

  <h2>Obteniendo modelos individuales / Agrupamientos</h2>
  <p>Además de obtener todos los registros de una tabla dada, también puedes obtener registros individuales usando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">find</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first</span>. En lugar de devolver una colección de modelos, estos métodos devuelven una única instancia de modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Recupera un modelo por su clave primaria...
\$flight = App\Flight::find(1);

// Recupera el primer modelo que coincida con las restricciones de consulta...
\$flight = App\Flight::where('active', 1)-&gt;first();
</code></pre>

  <p>También puedes ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">find</span> con un arreglo de claves primarias, el cual devolverá una colección de los registros que coincidan:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flights = App\Flight::find([1, 2, 3]);
</code></pre>

  <h4>Excepciones not found (no encontrado)</h4>
  <p>Algunas veces, puedes desear arrojar una excepción si un modelo no es encontrado. Es particularmente útil en rutas o controladores. Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">findOrFail</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrFail</span> obtendrán el primer resultado de la consulta; sin embargo, si nada es encontrado, una excepción de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\ModelNotFoundException</span> será arrojada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$model = App\Flight::findOrFail(1);

\$model = App\Flight::where('legs', '&gt;', 100)-&gt;firstOrFail();
</code></pre>

  <p>Si la excepción no es atrapada, una respuesta HTTP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">404</span> es enviada automáticamente de regreso al usuario. No es necesario escribir verificaciones explícitas para devolver respuestas
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">404</span> cuando uses estos métodos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::get('/api/flights/{id}', function (\$id) {
    return App\Flight::findOrFail(\$id);
});
</code></pre>

  <h3>Obteniendo agrupamientos</h3>
  <p>También puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">count</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sum</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">max</span> y otros métodos de agrupamiento proporcionados por el constructor de consulta. Estos métodos devuelven el valor escalar apropiado en lugar de una completa instancia de modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$count = App\Flight::where('active', 1)-&gt;count();

\$max = App\Flight::where('active', 1)-&gt;max('price');
</code></pre>

  <h2>Insertando Y actualizando modelos</h2>

  <h3>Inserciones</h3>
  <p>Para agregar un nuevo registro en la base de datos crea una nueva instancia de modelo, establece los atributos del modelo y después ejecuta el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Controllers;

use App\Flight;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class FlightController extends Controller
{
    /**
    * Create a new flight instance.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        // Validate the request...

        \$flight = new Flight;

        \$flight-&gt;name = \$request-&gt;name;

        \$flight-&gt;save();
    }
}
</code></pre>

  <p>En este ejemplo, asignamos el parámetro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> de la solicitud entrante al atributo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> de la instancia del modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Flight</span>. Cuando ejecutamos el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span>, un registro será insertado en la base de datos. Las marcas de tiempo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span> serán automáticamente establecidas cuando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> sea ejecutado, no hay necesidad de establecerlos manualmente.</p>

  <h3>Actualizaciones</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> también puede ser usado para actualizar modelos que ya existen en la base de datos. Para actualizar un modelo, debes obtenerlo, establecer cualquiera de los atributos que desees actualizar y después ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span>. Otra vez, la marca de tiempo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span> será actualizada automáticamente, no hay necesidad de establecer su valor manualmente.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight = App\Flight::find(1);

\$flight-&gt;name = 'New Flight Name';

\$flight-&gt;save();
</code></pre>

  <h4>Actualizaciones masivas</h4>
  <p>Las actualizaciones también pueden ser ejecutadas contra cualquier número de modelos que coincidan con un criterio de consulta dada. En este ejemplo, todos los vuelos que están activos o con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">active</span> igual a 1 y tienen un atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">destination</span> igual a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">San
  Diego</span> serán marcados como retrasados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>App\Flight::where('active', 1)
            -&gt;where('destination', 'San Diego')
            -&gt;update(['delayed' =&gt; 1]);
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span> espera un arreglo de pares de columna y valor representando las columnas que deberían ser actualizadas.</p>

  <p>Nota</p>
  <p>Al momento de utilizar una actualización masiva por medio de Eloquent, los eventos de modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saving</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saved</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updating</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated</span> no serán disparados para los modelos actualizados. Esto es debido a que los modelos nunca son obtenidos en realidad al momento de hacer una actualización masiva.</p>

  <h3>Asignación masiva</h3>
  <p>También puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> para guardar un nuevo modelo en una sola línea. La instancia de modelo insertada te será devuelta por el método. Sin embargo, antes de hacer eso, necesitarás especificar o un atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fillable</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guarded</span> del modelo, de modo que todos los modelos de Eloquent se protejan contra la asignación masiva de forma predeterminada.</p>
  <p>Una vulnerabilidad en la asignación masiva ocurre cuando un usuario pasa un parámetro HTTP inesperado a través de una solicitud y ese parámetro cambia una columna en tu base de datos que no esperabas. Por ejemplo, un usuario malicioso podría enviar un parámetro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">is_admin</span> a través de una solicitud HTTP, la cual es entonces pasada en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> de tu modelo, permitiendo que el usuario se promueva a si mismo como un usuario administrador.</p>
  <p>Así que, para empezar, debes definir cuáles atributos del modelo quieres que se asignen de forma masiva. Puedes hacerlo usando la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$fillable</span> del modelo. Por ejemplo, vamos a hacer el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> de nuestro modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Flight</span> sea asignado masivamente.
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
    * The attributes that are mass assignable.
    *
    * @var array
    */
    protected \$fillable = ['name'];
}
</code></pre>

  <p>Una vez que hemos indicado los atributos asignables en masa, podemos usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> para insertar un nuevo registro en la base de datos. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> devuelve la instancia de modelo guardada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight = App\Flight::create(['name' =&gt; 'Flight 10']);
</code></pre>

  <p>Si ya tienes una instancia del modelo, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fill</span> para llenarla con un arreglo de atributos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight-&gt;fill(['name' =&gt; 'Flight 22']);
</code></pre>

  <h4>Protección de atributos</h4>
  <p>Mientras <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$fillable</span> sirve como una "lista blanca" de atributos que deben ser asignados en forma masiva, también puedes elegir usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$guarded</span>. La propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$guarded</span> debe contener un arreglo de atributos que no deseas que sean asignados en forma masiva. El resto de atributos que no estén en el arreglo serán asignados masivamente. <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$guarded</span> funciona como una "lista negra". Importante, debes usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$fillable</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$guarded</span> - pero no ambos. En el ejemplo siguiente, todos los atributos <strong>excepto
      <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">price</span></strong> serán asignados en forma masiva:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Flight extends Model
{
    /**
    * The attributes that aren't mass assignable.
    *
    * @var array
    */
    protected \$guarded = ['price'];
}
</code></pre>

  <p>Si prefieres hacer todos los atributos asignados masivamente, puedes definir la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$guarded</span> como un arreglo vacío:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* The attributes that aren't mass assignable.
*
* @var array
*/
protected \$guarded = [];
</code></pre>

  <h3>Otros Métodos De Creación</h3>
  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrCreate</span>/ <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrNew</span></h4>
  <p>Hay otros dos métodos que puedes usar para crear modelos con atributos de asignación masiva:
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrCreate</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrNew</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrCreate</span> intentará localizar un registro de base de datos usando los pares columna / valor dados. Si el modelo no puede ser encontrado en la base de datos, un registro será insertado con los atributos del primer parámetro, junto con aquellos del segundo parámetro opcional.</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrNew</span>, al igual que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrCreate</span>, intentará localizar un registro en la base de datos que coincida con los atributos dados. Sin embargo, si un modelo no es encontrado, una nueva instancia de modelo será devuelta. Nota que el modelo devuelto por
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrNew</span> todavía no ha sido enviado a la base de datos. Necesitarás ejecutar
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> manualmente para hacerlo persistente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Recupera el vuelo por nombre, o lo crea si no existe...
\$flight = App\Flight::firstOrCreate(['name' =&gt; 'Flight 10']);

// Recupera vuelo por nombre o lo crea con los atributos name, delayed y arrival_time...
\$flight = App\Flight::firstOrCreate(
    ['name' =&gt; 'Flight 10'],
    ['delayed' =&gt; 1, 'arrival_time' =&gt; '11:30']
);

// Recupera por nombre, o instancia...
\$flight = App\Flight::firstOrNew(['name' =&gt; 'Flight 10']);

// Recupera por nombre o crea una instancia con los atributos name, delayed y arrival_time...
\$flight = App\Flight::firstOrNew(
    ['name' =&gt; 'Flight 10'],
    ['delayed' =&gt; 1, 'arrival_time' =&gt; '11:30']
);
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateOrCreate</span></h4>
  <p>También puedes encontrar situaciones donde quieras actualizar un modelo existente o crear un nuevo modelo si no existe. Laravel proporciona un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateOrCreate</span> para hacer esto en un paso. Al igual que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrCreate</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateOrCreate</span> persiste el modelo, para que no haya necesidad de ejecutar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save()</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Si hay un vuelo desde Oakland a San Diego, establece el precio a \$99.
// Si no existe un modelo que coincida, crea uno.
\$flight = App\Flight::updateOrCreate(
    ['departure' =&gt; 'Oakland', 'destination' =&gt; 'San Diego'],
    ['price' =&gt; 99, 'discounted' =&gt; 1]
);
</code></pre>

  <h2>Eliminando modelos</h2>
  <p>Para eliminar un modelo, ejecuta el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> en una instancia del modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight = App\Flight::find(1);

\$flight-&gt;delete();
</code></pre>

  <h4>Eliminando un modelo existente por clave</h4>
  <p>En el ejemplo anterior, estamos obteniendo el modelo de la base de datos antes de ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span>. Sin embargo, si conoces la clave primaria del modelo, puedes eliminar el modelo sin obtenerlo primero. Para hacer eso, ejecuta el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">destroy</span>. Además de recibir una sola clave primaria como argumento, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">destroy</span> aceptará múltiples claves primarias, o una collection de claves primarias:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>App\Flight::destroy(1);

App\Flight::destroy(1, 2, 3);

App\Flight::destroy([1, 2, 3]);

App\Flight::destroy(collect([1, 2, 3]));
</code></pre>

  <h4>Eliminando modelos por consultas</h4>
  <p>También puedes ejecutar una instrucción de eliminar en un conjunto de modelos. En este ejemplo, eliminaremos todos los vuelos que están marcados como inactivos. Al igual que las actualizaciones masivas, las eliminaciones masivas no dispararán cualquiera de los eventos de modelo para los modelos que son eliminados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$deletedRows = App\Flight::where('active', 0)-&gt;delete();
</code></pre>

  <p>Nota</p>
  <p>Al momento de ejecutar una instrucción de eliminación masiva por medio de Eloquent, los eventos de modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleting</span> and <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted</span> no serán ejecutados para los modelos eliminados. Esto es debido a que los modelos nunca son obtenidos realmente al momento de ejecutar la instrucción de eliminación.</p>

  <h3>Eliminación lógica (Soft Deleting)</h3>
  <p>Además de eliminar realmente los registros de tu base de datos, Eloquent también puede "eliminar lógicamente" los modelos. Cuando los modelos son borrados lógicamente, no son removidos realmente de tu base de datos. En lugar de eso, un atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted_at</span> es establecido en el modelo e insertado en la base de datos. Si un modelo tiene un valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted_at</span> no nulo, el modelo ha sido eliminado lógicamente. Para habilitar eliminaciones lógicas en un modelo, usa el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\SoftDeletes</span> en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Flight extends Model
{
    use SoftDeletes;
}
</code></pre>

  <p>TIP</p>
  <p>El trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SoftDeletes</span> convertirá (cast) automáticamente el atributo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted_at</span> a una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DateTime</span> / <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Carbon</span> para ti.
  </p>

  <p>Debes añadir la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted_at</span> a tu tabla de base de datos. El constructor de esquemas de Laravel contiene un método helper para crear esta columna:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('flights', function (Blueprint \$table) {
    \$table-&gt;softDeletes();
});
</code></pre>

  <p>Ahora, cuando ejecutes el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> en el modelo, la columna
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted_at</span> será establecida con la fecha y hora actual. Y, al momento de consultar un modelo que use eliminaciones lógicas, los modelos eliminados lógicamente serán excluidos automáticamente de todos los resultados de consultas.</p>
  <p>Para determinar si una instancia de modelo ha sido eliminada lógicamente, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trashed</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$flight-&gt;trashed()) {
    //
}
</code></pre>

  <h3>Consultando Modelos Eliminados Lógicamente</h3>
  <h4>Incluyendo modelos eliminados lógicamente</h4>
  <p>Como se apreció anteriormente, los modelos eliminados lógicamente serán excluidos automáticamente de los resultados de las consultas. Sin embargo, puedes forzar que los modelos eliminados lógicamente aparezcan en un conjunto resultante usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withTrashed</span> en la consulta:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flights = App\Flight::withTrashed()
                -&gt;where('account_id', 1)
                -&gt;get();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withTrashed</span> también puede ser usado en una consulta de relación de Eloquent:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight-&gt;history()-&gt;withTrashed()-&gt;get();
</code></pre>

  <h4>Obteniedo modelos individuales eliminados lógicamente</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onlyTrashed</span> obtendrá <strong>solamente</strong> modelos eliminados lógicamente:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flights = App\Flight::onlyTrashed()
                -&gt;where('airline_id', 1)
                -&gt;get();
</code></pre>

  <h4>Restaurando modelos eliminados lógicamente</h4>
  <p>Algunas veces puedes desear "deshacer la eliminación" de un modelo eliminado lógicamente. Para restaurar un modelo eliminado lógicamente a un estado activo, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">restore</span> en una instancia de modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight-&gt;restore();
</code></pre>

  <p>También puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">restore</span> en una consulta para restaurar rápidamente varios modelos. Otra vez, al igual que otras operaciones "masivas", esto no disparará cualquiera de los eventos de modelo para los modelos que sean restaurados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>App\Flight::withTrashed()
        -&gt;where('airline_id', 1)
        -&gt;restore();
</code></pre>

  <p>Al igual que con el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withTrashed</span>, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">restore</span> también puede ser usado en relaciones de Eloquent:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$flight-&gt;history()-&gt;restore();
</code></pre>

  <h4>Eliminando modelos permanentemente</h4>
  <p>Algunas veces puedes necesitar eliminar verdaderamente un modelo de tu base de datos. Para remover permanentemente un modelo eliminado lógicamente de la base de datos, usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forceDelete</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Obliga la eliminación de una instancia de un solo modelo...
\$flight-&gt;forceDelete();

// Obliga la eliminación de todos los modelos relacionados...
\$flight-&gt;history()-&gt;forceDelete();
</code></pre>

  <h2>Alcances (Scopes) de consultas</h2>

  <h3>Alcances (scopes) globales</h3>
  <p>Los alcances globales permiten que añadas restricciones a todas las consultas para un modelo dado. La propia funcionalidad de la eliminación lógica de Laravel utiliza alcances globales para extraer solamente los modelos "no-eliminados" de la base de datos. Escribiendo tus propios alcances globales puede proporcionarte una forma conveniente y fácil de asegurar que cada consulta para un modelo dado reciba ciertas restricciones.</p>
  <h4>Escribiendo scopes globales</h4>
  <p>Escribir un alcance global es simple. Define una clase que implemente la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\Scope</span>. Esta interfaz requiere que implementes un método: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">apply</span>. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">apply</span> puede añadir restricciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> a la consulta como sea necesario:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Scopes;

use Illuminate\Database\Eloquent\Scope;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class AgeScope implements Scope
{
    /**
    * Apply the scope to a given Eloquent query builder.
    *
    * @param  \Illuminate\Database\Eloquent\Builder  \$builder
    * @param  \Illuminate\Database\Eloquent\Model  \$model
    * @return void
    */
    public function apply(Builder \$builder, Model \$model)
    {
        \$builder-&gt;where('age', '&gt;', 200);
    }
}
</code></pre>

  <p>TIP</p>
  <p>Si tu scope global está agregando columnas a la cláusula select de la consulta, deberías usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">addSelect</span> en lugar de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>. Esto evitará el reemplazo no intencional de la cláusula select existente de la consulta.</p>

  <h4>Aplicando scopes globales</h4>
  <p>Para asignar un scope global a un modelo, debes sobrescribir el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> del modelo dado y usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">addGlobalScope</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use App\Scopes\AgeScope;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * The "booting" method of the model.
    *
    * @return void
    */
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope(new AgeScope);
    }
}
</code></pre>

  <p>Después de agregar el scope, una consulta a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User::all()</span> producirá el siguiente código SQL:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>select * from `users` where `age` &gt; 200
</code></pre>

  <h4>Alcances globales anónimos</h4>
  <p>Eloquent también permite que definas scopes globales usando Closures, lo cual es particularmente útil para scopes simples que no se crean en una clase separada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;

class User extends Model
{
    /**
    * The "booting" method of the model.
    *
    * @return void
    */
    protected static function boot()
    {
        parent::boot();

        static::addGlobalScope('age', function (Builder \$builder) {
            \$builder-&gt;where('age', '&gt;', 200);
        });
    }
}
</code></pre>

  <h4>Eliminar scopes globales</h4>
  <p>Si prefieres remover un scope global para una consulta dada, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withoutGlobalScope</span>. El método acepta el nombre de clase del scope global como su único argumento:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>User::withoutGlobalScope(AgeScope::class)-&gt;get();
</code></pre>

  <p>O, si definiste el scope global usando un Closure:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>User::withoutGlobalScope('age')-&gt;get();
</code></pre>

  <p>Si prefieres eliminar varios o incluso todos los scopes globales, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withoutGlobalScopes</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Elimina todos los scopes globales...
User::withoutGlobalScopes()-&gt;get();

// Elimina algunos de los scopes globales...
User::withoutGlobalScopes([
    FirstScope::class, SecondScope::class
])-&gt;get();
</code></pre>

  <h3>Alcances (scopes) locales</h3>
  <p>Los scopes locales permiten que definas conjuntos de restricciones comunes que puedes reusar fácilmente a traves de tu aplicación. Por ejemplo, puedes necesitar obtener frecuentemente todos los usuarios que son considerados "populares". Para definir un scope, agrega el prefijo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">scope</span> a un método de modelo de Eloquent.</p>
  <p>Los scopes deberían devolver siempre una instancia del constructor de consultas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * Scope a query to only include popular users.
    *
    * @param  \Illuminate\Database\Eloquent\Builder  \$query
    * @return \Illuminate\Database\Eloquent\Builder
    */
    public function scopePopular(\$query)
    {
        return \$query-&gt;where('votes', '&gt;', 100);
    }

    /**
    * Scope a query to only include active users.
    *
    * @param  \Illuminate\Database\Eloquent\Builder  \$query
    * @return \Illuminate\Database\Eloquent\Builder
    */
    public function scopeActive(\$query)
    {
        return \$query-&gt;where('active', 1);
    }
}
</code></pre>

  <h4>Utilizando un scope local</h4>
  <p>Una vez que el scope ha sido definido, puedes ejecutar los métodos de scope al momento de consultar el modelo. Sin embargo, no debes incluir el prefijo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">scope</span> cuando ejecutas el método. Incluso puedes encadenar las ejecuciones a varios scopes, por ejemplo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = App\User::popular()-&gt;active()-&gt;orderBy('created_at')-&gt;get();
</code></pre>

  <p>La combinación de múltiples scopes de modelo Eloquent a través de un operador de consulta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">or</span> puede requerir el uso de funciones de retorno Closure como:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = App\User::popular()-&gt;orWhere(function (Builder \$query) {
    \$query-&gt;active();
})-&gt;get();
</code></pre>

  <p>Sin embargo, dado que esto puede ser engorroso, Laravel proporciona un método de "orden superior"
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhere</span> que te permite encadenar estos scopes con fluidez sin el uso de Closure:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = App\User::popular()-&gt;orWhere-&gt;active()-&gt;get();
</code></pre>

  <h4>Scopes dinámicos</h4>
  <p>Algunas veces, puedes desear definir un scope que acepte parámetros. Para empezar, sólo agrega tus parámetros adicionales a tu scope. Los parámetros de scope deben ser definidos después del parámetro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$query</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * Scope a query to only include users of a given type.
    *
    * @param  \Illuminate\Database\Eloquent\Builder  \$query
    * @param  mixed  \$type
    * @return \Illuminate\Database\Eloquent\Builder
    */
    public function scopeOfType(\$query, \$type)
    {
        return \$query-&gt;where('type', \$type);
    }
}
</code></pre>

  <p>Ahora, puedes pasar los parámetros cuando llamas al scope:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = App\User::ofType('admin')-&gt;get();
</code></pre>

  <h2>Comparando modelos</h2>
  <p>En ocasiones necesitarás determinar si dos modelos son "el mismo". El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">is</span> puede ser usado para verificar rápidamente dos modelos que comparten llave principal, tabla y conexión a base de datos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$post-&gt;is(\$anotherPost)) {
    //
}
</code></pre>

  <h2>Eventos</h2>
  <p>Los modelos de Eloquent ejecutan varios eventos, permitiendo que captes los siguientes puntos en un ciclo de vida del modelo: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retrieved</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">creating</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updating</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saving</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saved</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleting</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">restoring</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">restored</span>. Los eventos permiten que ejecutes fácilmente código cada vez que una clase de modelo específica es guardada o actualizada en la base de datos.</p>
  <p>El evento <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retrieved</span> se disparará cuando un modelo existente es obtenido de la base de datos. Cuando un nuevo modelo es guardado la primera vez, los eventos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">creating</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created</span> se disparan. Si un modelo ya existe en la base de datos y el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> es ejecutado, los eventos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updating</span> / <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated</span> se dispararán. Sin embargo, en ambos casos, los eventos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saving</span> / <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saved</span> se dispararán.</p>

  <p>Nota</p>
  <p>Al realizar una actualización masiva a través de Eloquent, los eventos de modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saved</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated</span> no se activarán para los modelos actualizados. Esto se debe a que los modelos nunca se recuperan cuando se emite una actualización masiva.</p>

  <p>Para empezar, define una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$dispatchesEvents</span> en tu modelo Eloquent que mapee varios puntos del ciclo de vida de modelo de Eloquent a tus propias clases de eventos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use App\Events\UserSaved;
use App\Events\UserDeleted;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
    * The event map for the model.
    *
    * @var array
    */
    protected \$dispatchesEvents = [
        'saved' =&gt; UserSaved::class,
        'deleted' =&gt; UserDeleted::class,
    ];
}
</code></pre>

  <p>
    Después de definir y mapear tus eventos Eloquent, puedes usar listeners de eventos para manejar los eventos.
  </p>

  <h3>Observadores</h3>
  <h4>Definiendo observadores</h4>
  <p>Si estás escuchando muchos eventos en un modelo dado, puedes usar observadores para agrupar todos tus listeners dentro de una sola clase. Las clases observadoras tienen nombres de métodos que reflejan los eventos de Eloquent que deseas escuchar. Cada uno de estos métodos reciben el modelo como su único argumento. El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:observer</span> Artisan es la forma más sencilla de crear una nueva clase de observador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:observer UserObserver --model=User
</code></pre>

  <p>Este comando colocará el nuevo observador en tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App/Observers</span>. Si este directorio no existe, Artisan lo creará por ti. Tu nuevo observador lucirá como lo siguiente:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Observers;

use App\User;

class UserObserver
{
    /**
    * Handle the User "created" event.
    *
    * @param  \App\User  \$user
    * @return void
    */
    public function created(User \$user)
    {
        //
    }

    /**
    * Handle the User "updated" event.
    *
    * @param  \App\User  \$user
    * @return void
    */
    public function updated(User \$user)
    {
        //
    }

    /**
    * Handle the User "deleted" event.
    *
    * @param  \App\User  \$user
    * @return void
    */
    public function deleted(User \$user)
    {
        //
    }
}
</code></pre>

  <p>Para registrar un observador, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">observe</span> en el modelo que deseas observar. Puedes registrar los observadores en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de uno de tus proveedores de servicio. En este ejemplo, registraremos el observador en el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Providers;

use App\User;
use App\Observers\UserObserver;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Register any application services.
    *
    * @return void
    */
    public function register()
    {
        //
    }

    /**
    * Bootstrap any application services.
    *
    * @return void
    */
    public function boot()
    {
        User::observe(UserObserver::class);
    }
}
</code></pre>
</div>
""";