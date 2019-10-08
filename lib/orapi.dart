import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class OrApi extends StatelessWidget {
  final String title;
  OrApi(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmOrApi,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmOrApi = """
<!-- Eloquent: Recursos API -->
<div style='font-size: 14.2px;'>
  <h1>Eloquent: Recursos API</h1>
  <ul>
    <li>Introducción</li>
    <li>Generación de recursos</li>
    <li>
      Descripción general del concepto
      <ul>
        <li>Colecciones de recursos</li>
      </ul>
    </li>
    <li>
      Escritura de recursos
      <ul>
        <li>Envoltura de datos</li>
        <li>Paginación</li>
        <li>Atributos condicionales</li>
        <li>Relaciones condicionales</li>
        <li>Añadiendo metadatos</li>
      </ul>
    </li>
    <li>Respuestas de recursos</li>
  </ul>

  <h2>Introducción</h2>
  <p>Al crear una API, es posible que necesites una capa de transformación que se ubique entre tus modelos Eloquent y las respuestas JSON que realmente se devuelven a los usuarios de tu aplicación. Las clases de recursos de Laravel te permiten transformar tus modelos y colecciones de modelos de forma expresiva y sencilla en JSON.</p>

  <h2>Generación de recursos</h2>
  <p>Para generar un clase recurso, puedes usar el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:resource</span>. Por defecto, los recursos estará localizado en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Resources</span> de tu aplicación. Los Recursos extiende de la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Resources\Json\JsonResource</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:resource User
</code></pre>

  <h4>Colecciones de recurso</h4>
  <p>Además de generar recursos que transforman modelos individuales, puedes generar recursos que sean responsables de transformar colecciones de modelos. Esto permite que tu respuesta incluya enlaces y otra metainformación relevante para una colección completa de un recurso determinado.
  </p>
  <p>Para crear una colección de recursos, debes utilizar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--collection</span> al crear el recurso. O, incluir la palabra <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Colección</span> en el nombre del recurso que le indicará a Laravel que debe crear un recurso de colección. Los recursos de colección extienden la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Resources\Json\ResourceCollection</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:resource Users --collection

php artisan make:resource UserCollection
</code></pre>

  <h2>Descripción general del concepto</h2>

  <p>TIP</p>
  <p>Esta es una explicación general de recursos y colecciones de recursos. Te recomendamos que leas las otras secciones de esta documentación para obtener una comprensión más profunda de la personalización y el poder que te ofrecen los recursos.</p>

  <p>Antes de sumergirse en todas las opciones disponibles para escribir recursos, primero analicemos cómo se utilizan los recursos dentro de Laravel. Una clase de recurso representa un modelo único que debe transformarse en una estructura JSON. Por ejemplo, aquí hay una clase de recurso <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> simple:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class User extends JsonResource
{
    /**
    * Transform the resource into an array.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function toArray(\$request)
    {
        return [
            'id' =&gt; \$this-&gt;id,
            'name' =&gt; \$this-&gt;name,
            'email' =&gt; \$this-&gt;email,
            'created_at' =&gt; \$this-&gt;created_at,
            'updated_at' =&gt; \$this-&gt;updated_at,
        ];
    }
}
</code></pre>

  <p>Cada clase de recurso define un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span> que devuelve el arreglo de atributos que deben convertirse a JSON al enviar la respuesta. Observa que podemos acceder a las propiedades del modelo directamente desde la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this</span>. Esto es porque la clase del recurso va a redirigir de manera automática el acceso de propiedades y métodos al modelo asignado. Una vez que se define el recurso, se puede devolver desde una ruta o controlador:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\User as UserResource;

Route::get('/user', function () {
    return new UserResource(User::find(1));
});
</code></pre>

  <h3>Colecciones de recurso</h3>
  <p>Si estás devolviendo una colección de recursos o una respuesta paginada, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collection</span> al crear la instancia de recursos en tu ruta o controlador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\User as UserResource;

Route::get('/user', function () {
    return UserResource::collection(User::all());
});
</code></pre>

  <p>Observa que esto no permite ninguna adición de metadatos que pueden necesitar ser retornados con la colección. Si deseas personalizar la respuesta de la colección de recursos, puedes crear un recurso dedicado para representar la colección:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:resource UserCollection
</code></pre>

  <p>Una vez que se ha generado la clase de colección de recursos, puedes definir fácilmente los metadatos que deben incluirse con la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class UserCollection extends ResourceCollection
{
    /**
    * Transform the resource collection into an array.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function toArray(\$request)
    {
        return [
            'data' =&gt; \$this-&gt;collection,
            'links' =&gt; [
                'self' =&gt; 'link-value',
            ],
        ];
    }
}
</code></pre>

  <p>Después de definir tu colección de recursos, ésta la puedes devolver desde una ruta o controlador:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\UserCollection;

Route::get('/users', function () {
    return new UserCollection(User::all());
});
</code></pre>

  <h4>Preservando la colección de llaves</h4>
  <p>Cuando se retorna un recurso de colección desde una ruta, Laravel reinicia las llaves de la colección para que éstas estén en un simple orden numérico. Sin embargo, puedes añadir una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preserveKeys</span> a tu clase de recurso indicando si esta colección de llaves debería preservarse:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class User extends JsonResource
{
    /**
    * Indicates if the resource's collection keys should be preserved.
    *
    * @var bool
    */
    public \$preserveKeys = true;
}
</code></pre>

  <p>Cuando la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preserveKeys</span> es colocada en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>, la colección de llaves será preservada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\User as UserResource;

Route::get('/user', function () {
    return UserResource::collection(User::all()-&gt;keyBy-&gt;id);
});
</code></pre>

  <h4>Personalización de la clase de recurso subyacente</h4>
  <p>Normalmente, la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;collection</span> de una colección de recursos se rellena automáticamente con el resultado de la asignación de cada elemento de la colección a su clase de recurso singular. Se asume que la clase de recurso singular es el nombre de clase de la colección sin la cadena <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> al final.</p>
  <p>Por ejemplo, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserCollection</span> intentará asignar las instancias de usuario dadas al recurso <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>. Para personalizar este comportamiento, puedes anular la propiedad
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$collects</span> de tu colección de recursos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class UserCollection extends ResourceCollection
{
    /**
    * The resource that this resource collects.
    *
    * @var string
    */
    public \$collects = 'App\Http\Resources\Member';
}
</code></pre>

  <h2>Escritura de recursos</h2>

  <p>TIP</p>
  <p>Si no has leído la descripción general del concepto, te recomendamos que lo hagas antes de continuar con esta documentación.</p>

  <p>En esencia, los recursos son simples. Solo necesitan transformar un modelo dado en un arreglo. Por lo tanto, cada recurso contiene un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span> que traduce los atributos de tu modelo en un arreglo amigable con la API que se puede devolver a sus usuarios:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class User extends JsonResource
{
    /**
    * Transform the resource into an array.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function toArray(\$request)
    {
        return [
            'id' =&gt; \$this-&gt;id,
            'name' =&gt; \$this-&gt;name,
            'email' =&gt; \$this-&gt;email,
            'created_at' =&gt; \$this-&gt;created_at,
            'updated_at' =&gt; \$this-&gt;updated_at,
        ];
    }
}
</code></pre>

  <p>Una vez que has definido un recurso, lo puedes devolver directamente desde una ruta o controlador:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\User as UserResource;

Route::get('/user', function () {
    return new UserResource(User::find(1));
});
</code></pre>

  <h4>Relaciones</h4>
  <p>Si deseas incluir recursos relacionados en tu respuesta, puedes agregarlos al arreglo devuelto por tu método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span>. En este ejemplo, usaremos el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collection</span> del recurso <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> para agregar las publicaciones del blog del usuario a la respuesta del recurso:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Transform the resource into an array.
*
* @param  \Illuminate\Http\Request  \$request
* @return array
*/
public function toArray(\$request)
{
    return [
        'id' =&gt; \$this-&gt;id,
        'name' =&gt; \$this-&gt;name,
        'email' =&gt; \$this-&gt;email,
        'posts' =&gt; PostResource::collection(\$this-&gt;posts),
        'created_at' =&gt; \$this-&gt;created_at,
        'updated_at' =&gt; \$this-&gt;updated_at,
    ];
}
</code></pre>

  <p>TIP</p>
  <p>Si deseas incluir relaciones solo cuando ya se han cargado, consulte la documentación sobre relaciones condicionales.</p>

  <h4>Colecciones de recurso</h4>
  <p>Si bien los recursos traducen un modelo único en un arreglo, las colecciones de recursos traducen una colección de modelos en un arreglo. No es absolutamente necesario definir una clase de colección de recursos para cada uno de los tipos de modelo ya que todos los recursos proporcionan un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collection</span> para generar una colección de recursos "ad-hoc" sobre la marcha:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\User as UserResource;

Route::get('/user', function () {
    return UserResource::collection(User::all());
});
</code></pre>

  <p>Sin embargo, si necesitas personalizar los metadatos devueltos con la colección, será necesario definir una colección de recursos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class UserCollection extends ResourceCollection
{
    /**
    * Transform the resource collection into an array.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function toArray(\$request)
    {
        return [
            'data' =&gt; \$this-&gt;collection,
            'links' =&gt; [
                'self' =&gt; 'link-value',
            ],
        ];
    }
}
</code></pre>

  <p>Al igual que los recursos singulares, las colecciones de recursos se pueden devolver directamente desde las rutas o los controladores:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\UserCollection;

Route::get('/users', function () {
    return new UserCollection(User::all());
});
</code></pre>

  <h3>Envoltura de datos</h3>
  <p>Por defecto, tu recurso más externo está envuelto en una clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span> cuando la respuesta del recurso se convierte a JSON. Entonces, por ejemplo, una respuesta típica de colección de recursos se parece a lo siguiente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{
    "data": [
        {
            "id": 1,
            "name": "Eladio Schroeder Sr.",
            "email": "therese28@example.com",
        },
        {
            "id": 2,
            "name": "Liliana Mayert",
            "email": "evandervort@example.com",
        }
    ]
}
</code></pre>

  <p>Si deseas deshabilitar la envoltura del recurso más externo, puede usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withoutWrapping</span> en la clase de recurso base. Por lo general, debes llamar a este método desde su <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span> u otro proveedor de servicios que se carga en cada solicitud a tu aplicación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Http\Resources\Json\Resource;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Perform post-registration booting of services.
    *
    * @return void
    */
    public function boot()
    {
        Resource::withoutWrapping();
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

  <p>Nota</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withoutWrapping</span> solo afecta a la respuesta más externa y no eliminará las claves
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span> que agregues manualmente a tus propias colecciones de recursos.</p>

  <h3>Envoltura de recursos anidados</h3>
  <p>Tienes total libertad para determinar cómo se envuelven las relaciones de tus recursos. Si deseas que todas las colecciones de recursos se envuelvan en una clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span>, independientemente de su anidamiento, debes definir una clase de colección de recursos para cada recurso y devolver la colección dentro de una clave<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span>.</p>
  <p>Puedes que te estés preguntando si esto hará que tu recurso más externo se incluya en dos claves
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span>. No te preocupes, Laravel nunca permitirá que tus recursos se envuelvan por error, por lo que no tienes que preocuparte por el nivel de anidamiento de la colección de recursos que estás transformando:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class CommentsCollection extends ResourceCollection
{
    /**
    * Transform the resource collection into an array.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function toArray(\$request)
    {
        return ['data' =&gt; \$this-&gt;collection];
    }
}
</code></pre>

  <h3>Envoltura de datos y paginación</h3>
  <p>Al devolver colecciones paginadas en una respuesta de recursos, Laravel ajustará tus datos de recursos en una clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data</span> incluso si se ha llamado al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withoutWrapping</span>. Esto se debe a que las respuestas paginadas siempre contienen claves <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">meta</span> y<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">links</span> con información sobre el estado del paginador:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{
    "data": [
        {
            "id": 1,
            "name": "Eladio Schroeder Sr.",
            "email": "therese28@example.com",
        },
        {
            "id": 2,
            "name": "Liliana Mayert",
            "email": "evandervort@example.com",
        }
    ],
    "links":{
        "first": "http://example.com/pagination?page=1",
        "last": "http://example.com/pagination?page=1",
        "prev": null,
        "next": null
    },
    "meta":{
        "current_page": 1,
        "from": 1,
        "last_page": 1,
        "path": "http://example.com/pagination",
        "per_page": 15,
        "to": 10,
        "total": 10
    }
}
</code></pre>

  <h3>Paginación</h3>
  <p>Siempre puedes pasar una instancia del paginador al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collection</span> de un recurso o a una colección de recursos personalizada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\UserCollection;

Route::get('/users', function () {
    return new UserCollection(User::paginate());
});
</code></pre>

  <p>Las respuestas paginadas siempre contienen claves <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">meta</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">links</span> con información sobre el estado del paginador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{
    "data": [
        {
            "id": 1,
            "name": "Eladio Schroeder Sr.",
            "email": "therese28@example.com",
        },
        {
            "id": 2,
            "name": "Liliana Mayert",
            "email": "evandervort@example.com",
        }
    ],
    "links":{
        "first": "http://example.com/pagination?page=1",
        "last": "http://example.com/pagination?page=1",
        "prev": null,
        "next": null
    },
    "meta":{
        "current_page": 1,
        "from": 1,
        "last_page": 1,
        "path": "http://example.com/pagination",
        "per_page": 15,
        "to": 10,
        "total": 10
    }
}
</code></pre>

  <h3>Atributos condicionales</h3>
  <p>En ocasiones, es posible que desees incluir solo un atributo en una respuesta de recurso si se cumple una condición determinada. Por ejemplo, es posible que desee incluir solo un valor si el usuario actual es un "administrador". Laravel proporciona una variedad de métodos de ayuda para ayudarlo en esta situación. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span> se puede usar para agregar condicionalmente un atributo a una respuesta de recurso:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Transform the resource into an array.
*
* @param  \Illuminate\Http\Request  \$request
* @return array
*/
public function toArray(\$request)
{
    return [
        'id' =&gt; \$this-&gt;id,
        'name' =&gt; \$this-&gt;name,
        'email' =&gt; \$this-&gt;email,
        'secret' =&gt; \$this-&gt;when(Auth::user()-&gt;isAdmin(), 'secret-value'),
        'created_at' =&gt; \$this-&gt;created_at,
        'updated_at' =&gt; \$this-&gt;updated_at,
    ];
}
</code></pre>

  <p>En este ejemplo, la clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secret</span> solo se devolverá en la respuesta final del recurso si el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isAdmin</span> del usuario autenticado devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>. Si el método devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>, la clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secret</span> se eliminará de la respuesta del recurso por completo antes de que se envíe de nuevo al cliente. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span> te permite definir expresivamente tus recursos sin tener que recurrir a sentencias condicionales al construir el arreglo.</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span> también acepta un Closure como segundo argumento, lo que te permite calcular el valor resultante solo si la condición dada es<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'secret' =&gt; \$this-&gt;when(Auth::user()-&gt;isAdmin(), function () {
    return 'secret-value';
}),
</code></pre>

  <h4>Fusionar atributos condicionales</h4>
  <p>En ocasiones, es posible que tenga varios atributos que solo deben incluirse en la respuesta del recurso según la misma condición. En este caso, puede usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mergeWhen</span> para incluir los atributos en la respuesta solo cuando la condición dada es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Transform the resource into an array.
*
* @param  \Illuminate\Http\Request  \$request
* @return array
*/
public function toArray(\$request)
{
    return [
        'id' =&gt; \$this-&gt;id,
        'name' =&gt; \$this-&gt;name,
        'email' =&gt; \$this-&gt;email,
        \$this-&gt;mergeWhen(Auth::user()-&gt;isAdmin(), [
            'first-secret' =&gt; 'value',
            'second-secret' =&gt; 'value',
        ]),
        'created_at' =&gt; \$this-&gt;created_at,
        'updated_at' =&gt; \$this-&gt;updated_at,
    ];
}
</code></pre>

  <p>Nuevamente, si la condición dada es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>, estos atributos se eliminarán de la respuesta del recurso por completo antes de que se envíe al cliente.</p>

  <p>Nota</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mergeWhen</span> no debe usarse dentro de arreglos que mezclen claves de cadenas de caracteres y claves numéricas. Además, no se debe utilizar dentro de arreglos con claves numéricas que no están ordenadas secuencialmente.</p>

  <h3>Relaciones condicionales</h3>
  <p>Además de cargar condicionalmente los atributos, puedes incluir condicionalmente relaciones en tus respuestas de recursos en función de si la relación ya se ha cargado en el modelo. Esto permite que tu controlador decida qué relaciones deben cargarse en el modelo y tu recurso puede incluirlas fácilmente solo cuando realmente se hayan cargado.</p>
  <p>Fundamentalmente, esto hace que sea más fácil evitar los problemas de consulta "N + 1" dentro de tus recursos. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenLoaded</span> puede usarse para cargar condicionalmente una relación. Para evitar cargar relaciones innecesariamente, este método acepta el nombre de la relación en lugar de la relación en sí:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Transform the resource into an array.
*
* @param  \Illuminate\Http\Request  \$request
* @return array
*/
public function toArray(\$request)
{
    return [
        'id' =&gt; \$this-&gt;id,
        'name' =&gt; \$this-&gt;name,
        'email' =&gt; \$this-&gt;email,
        'posts' =&gt; PostResource::collection(\$this-&gt;whenLoaded('posts')),
        'created_at' =&gt; \$this-&gt;created_at,
        'updated_at' =&gt; \$this-&gt;updated_at,
    ];
}
</code></pre>

  <p>En este ejemplo, si la relación no se ha cargado, la clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts</span> se eliminará de la respuesta del recurso por completo antes de que se envíe al cliente.</p>
  <h4>Información de pivote condicional</h4>
  <p>Además de incluir condicionalmente la información de la relación en tus respuestas de recursos, puedes incluir condicionalmente datos de las tablas intermedias de relaciones de muchos a muchos utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenPivotLoaded</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenPivotLoaded</span> acepta el nombre de la tabla pivote como su primer argumento. El segundo argumento debe ser un Closure que defina el valor que se devolverá si la información pivote está disponible en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Transform the resource into an array.
*
* @param  \Illuminate\Http\Request  \$request
* @return array
*/
public function toArray(\$request)
{
    return [
        'id' =&gt; \$this-&gt;id,
        'name' =&gt; \$this-&gt;name,
        'expires_at' =&gt; \$this-&gt;whenPivotLoaded('role_user', function () {
            return \$this-&gt;pivot-&gt;expires_at;
        }),
    ];
}
</code></pre>

  <p>Si tu tabla intermedia utiliza un accesador distinto de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pivot</span>, puede usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenPivotLoadedAs</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Transform the resource into an array.
*
* @param  \Illuminate\Http\Request  \$request
* @return array
*/
public function toArray(\$request)
{
    return [
        'id' =&gt; \$this-&gt;id,
        'name' =&gt; \$this-&gt;name,
        'expires_at' =&gt; \$this-&gt;whenPivotLoadedAs('subscription', 'role_user', function () {
            return \$this-&gt;subscription-&gt;expires_at;
        }),
    ];
}
</code></pre>

  <h3>Añadiendo metadatos</h3>
  <p>Algunos estándares de API de JSON requieren la adición de metadatos a tus respuestas de recursos y colecciones de recursos. Esto a menudo incluye cosas como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">links</span> al recurso o recursos relacionados, o metadatos sobre el recurso en sí. Si necesitas devolver metadatos adicionales sobre un recurso, inclúyelos en tu método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span>. Por ejemplo, puedes incluir información de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">link</span> al transformar una colección de recursos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Transform the resource into an array.
*
* @param  \Illuminate\Http\Request  \$request
* @return array
*/
public function toArray(\$request)
{
    return [
        'data' =&gt; \$this-&gt;collection,
        'links' =&gt; [
            'self' =&gt; 'link-value',
        ],
    ];
}
</code></pre>

  <p>Al devolver metadatos adicionales de sus recursos, nunca tendrás que preocuparte por anular accidentalmente las claves <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">links</span> o<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">meta</span> que Laravel agrega automáticamente al devolver las respuestas paginadas. Cualquier <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">links</span> adicional que definas se fusionará con los enlaces proporcionados por el paginador.</p>
  <h4>Metadatos de nivel superior</h4>
  <p>A veces, es posible que desees incluir solo ciertos metadatos con una respuesta de recurso si el recurso es el recurso más externo que se devuelve. Por lo general, esto incluye información meta sobre la respuesta como un todo. Para definir estos metadatos, agrega un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span> a tu clase de recurso. Este método debería devolver un arreglo de metadatos que se incluirá con la respuesta del recurso solo cuando el recurso sea el recurso más externo que se está llamando:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;

class UserCollection extends ResourceCollection
{
    /**
    * Transform the resource collection into an array.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function toArray(\$request)
    {
        return parent::toArray(\$request);
    }

    /**
    * Get additional data that should be returned with the resource array.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function with(\$request)
    {
        return [
            'meta' =&gt; [
                'key' =&gt; 'value',
            ],
        ];
    }
}
</code></pre>

  <h4>Añadiendo metadatos al construir recursos</h4>
  <p>También puedes agregar datos de nivel superior al construir de instancias de recursos en tu ruta o controlador. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">additional</span>, que está disponible en todos los recursos, acepta un arreglo de datos que deberían agregarse a la respuesta del recurso:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return (new UserCollection(User::all()-&gt;load('roles')))
                -&gt;additional(['meta' =&gt; [
                    'key' =&gt; 'value',
                ]]);
</code></pre>

  <h2>Respuestas de Recurso</h2>
  <p>Como ya has leído, los recursos pueden devolverse directamente desde las rutas y los controladores:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\User as UserResource;

Route::get('/user', function () {
    return new UserResource(User::find(1));
});
</code></pre>

  <p>Sin embargo, a veces es posible que necesites personalizar la respuesta HTTP saliente antes de enviarla al cliente. Hay dos maneras de lograr esto. Primero, puedes encadenar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">response</span> en el recurso. Este método devolverá una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Response</span>, que te permite un control total de los encabezados de la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use App\Http\Resources\User as UserResource;

Route::get('/user', function () {
    return (new UserResource(User::find(1)))
                -&gt;response()
                -&gt;header('X-Value', 'True');
});
</code></pre>

  <p>Alternativamente, puedes definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withResponse</span> dentro del propio recurso. Este método se llamará cuando el recurso se devuelva como el recurso más externo en una respuesta:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class User extends JsonResource
{
    /**
    * Transform the resource into an array.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function toArray(\$request)
    {
        return [
            'id' =&gt; \$this-&gt;id,
        ];
    }

    /**
    * Customize the outgoing response for the resource.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @param  \Illuminate\Http\Response  \$response
    * @return void
    */
    public function withResponse(\$request, \$response)
    {
        \$response-&gt;header('X-Value', 'True');
    }
}
</code></pre>
</div>
""";