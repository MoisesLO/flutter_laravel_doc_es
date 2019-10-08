import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class OrRelaciones extends StatelessWidget {
  final String title;
  OrRelaciones(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmOrRelaciones,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmOrRelaciones = """
<!-- Eloquent: Relaciones -->
<div style='font-size: 14.2px;'>
  <h1>Eloquent: Relaciones</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Definiendo relaciones
      <ul>
        <li>Uno a uno</li>
        <li>Uno a muchos</li>
        <li>Uno a muchos (inverso)</li>
        <li>Muchos a muchos</li>
        <li>Definiendo modelos de tabla intermedia personalizados</li>
        <li>Tiene uno a través de</li>
        <li>Tiene muchos a través de</li>
      </ul>
    </li>
    <li>
      Relaciones polimórficas
      <ul>
        <li>Uno a uno</li>
        <li>Uno a muchos</li>
        <li>Muchos a muchos</li>
        <li>Tipos polimórficos personalizados</li>
      </ul>
    </li>
    <li>
      Consultando relaciones
      <ul>
        <li>Métodos de relación vs. propiedades dinámicas</li>
        <li>Consultando la existencia de relación</li>
        <li>Consultando la ausencia de relación</li>
        <li>Consultando relaciones polimorficas</li>
        <li>Contando modelos relacionados</li>
      </ul>
    </li>
    <li>
      Precarga (eager loading)
      <ul>
        <li>Restringiendo precargas</li>
        <li>Precarga diferida (lazy eager loading)</li>
      </ul>
    </li>
    <li>
      Insertando y actualizando modelos relacionados
      <ul>
        <li>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span></li>
        <li>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span></li>
        <li>Actualizando relaciones pertenece a (BelongsTo)</li>
        <li>Actualizando relaciones muchos a muchos</li>
      </ul>
    </li>
    <li>Tocando marcas de tiempo del padre</li>
  </ul>

  <h2>Introducción</h2>
  <p>Las tablas de base de datos frecuentemente están relacionadas a otra tabla. Por ejemplo, un post de un blog puede tener muchos comentarios o un pedido podría estar relacionado al usuario que lo ordenó. Eloquent hace que manejar y trabajar con estas relaciones sea fácil y soporta varios tipos de relaciones:</p>
  <ul>
    <li>Uno a Uno</li>
    <li>Uno a Muchos</li>
    <li>Muchos a Muchos</li>
    <li>Uno a Través de</li>
    <li>Muchos a Través de</li>
    <li>Uno a Uno (Polimórfica)</li>
    <li>Uno a Muchos (Polimórfica)</li>
    <li>Muchos a Muchos (Polimórfica)</li>
  </ul>

  <h2>Definiendo relaciones</h2>
  <p>
    Las relaciones de Eloquent se definen como métodos en tus clases de modelo de Eloquent. Debido a que, como los mismos modelos Eloquent, las relaciones también sirven como poderosos constructores de consultas , puesto que definir relaciones como métodos proporciona potentes capacidades de encadenamiento de métodos y consultas. Por ejemplo, podemos encadenar restricciones adicionales en esta relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;posts()-&gt;where('active', 1)-&gt;get();
</code></pre>

  <p>Pero, antes de profundizar demasiado en el uso de relaciones, aprendamos cómo definir cada tipo.
  </p>

  <h3>Uno A Uno</h3>
  <p>Una relación de uno a uno es una relación muy sencilla. Por ejemplo, un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> podría estar asociado con un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Phone</span>. Para definir esta relación, colocaremos un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phone</span> en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phone</span> debería llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOne</span> y devolver su resultado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * Get the phone record associated with the user.
    */
    public function phone()
    {
        return \$this-&gt;hasOne('App\Phone');
    }
}
</code></pre>

  <p>El primer argumento pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOne</span> es el nombre del modelo relacionado. Una vez que la relación es definida, podemos obtener el registro relacionado usando propiedades dinámicas de Eloquent. Las propiedades dinámicas permiten que accedas a métodos de relación como si fueran propiedades definidas en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$phone = User::find(1)-&gt;phone;
</code></pre>

  <p>Eloquent determina la clave foránea de la relación en base al nombre del modelo. En este caso, se asume automáticamente que el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Phone</span> tenga una clave foránea
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user_id</span>. Si deseas sobrescribir esta convención, puedes pasar un segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOne</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;hasOne('App\Phone', 'foreign_key');
</code></pre>

  <p>Adicionalmente, Eloquent asume que la clave foránea debería tener un valor que coincida con la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> (o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$primaryKey</span> personalizada) del padre. En otras palabras, Eloquent buscará el valor de la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> del usuario en la columna
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user_id</span> de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Phone</span>. Si prefieres que la relación use un valor distinto de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span>, puedes pasar un tercer argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOne</span> especificando tu clave personalizada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;hasOne('App\Phone', 'foreign_key', 'local_key');
</code></pre>

  <h4>Definiendo el inverso de la relación</h4>
  <p>Así, podemos acceder al modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Phone</span> desde nuestro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>. Ahora, vamos a definir una relación en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Phone</span> que nos permitirá accdeder al
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> que posee el teléfono. Podemos definir el inverso de una relación
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOne</span> usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Phone extends Model
{
    /**
    * Get the user that owns the phone.
    */
    public function user()
    {
        return \$this-&gt;belongsTo('App\User');
    }
}
</code></pre>

  <p>En el ejemplo anterior, Eloquent intentará hacer coincidir el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user_id</span> del modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Phone</span> con un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>. Eloquent determina el nombre de la clave foránea de forma predeterminada al examinar el nombre del método de la relación y agregando el sufijo al nombre del método con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_id</span>. Sin embargo, si la clave foránea en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Phone</span> no es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user_id</span>, puedes pasar un nombre de clave personalizada como segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the user that owns the phone.
*/
public function user()
{
    return \$this-&gt;belongsTo('App\User', 'foreign_key');
}
</code></pre>

  <p>Si tu modelo padre no usa <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> como su clave primaria, o deseas hacer join al modelo hijo con una columna diferente, puedes pasar un tercer argumento al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span> especificando la clave personalizada de tu tabla padre:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the user that owns the phone.
*/
public function user()
{
    return \$this-&gt;belongsTo('App\User', 'foreign_key', 'other_key');
}
</code></pre>

  <h3>Uno a muchos</h3>
  <p>Una relación de "uno-a-muchos" es usada para definir relaciones donde un solo modelo posee cualquier cantidad de otros modelos. Por ejemplo, un post de un blog puede tener un número infinito de comentarios. Al igual que todas las demás relaciones de Eloquent, las relaciones uno-a-muchos son definidas al colocar una función en tu modelo Eloquent:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    /**
    * Get the comments for the blog post.
    */
    public function comments()
    {
        return \$this-&gt;hasMany('App\Comment');
    }
}
</code></pre>

  <p>Recuerda, Eloquent determinará automáticamente la columna de clave foránea apropiada en el modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span>. Por convención, Eloquent tomará el nombre "snake_case" del modelo que la contiene y le agregará el sufijo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_id</span>. Para este ejemplo, Eloquent asumirá que la clave foránea del modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post_id</span>.</p>
  <p>Una vez que la relación ha sido definida, podemos acceder a la colección de comentarios al acceder a la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">comments</span>. Recuerda, ya que Eloquent proporciona "propiedades dinámicas", podemos acceder a los métodos de la relación como si fueran definidos como propiedades en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$comments = App\Post::find(1)-&gt;comments;

foreach (\$comments as \$comment) {
    //
}
</code></pre>

  <p>Debido a que todas las relaciones también sirven como constructores de consultas (query builders), puedes agregar restricciones adicionales a cuyos comentarios sean obtenidos ejecutando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">comments</span> y encadenando condiciones en la consulta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$comment = App\Post::find(1)-&gt;comments()-&gt;where('title', 'foo')-&gt;first();
</code></pre>

  <p>Igual que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOne</span>, también puedes sobrescribir las claves foráneas y locales al pasar argumentos adicionales al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasMany</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;hasMany('App\Comment', 'foreign_key');

return \$this-&gt;hasMany('App\Comment', 'foreign_key', 'local_key');
</code></pre>

  <h3>Uno a muchos (inverso)</h3>
  <p>Ahora que puedes acceder a todos los comentarios de un post, vamos a definir una relación para permitir a un comentario acceder a su post padre. Para definir el inverso de una relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasMany</span>, define una función de relación en el modelo hijo que ejecute el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    /**
    * Get the post that owns the comment.
    */
    public function post()
    {
        return \$this-&gt;belongsTo('App\Post');
    }
}
</code></pre>

  <p>Una vez que la relación ha sido definida, podemos obtener el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> para un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> accediendo a la "propiedad dinámica" de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$comment = App\Comment::find(1);

echo \$comment-&gt;post-&gt;title;
</code></pre>

  <p>En el ejemplo anterior, Eloquent tratará de hacer coincidir el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post_id</span> del modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> con un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>. Eloquent determina el nombre de la clave foránea por defecto, examinando el nombre del método de la relación y agregando un sufijo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_</span> al nombre del método, seguido del nombre de la columna principal de la llave. Sin embargo, si la clave foránea en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> no es
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post_id</span>, puedes pasar un nombre de clave personalizado como segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the post that owns the comment.
*/
public function post()
{
    return \$this-&gt;belongsTo('App\Post', 'foreign_key');
}
</code></pre>

  <p>Si tu modelo padre no usa <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> como su clave primaria, o deseas hacer join al modelo hijo con una columna diferente, puedes pasar un tercer argumento al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span> especificando la clave personalizada de tu tabla padre.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the post that owns the comment.
*/
public function post()
{
    return \$this-&gt;belongsTo('App\Post', 'foreign_key', 'other_key');
}
</code></pre>

  <h3>Muchos a muchos</h3>
  <p>Las relaciones de muchos-a-muchos son ligeramente más complicadas que las relaciones
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOne</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasMany</span>. Un ejemplo de tal relación es un usuario con muchos roles, donde los roles también son compartidos por otros usuarios. Por ejemplo, muchos usuarios pueden tener el rol "Admin". Para definir esta relación, tres tablas de bases de datos son necesitadas: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">roles</span>, y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">role_user</span>. La tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">role_user</span> es derivada del orden alfabético de los nombres de modelo relacionados y contiene las columnas
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user_id</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">role_id</span>.</p>
  <p>Las relaciones de muchos-a-muchos son definidas escribiendo un método que devuelve el resultado del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsToMany</span>. Por ejemplo, vamos a definir el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">roles</span> en nuestro modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * The roles that belong to the user.
    */
    public function roles()
    {
        return \$this-&gt;belongsToMany('App\Role');
    }
}
</code></pre>

  <p>Una vez que la relación es definida, puedes acceder a los roles del usuario usando la propiedad dinámica <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">roles</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

foreach (\$user-&gt;roles as \$role) {
    //
}
</code></pre>

  <p>Como con los otros tipos de relación, puedes ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">roles</span> para continuar encadenando las restricciones de consulta en la relación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$roles = App\User::find(1)-&gt;roles()-&gt;orderBy('name')-&gt;get();
</code></pre>

  <p>Como mencionamos previamente, para determinar el nombre de la tabla asociativa, Eloquent juntará los dos nombres de modelo en orden alfabético. Sin embargo, eres libre de sobrescribir esta convención. Puedes hacer eso pasando un segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsToMany</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;belongsToMany('App\Role', 'role_user');
</code></pre>

  <p>Además de personalizar el nombre de la tabla asociativa, también puedes personalizar los nombres de columna de las claves en la tabla pasando argumentos adicionales al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsToMany</span>. El tercer argumento es el nombre de clave foránea del modelo en el cual estás definiendo la relación, mientras el cuarto argumento es el nombre de la clave foránea del modelo que estás asociando:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;belongsToMany('App\Role', 'role_user', 'user_id', 'role_id');
</code></pre>

  <h4>Definiendo el inverso de la relación</h4>
  <p>Para definir el inverso de una relación de muchos-a-muchos, puedes colocar otra llamada de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsToMany</span> en tu modelo relacionado. Para continuar con nuestro ejemplo de roles de usuario, vamos a definir el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span> en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Role</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    /**
    * The users that belong to the role.
    */
    public function users()
    {
        return \$this-&gt;belongsToMany('App\User');
    }
}
</code></pre>

  <p>Como puedes ver, la relación es definida exactamente de la misma forma que su contraparte <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>, con la excepción de que referencia al modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span>. Ya que estamos reusando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsToMany</span>, todas las tablas y opciones de personalización de claves usuales están disponibles al momento de definir el inverso de las relaciones de muchos-a-muchos.
  </p>
  <h4>Obteniendo columnas de tablas intermedias (Pivote)</h4>
  <p>Como ya has aprendido, trabajar con relaciones de muchos-a-muchos requiere la presencia de una tabla intermedia o pivote. Eloquent proporciona algunas formas muy útiles de interactuar con esta tabla. Por ejemplo, vamos a asumir que nuestro objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> tiene muchos objetos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Role</span> al que está relacionado. Después de acceder a esta relación, podemos acceder a la tabla intermedia usando el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pivot</span> en los modelos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

foreach (\$user-&gt;roles as \$role) {
    echo \$role-&gt;pivot-&gt;created_at;
}
</code></pre>

  <p>Ten en cuenta que a cada modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Role</span> que obtenemos se le asigna automáticamente un atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pivot</span>. Este atributo contiene un modelo que representa la tabla intermedia y puede ser usado como cualquier otro modelo de Eloquent.</p>
  <p>De forma predeterminada, solo las claves del modelo estarán presentes en el objeto
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pivot</span>. Si tu tabla pivote contiene atributos extras, debes especificarlos cuando definas la relación.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;belongsToMany('App\Role')-&gt;withPivot('column1', 'column2');
</code></pre>

  <p>Si quieres que tu tabla pivote automáticamente mantenga las marcas de tiempo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span>, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withTimestamps</span> en la definición de la relación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;belongsToMany('App\Role')-&gt;withTimestamps();
</code></pre>

  <h4>Personalizando el nombre del atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pivot</span></h4>
  <p>Como se señaló anteriormente, los atributos de la tabla intermedia pueden ser accedidos en modelos usando el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pivot</span>. Sin embargo, eres libre de personalizar el nombre de este atributo para que refleje mejor su propósito dentro de tu aplicación.</p>
  <p>Por ejemplo, si tu aplicación contiene usuarios que pueden suscribirse a podcasts, probablemente tengas una relación de muchos-a-muchos entre usuarios y podcasts. Si éste es el caso, puedes desear renombrar tu tabla pivote intermedia como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscription</span> en lugar de
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pivot</span>. Esto puede ser hecho usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">as</span> al momento de definir la relación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;belongsToMany('App\Podcast')
                -&gt;as('subscription')
                -&gt;withTimestamps();
</code></pre>

  <p>Una vez hecho esto, puedes acceder a los datos de la tabla intermedia usando el nombre personalizado:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$users = User::with('podcasts')-&gt;get();

foreach (\$users-&gt;flatMap-&gt;podcasts as \$podcast) {
    echo \$podcast-&gt;subscription-&gt;created_at;
}
</code></pre>

  <h4>Filtrando relaciones a través de columnas de tablas intermedias</h4>
  <p>También puedes filtrar los resultados devueltos por <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsToMany</span> usando los métodos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">wherePivot</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">wherePivotIn</span> al momento de definir la relación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return \$this-&gt;belongsToMany('App\Role')-&gt;wherePivot('approved', 1);

return \$this-&gt;belongsToMany('App\Role')-&gt;wherePivotIn('priority', [1, 2]);
</code></pre>

  <h3>Definiendo modelos de tabla intermedia personalizados</h3>
  <p>Si prefieres definir un modelo personalizado para representar la tabla intermedia o pivote de tu relación, puedes ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">using</span> al momento de definir la relación. Los modelos de tablas intermedias de muchos-a-muchos personalizados deben extender la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\Relations\Pivot</span> mientras que los modelos polimórficos muchos-a-muchos deben extender la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Database\Eloquent\Relations\MorphPivot</span>. Por ejemplo, podemos definir un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Role</span> que use un modelo pivote <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RoleUser</span> personalizado:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    /**
    * The users that belong to the role.
    */
    public function users()
    {
        return \$this-&gt;belongsToMany('App\User')-&gt;using('App\RoleUser');
    }
}
</code></pre>

  <p>Al momento de definir el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RoleUser</span>, extenderemos la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Pivot</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Relations\Pivot;

class RoleUser extends Pivot
{
    //
}
</code></pre>

  <p>Puedes combinar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">using</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withPivot</span> para retornar columnas de la tabla intermedia. Por ejemplo, puedes retornar las columnas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_by</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_by</span> desde la tabla pivote <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RoleUser</span> pasando los nombres de las columnas al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withPivot</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    /**
    * The users that belong to the role.
    */
    public function users()
    {
        return \$this-&gt;belongsToMany('App\User')
                        -&gt;using('App\RoleUser')
                        -&gt;withPivot([
                            'created_by',
                            'updated_by'
                        ]);
    }
}
</code></pre>

  <p>Nota</p>
  <p><strong>Nota:</strong> Los modelos Pivot no pueden usar el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SoftDeletes</span>. Si necesitas hacer soft delete de registros pivot considera convertir tu modelo pivot a un modelo de Eloquent.</p>

  <h4>Modelos de pivote personalizados e IDs incrementales</h4>
  <p>Si has definido una relación de muchos a muchos que usa un modelo de pivote personalizado, y ese modelo de pivote tiene una clave primaria de incremento automático, debes asegurarte de que su clase de modelo de pivote personalizado defina una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">incrementing</span> que se establece en<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Indicates if the IDs are auto-incrementing.
*
* @var bool
*/
public \$incrementing = true;
</code></pre>

  <h3>Tiene uno a través de (hasOneThrough)</h3>
  <p>La relación "tiene uno a través" vincula los modelos a través de una única relación intermedia. Por ejemplo, si cada proveedor (supplier) tiene un usuario (user) y cada usuario está asociado con un registro del historial (history) de usuarios, entonces el modelo del proveedor puede acceder al historial del usuario <em>a través</em> del usuario. Veamos las tablas de base de datos necesarias para definir esta relación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>users
    id - integer
    supplier_id - integer

suppliers
    id - integer

history
    id - integer
    user_id - integer
</code></pre>

  <p>Aunque la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">history</span> no contiene una columna<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">supplier_id</span>, la relación
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOneThrough</span> puede proporcionar acceso al historial del usuario desde el modelo del proveedor. Ahora que hemos examinado la estructura de la tabla para la relación, vamos a definirla en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Supplier</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    /**
    * Get the user's history.
    */
    public function userHistory()
    {
        return \$this-&gt;hasOneThrough('App\History', 'App\User');
    }
}
</code></pre>

  <p>El primer argumento pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOneThrough</span> es el nombre del modelo final al que queremos acceder, mientras que el segundo argumento es el nombre del modelo intermedio.</p>
  <p>Se utilizarán las convenciones típicas de clave foránea de Eloquent al realizar las consultas de la relación. Si deseas personalizar las claves de la relación, puedes pasarlas como el tercer y cuarto argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOneThrough</span>. El tercer argumento es el nombre de la clave foránea en el modelo intermedio. El cuarto argumento es el nombre de la clave foránea en el modelo final. El quinto argumento es la clave local, mientras que el sexto argumento es la clave local del modelo intermedio:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>class Supplier extends Model
{
    /**
    * Get the user's history.
    */
    public function userHistory()
    {
        return \$this-&gt;hasOneThrough(
            'App\History',
            'App\User',
            'supplier_id', // Foreign key on users table...
            'user_id', // Foreign key on history table...
            'id', // Local key on suppliers table...
            'id' // Local key on users table...
        );
    }
}
</code></pre>

  <h3>Tiene muchos a través de (hasManyThrough)</h3>
  <p>La relación "tiene-muchos-a-través-de" proporciona una abreviación conveniente para acceder a relaciones distantes por medio de una relación intermedia. Por ejemplo, un modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Country</span> podría tener muchos modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> a través de un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> intermedio. En este ejemplo, podrías traer todos los posts de un blog para un país dado. Vamos a buscar las tablas requeridas para definir esta relación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>countries
    id - integer
    name - string

users
    id - integer
    country_id - integer
    name - string

posts
    id - integer
    user_id - integer
    title - string
</code></pre>

  <p>Aunque los <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts</span> no contienen una columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">country_id</span>, la relación
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasManyThrough</span> proporciona acceso a los posts de un país por medio de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$country-&gt;posts</span>. Para ejecutar esta consulta, Eloquent inspecciona el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">country_id</span> de la tabla intermedia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span>. Después de encontrar los ID de usuario que coincidan, serán usados para consultar la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts</span>.</p>
  <p>Ahora que hemos examinado la estructura de la tabla para la relación, vamos a definirla en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Country</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Country extends Model
{
    /**
    * Get all of the posts for the country.
    */
    public function posts()
    {
        return \$this-&gt;hasManyThrough('App\Post', 'App\User');
    }
}
</code></pre>

  <p>El primer argumento pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasManyThrough</span> es el nombre del modelo final que deseamos acceder, mientras que el segundo argumento es el nombre del modelo intermedio.</p>
  <p>Las convenciones de clave foránea típicas de Eloquent serán usadas al momento de ejecutar las consultas de la relación. Si prefieres personalizar las claves de la relación, puedes pasarlos como tercer y cuarto argumentos del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasManyThrough</span>. El tercer argumento es el nombre de la clave foránea en el modelo intermedio. El cuarto argumento es el nombre de la clave foránea en el modelo final. El quinto argumento es la clave local, mientras el sexto argumento es la clave local del modelo intermedio:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>class Country extends Model
{
    public function posts()
    {
        return \$this-&gt;hasManyThrough(
            'App\Post',
            'App\User',
            'country_id', // Foreign key on users table...
            'user_id', // Foreign key on posts table...
            'id', // Local key on countries table...
            'id' // Local key on users table...
        );
    }
}
</code></pre>

  <h2>Relaciones polimórficas</h2>
  <p>Una relación polimórfica permite que el modelo objetivo pertenezca a más de un tipo de modelo usando una sola asociación.</p>

  <h3>Una a una (polimórfica)</h3>
  <h4>Estructura de tabla</h4>
  <p>Una relación polimorfica de uno-a-uno es similar a una relación de uno-a-uno simple; sin embargo, el modelo objetivo puede pertenecer a más de un tipo de modelo en una sola asociación. Por ejemplo, un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> de un blog y un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> pueden compartir una relación polimórfica con un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Image</span>. Usando una relación polimórfica de uno-a-uno te permite tener una sola lista de imagenes únicas que son usadas tanto los posts del blog como por las cuentas de los usuarios. Primero, vamos a examinar la estructura de la tabla:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>posts
    id - integer
    name - string

users
    id - integer
    name - string

images
    id - integer
    url - string
    imageable_id - integer
    imageable_type - string
</code></pre>

  <p>Observa las columnas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imageable_id</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imageable_type</span> en la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">images</span>. La columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imageable_id</span> contendrá el valor del ID del post o el usuario, mientras que la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imageable_type</span> contendrá el nombre de clase del modelo padre. La columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imageable_type</span> es usada por Eloquent para determinar cuál "tipo" de modelo padre retornar al acceder a la relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imageable</span>.</p>
  <h4>Estructura del modelo</h4>
  <p>A continuación, vamos a examinar las definiciones de modelo necesarias para construir esta relación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    /**
    * Get the owning imageable model.
    */
    public function imageable()
    {
        return \$this-&gt;morphTo();
    }
}

class Post extends Model
{
    /**
    * Get the post's image.
    */
    public function image()
    {
        return \$this-&gt;morphOne('App\Image', 'imageable');
    }
}

class User extends Model
{
    /**
    * Get the user's image.
    */
    public function image()
    {
        return \$this-&gt;morphOne('App\Image', 'imageable');
    }
}
</code></pre>

  <h4>Retornando la relación</h4>
  <p>Una vez que tu base de datos y modelos son definidos, puedes acceder a las relaciones mediante tus modelos. Por ejemplo, para retornar la imagen para un post, podemos usar la propiedad dinámica <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">image</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$post = App\Post::find(1);

\$image = \$post-&gt;image;
</code></pre>

  <p>Puedes también retornar el padre del modelo polimórfico accediendo al nombre del método que realiza la llamada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphTo</span>. En nuestro caso, éste es el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imageable</span> en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Image</span>. Entonces, accederemos al método como una propiedad dinámica:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$image = App\Image::find(1);

\$imageable = \$image-&gt;imageable;
</code></pre>

  <p>La relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imageable</span> en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Image</span> retornar ya sea una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>, dependiendo del tipo de modelo que posea la imagen.
  </p>

  <h3>Uno a muchos (Polimórfica)</h3>
  <h4>Estructura de tabla</h4>
  <p>Una relación polimórfica de uno-a-muchos es similar a una relación de uno-a-muchos sencilla; sin embargo, el modelo objetivo puede pertenecer a más de un tipo de modelo en una sola asociación. Por ejemplo, imagina que usuarios de tu aplicación pueden comentar tanto en posts como en videos. Usando relaciones polimórficas, puedes usar una sola tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">comments</span> para ambos escenarios. Primero, vamos a examinar la estructura de tabla requerida para esta relación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>posts
    id - integer
    title - string
    body - text

videos
    id - integer
    title - string
    url - string

comments
    id - integer
    body - text
    commentable_id - integer
    commentable_type - string
</code></pre>

  <h4>Estructura de modelo</h4>
  <p>A continuación, vamos a examinar las definiciones de modelos necesarias para construir esta relación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    /**
    * Get the owning commentable model.
    */
    public function commentable()
    {
        return \$this-&gt;morphTo();
    }
}

class Post extends Model
{
    /**
    * Get all of the post's comments.
    */
    public function comments()
    {
        return \$this-&gt;morphMany('App\Comment', 'commentable');
    }
}

class Video extends Model
{
    /**
    * Get all of the video's comments.
    */
    public function comments()
    {
        return \$this-&gt;morphMany('App\Comment', 'commentable');
    }
}
</code></pre>

  <h4>Retornando la relación</h4>
  <p>Una vez que tu base de datos y modelos son definidos, puedes acceder a las relaciones mediante tus modelos. Por ejemplo, para acceder a todos los comentarios de un post podemos usar la propiedad dinámica <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">comments</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$post = App\Post::find(1);

foreach (\$post-&gt;comments as \$comment) {
    //
}
</code></pre>

  <p>También puedes retornar al propietario de una relación polimórfica desde un modelo polimórfico accediendo al nombre del método que realiza la llamada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphTo</span>. En nuestro caso, éste es el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">commentable</span> en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span>. Así que, accederemos a dicho método como una propiedad dinámica:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$comment = App\Comment::find(1);

\$commentable = \$comment-&gt;commentable;
</code></pre>

  <p>La relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">commentable</span> en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> retornará ya sea una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Video</span>, dependiendo de qué tipo de modelo es el propietario del comentario.</p>

  <h3>Muchos A Muchos (Polimórfica)</h3>
  <h4>Estructura de tabla</h4>
  <p>Las relaciones polimórficas de muchos-a-muchos son un poco más complicadas que las relaciones
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphOne</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphMany</span>. Por ejemplo, un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> de un blog y un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Video</span> pueden compartir una relación polimórfica con un modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Tag</span>. Usando una relación polimórfica de muchos-a-muchos te permite tener una única lista de etiquetas que son compartidas a través de posts y videos. Primero, vamos a examinar la estructura de tabla:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>posts
    id - integer
    name - string

videos
    id - integer
    name - string

tags
    id - integer
    name - string

taggables
    tag_id - integer
    taggable_id - integer
    taggable_type - string
</code></pre>

  <h4>Estructura del modelo</h4>
  <p>Seguidamente, estamos listos para definir las relaciones en el modelo. Ambos modelos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Video</span> tendrán un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tags</span> que ejecuta el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphToMany</span> en la clase base de Eloquent:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    /**
    * Get all of the tags for the post.
    */
    public function tags()
    {
        return \$this-&gt;morphToMany('App\Tag', 'taggable');
    }
}
</code></pre>

  <h4>Definiendo el inverso de la relación</h4>
  <p>A continuación, en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Tag</span>, debes definir un método para cada uno de sus modelos relacionados. Así, para este ejemplo, definiremos un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts</span> y un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">videos</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{
    /**
    * Get all of the posts that are assigned this tag.
    */
    public function posts()
    {
        return \$this-&gt;morphedByMany('App\Post', 'taggable');
    }

    /**
    * Get all of the videos that are assigned this tag.
    */
    public function videos()
    {
        return \$this-&gt;morphedByMany('App\Video', 'taggable');
    }
}
</code></pre>

  <h4>Obteniendo la relación</h4>
  <p>Una vez que tu tabla en la base de datos y modelos son definidos, puedes acceder las relaciones por medio de tus modelos. Por ejemplo, para acceder a todos los tags de un post, puedes usar la propiedad dinámica <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tags</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$post = App\Post::find(1);

foreach (\$post-&gt;tags as \$tag) {
    //
}
</code></pre>

  <p>También puedes obtener el propietario de una relación polimórfica desde el modelo polimórfico accediendo al nombre del método que ejecutó la llamada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphedByMany</span>. En nuestro caso, estos son los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">videos</span> en el modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Tag</span>. Así, accederemos a esos métodos como propiedades dinámicas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$tag = App\Tag::find(1);

foreach (\$tag-&gt;videos as \$video) {
    //
}
</code></pre>

  <h3>Tipos polimórficos personalizados</h3>
  <p>Por defecto, Laravel usará el nombre completo de clase para almacenar el tipo del modelo relacionado. Por ejemplo, dado el ejemplo uno-a-muchos de arriba donde un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> puede pertenecer a un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> o a un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Video</span>, el
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">commentable_type</span> por defecto será <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Post</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Video</span>, respectivamente. Sin embargo, puedes querer desacoplar tu base de datos de la estructura interna de tu aplicación. En dicho caso, puedes definir un "mapa de morfología (morph map)" para indicarle a Eloquent que use un nombre personalizado para cada modelo en lugar del nombre de la clase:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Relations\Relation;

Relation::morphMap([
    'posts' =&gt; 'App\Post',
    'videos' =&gt; 'App\Video',
]);
</code></pre>

  <p>TIP</p>
  <p>Al agregar un "morph map" a tu aplicación existente, cada valor de la columna de morfología
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*_type</span> en tu base de datos que aún contenga una clase completamente calificada necesitará ser convertida a su nombre de "mapa".</p>

  <h2>Consultando relaciones</h2>
  <p>Ya que todos los tipos de relaciones Eloquent son definidas por medio de métodos, puedes ejecutar esos métodos para obtener una instancia de la relación sin ejecutar realmente las consultas de la relación. Además, todos los tipos de relaciones Eloquent también sirven como constructores de consultas, permitiendo que continues encadenando restricciones dentro de la consulta de la relación antes de ejecutar finalmente el SQL contra la base de datos.</p>
  <p>Por ejemplo, imagina un sistema de blog en el cual un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> tiene muchos modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> asociados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * Get all of the posts for the user.
    */
    public function posts()
    {
        return \$this-&gt;hasMany('App\Post');
    }
}
</code></pre>

  <p>Puedes consultar la relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts</span> y agregar limitaciones a la relación de la siguiente forma:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$user-&gt;posts()-&gt;where('active', 1)-&gt;get();
</code></pre>

  <p>Puedes usar cualquiera de los métodos de constructor de consultas y así que asegúrate de revisar la documentación del constructor de consultas para aprender sobre todos los métodos disponibles.
  </p>
  <h4>Encadenando cláusulas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhere</span> en relaciones</h4>
  <p>Como se demostró en el ejemplo superior, eres libre de agregar restriciones adicionales a las relaciones al momento de realizar peticiones. Sin embargo, ten cuidado al encadenar cláusulas
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhere</span> a una relación, dado que las cláusulas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhere</span> serán agrupadas lógicamente en el mismo nivel que la restricción de la relación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;posts()
        -&gt;where('active', 1)
        -&gt;orWhere('votes', '&gt;=', 100)
        -&gt;get();

// select * from posts
// where user_id = ? and active = 1 or votes &gt;= 100
</code></pre>

  <p>En la mayoria de los casos, probablemente pretendes usar grupos de restricciones para agrupar logicamente las comprobaciones condicionales entre parentisis:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$user-&gt;posts()
        -&gt;where(function (Builder \$query) {
            return \$query-&gt;where('active', 1)
                            -&gt;orWhere('votes', '&gt;=', 100);
        })
        -&gt;get();

// select * from posts
// where user_id = ? and (active = 1 or votes &gt;= 100)
</code></pre>

  <h3>Métodos de relación Vs. propiedades dinámicas</h3>
  <p>Si no necesitas agregar restricciones adicionales a una consulta de relación de Eloquent, puedes acceder a la relación como si fuera una propiedad. Por ejemplo, continuando con el uso de nuestros modelos de ejemplo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>, podemos acceder a todos los posts de un usuario como sigue:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

foreach (\$user-&gt;posts as \$post) {
    //
}
</code></pre>

  <p>Las propiedades dinámicas son de "carga diferida (lazy loading)", lo que significa que cargarán solamente los datos de su relación cuando realmente accedas a ellas. Debido a esto, los desarrolladores con frecuencia usan carga previa (eager loading) para precargar las relaciones que ellos saben que serán accedidas después de cargar el modelo. La carga previa proporciona una reducción significativa en consultas SQL que deben ser ejecutadas para cargar las relaciones de un modelo.</p>

  <h3>Consultando la existencia de una relación</h3>
  <p>Cuando accedes a los registros de un modelo, puedes desear limitar sus resultados basados en la existencia de una relación. Por ejemplo, imagina que quieres obtener todos los posts de blog que tienen al menos un comentario. Para hacer eso, puedes pasar el nombre de la relación a los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orHas</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Retrieve all posts that have at least one comment...
\$posts = App\Post::has('comments')-&gt;get();
</code></pre>

  <p>También puedes especificar un operador y la cantidad para personalizar aún más la consulta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Retrieve all posts that have three or more comments...
\$App/posts = Post::has('comments', '&gt;=', 3)-&gt;get();
</code></pre>

  <p>Las instrucciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span> anidadas también pueden ser construidas usando la notación de "punto". Por ejemplo, puedes obtener todos los posts que tienen al menos un comentario con votos:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Retrieve posts that have at least one comment with votes...
\$App/posts = Post::has('comments.votes')-&gt;get();
</code></pre>

  <p>Incluso si necesitas más potencia, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereHas</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhereHas</span> para poner condiciones "where" en tus consultas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span>. Estos métodos permiten que agregues restricciones personalizadas a una restricción de relación, tal como verificar el contenido de un comentario:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

// Retrieve posts with at least one comment containing words like foo%
\$posts = App\Post::whereHas('comments', function (Builder \$query) {
    \$query-&gt;where('content', 'like', 'foo%');
})-&gt;get();

// Retrieve posts with at least ten comments containing words like foo%
\$posts = App\Post::whereHas('comments', function (Builder \$query) {
    \$query-&gt;where('content', 'like', 'foo%');
}, '&gt;=', 10)-&gt;get();
</code></pre>

  <h3>Consultando la ausencia de una relación</h3>
  <p>Al momento de acceder a los registros de un modelo, puedes desear limitar tus resultados en base a la ausencia de una relación. Por ejemplo, imagina que quieras obtener todos los posts de blogs que <strong>no</strong> tienen algún comentario. Para hacer eso, puedes pasar el nombre de la relación a los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">doesntHave</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orDoesntHave</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$posts = App\Post::doesntHave('comments')-&gt;get();
</code></pre>

  <p>Incluso si necesitas más potencia, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereDoesntHave</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">orWhereDoesntHave</span> para poner condiciones "where" en tus consultas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">doesntHave</span>. Estos métodos permiten que agregues restricciones personalizadas a una restricción de relación, tal como verificar el contenido de un comentario:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$posts = Post::whereDoesntHave('comments', function (Builder \$query) {
    \$query-&gt;where('content', 'like', 'foo%');
})-&gt;get();
</code></pre>

  <p>Puedes usar notación "de puntos" para ejecutar una consulta contra una relación anidada. Por ejemplo, la siguiente consulta entregará todos los posts con comentarios de autores que no están vetados:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$posts = App\Post::whereDoesntHave('comments.author', function (Builder \$query) {
    \$query-&gt;where('banned', 1);
})-&gt;get();
</code></pre>

  <h3>Consultando relaciones polimorficas</h3>
  <p>Para consultar la existencia de relaciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MorphTo</span>, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereHasMorph</span> y sus métodos correspondientes:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

// Retrieve comments associated to posts or videos with a title like foo%...
\$comments = App\Comment::whereHasMorph(
    'commentable',
    ['App\Post', 'App\Video'],
    function (Builder \$query) {
        \$query-&gt;where('title', 'like', 'foo%');
    }
)-&gt;get();

// Retrieve comments associated to posts with a title not like foo%...
\$comments = App\Comment::whereDoesntHaveMorph(
    'commentable',
    'App\Post',
    function (Builder \$query) {
        \$query-&gt;where('title', 'like', 'foo%');
    }
)-&gt;get();
</code></pre>

  <p>Puedes usar el parametro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$type</span> para agregar diferentes restricciones dependiendo del modelo relacionado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$comments = App\Comment::whereHasMorph(
    'commentable',
    ['App\Post', 'App\Video'],
    function (Builder \$query, \$type) {
        \$query-&gt;where('title', 'like', 'foo%');
        if (\$type === 'App\Post') {
            \$query-&gt;orWhere('content', 'like', 'foo%');
        }
    }
)-&gt;get();
</code></pre>

  <p>En lugar de pasar un arreglo de posibles modelos polimorficos, puedes proporcionar un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*</span> como comodín y dejar que Laravel retorne todos los posibles tipos polimorficos desde la base de datos. Laravel ejecutará una solicitud adicional para poder realizar esta operación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$comments = App\Comment::whereHasMorph('commentable', '*', function (Builder \$query) {
    \$query-&gt;where('title', 'like', 'foo%');
})-&gt;get();
</code></pre>

  <h3>Contando modelos relacionados</h3>
  <p>Si quieres contar el número de resultados de una relación sin cargarlos realmente puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withCount</span>, el cual coloca una columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{relation}_count</span> en tus modelos resultantes. Por ejemplo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$posts = App\Post::withCount('comments')-&gt;get();

foreach (\$posts as \$post) {
    echo \$post-&gt;comments_count;
}
</code></pre>

  <p>Puedes agregar las "cuentas" para múltiples relaciones así como también agregar restricciones a las consultas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$posts = Post::withCount(['votes', 'comments' =&gt; function (\$query) {
    \$query-&gt;where('content', 'like', 'foo%');
}])-&gt;get();

echo \$posts[0]-&gt;votes_count;
echo \$posts[0]-&gt;comments_count;
</code></pre>

  <p>También puedes poner un alias al resultado de la cuenta de la relación, permitiendo múltiples cuentas en la misma relación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$posts = App/post::withCount([
    'comments',
    'comments as pending_comments_count' =&gt; function (Builder \$query) {
        \$query-&gt;where('approved', false);
    }
])-&gt;get();

echo \$posts[0]-&gt;comments_count;

echo \$posts[0]-&gt;pending_comments_count;
</code></pre>

  <p>Si estás combinando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withCount</span> con una instrucción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>, asegúrate de llamar a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withCount</span> después del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$posts = App\Post::select(['title', 'body'])-&gt;withCount('comments')-&gt;get();

echo \$posts[0]-&gt;title;
echo \$posts[0]-&gt;body;
echo \$posts[0]-&gt;comments_count;
</code></pre>

  <h2>Carga previa (eager loading)</h2>
  <p>Al momento de acceder a las relaciones Eloquent como propiedades, los datos de la relación son "cargados diferidamente (lazy loading)". Esto significa que los datos de la relación no son cargados realmente hasta que primero accedas a la propiedad. Sin embargo, Eloquent puede "cargar previamente (eager loading)" las relaciones al mismo tiempo que consultas el modelo padre. La carga previa alivia el problema de la consulta N + 1. Para ilustrar el problema de la consulta N + 1, considera un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Book</span> que está relacionado a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Author</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    /**
    * Get the author that wrote the book.
    */
    public function author()
    {
        return \$this-&gt;belongsTo('App\Author');
    }
}
</code></pre>

  <p>Ahora, vamos a obtener todos los libros y sus autores:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$books = App\Book::all();

foreach (\$books as \$book) {
    echo \$book-&gt;author-&gt;name;
}
</code></pre>

  <p>Este ciclo ejecutará una consulta para obtener todos los libros en la tabla, despues otra consulta para cada libro para obtener el autor. Así, si tenemos 25 libros, este ciclo debería ejecutar 26 consultas: 1 para el libro original y 25 consultas adicionales para obtener el autor de cada libro.</p>
  <p>Afortunadamente, podemos usar la carga previa para reducir esta operación a solo 2 consultas. Al momento de consultar, puedes especificar cuáles relaciones deberían ser precargadas usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$books = App\Book::with('author')-&gt;get();

foreach (\$books as \$book) {
    echo \$book-&gt;author-&gt;name;
}
</code></pre>

  <p>Para esta operación, solo dos consultas serán ejecutadas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>select * from books

select * from authors where id in (1, 2, 3, 4, 5, ...)
</code></pre>

  <h4>Carga previa de múltiples relaciones</h4>
  <p>Algunas veces puedes necesitar la carga previa de varias relaciones diferentes en una operación única. Para hacer eso, pasa sólo los argumentos adicionales al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$books = App\Book::with(['author', 'publisher'])-&gt;get();
</code></pre>

  <h4>Carga previa anidada</h4>
  <p>Para precargar relaciones anidadas, puedes usar la sintaxis de "punto". Por ejemplo, vamos a precargar todos los autores de los libros y todos los contactos personales del autor en una instrucción de Eloquent:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$books = App\Book::with('author.contacts')-&gt;get();
</code></pre>

  <h4>Eager Load anidado de relaciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphTo</span></h4>
  <p>Si te gustaría hacer eager load de relaciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphTo</span>, así como de relaciones anidadas en varias entidades que podrían ser retornadas por dicha relación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span> en combinación con el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphWith</span> de la relación
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphTo</span>. Para ayudarte a ilustrar este método, vamos a considerar el siguiente método:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

use Illuminate\Database\Eloquent\Model;

class ActivityFeed extends Model
{
    /**
    * Get the parent of the activity feed record.
    */
    public function parentable()
    {
        return \$this-&gt;morphTo();
    }
}
</code></pre>

  <p>En este ejemplo, vamos a asumir que los modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Èvent</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Photo</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> podrían crear moelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ActivityFeed</span>. Adicionalmente, vamos a asumir que los modelos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Event</span> pertenecen a una modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Calendar</span>, que los modelos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Photo</span> están asociados con modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Tag</span> y los modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> pertenecen a una modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Author</span>.</p>
  <p>Usando estas definiciones de modelos y relaciones, podríamos retornar instancias del modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ActivityFeed</span> y hacer eager load de todos los modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">parentable</span> y sus respectivas relaciones anidadas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Relations\MorphTo;

\$activities = ActivityFeed::query()
    -&gt;with(['parentable' =&gt; function (MorphTo \$morphTo) {
        \$morphTo-&gt;morphWith([
            Event::class =&gt; ['calendar'],
            Photo::class =&gt; ['tags'],
            Post::class =&gt; ['author'],
        ]);
    }])-&gt;get();
</code></pre>

  <h4>Cargando previamente columnas específicas</h4>
  <p>No siempre necesitas todas las columna de las relaciones que estás obteniendo. Por esta razón, Eloquent te permite que especificar cuáles columnas de la relación te gustaría obtener:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$books = App\Book::with('author:id,name')-&gt;get();
</code></pre>

  <p>Nota</p>
  <p>Al momento de usar esta característica, siempre debes incluir la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> en la lista de columnas que deseas obtener.</p>

  <p>Para relaciones "tiene muchos" necesitas especificar tanto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> como
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">foreign_key</span></p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$books = App\Book::with('chapter:id,book_id,name')-&gt;get();
</code></pre>

  <p>Nota</p>
  <p>Al usar esta caracteristica, siempre debes incluir la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> y cualquier columna de clave foranea relevante en la lista de columnas que deseas retornar.</p>

  <h4>Carga previa por defecto</h4>
  <p>Algunas veces vas a querer cargar siempre algunas relaciones al retornar un modelo. Para lograr esto, puedes definir una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$with</span> en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;
use Illuminate\Database\Eloquent\Model;

class Book extends Model
{
    /**
    * Always load the related author when retrieving a book
    * The relationships that should always be loaded.
    *
    * @var array
    */
    protected \$with = ['author'];

    /**
    * Get the author that wrote the book.
    */
    public function author()
    {
        return \$this-&gt;belongsTo('App\Author');
    }
}
</code></pre>

  <p>Si te gustaria remover un elemento de la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$with</span> para una sola petición, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">without</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$books = App\Book::without('author')-&gt;get();
</code></pre>

  <h3>Restringiendo cargas previas</h3>
  <p>Algunas veces puedes desear cargar previamente una relación, pero también especificar condiciones de consulta para la consulta de carga previa. Aquí está un ejemplo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$users = App\User::with(['posts' =&gt; function (\$query) {
    \$query-&gt;where('title', 'like', '%first%');
}])-&gt;get();
</code></pre>

  <p>En este ejemplo, Eloquent solamente precargará los posts donde la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">title</span> del post contenga la palabra <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first</span>. Puedes ejecutar otros métodos del constructor de consulta para personalizar más la operación de carga previa:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$users = App\User::with(['posts' =&gt; function (\$query) {
    \$query-&gt;orderBy('created_at', 'desc');
}])-&gt;get();
</code></pre>

  <p>Nota</p>
  <p>Los métodos del constructor de consultas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">limit</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">take</span> no se pueden usar al restringir las cargas previas.</p>

  <h3>Carga previa diferida (lazy eager loading)</h3>
  <p>Algunas veces puedes necesitar precargar una relación después de que el modelo padre ya ha sido obtenido. Por ejemplo, esto puede ser útil si necesitas decidir dinámicamente si se cargan modelos relacionados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$books = App\Book::all();

if (\$someCondition) {
    \$books-&gt;load('author', 'publisher');
}
</code></pre>

  <p>Si necesitas establecer restricciones de consultas adicionales en la consulta de carga previa, puedes pasar un arreglo clave / valor con las relaciones que deseas cargar. Los valores del arreglo deberían ser instancias de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>, las cuales reciben la instancia de consulta:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Database\Eloquent\Builder;

\$books-&gt;load(['author' =&gt; function (\$query) {
    \$query-&gt;orderBy('published_date', 'asc');
}]);
</code></pre>

  <p>Para cargar una relación solo cuando aún no se ha cargado, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadMissing</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>public function format(Book \$book)
{
    \$book-&gt;loadMissing('author');

    return [
        'name' =&gt; \$book-&gt;name,
        'author' =&gt; \$book-&gt;author-&gt;name
    ];
}
</code></pre>

  <h4>Carga previa diferida anidada y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphTo</span></h4>
  <p>Si deseas cargar previamente una relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphTo</span>, así como relaciones anidadas en las diversas entidades que pueden ser devueltas por esa relación, puedes usar el método<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loadMorph</span>.
  </p>
  <p>Este método acepta el nombre de la relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphTo</span> como su primer argumento, y un arreglo de pares modelo / relación como su segundo argumento. Para ayudar a ilustrar este método, consideremos el siguiente modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

use Illuminate\Database\Eloquent\Model;

class ActivityFeed extends Model
{
    /**
    * Get the parent of the activity feed record.
    */
    public function parentable()
    {
        return \$this-&gt;morphTo();
    }
}
</code></pre>

  <p>En este ejemplo, asumamos que los modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Event</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Photo</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> pueden crear modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ActivityFeed</span>. Además, supongamos que los modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Event</span> pertenecen a un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Calendar</span>, los modelos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Photo</span> están asociados con los modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Tag</span> y los modelos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> pertenecen a un modelo<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Author</span>.</p>
  <p>Usando estas definiciones y relaciones de modelo, podemos recuperar instancias de modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ActivityFeed</span> y cargar previamente todos los modelos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">parentables</span> y sus respectivas relaciones anidadas:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$activities = ActivityFeed::with('parentable')
    -&gt;get()
    -&gt;loadMorph('parentable', [
        Event::class =&gt; ['calendar'],
        Photo::class =&gt; ['tags'],
        Post::class =&gt; ['author'],
    ]);
</code></pre>

  <h2>Insertando y actualizando modelos relacionados</h2>

  <h3>El método save</h3>
  <p>Eloquent proporciona métodos convenientes para agregar nuevos modelos a las relaciones. Por ejemplo, quizá necesites insertar un nuevo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> para un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>. En lugar de establecer manualmente el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post_id</span> en el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span>, puedes insertar el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> directamente con el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> de la relación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$comment = new App\Comment(['message' =&gt; 'A new comment.']);

\$post = App\Post::find(1);

\$post-&gt;comments()-&gt;save(\$comment);
</code></pre>

  <p>Observa que no accedimos a la relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">comments</span> como una propiedad dinámica. En su lugar, ejecutamos el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">comments</span> para obtener una instancia de la relación. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> automáticamente agregará el valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post_id</span> apropiado al nuevo modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span>.</p>
  <p>Si necesitas guardar múltiples modelos relacionados, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saveMany</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$post = App\Post::find(1);

\$post-&gt;comments()-&gt;saveMany([
    new App\Comment(['message' =&gt; 'A new comment.']),
    new App\Comment(['message' =&gt; 'Another comment.']),
]);
</code></pre>

  <h4>Guardando modelos y relaciones recursivamente</h4>
  <p>SI quieres hacer <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> a tu modelo y a todas sus relaciones asociadas, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">push</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$post = App\Post::find(1);

\$post-&gt;comments[0]-&gt;message = 'Message';
\$post-&gt;comments[0]-&gt;author-&gt;name = 'Author Name';

\$post-&gt;push();
</code></pre>

  <h3>El método create</h3>
  <p>En adición a los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">saveMany</span>, también puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>, el cual acepta un arreglo de atributos, crea un modelo y lo inserta dentro de la base de datos. Otra vez, la diferencia entre <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> es que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> acepta una instancia de modelo Eloquent llena mientras <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> acepta un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span> PHP plano:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$post = App\Post::find(1);

\$comment = \$post-&gt;comments()-&gt;create([
    'message' =&gt; 'A new comment.',
]);
</code></pre>

  <p>TIP</p>
  <p>Antes de usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>, asegurate de revisar la documentación sobre la asignación masiva de atributos.</p>

  <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">createMany</span> para crear múltiples modelos relacionados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$post = App\Post::find(1);

\$post-&gt;comments()-&gt;createMany([
    [
        'message' =&gt; 'A new comment.',
    ],
    [
        'message' =&gt; 'Another new comment.',
    ],
]);
</code></pre>

  <p>
    También puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">findOrNew</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrNew</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstOrCreate</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateOrCreate</span> para crear y actualizar modelos en relaciones .
  </p>

  <h3>Actualizar relación pertenece a (belongsTo)</h3>
  <p>Al momento de actualizar una relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span>, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">associate</span>. Este método establecerá la clave foránea en el modelo hijo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$account = App\Account::find(10);

\$user-&gt;account()-&gt;associate(\$account);

\$user-&gt;save();
</code></pre>

  <p>Al momento de eliminar una relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span>, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dissociate</span>. Este método establecerá la clave foránea de la relación a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;account()-&gt;dissociate();

\$user-&gt;save();
</code></pre>

  <h4>Modelos predeterminados</h4>
  <p>
    Las relaciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOne</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasOneThrough</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">morphOne</span> te permiten definir un modelo predeterminado que se devolverá si la relación dada es
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>. A este patrón se le conoce comúnmente como patrón Null Object y puede ayudar a quitar comprobaciones condicionales en tu código. En el ejemplo siguiente, la relación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span> devolverá un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> vacío si no hay un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span> adjunto a la publicación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the author of the post.
*/
public function user()
{
    return \$this-&gt;belongsTo('App\User')-&gt;withDefault();
}
</code></pre>

  <p>Para rellenar el modelo predeterminado con atributos, puedes pasar un arreglo o Closure al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withDefault</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the author of the post.
*/
public function user()
{
    return \$this-&gt;belongsTo('App\User')-&gt;withDefault([
        'name' =&gt; 'Guest Author',
    ]);
}

/**
* Get the author of the post.
*/
public function user()
{
    return \$this-&gt;belongsTo('App\User')-&gt;withDefault(function (\$user) {
        \$user-&gt;name = 'Guest Author';
    });
}
</code></pre>

  <h3>Relaciones muchos a muchos</h3>
  <h4>Adjuntando (attach) / Quitando (detach)</h4>
  <p>Eloquent también proporciona unos cuantas métodos helper para hacer que el trabajo con los modelos relacionados sea más conveniente. Por ejemplo, vamos a imaginar que un usuario tiene muchos roles y un rol puede tener muchos usuarios. Para adjuntar un rol a un usuario insertando un registro en la tabla intermedia que vincula los modelos, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attach</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$user-&gt;roles()-&gt;attach(\$roleId);
</code></pre>

  <p>Al momento de adjuntar una relación a un modelo, también puedes pasar un arreglo de datos adicionales para ser insertados dentro de la tabla intermedia:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;roles()-&gt;attach(\$roleId, ['expires' =&gt; \$expires]);
</code></pre>

  <p>Algunas veces puede ser necesario quitar un rol de un usuario. Para remover un registro de una relación de muchos-a-muchos, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">detach</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">detach</span> eliminará el registro apropiado de la tabla intermedia; sin embargo, ambos modelos permanecerán en la base de datos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Detach a single role from the user...
\$user-&gt;roles()-&gt;detach(\$roleId);

// Detach all roles from the user...
\$user-&gt;roles()-&gt;detach();
</code></pre>

  <p>Por conveniencia, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attach</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">detach</span> también aceptan arreglos de IDs como entrada:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$user-&gt;roles()-&gt;detach([1, 2, 3]);

\$user-&gt;roles()-&gt;attach([
    1 =&gt; ['expires' =&gt; \$expires],
    2 =&gt; ['expires' =&gt; \$expires]
]);
</code></pre>

  <h4>Sincronizando asociaciones</h4>
  <p>También puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sync</span> para construir asociaciones muchos-a-muchos. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sync</span> acepta un arreglo de IDs para colocar en la tabla intermedia. Algunos IDs que no estén en el arreglo dado serán removidos de la tabla intermedia. Por tanto, después que esta operación se complete, solamente los IDs en el arreglo dado existirán en la tabla intermedia:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;roles()-&gt;sync([1, 2, 3]);
</code></pre>

  <p>También puedes pasar valores adicionales de tabla intermedia con los IDs:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;roles()-&gt;sync([1 =&gt; ['expires' =&gt; true], 2, 3]);
</code></pre>

  <p>Si no quieres desatar IDs existentes, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">syncWithoutDetaching</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;roles()-&gt;syncWithoutDetaching([1, 2, 3]);
</code></pre>

  <h4>Alternar asociaciones</h4>
  <p>La relación de muchos-a-muchos también proporciona un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toggle</span> el cual "alterna" el estado adjunto de los IDs dados. Si el ID está actualmente adjuntado, será removido. De igual forma, si está actualmente removido, será adjuntado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;roles()-&gt;toggle([1, 2, 3]);
</code></pre>

  <h4>Guardando datos adicionales en una tabla pivote</h4>
  <p>Al momento de trabajar con una relación de muchos-a-muchos, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">save</span> acepta un arreglo de atributos adicionales de tabla intermedia como su segundo argumento:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>App\User::find(1)-&gt;roles()-&gt;save(\$role, ['expires' =&gt; \$expires]);
</code></pre>

  <h4>Actualizando un registro en una tabla pivote</h4>
  <p>Si necesitas actualizar una fila existente en tu tabla pivote, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateExistingPivot</span>. Este método acepta la clave foránea del registro pivote y un arreglo de atributos para actualizar:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$user-&gt;roles()-&gt;updateExistingPivot(\$roleId, \$attributes);
</code></pre>

  <h2>Tocando marcas de tiempo del padre</h2>
  <p>Cuando un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsTo</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">belongsToMany</span> a otro modelo, tal como un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> el cual pertenece a un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>, algunas veces es útil actualizar la marca de tiempo del padre cuando el modelo hijo es actualizado. Por ejemplo, cuando un modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span> es actualizado, puedes querer "tocar" automáticamente la marca de tiempo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span> del <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> que lo posee. Eloquent hace esto fácil. Simplemente agrega una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">touches</span> conteniendo los nombres de las relaciones al modelo hijo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    /**
    * All of the relationships to be touched.
    *
    * @var array
    */
    protected \$touches = ['post'];

    /**
    * Get the post that the comment belongs to.
    */
    public function post()
    {
        return \$this-&gt;belongsTo('App\Post');
    }
}
</code></pre>

  <p>Ahora, cuando actualices un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Comment</span>, el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> que lo posee tendrá su columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span> actualizada también, haciéndolo más conveniente para saber cuándo invalidar una caché del modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$comment = App\Comment::find(1);

\$comment-&gt;text = 'Edit to this comment!';

\$comment-&gt;save();
</code></pre>
</div>
""";