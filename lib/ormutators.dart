import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class OrMutators extends StatelessWidget {
  final String title;
  OrMutators(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmOrMutators,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmOrMutators = """
<!-- Eloquent: Mutators -->
<div style='font-size: 14.2px;'>
  <h1>Eloquent: Mutators</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Accesadores y mutadores
      <ul>
        <li>Definiendo un accesador</li>
        <li>Definiendo un mutador</li>
      </ul>
    </li>
    <li>Mutadores de fecha</li>
    <li>
      Conversión de atributos
      <ul>
        <li>Conversión de arreglos y JSON</li>
        <li>Conversión de fechas</li>
      </ul>
    </li>
  </ul>

  <h2>Introducción</h2>
  <p>Los accesadores y mutadores permiten que des formato a los valores de atributos de Eloquent cuando los obtienes o estableces en las instancias de modelo. Por ejemplo, puede que te guste usar el encriptador de Laravel para cifrar un valor mientras es almacenado en la base de datos y después descifrar automáticamente el atributo cuando accedes a él en un modelo de Eloquent.</p>
  <p>
    Además de los accesadores y los mutadores personalizados, Eloquent también puede convertir automáticamente campos de fecha a instancias Carbon
    <outboundlink></outboundlink>
    o incluso convertir campos de texto a JSON.
  </p>

  <h2>Accesadores y mutadores</h2>

  <h3>Definiendo un accesador</h3>
  <p>Para definir un accesador crea un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getFooAttribute</span> en tu modelo, donde <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Foo</span> es el nombre de la columna que deseas acceder en el formato Studly Case (Primera letra de cada palabra en mayúscula). En este ejemplo, definiremos un accesador para el atributo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first_name</span>. El accesador automáticamente será ejecutado por Eloquent al momento de intentar obtener el valor del atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first_name</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * Get the user's first name.
    *
    * @param  string  \$value
    * @return string
    */
    public function getFirstNameAttribute(\$value)
    {
        return ucfirst(\$value);
    }
}
</code></pre>

  <p>Como puedes ver, el valor original de la columna es pasado al accesador, permitiéndote manipular y devolver el valor. Para acceder al valor del accesador, puedes acceder al atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first_name</span> en una instancia del modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$firstName = \$user-&gt;first_name;
</code></pre>

  <p>También puedes usar accesadores para retornar nuevos valores computados de atributos existentes:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the user's full name.
*
* @return string
*/
public function getFullNameAttribute()
{
    return "{\$this-&gt;first_name} {\$this-&gt;last_name}";
}
</code></pre>

  <p>TIP</p>
  <p>
    Si deseas que estos valores computados sean agregados a las representaciones de arreglo / JSON de tu modelo, necesitarás adjuntarlos
    <outboundlink></outboundlink>
    .
  </p>

  <h3>Definiendo un mutador</h3>
  <p>Para definir un mutador, define un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">setFooAttribute</span> en tu modelo, donde <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Foo</span> es el nombre de la columna que deseas acceder en el formato Studly Case (Primera letra de cada palabra en mayúscula). Así, otra vez, vamos a definir un mutador para el atributo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first_name</span>. Este mutador será ejecutado automáticamente cuando intentamos establecer el valor del atributo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first_name</span> en el modelo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * Set the user's first name.
    *
    * @param  string  \$value
    * @return void
    */
    public function setFirstNameAttribute(\$value)
    {
        \$this-&gt;attributes['first_name'] = strtolower(\$value);
    }
}
</code></pre>

  <p>El mutador recibirá el valor que está siendo establecido en el atributo, permitiéndote manipular el valor y establecer el valor manipulado en la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$attributes</span> interna del modelo Eloquent. Así, por ejemplo, si intentamos establecer el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first_name</span> como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Sally</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$user-&gt;first_name = 'Sally';
</code></pre>

  <p>En este ejemplo, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">setFirstNameAttribute</span> será ejecutada con el valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Sally</span>. El mutador entonces aplicará la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">strtolower</span> al nombre y establecerá su valor resultante en el arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$attributes</span> interno.</p>

  <h2>Mutadores de fecha</h2>
  <p>
    De forma predeterminada, Eloquent convertirá las columnas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span> a instancias de Carbon , la cual extiende la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DateTime</span> de PHP para proporcionar una variedad de métodos útiles. Puedes agregar atributos de fecha adicionales estableciendo la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$dates</span> de tu modelo.
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * The attributes that should be mutated to dates.
    *
    * @var array
    */
    protected \$dates = [
        'seen_at',
    ];
}
</code></pre>

  <p>TIP</p>
  <p>Puedes desactivar las marcas de tiempo (timestamps) predeterminadas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">created_at</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updated_at</span> configurando la propiedad pública <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$timestamps</span> de tu modelo en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>.</p>

  <p>Cuando una columna es considerada una fecha, puedes establecer su valor a una marca de tiempo UNIX, cadena de fecha (<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Y-m-d</span>), cadena fecha-hora o una instancia
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DateTime</span> / <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Carbon</span>. El valor de la fecha será convertido y almacenado correctamente en tu base de datos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$user-&gt;deleted_at = now();

\$user-&gt;save();
</code></pre>

  <p>
    Como se apreció anteriormente, al momento de obtener atributos que están listados en tu propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$dates</span>, éstos serán automáticamente convertidos a instancias Carbon , permitiendo que uses cualquiera de los métodos de Carbon en tus atributos:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

return \$user-&gt;deleted_at-&gt;getTimestamp();
</code></pre>

  <h4>Formatos de fecha</h4>
  <p>De forma predeterminada, las marcas de tiempo son formateadas como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">'Y-m-d H:i:s'</span>. Si necesitas personalizar el formato de marca de tiempo, establece la propiedad
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$dateFormat</span> en tu modelo. Esta propiedad determina como los atributos de fecha son almacenados en la base de datos así como también su formato cuando el modelo es serializado a un arreglo o JSON:</p>

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

  <h2>Conversión (casting) de atributos</h2>
  <p>La propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$casts</span> en tu modelo proporciona un método conveniente de convertir atributos a tipos de datos comunes. La propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$casts</span> debería ser un arreglo donde la clave es el nombre del atributo que está siendo convertido y el valor es el tipo al que deseas convertir la columna. Los tipos de conversión soportados son: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">integer</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">real</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">float</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">double</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decimal:&lt;digits&gt;</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">string</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boolean</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">object</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collection</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">date</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">datetime</span>, and <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">timestamp</span>. Al convertir en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decimal</span>, debes definir el número de digitos (<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decimal:2</span>).</p>
  <p>Para demostrar la conversión de atributos, vamos a convertir el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">is_admin</span>, el cual es almacenado en nuestra base de datos como un entero (<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">0</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">1</span>) a un valor booleano:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * The attributes that should be cast to native types.
    *
    * @var array
    */
    protected \$casts = [
        'is_admin' =&gt; 'boolean',
    ];
}
</code></pre>

  <p>Ahora el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">is_admin</span> será siempre convertido a un booleano cuando lo accedas, incluso si el valor subyacente es almacenado en la base de datos como un entero:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

if (\$user-&gt;is_admin) {
    //
}
</code></pre>

  <h3>Conversión de arreglos y JSON</h3>
  <p>El tipo de conversión <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span> es particularmente útil al momento de trabajar con columnas que son almacenadas como JSON serializado. Por ejemplo, si tu base de datos tiene un tipo de campo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">JSON</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">TEXT</span> que contiene JSON serializado, agregar la conversión <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span> a ese atributo deserializará automáticamente el atributo a un arreglo PHP cuando lo accedas en tu modelo Eloquent:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User extends Model
{
    /**
    * The attributes that should be cast to native types.
    *
    * @var array
    */
    protected \$casts = [
        'options' =&gt; 'array',
    ];
}
</code></pre>

  <p>Una vez que la conversión es definida, puedes acceder al atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">options</span> y será automáticamente deserializado desde JSON a un arreglo PHP. Cuando establezcas el valor del atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">options</span>, el arreglo dado será automáticamente serializado de vuelta en JSON para almacenamiento:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$options = \$user-&gt;options;

\$options['key'] = 'value';

\$user-&gt;options = \$options;

\$user-&gt;save();
</code></pre>

  <h3>Conversión de fechas</h3>
  <p>Al usar el tipo de conversión <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">date</span> o<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">datetime</span>, puedes especificar el formato de la fecha. Este formato se utilizará cuando el modelo se serializa a un arreglo o JSON:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* The attributes that should be cast to native types.
*
* @var array
*/
protected \$casts = [
    'created_at' =&gt; 'datetime:Y-m-d',
];
</code></pre>
</div>
""";