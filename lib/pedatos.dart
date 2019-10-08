import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PeDatos extends StatelessWidget {
  final String title;
  PeDatos(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmPeDatos,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmPeDatos = """
<!-- Pruebas de Base de Datos -->
<div style='font-size: 14.2px;'>
  <h1>Pruebas de Base de Datos</h1>
  <ul>
    <li>Introducción</li>
    <li>Generando factories</li>
    <li>Reiniciando la base de datos después de cada prueba</li>
    <li>
      Escribiendo factories
      <ul>
        <li>Estados de un factory</li>
        <li>LLamadas de retorno de un factory</li>
      </ul>
    </li>
    <li>
      Usando factories
      <ul>
        <li>Creando modelos</li>
        <li>Persistiendo modelos</li>
        <li>Relaciones</li>
      </ul>
    </li>
    <li>Aserciones disponibles</li>
  </ul>

  <h2>Introducción</h2>
  <p>Laravel proporciona una variedad de herramientas útiles para hacer que sea más fácil probar tus aplicaciones que manejan base de datos. Primero, puedes usar el método (helper) <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertDatabaseHas</span> para comprobar que los datos existentes en la base de datos coinciden con un conjunto dado de criterios. Por ejemplo, si quisieras verificar que hay un registro en la tabla
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span> con el valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">email</span> de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sally@example.com</span>, puedes hacer lo siguiente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>public function testDatabase()
{
    // Make call to application...

    \$this-&gt;assertDatabaseHas('users', [
        'email' =&gt; 'sally@example.com',
    ]);
}
</code></pre>

  <p>También podrías usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertDatabaseMissing</span> para comprobar que esos datos no existen en la base de datos.</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertDatabaseHas</span> y otros métodos como éste son por conveniencia. Eres libre de usar cualquiera de los métodos de aserción de PHPUnit integrados para complementar tus pruebas.
  </p>

  <h2>Generando factories</h2>
  <p>
    Para crear un factory, usa el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:factory</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:factory PostFactory
</code></pre>

  <p>El nuevo factory será colocado en tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database/factories</span>.</p>
  <p>La opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--model</span> puede ser usada para indicar el nombre del modelo creado por el factory. Esta opción pre-rellenará el archivo de factory generado con el modelo dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:factory PostFactory --model=Post
</code></pre>

  <h2>Reiniciando la base de datos después de cada prueba</h2>
  <p>Con frecuencia es útil reinicializar tu base de datos después de cada prueba de modo que los datos de una prueba previa no interfieran con las pruebas subsecuentes. El trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RefreshDatabase</span> toma el enfoque más óptimo para migrar tu base de datos de pruebas, dependiendo de si estás usando una base de datos en memoria o una base de datos tradicional. Usa el trait en tu clase de prueba y todo será manejado por ti:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    use RefreshDatabase;

    /**
    * A basic functional test example.
    *
    * @return void
    */
    public function testBasicExample()
    {
        \$response = \$this-&gt;get('/');

        // ...
    }
}
</code></pre>

  <h2>Escribiendo factories</h2>
  <p>
    Al momento de probar, puedes necesitar insertar unos pocos registros dentro de tu base de datos antes de ejecutar tu prueba. En lugar de especificar manualmente el valor de cada columna cuando crees estos datos de prueba, Laravel permite que definas un conjunto de atributos predeterminados para cada uno de tus modelos de Eloquent usando factories de modelos. Para empezar, echemos un vistazo al archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database/factories/UserFactory.php</span> en tu aplicación. De forma predeterminada, este archivo contiene una definición de factory:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Support\Str;
use Faker\Generator as Faker;

\$factory-&gt;define(App\User::class, function (Faker \$faker) {
    return [
        'name' =&gt; \$faker-&gt;name,
        'email' =&gt; \$faker-&gt;unique()-&gt;safeEmail,
        'email_verified_at' =&gt; now(),
        'password' =&gt; '\$2y\$10\$TKh8H1.PfQx37YgCzwiKb.KjNyWgaHb9cbcoQgdIVFlYg7B77UdFm', // secret
        'remember_token' =&gt; Str::random(10),
    ];
});
</code></pre>

  <p>
    Dentro del Closure, la cual sirve como la definición del factory, puedes devolver los valores de prueba predeterminados de todos los atributos del modelo. El Closure recibirá una instancia de la biblioteca PHP Faker
    <outboundlink></outboundlink>
    , la cual permitirá que generes convenientemente varios tipos de datos aleatorios para las pruebas.
  </p>
  <p>También puedes crear archivos de factories adicionales para cada modelo para una mejor organización. Por ejemplo, podrías crear archivos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserFactory.php</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">CommentFactory.php</span> dentro de tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database/factories</span>. Todos los archivos dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">factories</span> serán cargados automáticamente por Laravel.</p>

  <p>TIP TIP</p>
  <p>Puedes establecer la configuración regional de Faker agregando una opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">faker_locale</span> a tu archivo de configuración<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>.</p>

  <h3>Estados de un factory</h3>
  <p>Los estados te permiten definir modificaciones discretas que pueden ser aplicadas a tus factories de modelos en cualquier combinación. Por ejemplo, tu modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> podría tener un estado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delinquent</span> que modifique uno de sus valores de atributo predeterminados. Puedes definir tus transformaciones de estado usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">state</span>. Para estados simples, puedes pasar un arreglo de modificaciones de atributos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$factory-&gt;state(App\User::class, 'delinquent', [
    'account_status' =&gt; 'delinquent',
]);
</code></pre>

  <p>Si tu estado requiere cálculo o una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$faker</span>, puedes usar un Closure para calcular las modificaciones de los atributos del estado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$factory-&gt;state(App\User::class, 'address', function (\$faker) {
    return [
        'address' =&gt; \$faker-&gt;address,
    ];
});
</code></pre>

  <h3>LLamadas de retorno de un factory</h3>
  <p>Las llamadas de retorno de un Factory son registradas usando los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">afterMaking</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">afterCreating</span> y te permiten realizar tareas adicionales de hacer o crear un modelo. Por ejemplo, puedes usar llamadas de retorno para relacionar modelos adicionales con el modelo creado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$factory-&gt;afterMaking(App\User::class, function (\$user, \$faker) {
    // ...
});

\$factory-&gt;afterCreating(App\User::class, function (\$user, \$faker) {
    \$user-&gt;accounts()-&gt;save(factory(App\Account::class)-&gt;make());
});
</code></pre>

  <p>También puedes definir llamadas de retorno para estados de un factory:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$factory-&gt;afterMakingState(App\User::class, 'delinquent', function (\$user, \$faker) {
    // ...
});

\$factory-&gt;afterCreatingState(App\User::class, 'delinquent', function (\$user, \$faker) {
    // ...
});
</code></pre>

  <h2>Usando factories</h2>

  <h3>Creando modelos</h3>
  <p>Una vez que has definido tus factories, puedes usar la función global <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">factory</span> en tus pruebas o en archivos seeder para generar instancias de un modelo. Así, vamos a echar un vistazo en unos pocos ejemplos de creación de modelos. Primero, usaremos el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> para crear modelos pero sin guardarlos en la base de datos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>public function testDatabase()
{
    \$user = factory(App\User::class)-&gt;make();

    // Use model in tests...
}
</code></pre>

  <p>También puedes crear una colección de muchos modelos o crear modelos de un tipo dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Create three App\User instances...
\$users = factory(App\User::class, 3)-&gt;make();
</code></pre>

  <h4>Aplicando estados</h4>
  <p>También puedes aplicar cualquiera de tus estados a los modelos. Si prefieres aplicar múltiples transformaciones de estado a los modelos, deberías especificar el nombre de cada estado que quisieras aplicar:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = factory(App\User::class, 5)-&gt;states('delinquent')-&gt;make();

\$users = factory(App\User::class, 5)-&gt;states('premium', 'delinquent')-&gt;make();
</code></pre>

  <h4>Sobrescribiendo atributos</h4>
  <p>Si prefieres sobreescribir algunos de los valores predeterminados de tus modelos, puedes pasar un arreglo de valores al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span>. Solamente, los valores especificados serán reemplazados mientras que el resto de los valores permanecerán con sus valores predeterminados cómo se especificó en el factory:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = factory(App\User::class)-&gt;make([
    'name' =&gt; 'Abigail',
]);
</code></pre>

  <h3>Persistiendo modelos</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> no solamente crea las instancias de un modelo sino que también los almacena en la base de datos usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> de Eloquent:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>public function testDatabase()
{
    // Create a single App\User instance...
    \$user = factory(App\User::class)-&gt;create();

    // Create three App\User instances...
    \$users = factory(App\User::class, 3)-&gt;create();

    // Use model in tests...
}
</code></pre>

  <p>Puedes sobrescribir atributos en el modelo al pasar un arreglo al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = factory(App\User::class)-&gt;create([
    'name' =&gt; 'Abigail',
]);
</code></pre>

  <h3>Relaciones</h3>
  <p>En este ejemplo, adjuntaremos una relación para algunos modelos creados. Al momento de usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> para crear múltiples modelos, una instancia de colección de Eloquent es devuelta, permitiendo que uses cualquiera de las funciones convenientes proporcionadas por la colección, tales como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">each</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = factory(App\User::class, 3)
            -&gt;create()
            -&gt;each(function (\$user) {
                \$user-&gt;posts()-&gt;save(factory(App\Post::class)-&gt;make());
            });
</code></pre>

  <h4>Relaciones y closures de atributos</h4>
  <p>También puedes adjuntar relaciones a los modelos usando atributos de Closure en tus definiciones del factory. Por ejemplo, si prefieres crear una nueva instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> al momento de crear un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>, puedes hacer lo siguiente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$factory-&gt;define(App\Post::class, function (\$faker) {
    return [
        'title' =&gt; \$faker-&gt;title,
        'content' =&gt; \$faker-&gt;paragraph,
        'user_id' =&gt; function () {
            return factory(App\User::class)-&gt;create()-&gt;id;
        }
    ];
});
</code></pre>

  <p>Estas Closures también reciben el arreglo de atributos evaluados del factory que los define:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$factory-&gt;define(App\Post::class, function (\$faker) {
    return [
        'title' =&gt; \$faker-&gt;title,
        'content' =&gt; \$faker-&gt;paragraph,
        'user_id' =&gt; function () {
            return factory(App\User::class)-&gt;create()-&gt;id;
        },
        'user_type' =&gt; function (array \$post) {
            return App\User::find(\$post['user_id'])-&gt;type;
        }
    ];
});
</code></pre>

  <h2>Aserciones disponibles</h2>
  <p>
    Laravel proporciona varias aserciones de base de datos para tus pruebas PHPUnit :
  </p>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Método</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;assertDatabaseHas(\$table, array \$data);</span></td>
      <td>Comprueba que una tabla en la base de datos contiene los datos dados.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;assertDatabaseMissing(\$table, array \$data);</span></td>
      <td>Comprueba que una tabla en la base de datos no contiene los datos dados.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;assertSoftDeleted(\$table, array \$data);</span></td>
      <td>Comprueba que el registro dado ha sido borrado lógicamente.</td>
    </tr>
    </tbody>
  </table>
</div>
""";