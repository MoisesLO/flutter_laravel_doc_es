import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class OrSerializacion extends StatelessWidget {
  final String title;
  OrSerializacion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmOrSerializacion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmOrSerializacion = """
<!-- Eloquent: Serialización -->
<div style='font-size: 14.2px;'>
  <h1>Eloquent: Serialización</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Serializando modelos y colecciones
      <ul>
        <li>Serializando a arreglos</li>
        <li>Serializando a JSON</li>
      </ul>
    </li>
    <li>Ocultando atributos de JSON</li>
    <li>Añadiendo valores a JSON</li>
    <li>Serialización de fechas</li>
  </ul>

  <h2>Introducción</h2>
  <p>Al momento de construir APIs JSON, con frecuencia necesitas convertir tus modelos y relaciones a arreglos o JSON. Eloquent incluye métodos convenientes para hacer estas conversiones, también como controlar cuáles atributos están incluidos en tus serializaciones.</p>

  <h2>Serializando modelos y colecciones</h2>

  <h3>Serializando a arreglos</h3>
  <p>
    Para convertir un modelo y sus relaciones cargadas a un arreglo, debes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span>. Este método es recursivo, ya que todos los atributos y todas las relaciones (incluyendo las relaciones de relaciones) serán convertidas a arreglos:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::with('roles')-&gt;first();

return \$user-&gt;toArray();
</code></pre>

  <p>Para convertir solo los atributos de un modelo a un arreglo, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attributedToArray</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::first();

return \$user-&gt;attributesToArray();
</code></pre>

  <p>
    También puedes convertir colecciones completas de modelos en arreglos:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = App\User::all();

return \$users-&gt;toArray();
</code></pre>

  <h3>Serializando a JSON</h3>
  <p>
    Para convertir un modelo a JSON, deberías usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toJson</span>. Igual que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span>, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toJson</span> es recursivo, así todos los atributos y relaciones serán convertidas a JSON. También puedes especificar las opciones de codificación JSON soportadas por PHP
    <outboundlink></outboundlink>
    :
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

return \$user-&gt;toJson();

return \$user-&gt;toJson(JSON_PRETTY_PRINT);
</code></pre>

  <p>Alternativamente, puedes convertir un modelo o colección en una cadena, la cual ejecutará automáticamente el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toJson</span> sobre el modelo o colección:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

return (string) \$user;
</code></pre>

  <p>Debido a que los modelos y colecciones son convertidos a JSON al momento de conversión a una cadena, puedes devolver objetos de Eloquent directamente desde las rutas o controladores de tu aplicación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::get('users', function () {
    return App\User::all();
});
</code></pre>

  <h4>Relaciones</h4>
  <p>Cuando un modelo de Eloquent es convertido a JSON, las relaciones que sean cargadas serán incluidas automáticamente como atributos en el objeto JSON. Además, aunque los métodos de relación de Eloquent sean definidos usando "camel case", un atributo JSON de la relación en su lugar se verá como "snake case".</p>

  <h2>Ocultando Atributos de JSON</h2>
  <p>Algunas veces puedes querer limitar los atributos, tales como contraseñas, que están incluidos en la representación de arreglo o JSON de tu modelo. Para hacer eso, agrega una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$hidden</span> en tu modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * The attributes that should be hidden for arrays.
    *
    * @var array
    */
    protected \$hidden = ['password'];
}
</code></pre>

  <p>Nota</p>
  <p>Al momento de ocultar relaciones, usa el nombre de método de la relación.</p>

  <p>Alternativamente, puedes usar la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">visible</span> para definir una lista blanca de atributos que deberían ser incluidos en la representación de arreglo y JSON de tu modelo. Todos los demás atributos estarán ocultos cuando el modelo sea convertido a un arreglo o JSON:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * The attributes that should be visible in arrays.
    *
    * @var array
    */
    protected \$visible = ['first_name', 'last_name'];
}
</code></pre>

  <h4>Modificando la visibilidad de atributos temporalmente</h4>
  <p>Si prefieres hacer visible algunos atributos típicamente ocultos en una instancia de modelo dado, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeVisible</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeVisible</span> devuelve la instancia de modelo para encadenar métodos de forma conveniente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$user-&gt;makeVisible('attribute')-&gt;toArray();
</code></pre>

  <p>De igual manera, si prefieres ocultar algunos atributos típicamente visibles en una instancia de modelo dado, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeHidden</span>.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$user-&gt;makeHidden('attribute')-&gt;toArray();
</code></pre>

  <h2>Añadiendo Valores a JSON</h2>
  <p>Ocasionalmente, al momento de convertir modelos a un arreglo o JSON, puedes querer agregar atributos que no tienen una columna correspondiente en tu base de datos. Para hacer eso, primero define un accesador para el valor:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * Get the administrator flag for the user.
    *
    * @return bool
    */
    public function getIsAdminAttribute()
    {
        return \$this-&gt;attributes['admin'] == 'yes';
    }
}
</code></pre>

  <p>Después de crear el accesador, agrega el nombre del atributo a la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">appends</span> en el modelo. Nota que los nombres de atributo son referenciados típicamente en "snake_case", aun cuando el accesador sea definido usando "camel case":</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * The accessors to append to the model's array form.
    *
    * @var array
    */
    protected \$appends = ['is_admin'];
}
</code></pre>

  <p>Una vez que el atributo ha sido agregado a la lista <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">appends</span>, será incluido en ambas representaciones de arreglo y JSON del modelo. Los atributos en el arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">appends</span> también respetarán las configuraciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">visible</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hidden</span> configuradas en el modelo.</p>
  <h4>Añadiendo en tiempo de ejecución</h4>
  <p>Puedes indicar una única instancia de modelo que agregue atributos utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">append</span>. También usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">setAppends</span> para sobrescribir el arreglo completo de propiedades adjuntadas para una instancia de un modelo dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$user-&gt;append('is_admin')-&gt;toArray();

return \$user-&gt;setAppends(['is_admin'])-&gt;toArray();
</code></pre>

  <h2>Serialización de Fecha</h2>
  <h4>Personalizar el formato de la fecha por atributo</h4>
  <p>Puedes personalizar el formato de serialización de atributos de fecha de Eloquent individuales especificando el formato de la fecha en la declaración de la conversión:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>protected \$casts = [
    'birthday' =&gt; 'date:Y-m-d',
    'joined_at' =&gt; 'datetime:Y-m-d H:00',
];
</code></pre>

  <h4>Personalización global mediante carbon</h4>
  <p>
    Laravel extiende la biblioteca de fechas Carbon con el propósito de proporcionar la personalización conveniente del formato de serialización de Carbon. Para personalizar la forma en que todas las fechas Carbon a través de tu aplicación sean serializadas, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Carbon::serializeUsing</span>. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">serializeUsing</span> acepta una Closure la cual devuelve una representación en forma de cadena de la fecha para la serialización JSON:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Carbon;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Perform post-registration booting of services.
    *
    * @return void
    */
    public function boot()
    {
        Carbon::serializeUsing(function (\$carbon) {
            return \$carbon-&gt;format('U');
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
</div>
""";