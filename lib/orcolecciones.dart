import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class OrColecciones extends StatelessWidget {
  final String title;
  OrColecciones(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmOrColecciones,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmOrColecciones = """
<!-- Eloquent: Colecciones -->
<div style='font-size: 14.2px;'>
  <h1>Eloquent: Colecciones</h1>
  <ul>
    <li>Introducción</li>
    <li>Métodos disponibles</li>
    <li>Colecciones personalizadas</li>
  </ul>

  <h2>Introducción</h2>
  <p>
    Todos los conjuntos de multi-resultados retornados por Eloquent son instancias del objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\Collection</span>, incluyendo los resultados obtenidos por medio del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> o accedidos por medio de una relación. El objeto de la colección Eloquent extiende la collección base de Laravel, así hereda naturalmente docenas de métodos usados para trabajar fluidamente con el arreglo subyacente de modelos de Eloquent.
  </p>
  <p>Todas las colecciones tambien sirven como iteradores, permitiendo que iteres sobre ellas como si fueran simples arreglos de PHP:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = App\User::where('active', 1)-&gt;get();

foreach (\$users as \$user) {
    echo \$user-&gt;name;
}
</code></pre>

  <p>Sin embargo, las colecciones son mucho más poderosas que los arreglos y exponen una variedad de mapeos / reduce operaciones que pueden ser encadenadas usando una interfaz intuitiva. Por ejemplo, vamos a remover todos los modelos inactivos y traeremos el primer nombre para cada usuario restante:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = App\User::all();

\$names = \$users-&gt;reject(function (\$user) {
    return \$user-&gt;active === false;
})
-&gt;map(function (\$user) {
    return \$user-&gt;name;
});
</code></pre>

  <p>Nota</p>
  <p>
    Mientras los métodos de colección de Eloquent devuelven una nueva instancia de una colección de Eloquent, los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pluck</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">keys</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">zip</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collapse</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flatten</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flip</span> devuelven una instancia de colección base . De igual forma, si una operación devuelve una colección que no contiene modelos Eloquent, será automáticamente convertida a una colección base.
  </p>

  <h2>Métodos Disponibles</h2>
  <h3>La colección base</h3>
  <p>Todas las colecciones de Eloquent extienden el objeto de colección de Laravel base; sin embargo, heredan todos los métodos poderosos proporcionados por la clase de colección base:</p>
  <p>Adicionalmente, la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\Collection</span> proporciona una serie de métodos para ayudarte a administrar tus colecciones de modelos. La mayoría de los métodos retornan instancias de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\Collection</span>; sin embargo, algunos métodos retornan una instancia base <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Collection</span>.
  </p>
  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains(\$key, \$operator = null, \$value = null)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains</span> puede ser usado para determinar si una instancia de modelo dada es contenida por la colección. Este método acepta una clave primaria o una instancia de modelo:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users-&gt;contains(1);

\$users-&gt;contains(User::find(1));
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">diff(\$items)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">diff</span> retorna todos los modelos que no están presentes en la colección dada:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;

\$users = \$users-&gt;diff(User::whereIn('id', [1, 2, 3])-&gt;get());
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">except(\$keys)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">except</span> retorna todos los modelos que no tienen las claves primarias dadas:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = \$users-&gt;except([1, 2, 3]);
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">find(\$key)</span> {#collection-method .first-collection-method}</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">find</span> encuentra un modelo que tienen una clave primaria dada. Si
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$key</span> es una instancia de modelo, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">find</span> intentará retornar un modelo que coincida con la clave primaria. Si <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$key</span> es un arreglo de claves, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">find</span> retornará todos los modelos que coincidan con las <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$keys</span> usando
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereIn()</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = User::all();

\$user = \$users-&gt;find(1);
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fresh(\$with = [])</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fresh</span> retorna una instancia nueva de cada modelo en la colección desde la base de datos. Adicionalmente, cualquier relación especificada será cargada por adelantado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = \$users-&gt;fresh();

\$users = \$users-&gt;fresh('comments');
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">intersect(\$items)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">intersect</span> retorna todos los modelos que también están presentes en la colección dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;

\$users = \$users-&gt;intersect(User::whereIn('id', [1, 2, 3])-&gt;get());
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">load(\$relations)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">load</span> carga por adelantado las relaciones dadas para todos los modelos en la colección:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users-&gt;load('comments', 'posts');

\$users-&gt;load('comments.author');
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadMissing(\$relations)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadMissing</span> carga por adelantado las relaciones dadas para todos los modelos en la colección si las relaciones aún no han sido cargadas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users-&gt;loadMissing('comments', 'posts');

\$users-&gt;loadMissing('comments.author');
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">modelKeys()</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">modelKeys</span> retorna las claves primarias para todos los modelos en la colección:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users-&gt;modelKeys();

// [1, 2, 3, 4, 5]
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeVisible(\$attributes)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeVisible</span> hace visibles los atributos que normalmente están "ocultados" en cada modelo de la colección:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = \$users-&gt;makeVisible(['address', 'phone_number']);
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeHidden(\$attributes)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeHidden</span> oculta los atributos que normalmente están "visibles" en cada modelo de la colección:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = \$users-&gt;makeHidden(['address', 'phone_number']);
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">only(\$keys)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">only</span> retorna todos los modelos que tienen las claves primarias dadas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = \$users-&gt;only([1, 2, 3]);
</code></pre>

  <h4><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique(\$key = null, \$strict = false)</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span> retorna todos los modelos únicos en la colección. Cualquier modelo del mismo tipo con las mismas claves primarias que otro modelo en la colección es removido.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = \$users-&gt;unique();
</code></pre>

  <h2>Colecciones personalizadas</h2>
  <p>Si necesitas usar un objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> personalizado con tus propios métodos de extensión, puedes sobrescribir el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">newCollection</span> en tu modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use App\CustomCollection;
use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
        * Create a new Eloquent Collection instance.
        *
        * @param  array  \$models
        * @return \Illuminate\Database\Eloquent\Collection
        */
    public function newCollection(array \$models = [])
    {
        return new CustomCollection(\$models);
    }
}
</code></pre>

  <p>Una vez que has definido un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">newCollection</span>, recibirás una instancia de tu colección personalizada cada vez que Eloquent devuelva una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> de ese modelo. Si prefieres usar una colección personalizada para cada modelo en tu aplicación, deberías sobrescribir el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">newCollection</span> en una clase del modelo base que es extendida por todos tus modelos.</p>
</div>
""";