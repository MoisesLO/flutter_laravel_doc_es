import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class BdSeeding extends StatelessWidget {
  final String title;
  BdSeeding(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmBdSeeding,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmBdSeeding = """
<!-- Base de datos: Seeding -->
<div style='font-size: 14.2px;'>
  <h1>Base de datos: Seeding</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Escribiendo seeders
      <ul>
        <li>Usando model factories</li>
        <li>Registrando seeders adicionales</li>
      </ul>
    </li>
    <li>Ejecutando seeders</li>
  </ul>

  <h2>Introducción</h2>
  <p>Laravel incluye un método sencillo para alimentar tu base de datos con datos de prueba usando clases <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Seeder</span>. Todas las clases <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Seeder</span> son almacenadas en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database/seeds</span>. Las clases <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Seeder</span> pueden tener cualquier nombre que desees, pero deberías seguir probablemente alguna convención razonable, tales como
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UsersTableSeeder</span> etc. De forma predeterminada, una clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DatabaseSeeder</span> se define para tí. A partir de esta clase, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span> para registrar otras clases seeder, permitiendo que controles el orden en que se ejecutan.</p>

  <h2>Escribiendo seeders</h2>
  <p>
    Para generar un seeder, ejecuta el Comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:seeder</span>. Todos los seeders generados por el framework seran colocados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database/seeds</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:seeder UsersTableSeeder
</code></pre>

  <p>
    Una clase seeder contiene solamente un método de forma predeterminada: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">run</span>. Este método es ejecutado cuando el Comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">db:seed</span> se ejecuta. Dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">run</span>, puedes insertar datos en tu base de datos en la forma que desees. Puedes usar el constructor de consultas para insertar datos manualmente o puedes usar los Model Factories de Eloquent .
  </p>

  <p>TIP</p>
  <p>
    La protección de asignación en masa es deshabilitada automáticamente durante el seeding de la base de datos.
  </p>

  <p>Como un ejemplo, vamos a modificar la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DatabaseSeeder</span> predeterminada y agregar una instrucción insert al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">run</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

use Illuminate\Support\Str;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class DatabaseSeeder extends Seeder
{
    /**
    * Run the database seeds.
    *
    * @return void
    */
    public function run()
    {
        DB::table('users')-&gt;insert([
            'name' =&gt; Str::random(10),
            'email' =&gt; Str::random(10).'@gmail.com',
            'password' =&gt; bcrypt('password'),
        ]);
    }
}
</code></pre>

  <p>TIP</p>
  <p>Puede escribir cualquier dependencia que necesite dentro de la firma del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">run</span>. Se resolverán automáticamente a través del contenedor de servicio de Laravel.</p>

  <h3>Usando model factories</h3>
  <p>Ciertamente, especificar manualmente los atributos para cada seeder de modelos es lento y complicado. En lugar de eso, puedes usar Model Factories para generar convenientemente cantidades grandes de registros de bases de datos. Primero, revisa la documentación sobre model factories para aprender cómo definir tus factories. Una vez que hayas definido tus factories, puedes usar la función helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">factory</span> para insertar registros dentro de tu base de datos.
  </p>
  <p>Por ejemplo, vamos a crear 50 usuarios y establecer una asociación con los posts para cada usuario:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Run the database seeds.
*
* @return void
*/
public function run()
{
    factory(App\User::class, 50)-&gt;create()-&gt;each(function (\$user) {
        \$user-&gt;posts()-&gt;save(factory(App\Post::class)-&gt;make());
    });
}
</code></pre>

  <h3>Registrando seeders adicionales</h3>
  <p>Dentro de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DatabaseSeeder</span>, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span> para ejecutar clases seeder adicionales. Usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span> te permite separar el seeding de tu base de datos en varios archivos con el propósito de que no exista una clase seeder única que se vuelva extremadamente grande. Pasa el nombre de la clase seeder que deseas ejecutar:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Run the database seeds.
*
* @return void
*/
public function run()
{
    \$this-&gt;call([
        UsersTableSeeder::class,
        PostsTableSeeder::class,
        CommentsTableSeeder::class,
    ]);
}
</code></pre>

  <h2>Ejecutando seeders</h2>
  <p>Una vez que hayas escrito tu seeder, puedes necesitar regenerar el cargador automático de Composer usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump-autoload</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer dump-autoload
</code></pre>

  <p>Ahora puedes usar el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">db:seed</span> para alimentar tu base de datos. De forma predeterminada, el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">db:seed</span> ejecuta la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DatabaseSeeder</span>, la cual puede ser usada para ejecutar otras clases seeder. Sin embargo, puedes usar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--class</span> para especificar que una clase seeder específica se ejecute individualmente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan db:seed

php artisan db:seed --class=UsersTableSeeder
</code></pre>

  <p>También puedes alimentar tu base de datos usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate:refresh</span>, el cual también deshará y volverá a ejecutar tods tus migraciones. Este comando es útil para reconstruir tu base de datos completamente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate:refresh --seed
</code></pre>

  <h4>Forzar la ejecución de seeders en producción</h4>
  <p>Algunas operaciones de seeding pueden causar que alteres o pierdas datos. Para protegerte de ejecutar comandos de seeding en tu base de datos de producción, te será solicitada una confirmación antes de que los seeders sean ejecutados. Para forzar la ejecución de los seeders sin confirmación, usa la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--force</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan db:seed --force
</code></pre>
</div>
""";