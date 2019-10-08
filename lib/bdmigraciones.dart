import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class BdMigraciones extends StatelessWidget {
  final String title;
  BdMigraciones(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmBdMigraciones,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmBdMigraciones = """
<!-- Base de datos: Migraciones -->
<div style='font-size: 14.2px;'>
  <h1>Base de datos: Migraciones</h1>
  <ul>
    <li>Introducción</li>
    <li>Generando migraciones</li>
    <li>Estructura de migración</li>
    <li>
      Ejecutando migraciones
      <ul>
        <li>Revertir migraciones</li>
      </ul>
    </li>
    <li>
      Tablas
      <ul>
        <li>Creando tablas</li>
        <li>Renombrando / Eliminando tablas</li>
      </ul>
    </li>
    <li>
      Columnas
      <ul>
        <li>Creando columnas</li>
        <li>Modificadores de columna</li>
        <li>Modificando columnas</li>
        <li>Eliminando columnas</li>
      </ul>
    </li>
    <li>
      Índices
      <ul>
        <li>Creación de indices</li>
        <li>Renombrando indices</li>
        <li>Eliminando indices</li>
        <li>Restricciones de clave foránea</li>
      </ul>
    </li>
  </ul>

  <h2>Introducción</h2>
  <p>Las migraciones son como el control de versión para tu base de datos, permiten que tu equipo modifique y comparta fácilmente el esquema de base de datos de la aplicación. Las migraciones son emparejadas típicamente con el constructor de esquema de Laravel para construir fácilmente el esquema de base de datos de tu aplicación. Si inclusive has tenido que decirle a un miembro de equipo que agregue una columna manualmente a sus esquemas de bases de datos local, has encarado el problema que solucionan las migraciones de base de datos.</p>
  <p>
    La clase facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Schema</span> de Laravel proporciona soporte de base de datos orientado a la programación orientada a objetos para la creación y manipulación de tablas a través de todos los sistemas de bases de datos soportados por Laravel.
  </p>

  <h2>Generando migraciones</h2>
  <p>
    Para crear una migración, usa el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:migration</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:migration create_users_table
</code></pre>

  <p>La nueva migración estará ubicada en tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database/migrations</span>. Cada nombre de archivo de migración contiene una marca de tiempo la cual permite que Laravel determine el orden de las migraciones.</p>
  <p>Las opciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--table</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--create</span> también pueden ser usadas para indicar el nombre de la tabla y si la migración estará creando una nueva tabla. Estas opciones rellenan previamente el archivo stub de migración generado con la tabla especificada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan make:migration create_users_table --create=users

php artisan make:migration add_votes_to_users_table --table=users
</code></pre>

  <p>Si prefieres especificar una ruta de directorio de salida personalizada para la migración generada, puedes usar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--path</span> al momento de ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:migration</span>. La ruta de directorio dada debe ser relativa a la ruta de directorio base de tu aplicación.</p>

  <h2>Estructura de migración</h2>
  <p>Una clase de migración contiene dos métodos: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">up</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">down</span>. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">up</span> es usado para agregar nuevas tablas, columnas, o índices para tu base de datos, mientras el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">down</span> debería revertir las operaciones ejecutadas por el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">up</span>.</p>
  <p>Dentro de ambos métodos puedes usar el constructor de esquema de Laravel para crear y modificar expresivamente las tablas. Para aprender sobre todos los métodos disponibles en el constructor
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Schema</span>, inspecciona su documentación. Por ejemplo, este ejemplo de migración crea una tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flights</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFlightsTable extends Migration
{
    /**
    * Run the migrations.
    *
    * @return void
    */
    public function up()
    {
        Schema::create('flights', function (Blueprint \$table) {
            \$table-&gt;bigIncrements('id');
            \$table-&gt;string('name');
            \$table-&gt;string('airline');
            \$table-&gt;timestamps();
        });
    }

    /**
    * Reverse the migrations.
    *
    * @return void
    */
    public function down()
    {
        Schema::drop('flights');
    }
}
</code></pre>

  <h2>Ejecutando migraciones</h2>
  <p>Para ejecutar todas tus maravillosas migraciones, ejecuta el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate
</code></pre>

  <p>Nota</p>
  <p>
    Si estás usando La máquina virtual de Homestead , deberías ejecutar este comando desde dentro de tu máquina virtual.
  </p>

  <h4>Forzando las migraciones para ejecutar en producción</h4>
  <p>Algunas operaciones de migración son destructivas, lo que significa que pueden causar que pierdas tus datos. Con el propósito de protegerte de ejecutar estos comandos contra tu base de datos de producción, recibirás un mensaje de confirmación antes que los comandos sean ejecutados. Para forzar que los comandos se ejecuten sin retardo, usa el indicador <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--force</span>.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate --force
</code></pre>

  <h3>Revertir migraciones</h3>
  <p>Para revertir la operación de migración más reciente, puedes usar el comando
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rollback</span>. Este comando reversa el último "lote" de migraciones, los cuales pueden incluir archivos de migración múltiples.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate:rollback
</code></pre>

  <p>Puedes revertir un número limitado de migraciones proporcionando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">step</span> al comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rollback</span>. Por ejemplo, el siguiente comando revertirá los cinco "lotes" de migraciones más recientes:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate:rollback --step=5
</code></pre>

  <p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate:reset</span> revertirá todas las migraciones de tu aplicación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate:reset
</code></pre>

  <h4>rollback &amp; migrate en un único comando</h4>
  <p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate:refresh</span> revertirá todas tus migraciones y después ejecutará el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate</span>. Este comando vuelve a crear efectivamente tu base de datos entera:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate:refresh

// Refresh the database and run all database seeds...
php artisan migrate:refresh --seed
</code></pre>

  <p>Puedes revertir y volver a migrar un número limitado de migraciones proporcionando la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">step</span> al comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">refresh</span>. Por ejemplo, el siguiente comando revertirá y volverá a migrar las cinco migraciones más recientes:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate:refresh --step=5
</code></pre>

  <h4>Eliminando todas las tablas y migrar</h4>
  <p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate:fresh</span> eliminará todas las tablas de la base de datos y después ejecutará el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate:fresh

php artisan migrate:fresh --seed
</code></pre>

  <h2>Tablas</h2>

  <h3>Creando tablas</h3>
  <p>Para crear una nueva tabla en la base de datos, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> en la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Schema</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> acepta dos argumentos. El primero es el nombre de la tabla, mientras que el segundo es una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> la cual recibe un objeto de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Blueprint</span> que puede ser usado para definir la nueva tabla:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::create('users', function (Blueprint \$table) {
    \$table-&gt;bigIncrements('id');
});
</code></pre>

  <p>Al momento de crear la tabla, puedes usar cualquiera de los métodos de columna del constructor de esquemas para definir las columnas de la tabla.</p>
  <h4>Inspeccionando la tabla / Existencia de columna</h4>
  <p>Puedes inspeccionar fácilmente la existencia de una tabla o columna usando los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasTable</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasColumn</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (Schema::hasTable('users')) {
    //
}

if (Schema::hasColumn('users', 'email')) {
    //
}
</code></pre>

  <h4>Conexión de base de datos &amp; Opciones de tabla</h4>
  <p>Si quieres ejecutar una operación de esquema en una conexión de base de datos que no es tu conexión predeterminada, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">connection</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::connection('foo')-&gt;create('users', function (Blueprint \$table) {
    \$table-&gt;bigIncrements('id');
});
</code></pre>

  <p>Puedes usar los siguientes comandos en el constructor de esquema para definir las opciones de tabla:
  </p>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Comando</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;engine = 'InnoDB';</span></td>
      <td>Especifica el motor de almacenamiento de la tabla. (Sólo en MySQL).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;charset = 'utf8';</span></td>
      <td>Especifica un conjunto de caracteres. (Sólo en MySQL).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;collation = 'utf8_unispan_ci';</span></td>
      <td>Especifica un orden predeterminado para la tabla. (Sólo en MySQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;temporary();</span></td>
      <td>Crea una tabla temporal (excepto en SQL Server).</td>
    </tr>
    </tbody>
  </table>

  <h3>Renombrando / Eliminando tablas</h3>
  <p>Para renombrar una tabla de base de datos existente, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rename</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::rename(\$from, \$to);
</code></pre>

  <p>Para eliminar una tabla existente, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">drop</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dropIfExists</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::drop('users');

Schema::dropIfExists('users');
</code></pre>

  <h4>Renombrando tablas con claves foráneas</h4>
  <p>Antes de renombrar una tabla, deberías verificar que cualquiera de las restricciones de clave foránea en la tabla tenga un nombre explícito en tus archivos de migración en caso de permitir que Laravel asigne un nombre basado en la convención. De otra manera, el nombre de restricción de clave foránea se referirá al nombre que tenía la tabla.</p>

  <h2>Columnas</h2>

  <h3>Creando columnas</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">table</span> en la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Schema</span> puede ser usado para actualizar tablas existentes. Igual que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> acepta dos argumentos: el nombre de la tabla y una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> que recibe una instancia de la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Blueprint</span> que puedes usar para agregar columnas a la tabla:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('users', function (Blueprint \$table) {
    \$table-&gt;string('email');
});
</code></pre>

  <h4>Tipos de columna permitidos</h4>
  <p>El constructor de esquema contiene una variedad de tipos de columna que puedes especificar al momento de construir tus tablas:</p>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Comando</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;bigIncrements('id');</span></td>
      <td>Tipo de columna equivalente a Auto-incremento UNSIGNED BIGINT (clave primaria).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;bigInteger('votes');</span></td>
      <td>Tipo de columna equivalente a BIGINT equivalent.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;binary('data');</span></td>
      <td>Tipo de columna equivalente a BLOB.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;boolean('confirmed');</span></td>
      <td>Tipo de columna equivalente a BOOLEAN.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;char('name', 100);</span></td>
      <td>Tipo de columna equivalente a CHAR con una longitud opcional.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;date('created_at');</span></td>
      <td>Tipo de columna equivalente a DATE.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dateTime('created_at');</span></td>
      <td>Tipo de columna equivalente a DATETIME.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dateTimeTz('created_at');</span></td>
      <td>Tipo de columna equivalente a DATETIME (con hora de la zona).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;decimal('amount', 8, 2);</span></td>
      <td>Tipo de columna equivalente a DECIMAL con una precisión (el total de dígitos) y escala de dígitos decimales.
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;double('amount', 8, 2);</span></td>
      <td>Tipo de columna equivalente a DOUBLE con una precisión (el total de dígitos) y escala de dígitos decimales.
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;enum('level', ['easy', 'hard']);</span></td>
      <td>Tipo de columna equivalente a ENUM.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;float('amount', 8, 2);</span></td>
      <td>Tipo de columna equivalente a FLOAT con una precisión (el total de dígitos) y escala de dígitos decimales.
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;geometry('positions');</span></td>
      <td>Tipo de columna equivalente a GEOMETRY.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;geometryCollection('positions');</span></td>
      <td>Tipo de columna equivalente a GEOMETRYCOLLECTION.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;increments('id');</span></td>
      <td>Tipo de columna equivalente a Auto-incremento UNSIGNED INTEGER (clave primaria).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;integer('votes');</span></td>
      <td>Tipo de columna equivalente a INTEGER.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;ipAddress('visitor');</span></td>
      <td>Tipo de columna equivalente a dirección IP.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;json('options');</span></td>
      <td>Tipo de columna equivalente a JSON.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;jsonb('options');</span></td>
      <td>Tipo de columna equivalente a JSONB.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;lineString('positions');</span></td>
      <td>Tipo de columna equivalente a LINESTRING.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;longText('description');</span></td>
      <td>Tipo de columna equivalente a LONGTEXT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;macAddress('device');</span></td>
      <td>Tipo de columna equivalente a dirección MAC.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;mediumIncrements('id');</span></td>
      <td>Tipo de columna equivalente a Auto-incremento UNSIGNED MEDIUMINT (clave primaria).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;mediumInteger('votes');</span></td>
      <td>Tipo de columna equivalente a MEDIUMINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;mediumText('description');</span></td>
      <td>Tipo de columna equivalente a MEDIUMTEXT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;morphs('taggable');</span></td>
      <td>Agrega los tipos de columna equivalente a UNSIGNED INTEGER <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taggable_id</span> y VARCHAR <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taggable_type</span>.
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;multiLineString('positions');</span></td>
      <td>Tipo de columna equivalente a MULTILINESTRING.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;multiPoint('positions');</span></td>
      <td>Tipo de columna equivalente a MULTIPOINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;multiPolygon('positions');</span></td>
      <td>Tipo de columna equivalente a MULTIPOLYGON.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;nullableMorphs('taggable');</span></td>
      <td>Permite que la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphs()</span> acepte una versión de valor nulo.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;nullableTimestamps();</span></td>
      <td>Método Alias de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">timestamps()</span>.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;point('position');</span></td>
      <td>Tipo de columna equivalente a POINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;polygon('positions');</span></td>
      <td>Tipo de columna equivalente a POLYGON.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;rememberToken();</span></td>
      <td>Permite nulos en el tipo de columna equivalente a VARCHAR(100)
        <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">remember_token</span>.
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;set('flavors', ['strawberry', 'vanilla']);</span></td>
      <td>Establece una columna equivalente.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;smallIncrements('id');</span></td>
      <td>Tipo de columna equivalente a Auto-incremento UNSIGNED SMALLINT (clave primaria).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;smallInteger('votes');</span></td>
      <td>Tipo de columna equivalente a SMALLINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;softDeletes();</span></td>
      <td>Permite nulos en el tipo de columna equivalente a TIMESTAMP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted_at</span> para eliminaciones.
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;softDeletesTz();</span></td>
      <td>Permite nulos en el tipo de columna equivalente a TIMESTAMP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted_at</span> (con la hora de la zona) para eliminaciones.
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;string('name', 100);</span></td>
      <td>Tipo de columna equivalente a VARCHAR con una longitud opcional.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;text('description');</span></td>
      <td>Tipo de columna equivalente a TEXT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;time('sunrise');</span></td>
      <td>Tipo de columna equivalente a TIME.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;timeTz('sunrise');</span></td>
      <td>Tipo de columna equivalente a TIME (con la hora de la zona).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;timestamp('added_on');</span></td>
      <td>Tipo de columna equivalente a TIMESTAMP.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;timestampTz('added_on');</span></td>
      <td>Tipo de columna equivalente a TIMESTAMP (con la hora de la zona).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;timestamps();</span></td>
      <td>Permite nulos en las columnas equivalentes TIMESTAMP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span>.
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;timestampsTz();</span></td>
      <td>Permite nulos en las columnas equivalentes TIMESTAMP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span> (con la hora de la zona).
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;tinyIncrements('id');</span></td>
      <td>Tipo de columna equivalente a Auto-incremento UNSIGNED TINYINT (clave primaria).</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;tinyInteger('votes');</span></td>
      <td>Tipo de columna equivalente a TINYINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;unsignedBigInteger('votes');</span></td>
      <td>Tipo de columna equivalente a UNSIGNED BIGINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;unsignedDecimal('amount', 8, 2);</span></td>
      <td>Tipo de columna equivalente a UNSIGNED DECIMAL con una precisión (total de dígitos) escala (dígitos decimales).
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;unsignedInteger('votes');</span></td>
      <td>Tipo de columna equivalente a UNSIGNED INTEGER.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;unsignedMediumInteger('votes');</span></td>
      <td>Tipo de columna equivalente a UNSIGNED MEDIUMINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;unsignedSmallInteger('votes');</span></td>
      <td>Tipo de columna equivalente a UNSIGNED SMALLINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;unsignedTinyInteger('votes');</span></td>
      <td>Tipo de columna equivalente a UNSIGNED TINYINT.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;uuid('id');</span></td>
      <td>Tipo de columna equivalente a UUID.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;year('birth_year');</span></td>
      <td>Tipo de columna equivalente a YEAR.</td>
    </tr>
    </tbody>
  </table>

  <h3>Modificadores de columna</h3>
  <p>Además de los tipos de columna listados anteriormente, hay varios "modificadores" de columna que puedes usar al momento de agregar una columna a la tabla de base de datos. Por ejemplo, para hacer que la columna "acepte valores nulos", puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">nullable</span>.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('users', function (Blueprint \$table) {
    \$table-&gt;string('email')-&gt;nullable();
});
</code></pre>

  <p>Debajo está una lista con todos los modificadores de columna disponibles. Esta lista no incluye los modificadores de índice:</p>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Modificador</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;after('column')</span></td>
      <td>Coloca la columna "después de" otra columna (MySQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;autoIncrement()</span></td>
      <td>Establece las columnas tipo INTEGER como auto-incremento (clave primaria)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;charset('utf8')</span></td>
      <td>Especifica un conjunto de caracteres para la columna (MySQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;collation('utf8_unispan_ci')</span></td>
      <td>Especifica un ordenamiento para la columna (MySQL/SQL Server)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;comment('my comment')</span></td>
      <td>Agrega un comentario a una columna (MySQL/PostgreSQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;default(\$value)</span></td>
      <td>Especifica un valor "predeterminado" para la columna</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;first()</span></td>
      <td>Coloca la columna al "principio" en la tabla (MySQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;nullable(\$value = true)</span></td>
      <td>Permite que valores NULL (por defecto) sean insertados dentro de la columna</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;storedAs(\$expression)</span></td>
      <td>Crea una columna almacenada generada por la expresión (MySQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;unsigned()</span></td>
      <td>Establece las columnas tipo INTEGER como UNSIGNED (MySQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;useCurrent()</span></td>
      <td>Establece las columnas tipo TIMESTAMP para usar CURRENT_TIMESTAMP como valor predeterminado
      </td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;virtualAs(\$expression)</span></td>
      <td>Crea una columna virtual generada por la expresión (MySQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;generatedAs(\$expression)</span></td>
      <td>Crea una columna de identidad con opciones de secuencia especificadas (PostgreSQL)</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;always()</span></td>
      <td>Define la prioridad de los valores de secuencia sobre la entrada para una columna de identidad (PostgreSQL)
      </td>
    </tr>
    </tbody>
  </table>

  <h3>Modificando columnas</h3>
  <h4>Prerequisitos</h4>
  <p>Antes de modificar una columna, asegúrate de agregar la dependencia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">doctrine/dbal</span> a tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span>. La biblioteca DBAL de Doctrine es usada para determinar el estado actual de la columna y crear las consultas SQL necesarias para hacer los ajustes especificados a la columna:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require doctrine/dbal
</code></pre>

  <h4>Actualizando los atributos de columna</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">change</span> permite que modifiques algunos tipos de columna existentes a un nuevo tipo o modifiques los atributos de la columna. Por ejemplo, puedes querer aumentar el tamaño de una columna tipo cadena. Para ver el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">change</span> en acción, vamos a aumentar el tamaño de la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> de 25 a 50 caracteres:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('users', function (Blueprint \$table) {
    \$table-&gt;string('name', 50)-&gt;change();
});
</code></pre>

  <p>También podríamos modificar una columna para que acepte valores nulos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('users', function (Blueprint \$table) {
    \$table-&gt;string('name', 50)-&gt;nullable()-&gt;change();
});
</code></pre>

  <p>Nota</p>
  <p>Solamente los siguientes tipos de columna pueden ser "cambiados": bigInteger, binary, boolean, date, dateTime, dateTimeTz, decimal, integer, json, longText, mediumText, smallInteger, string, text, time, unsignedBigInteger, unsignedInteger y unsignedSmallInteger.</p>

  <h4>Renombrando columnas</h4>
  <p>Para renombrar una columna, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">renameColumn</span> en el constructor de esquemas. Antes de renombrar una columna, asegúrate de agregar la dependencia
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">doctrine/dbal</span> a tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('users', function (Blueprint \$table) {
    \$table-&gt;renameColumn('from', 'to');
});
</code></pre>

  <p>Nota</p>
  <p>Renombrar alguna columna en una tabla que también tiene una columna de tipo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">enum</span> no es soportado actualmente.</p>

  <h3>Eliminando columnas</h3>
  <p>Para eliminar una columna, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dropColumn</span> en el constructor de esquemas. Antes de eliminar columnas de una base de datos SQLite, necesitarás agregar la dependencia
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">doctrine/dbal</span> a tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span> y ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer
    update</span> en tu terminal para instalar la biblioteca:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('users', function (Blueprint \$table) {
    \$table-&gt;dropColumn('votes');
});
</code></pre>

  <p>Puedes eliminar múltiples columnas de una tabla al pasar un arreglo de nombres de columna al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dropColumn</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('users', function (Blueprint \$table) {
    \$table-&gt;dropColumn(['votes', 'avatar', 'location']);
});
</code></pre>

  <p>Nota</p>
  <p>Eliminar o modificar múltiples columnas dentro de una sola migración al momento de usar una base de datos SQLite no está soportado.</p>

  <h4>Alias de comandos disponibles</h4>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Comando</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropMorphs('morphable');</span></td>
      <td>Elimina las columnas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphable_id</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphable_type</span>.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropRememberToken();</span></td>
      <td>Eliminar la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">remember_token</span>.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropSoftDeletes();</span></td>
      <td>Eliminar la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleted_at</span>.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropSoftDeletesTz();</span></td>
      <td>Alias del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dropSoftDeletes()</span>.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropTimestamps();</span></td>
      <td>Eliminar las columnas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span>.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropTimestampsTz();</span></td>
      <td>Alias del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dropTimestamps()</span>.</td>
    </tr>
    </tbody>
  </table>

  <h2>Indices</h2>

  <h3>Creando indices</h3>
  <p>El constructor de esquemas soporta varios tipos de índices. Primero, veamos un ejemplo que especifica que los valores de una columna deben ser únicos. Para crear el índice, podemos encadenar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span> en la definición de columna:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$table-&gt;string('email')-&gt;unique();
</code></pre>

  <p>Alternativamente, puedes crear el índice después de la definición de la columna. Por ejemplo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$table-&gt;unique('email');
</code></pre>

  <p>Incluso puedes pasar un arreglo de columnas a un método de índice para crear un índice compuesto (o combinado) :</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$table-&gt;index(['account_id', 'created_at']);
</code></pre>

  <p>Laravel generará automáticamente un nombre de índice razonable, pero puedes pasar un segundo argumento al método para especificar el nombre por ti mismo.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$table-&gt;unique('email', 'unique_email');
</code></pre>

  <h4>Tipos de indice disponibles</h4>
  <p>Cada método de índice acepta un segundo argumento opcional para especificar el nombre del índice. Si se omite, el nombre se derivará de los nombres de la tabla y la(s) columna(s).</p>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Comando</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;primary('id');</span></td>
      <td>Agrega una clave primaria.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;primary(['id', 'parent_id']);</span></td>
      <td>Agrega claves compuestas.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;unique('email');</span></td>
      <td>Agrega un índice único.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;index('state');</span></td>
      <td>Agrega un índice con valores repetidos.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;spatialIndex('location');</span></td>
      <td>Agrega un índice espacial. (excepto SQLite)</td>
    </tr>
    </tbody>
  </table>
  <h4>Longitudes de indices &amp; MySQL / MariaDB</h4>
  <p>Laravel usa el conjunto de caracteres <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">utf8mb4</span> por defecto, el cual incluye soporte para almacenar "emojis" en la base de datos. Si estás ejecutando una versión de MySQL más antigua que la versión 5.7.7 o más vieja que la versión 10.2.2 de MariaDB, puedes que necesites configurar manualmente la longitud de cadena predeterminada generada por las migraciones con el propósito de que MySQL cree los índices para estos. Puedes configurar esto ejecutando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Schema::defaultStringLength</span> dentro de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Support\Facades\Schema;

/**
* Bootstrap any application services.
*
* @return void
*/
public function boot()
{
    Schema::defaultStringLength(191);
}
</code></pre>

  <p>Alternativamente, puedes habilitar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">innodb_large_prefix</span> para tu base de datos. Debes referirte a la documentación de tu base de datos para conocer las instrucciones de cómo habilitar ésta apropiadamente.</p>

  <h3>Renombrando indices</h3>
  <p>Para renombrar un índice, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">renameIndex</span>. Este método acepta el nombre del índice actual como primer argumento y el nombre deseado como segundo argumento:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$table-&gt;renameIndex('from', 'to')
</code></pre>

  <h3>Eliminando indices</h3>
  <p>Para eliminar un índice, debes especificar el nombre del índice. De forma predeterminada, Laravel asigna automáticamente un nombre razonable para los índices. Concatena el nombre de la tabla, el nombre de la columna indexada y el tipo de índice. Aquí están algunos ejemplos:</p>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Comando</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropPrimary('users_id_primary');</span></td>
      <td>Eliminar una clave primaria de la tabla "users".</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropUnique('users_email_unique');</span></td>
      <td>Elimina un índice único de la tabla "users".</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropIndex('geo_state_index');</span></td>
      <td>Elimina un índice básico de la tabla "geo".</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$table-&gt;dropSpatialIndex('geo_location_spatialindex');</span></td>
      <td>Elimina un índice espacial de la tabla "geo" (excepto SQLite).</td>
    </tr>
    </tbody>
  </table>
  <p>Si pasas un arreglo de columnas dentro de un método que elimina los índices, el nombre de índice convencional será generado basado en el nombre de la tabla, columnas y tipo de clave:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('geo', function (Blueprint \$table) {
    \$table-&gt;dropIndex(['state']); // Drops index 'geo_state_index'
});
</code></pre>

  <h3>Restricciones de clave foránea</h3>
  <p>Laravel también proporciona soporte para la creación de restricciones de clave foránea, las cuales son usadas para forzar la integridad referencial a nivel de base de datos. Por ejemplo, vamos a definir una columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user_id</span> en la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts</span> que referencia la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> en una tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('posts', function (Blueprint \$table) {
    \$table-&gt;unsignedBigInteger('user_id');

    \$table-&gt;foreign('user_id')-&gt;references('id')-&gt;on('users');
});
</code></pre>

  <p>También puedes especificar la acción deseada para las propiedades "on delete" y "on update" de la restricción:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$table-&gt;foreign('user_id')
      -&gt;references('id')-&gt;on('users')
      -&gt;onDelete('cascade');
</code></pre>

  <p>Para eliminar una clave foránea, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dropForeign</span>. Las restricciones de clave foránea usan la misma convención de nombres que los índices. Así, concatenaremos el nombre de la tabla y el de columna en la restricción luego agrega el sufijo "_foreign" al nombre:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$table-&gt;dropForeign('posts_user_id_foreign');
</code></pre>

  <p>O, puedes pasar un arreglo de valores el cual usará automáticamente el nombre de restricción convencional al momento de eliminar:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$table-&gt;dropForeign(['user_id']);
</code></pre>

  <p>Puedes habilitar o deshabilitar las restricciones de clave foránea dentro de tus migraciones usando los siguientes métodos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::enableForeignKeyConstraints();

Schema::disableForeignKeyConstraints();
</code></pre>

  <p>Nota</p>
  <p>SQLite deshabilita las restricciones de clave foránea de forma predeterminada. Al usar SQLite, asegúrese de habilitar el soporte de clave foránea en la configuración de tu base de datos antes de intentar crearlos en sus migraciones.</p>
</div>
""";