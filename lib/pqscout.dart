import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PqScout extends StatelessWidget {
  final String title;
  PqScout(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPaScout,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPaScout = """
<!-- Scout para Laravel -->
<div style='font-size: 14.2px;'>
  <h1>Scout para Laravel</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Instalación
      <ul>
        <li>Colas</li>
        <li>Requisitos previos del driver</li>
      </ul>
    </li>
    <li>
      Configuración
      <ul>
        <li>Configurando indices de modelo</li>
        <li>Configurando datos de búsqueda</li>
        <li>Configurando el ID de modelo</li>
      </ul>
    </li>
    <li>
      Indexando
      <ul>
        <li>Importación en lote (batch)</li>
        <li>Agregando registros</li>
        <li>Actualizando registros</li>
        <li>Eliminando registros</li>
        <li>Pausando indexamiento</li>
        <li>Instancias de modelos searchable condicionales</li>
      </ul>
    </li>
    <li>
      Búsqueda
      <ul>
        <li>Cláusulas where</li>
        <li>Paginación</li>
        <li>Eliminación lógica</li>
        <li>Personalizando motores de búsqueda</li>
      </ul>
    </li>
    <li>Motores personalizados</li>
    <li>Macros de constructor (builder)</li>
  </ul>

  <h2>Introducción</h2>
  <p>
    Laravel Scout proporciona una sencilla solución para agregar búsquedas de texto completo a tus modelos Eloquent . Usando observadores de modelo, Scout mantendrá automáticamente tus índices de búsqueda sincronizados con tus registros de Eloquent.
  </p>
  <p>
    Actualmente, Scout viene con el controlador (driver) Algolia
    <outboundlink></outboundlink>
    ; sin embargo, la escritura de controladores personalizados es simple y eres libre de extender Scout con tus propias implementaciones de búsqueda.
  </p>

  <h2>Instalación</h2>
  <p>Primero, instala Scout por medio del paquete administrador de Composer:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require laravel/scout
</code></pre>

  <p>Después de instalar Scout, debes publicar la configuración de Scout usando el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span>. Este comando publicará el archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">scout.php</span> en tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan vendor:publish --provider="Laravel\Scout\ScoutServiceProvider"
</code></pre>

  <p>Finalmente, agrega el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Laravel\Scout\Searchable</span> al modelo en el que te gustaría hacer búsquedas. Este trait registrará un observador de modelo para mantener sincronizado con tu controlador de búsqueda:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Laravel\Scout\Searchable;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use Searchable;
}
</code></pre>

  <h3>Colas</h3>
  <p>
    Aunque no es estrictamente necesario para usar Scout, deberías considerar fuertemente configurar un controlador de cola antes de usar el paquete. La ejecución de un trabajador (worker) de cola permitirá a Scout poner en cola todas las operaciones que sincronizan la información de tu modelo con tus índices de búsqueda, proporcionando mejores tiempos de respuesta para la interfaz web de tu aplicación.
  </p>
  <p>Una vez que hayas configurado tu controlador de cola, establece el valor de la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/scout.php</span> a
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'queue' =&gt; true,
</code></pre>

  <h3>Requisitos previos del driver</h3>
  <h4>Algolia</h4>
  <p>Al usar el controlador Algolia, debes configurar tus credenciales <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secret</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/scout.php</span>. Una vez que tus credenciales han sido configuradas, también necesitarás instalar Algolia PHP SDK por medio del gestor de paquetes Composer:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require algolia/algoliasearch-client-php:^2.2
</code></pre>

  <h2>Configuración</h2>

  <h3>Configurando indices de modelo</h3>
  <p>Cada modelo Eloquent es sincronizado con un "índice" de búsqueda dado, el cual contiene todos los registros que pueden ser encontrados para ese modelo. En otras palabras, puedes pensar en cada índice como una tabla MySQL. De forma predeterminada, cada modelo será persistido en un índice que coincida con el típico nombre de la "tabla" del modelo. Típicamente, esta es la forma plural del nombre del modelo; sin embargo, eres libre de personalizar el índice del modelo sobrescribiendo el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">searchableAs</span> en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Laravel\Scout\Searchable;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use Searchable;

    /**
    * Get the index name for the model.
    *
    * @return string
    */
    public function searchableAs()
    {
        return 'posts_index';
    }
}
</code></pre>

  <h3>Configuración de datos de búsqueda</h3>
  <p>De forma predeterminada, la forma <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span> completa de un modelo dado será persistida en su índice de búsqueda. Si prefieres personalizar los datos que son sincronizados en el índice de búsqueda, puedes sobrescribir el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toSearchableArray</span> en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Laravel\Scout\Searchable;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    use Searchable;

    /**
    * Get the indexable data array for the model.
    *
    * @return array
    */
    public function toSearchableArray()
    {
        \$array = \$this-&gt;toArray();

        // Customize array...

        return \$array;
    }
}
</code></pre>

  <h3>Configurando el ID del modelo</h3>
  <p>Por defecto, Scout usará la clave primaria del modelo como su ID única, almacenada en el índice de búsqueda. Si necesitas personalizar este comportamiento, se puede sobrescribir el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getScoutKey</span> en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Laravel\Scout\Searchable;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    use Searchable;

    /**
    * Get the value used to index the model.
    *
    * @return mixed
    */
    public function getScoutKey()
    {
        return \$this-&gt;email;
    }
}
</code></pre>

  <h2>Indexando</h2>

  <h3>Importación en lote (batch)</h3>
  <p>Si estás instalando Scout en un proyecto existente, puede que ya tengas registros de base de datos que necesites importar dentro de tu manejador de búsqueda. Scout proporciona un comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">import</span> que puedes usar para importar todos tus registros existentes a tus índices de búsqueda:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan scout:import "App\Post"
</code></pre>

  <p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flush</span> puede ser usado para eliminar todos los registros de un modelo de los indicies de busqueda:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan scout:flush "App\Post"
</code></pre>

  <h3>Agregando registros</h3>
  <p>Una vez que has agregado el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Laravel\Scout\Searchable</span> a tu modelo, todo lo que necesitas hacer es llamar a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> en una instancia de modelo y será agregada automáticamente a tu índice de búsqueda. Si has configurado Scout para usar colas esta operación será ejecutada en segundo plano por tu worker de cola:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$order = new App\Order;

// ...

\$order-&gt;save();
</code></pre>

  <h4>Agregando por medio de consulta</h4>
  <p>
    Si prefieres agregar una colección de modelos a tu índice de búsqueda por medio de una consulta Eloquent, puedes encadenar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">searchable</span> con una consulta Eloquent. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">searchable</span> dividirá (chunk) los resultados de la consulta y agregará los registros a tu índice de búsqueda. Otra vez, si has configurado Scout para usar colas, todos estas porciones serán agregadas en segundo plano por tus workers de cola:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Agregando Por Medio de consulta Eloquent...
App\Order::where('price', '&gt;', 100)-&gt;searchable();

// Puedes también agregar registros a través de relaciones...
\$user-&gt;orders()-&gt;searchable();

// Puedes también agregar registros a través de colecciones...
\$orders-&gt;searchable();
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">searchable</span> puede ser considerado una operación "upsert". En otras palabras, si el registro del modelo ya está en tu índice, será actualizado. Si no existe en el índice de búsqueda, será agregado al índice.</p>

  <h3>Actualizando registros</h3>
  <p>Para actualizar un modelo searchable, sólo necesitas actualizar las propiedades de la instancia del modelo y llamar a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> en el modelo en tu base de datos. Scout persistirá automáticamente los cambios en tu índice de búsqueda:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$order = App\Order::find(1);

// Update the order...

\$order-&gt;save();
</code></pre>

  <p>También puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">searchable</span> en una consulta Eloquent para actualizar una colección de modelos. Si los modelos no existen en tu índice de búsqueda, serán creados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Actualizando a través de consulta de Eloquent...
App\Order::where('price', '&gt;', 100)-&gt;searchable();

// Puedes actualizar por medio de relaciones...
\$user-&gt;orders()-&gt;searchable();

// También puedes actualizar a través de colecciones...
\$orders-&gt;searchable();
</code></pre>

  <h3>Eliminando registros</h3>
  <p>
    Para eliminar un registro de tu índice, llama a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> en el modelo de la base de datos. Esta forma de eliminar es también compatible con los modelos eliminados lógicamente :
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$order = App\Order::find(1);

\$order-&gt;delete();
</code></pre>

  <p>Si no quieres obtener el modelo antes de eliminar el registro, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unsearchable</span> en una instancia de consulta de Eloquent o una colección:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Removing via Eloquent query...
App\Order::where('price', '&gt;', 100)-&gt;unsearchable();

// You may also remove via relationships...
\$user-&gt;orders()-&gt;unsearchable();

// You may also remove via collections...
\$orders-&gt;unsearchable();
</code></pre>

  <h3>Pausando el indexamiento</h3>
  <p>Algunas veces puedes necesitar ejecutar un lote de operaciones de Eloquent en un modelo sin sincronizar los datos del modelo con tu índice de búsqueda. Puedes hacer esto usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withoutSyncingToSearch</span>. Este método acepta una sola función de retorno la cual será ejecutada inmediatamente. Cualquiera de las operaciones de modelo que ocurran dentro de la función de retorno no serán sincronizadas con el índice del modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>App\Order::withoutSyncingToSearch(function () {
    // Perform model actions...
});
</code></pre>

  <h3>Instancias de modelos searchable condicionales</h3>
  <p>A veces es posible que solo tengas que hacer que un modelo searchable bajo ciertas condiciones. Por ejemplo, imagina que tienes el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Post</span> que puede estar en uno de dos estados: " borrador (draft)" y "publicado (published)". Es posible que solo desees permitir que las publicaciones "publicadas" puedan buscarse. Para lograr esto, puede definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shouldBeSearchable</span> en su modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>public function shouldBeSearchable()
{
    return \$this-&gt;isPublished();
}
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shouldBeSearchable</span> solo se aplica cuando se manipulan modelos a través del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span>, las consultas o las relaciones. Puedes hacer que los modelos o las colecciones se puedan buscar directamente utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">searchable</span> que sobrescribirá el resultado del método<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shouldBeSearchable</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Respetará "shouldBeSearchable"...
App\Order::where('price', '&gt;', 100)-&gt;searchable();

\$user-&gt;orders()-&gt;searchable();

\$order-&gt;save();

// Sobrescribirá "shouldBeSearchable"...
\$orders-&gt;searchable();

\$order-&gt;searchable();
</code></pre>

  <h2>Búsqueda</h2>
  <p>Puedes empezar a buscar un modelo usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">search</span>. Este método acepta una sola cadena que será usada para buscar tus modelos. Luego debes encadenar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> con la consulta de búsqueda para obtener los modelos Eloquent que coincidan con la consulta de búsqueda dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = App\Order::search('Star Trek')-&gt;get();
</code></pre>

  <p>Ya que las búsquedas de Scout devuelven una colección de modelos, incluso puedes devolver los resultados directamente desde una ruta o controlador y serán convertidos automáticamente a JSON:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Http\Request;

Route::get('/search', function (Request \$request) {
    return App\Order::search(\$request-&gt;search)-&gt;get();
});
</code></pre>

  <p>Si prefieres obtener los resultados crudos (raw) antes de que sean convertidos a modelos de Eloquent, deberías usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">raw</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = App\Order::search('Star Trek')-&gt;raw();
</code></pre>

  <p>Las consultas de búsqueda son ejecutadas típicamente en el índice especificado por el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">searchableAs</span> del modelo. Sin embargo, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">within</span> para especificar un índice personalizado que debería ser buscado en su lugar:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = App\Order::search('Star Trek')
    -&gt;within('tv_shows_popularity_desc')
    -&gt;get();
</code></pre>

  <h2>Cláusulas where</h2>
  <p>Scout permite que agregues cláusulas "where" sencillas a tus consultas de búsqueda. Actualmente, estas cláusulas solamente soportan verificaciones básicas de igualdad numérica y son útiles principalmente para establecer el alcance de las consultas de búsqueda por un ID. Ya que un índice de búsqueda no es una base de datos relacional, cláusulas "where" más avanzadas no están soportadas actualmente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = App\Order::search('Star Trek')-&gt;where('user_id', 1)-&gt;get();
</code></pre>

  <h3>Paginación</h3>
  <p>
    Además de obtener una colección de modelos, puedes paginar los resultados de tu búsqueda usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">paginate</span>. Este método devolverá una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Paginator</span> justo como si hubieras paginada una consulta Eloquent tradicional :
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = App\Order::search('Star Trek')-&gt;paginate();
</code></pre>

  <p>Puedes especificar cuántos modelos obtener por página al pasar la cantidad como primer argumento del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">paginate</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$orders = App\Order::search('Star Trek')-&gt;paginate(15);
</code></pre>

  <p>
    Una vez que has obtenido los resultados, puedes mostrar los resultados y renderizar los enlaces de página usando Blade justo como si hubieras paginado una consulta Eloquent tradicional:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;div class="container"&gt;
    @foreach (\$orders as \$order)
        {{ \$order-&gt;price }}
    @endforeach
&lt;/div&gt;

{{ \$orders-&gt;links() }}
</code></pre>

  <h3>Eliminación lógica</h3>
  <p>
    Si tus modelos indexados son de eliminación lógica y necesitas buscar tus modelos eliminados lógicamente, establece la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">soft_delete</span> del archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/scout.php</span> en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'soft_delete' =&gt; true,
</code></pre>

  <p>Cuando esta opción de configuración es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>, Scout no removerá del índice los modelos eliminados lógicamente. En su lugar, establecerá un atributo escondido <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__soft_deleted</span> en el registro indexado. Luego, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withTrashed</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onlyTrashed</span> para recuperar los registros eliminados lógicamente al realizar una búsqueda:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Include trashed records when retrieving results...
\$orders = App\Order::search('Star Trek')-&gt;withTrashed()-&gt;get();

// Only include trashed records when retrieving results...
\$orders = App\Order::search('Star Trek')-&gt;onlyTrashed()-&gt;get();
</code></pre>

  <p>TIP</p>
  <p>Cuando un modelo eliminado lógicamente es eliminado permanentemente utilizando
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forceDelete</span>, Scout lo removerá del índice de búsqueda automáticamente.</p>

  <h3>Personalizando motores de búsqueda</h3>
  <p>Si necesitas personalizar el comportamiento de un motor de búsqueda, puedes pasar una función de retorno (callback) como el segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">search</span>. Por ejemplo, podrías usar este callback para añadir datos de geolocalización a tus opciones de búsqueda antes de que la consulta de búsqueda sea pasada a Algolia:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Algolia\AlgoliaSearch\SearchIndex;

App\Order::search('Star Trek', function (SearchIndex \$algolia, string \$query, array \$options) {
    \$options['body']['query']['bool']['filter']['geo_distance'] = [
        'distance' =&gt; '1000km',
        'location' =&gt; ['lat' =&gt; 36, 'lon' =&gt; 111],
    ];

    return \$algolia-&gt;search(\$query, \$options);
})-&gt;get();
</code></pre>

  <h2>Motores personalizados</h2>
  <h4>Escribiendo el motor</h4>
  <p>Si ninguno de los motores de búsqueda integrados en Scout no se ajustan a tus necesidades, puedes escribir tu propio motor personalizado y registrarlo con Scout. Tu motor debería extender la clase abstracta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Laravel\Scout\Engines\Engine</span>. Esta clase abstracta contiene ocho métodos que tu motor de búsqueda personalizado debe implementar:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Laravel\Scout\Builder;

abstract public function update(\$models);
abstract public function delete(\$models);
abstract public function search(Builder \$builder);
abstract public function paginate(Builder \$builder, \$perPage, \$page);
abstract public function mapIds(\$results);
abstract public function map(\$results, \$model);
abstract public function getTotalCount(\$results);
abstract public function flush(\$model);
</code></pre>

  <p>Puedes encontrar útil revisar las implementaciones de estos métodos en la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Laravel\Scout\Engines\AlgoliaEngine</span>. Esta clase te proporcionará un buen punto de inicio para aprender cómo implementar cada uno de estos métodos en tu propio motor.</p>
  <h4>Registrando el motor</h4>
  <p>Una vez que hayas escrito tu motor personalizado, puedes registrarlo con Scout usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> del administrador de motor de Scout. Deberías ejecutar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span> o cualquier otro proveedor de servicio usado por tu aplicación. Por ejemplo, si has escrito un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MySqlSearchEngine</span>, puedes registrarlo como sigue:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Laravel\Scout\EngineManager;

/**
* Bootstrap any application services.
*
* @return void
*/
public function boot()
{
    resolve(EngineManager::class)-&gt;extend('mysql', function () {
        return new MySqlSearchEngine;
    });
}
</code></pre>

  <p>Una vez que tu motor ha sido registrado, puedes especificarlo como tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> predeterminado de Scout en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/scout.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'driver' =&gt; 'mysql',
</code></pre>

  <h2>Macros de constructor (builder)</h2>
  <p>Si deseas definir un método constructor personalizado, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">macro</span> en la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Laravel\Scout\Builder</span>. Típicamente, las "macros" deben ser definidas dentro de un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de un proveedor de servicios:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Providers;

use Laravel\Scout\Builder;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Response;

class ScoutMacroServiceProvider extends ServiceProvider
{
    /**
    * Register the application's scout macros.
    *
    * @return void
    */
    public function boot()
    {
        Builder::macro('count', function () {
            return \$this-&gt;engine-&gt;getTotalCount(
                \$this-&gt;engine()-&gt;search(\$this)
            );
        });
    }
}
</code></pre>

  <p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">macro</span> acepta un nombre como su primer argumento y un Closure como el segundo. El CLosure del macro será ejecutado al momento de llamar el nombre del macro desde una implementación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Laravel\Scout\Builder</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>App\Order::search('Star Trek')-&gt;count();
</code></pre>
</div>
""";