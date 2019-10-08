import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuRutas extends StatelessWidget {
  final String title;
  FuRutas(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuRutas,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuRutas = """
<div style='font-size: 14.2px;'>
<h1>Rutas</h1>
<ul>
    <li>
        Rutas básicas
        <ul>
            <li>Redireccionar rutas</li>
            <li>Las rutas de vistas</li>
        </ul>
    </li>
    <li>
        Los parámetros de rutas
        <ul>
            <li>Los parámetros requeridos</li>
            <li>Los parámetros opcionales</li>
            <li>Las restricciones de expresiones regulares</li>
        </ul>
    </li>
    <li>Las rutas nombradas</li>
    <li>
        Los grupos de ruta
        <ul>
            <li>Los middleware</li>
            <li>Los espacios de nombres</li>
            <li>Enrutamiento de subdominios</li>
            <li>Los prefijos de ruta</li>
            <li>Los prefijos por nombre de ruta</li>
        </ul>
    </li>
    <li>
        Enlazamiento de modelo de ruta (route model binding)
        <ul>
            <li>Enlazamiento implícito</li>
            <li>Enlazamiento explícito</li>
        </ul>
    </li>
    <li>Rutas Fallback</li>
    <li>Límite de rango</li>
    <li>La suplantación del método del formulario</li>
    <li>Accediendo la ruta actual</li>
</ul>
<p></p>
<h2>Rutas básicas</h2>
<p>Las rutas de Laravel más básicas aceptan una URI y una <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>,
    proporcionando un método muy fácil y expresivo de definición de rutas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('foo', function () {
    return 'Hello World';
});
</code></pre>

<h4>Los archivos de ruta predeterminados</h4>
<p>Todas las rutas de Laravel están definidas en tus archivos de ruta, los cuales están localizados
    en el directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes</span>.
    Estos archivos son cargados automáticamente por el framework. El archivo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes\web.php</span>
    define rutas que son para tu interface web. Estas rutas son asignadas al grupo de middleware
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>, el
    cual proporciona características como estado de sesión y protección CSRF. Las rutas en <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes\api.php</span>
    son independientes de estado y son asignadas al grupo de middleware <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api</span>.
</p>
<p>Para las principales aplicaciones, empezarás definiendo rutas en tu archivo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/web.php</span>.
    Las rutas definidas en <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/web.php</span>
    pueden ser accedidas colocando la URL de la ruta definida en tu navegador. Por ejemplo, puede
    acceder a la siguiente ruta al navegar a <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://your-app.dev/user</span>
    en tu navegador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/user', 'UserController@index');
</code></pre>

<p>Las rutas definidas en el archivo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/api.php</span>
    son agrupadas dentro de un grupo de ruta por el <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>.Dentro
    de este grupo, el prefijo de URI <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/api</span>
    es aplicado automáticamente de modo que no es necesario aplicarlo manualmente en todas las rutas
    en el archivo. Puedes modificar el prefijo y otras opciones de grupos de ruta al modificar tu
    clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>.
</p>
<h4>Métodos disponibles del enrutador</h4>
<p>El enrutador permite que registres rutas que responden a cualquier verbo HTTP:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get(\$uri, \$callback);
Route::post(\$uri, \$callback);
Route::put(\$uri, \$callback);
Route::patch(\$uri, \$callback);
Route::delete(\$uri, \$callback);
Route::options(\$uri, \$callback);
</code></pre>

<p>Algunas veces puede que necesites registrar una ruta que responda a verbos HTTP múltiples. Puedes
    hacerlo usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">match</span>.
    También, puedes incluso registrar una ruta que responda a todos los verbos HTTP usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">any</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::match(['get', 'post'], '/', function () {
    //
});

Route::any('/', function () {
    //
});
</code></pre>

<h4>Protección CSRF</h4>
<p>
    Cualquiera de los formularios HTML que apunten a rutas <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">POST</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PUT</span>, or
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DELETE</span>
    que sean definidas en el archivo de rutas <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>
    deberían incluir un campo de token CSRF. De otra manera, la solicitud será rechazada. Puedes
    leer más sobre protección CSRF en la
    documentación de CSRF
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;form method="POST" action="/profile"&gt;
    {{ csrf_field() }}
    ...
&lt;/form&gt;
</code></pre>

<p></p>
<h3>Redireccionar rutas</h3>
<p>Si estás definiendo una ruta que redirecciona a otra URI, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::redirect</span>.
    Este método proporciona una forma abreviada conveniente de modo que no tengas que definir una
    ruta completa o de controlador para ejecutar una redirección básica:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::redirect('/here', '/there');
</code></pre>

<p>Por defecto, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::redirect</span>
    retorna un código de estado <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">302</span>.
    Puedes personalizar el código de estado usando el tercer parámetro opcional:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::redirect('/here', '/there', 301);
</code></pre>

<p>Puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::permanentRedirect</span>
    para retornar un código de estado <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">301</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::permanentRedirect('/here', '/there');
</code></pre>

<p></p>
<h3>Rutas de vista</h3>
<p>Si tu ruta necesita solamente devolver una vista, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::view</span>.
    Igual que el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirect</span>,
    este método proporciona una forma abreviada básica de modo que no tengas que definir una ruta
    completa o de controlador. El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>
    acepta una URI como su primer argumento y un nombre de vista como su segundo argumento. Además,
    puedes proporcionar una arreglo de datos para pasar a la vista como un tercer argumento
    opcional:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::view('/welcome', 'welcome');

Route::view('/welcome', 'welcome', ['name' =&gt; 'Taylor']);
</code></pre>

<p></p>
<h2>Parámetros de ruta</h2>
<p></p>
<h3>Parámetros requeridos</h3>
<p>Con frecuencia necesitarás capturar segmentos de la URI dentro de tu ruta. Por ejemplo, puedes
    necesitar capturar un ID de usuario de la URL. Puedes hacer eso al definir los parámetros de
    ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/{id}', function (\$id) {
    return 'User '.\$id;
});
</code></pre>

<p>Puedes definir tantos parámetros de ruta como requieras para tu ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('posts/{post}/comments/{comment}', function (\$postId, \$commentId) {
    //
});
</code></pre>

<p>Los parámetros de ruta siempre son encerrados dentro de <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{}</span>,
    deberían consistir de caracteres alfabéticos y no pueden contener un caracter <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-</span>. En
    lugar de usar el caracter <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-</span>, use
    el guión bajo (<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_</span>).
    Los parámetros de ruta son inyectados dentro de las funciones de retorno de ruta / controlador
    en base a su orden - los nombres de los argumentos de la función de retorno / controlador no
    importan.</p>
<p></p>
<h3>Parámetros opcionales</h3>
<p>Ocasionalmente puede que necesites especificar un parámetro de ruta, pero que aparezca como un
    parámetro opcional de esa ruta. Puedes hacer eso al colocar un signo de interrogación <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">?</span>
    después del nombre del parámetro. Asegúrate de dar un valor por defecto a la variable
    correspondiente de la ruta.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/{name?}', function (\$name = null) {
    return \$name;
});

Route::get('user/{name?}', function (\$name = 'John') {
    return \$name;
});
</code></pre>

<p></p>
<h3>Restricciones con expresiones regulares</h3>
<p>Puedes restringir el formato de tus parámetros de ruta usando el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> en
    una instancia de ruta. El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>
    acepta el nombre del parámetro y una expresión regular que defina cómo el parámetro debería
    estar conformado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/{name}', function (\$name) {
    //
})-&gt;where('name', '[A-Za-z]+');

Route::get('user/{id}', function (\$id) {
    //
})-&gt;where('id', '[0-9]+');

Route::get('user/{id}/{name}', function (\$id, \$name) {
    //
})-&gt;where(['id' =&gt; '[0-9]+', 'name' =&gt; '[a-z]+']);
</code></pre>

<p></p>
<h4>Restricciones globales</h4>
<p>Si prefieres que un parámetro de ruta siempre esté restringido por una expresión regular dada,
    puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pattern</span>.
    Deberías definir estos patrones en el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Definir los enlaces de modelo de tus rutas, patrones, filtros, etc.
*
* @return void
*/
public function boot()
{
    Route::pattern('id', '[0-9]+');

    parent::boot();
}
</code></pre>

<p>Una vez que el patrón ha sido definido, es aplicado automáticamente a todas las rutas que usen
    ese nombre de parámetro:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/{id}', function (\$id) {
    // Only executed if {id} is numeric...
});
</code></pre>

<p></p>
<h4>Slashes codificados</h4>
<p>El componente de rutas de Laravel permite todos los caracteres excepto <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/</span>. Debes
    explícitamente permitir que <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/</span> sea
    parte de tu placeholder usando una expresión regular de la condición <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('search/{search}', function (\$search) {
    return \$search;
})-&gt;where('search', '.*');
</code></pre>


<p>Nota</p>
<p>Los slashes codificados sólo están soportados dentro del último segmento de la ruta.</p>


<p></p>
<h2>Rutas nombradas</h2>
<p>Las rutas nombradas permiten la generación de URLs o redirecciones para rutas específicas de una
    forma conveniente. Puedes especificar un nombre para una ruta al encadenar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span>
    en la definición de la ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/profile', function () {
    //
})-&gt;name('profile');
</code></pre>

<p>También puedes especificar los nombes de ruta para acciones de controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/profile', 'UserController@showProfile')-&gt;name('profile');
</code></pre>

<h4>Generación de URLs para las rutas nombradas</h4>
<p>Una vez que has asignado un nombre a una ruta dada, puedes usar el nombre de la ruta cuando estás
    generando URLs o redireccionas por medio de la función <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>
    global:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Generating URLs...
\$url = route('profile');

// Generando Redirecciones...
return redirect()-&gt;route('profile');
</code></pre>

<p>Si la ruta nombrada posee parámetros, puedes pasar los parámetros como el segundo argumento de la
    función <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>.
    Los parámetros dados serán insertados automáticamente dentro de la URL en sus posiciones
    correctas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/{id}/profile', function (\$id) {
    //
})-&gt;name('profile');

\$url = route('profile', ['id' =&gt; 1]);
</code></pre>

<h4>Inspeccionando la ruta actual</h4>
<p>Si requieres determinar si la solicitud actual fue enrutada por una ruta nombrada dada, puedes
    usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">named</span>
    en una instancia de Ruta. Por ejemplo, puedes verficar el nombre de ruta actual desde el
    middleware de una ruta.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Manejar una solicitud entrante.
*
* @param  \Illuminate\Http\Request  \$request
* @param  \Closure  \$next
* @return mixed
*/
public function handle(\$request, Closure \$next)
{
    if (\$request-&gt;route()-&gt;named('profile')) {
        //
    }

    return \$next(\$request);
}
</code></pre>

<p></p>
<h2>Los grupos de ruta</h2>
<p>Los grupos de ruta permiten que tu compartas atributos de ruta, tales como los middleware o los
    espacios de nombres, a través de un número grande de rutas sin necesidad de definir esos
    atributos en cada ruta individual. Los atributos compartidos son especificados en un formato de
    arreglo como el primer parámetro al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::group</span>.
</p>
<p>Los grupos anidados intentan "fusionar" de forma inteligente los atributos al grupo de sus
    padres. Los middleware y condiciones <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>
    son mezcladas (merged) mientras que los nombres, nombres de espacio y prefijos son agregados
    (appended). Las delimitaciones de nombres de espacio y los slashes en los prefijos de URLs son
    automáticamente agregados cuando es apropiado.</p>
<p></p>
<h3>Los middleware</h3>
<p>Para asignar los middleware a todas las rutas dentro de un grupo, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">middleware</span>
    antes de la definición del grupo. Los middleware son ejecutados en base al orden en el cual son
    listados en el arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::middleware(['first', 'second'])-&gt;group(function () {
    Route::get('/', function () {
        // Uses first &amp; second Middleware
    });

    Route::get('user/profile', function () {
        // Uses first &amp; second Middleware
    });
});
</code></pre>

<p></p>
<h3>Los espacios de nombres</h3>
<p>Otro uso común para los grupos de ruta es la asignación del mismo espacio de nombre de PHP a un
    grupo de controladores usando el métod <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">namespace</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::namespace('Admin')-&gt;group(function () {
    // Controladores dentro del espacio de nombre "App\Http\Controllers\Admin"
});
</code></pre>

<p>Recuerda que por defecto, el <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>
    incluye tus archivos de ruta dentro de un grupo de espacio de nombre, permitiéndote que
    registres rutas de controlador sin especificar el prefijo de espacio de nombre <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers</span>
    completo. Así, puedes necesitar especificar solamente la porción del espacio de nombre que viene
    después del espacio de nombre <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers</span>
    base.</p>
<p></p>
<h3>El enrutamiento de subdominio</h3>
<p>Los grupos de ruta también pueden ser usados para manejar enrutamiento de sub-dominio. Los
    Sub-dominios pueden ser asignados a parámetros de ruta justamente como URIs de ruta,
    permitiendote que captures una porción del sub-dominio para uso en tu ruta o controlador. El
    sub-dominio puede ser especificado al ejecutar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">domain</span>
    antes de definir el grupo.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::domain('{account}.myapp.com')-&gt;group(function () {
    Route::get('user/{id}', function (\$account, \$id) {
        //
    });
});
</code></pre>


<p>Nota</p>
<p>Para asegurarte de que tus rutas de subdominios son accesibles, debes registrar rutas de
    subdominios antes de registrar rutas de dominio principal. Esto evitará que las rutas
    princripales sobrescriban rutas de subdominios que tienen la misma URI.</p>

<p></p>
<h3>Prefijos de rutas</h3>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">prefix</span>
    puede ser usado para poner un prefijo a cada ruta en el grupo con una URI dada. Por ejemplo,
    puedes desear poner un prefijo a todas las URIs de ruta dentro del grupo con <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">admin</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::prefix('admin')-&gt;group(function () {
    Route::get('users', function () {
        // Coincide con la URL "/admin/users"
    });
});
</code></pre>

<p></p>
<h3>Los prefijos de nombre de ruta</h3>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> puede
    ser usado para poner prefijo a cada nombre de ruta en el grupo con una cadena dada. Por ejemplo,
    puedes desear poner prefijo a todos los nombres de ruta agrupados con <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">admin</span>.
    La cadena dada es prefijada al nombre de ruta exactamente cómo es especificada, así que nos
    aseguraremos de proporcionar el caracter de terminación <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.</span> en
    el prefijo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::name('admin.')-&gt;group(function () {
    Route::get('users', function () {
        // Nombre asignado de ruta "admin.users"...
    });
});
</code></pre>

<p></p>
<h2>Enlazamiento de modelo de ruta (route model binding)</h2>
<p>Cuando estamos inyectando un ID de modelo a una ruta o acción de controlador, usualmente
    consultarás para obtener el modelo que corresponde a esa ID. El enlazamiento de modelo de ruta
    de Laravel proporciona una forma conveniente de inyectar directamente las instancias del modelo
    en tus rutas. Por ejemplo, en lugar de inyectar un ID de usuario, puedes inyectar la instancia
    del modelo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>
    completa que coincida con el ID dado.</p>
<p></p>
<h3>Enlazamiento implícito</h3>
<p>Laravel resuelve automáticamente los modelos de Eloquent en rutas o acciones de controlador cuyos
    nombres de variables declaradas coincidan con un nombre de segmento de ruta. Por ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('api/users/{user}', function (App\User \$user) {
    return \$user-&gt;email;
});
</code></pre>

<p>Debido a que la variable <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$user</span>
    está declarada como el modelo de Eloquent <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span>
    y el nombre de variable coincide con el segmento de URI <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{user}</span>,
    Laravel inyectará automáticamente la instancia del modelo que tenga un ID coincidiendo con el
    valor correspondiente en la URI de la solicitud. Si una instancia del modelo que coincida no es
    encontrada en la base de datos, una respuesta HTTP 400 será generada automáticamente.</p>
<h4>Personalizando el nombre de clave</h4>
<p>Si prefieres que el enlazamiento del modelo use una columna de base de datos distinta del <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> cuando
    estás obteniendo una clase de modelo dada, puedes sobreescribir el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getRouteKeyName</span>
    en el módelo de Eloquent:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Obtener la clave de la ruta para el modelo.
*
* @return string
*/
public function getRouteKeyName()
{
    return 'slug';
}
</code></pre>

<p></p>
<h3>Enlazamiento explícito</h3>
<p>Para registrar un enlazamiento explícito, usa el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">model</span> del
    enrutador para especificar la clase para un parámetro dado. Deberías definir tu enlazamiento del
    modelo explícito en el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>public function boot()
{
    parent::boot();

    Route::model('user', App\User::class);
}
</code></pre>

<p>Seguido, define una ruta que contenga un parámetro <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{user}</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('profile/{user}', function (App\User \$user) {
    //
});
</code></pre>

<p>Debido a que hemos enlazado todos los parámetros de <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{user}</span> al
    modelo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span>,
    una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>
    será inyectada dentro de la ruta. Así, por ejemplo, una solicitud a <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">profile/1</span>
    inyectará la instancia de la base de datos la cual tiene una ID de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">1</span>.</p>
<p>Si una instancia de modelo que coincida no es encontrada en la base de datos, una respuesta HTTP
    404 será generada automáticamente.</p>
<h4>Personalizando la lógica de resolución</h4>
<p>Si deseas usar tu propia lógica de resolución, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::bind</span>.
    La <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>
    que pases al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bind</span>
    recibirá el valor del segmento de URI y debería devolver la instancia de la clase que debería
    ser inyectada dentro de la ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Bootstrap any application services.
*
* @return void
*/
public function boot()
{
    parent::boot();

    Route::bind('user', function (\$value) {
        return App\User::where('name', \$value)-&gt;first() ?? abort(404);
    });
}
</code></pre>

<p>Como alternativa, puedes sobreescribir el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resolveRouteBinding</span>
    en tu modelo Eloquent. Este método recibirá el valor del segmento URI y debe devolver la
    instancia de la clase que se debe inyectar en la ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Retrieve the model for a bound value.
*
* @param  mixed  \$value
* @return \Illuminate\Database\Eloquent\Model|null
*/
public function resolveRouteBinding(\$value)
{
    return \$this-&gt;where('name', \$value)-&gt;first() ?? abort(404);
}
</code></pre>

<p></p>
<h2>Rutas fallback</h2>
<p>Usando el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::fallback</span>,
    puedes definir una ruta que será ejecutada cuando ninguna otra ruta coincida con la petición
    entrante. Típicamente, las peticiones no gestionadas automáticamente mostrarán una página 404 a
    través del manejador de excepciones de tu aplicación. Sin embargo, ya que puedes definir la ruta
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fallback</span>
    dentro de tu archivo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/web.php</span>,
    todo middleware en el grupo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>
    aplicará a la ruta. Eres libre de añadir middleware adicionales a esta ruta de ser necesario:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::fallback(function () {
    //
});
</code></pre>


<p>Nota</p>
<p>La ruta alternativa siempre debe ser la última ruta registrada por tu aplicación.</p>

<p></p>
<h2>Límite de rango</h2>
<p>Laravel incluye un middleware para limitar el rango de acceso a rutas dentro de tu aplicación.
    Para empezar, asigna el middleware <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">throttle</span>
    a una ruta o grupo de rutas. EL middleware <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">throttle</span>
    acepta dos parámetros que determinan el máximo número de peticiones que pueden hacerse en un
    número de minutos dado. Por ejemplo, específiquemos que un usuario autenticado puede acceder al
    siguiente grupo de rutas sesenta veces por minuto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::middleware('auth:api', 'throttle:60,1')-&gt;group(function () {
    Route::get('/user', function () {
        //
    });
});
</code></pre>

<h4>Limite de rango dinámico</h4>
<p>Puedes especificar un máximo de peticiones dinámicas basado en un atribto del modelo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>
    autenticado. Por ejemplo, si tu modelo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>
    contiene un atributo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rate_limit</span>,
    puedes pasar el nombre del atributo al middleware <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">throttle</span>
    de modo que sea usado para calcular el conteo máximo de peticiones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::middleware('auth:api', 'throttle:rate_limit,1')-&gt;group(function () {
    Route::get('/user', function () {
        //
    });
});
</code></pre>

<p></p>
<h2>La suplantación de método del formulario</h2>
<p>Los formularios HTML no soportan acciones <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PUT</span>, <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PATCH</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DELETE</span>.
    Así que, cuando estés definiendo rutas <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PUT</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PATCH</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DELETE</span>
    que son llamadas desde un formulario HTML, necesitarás agregar un campo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_method</span>
    oculto para el formulario. El valor enviado con el campo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_method</span>
    será usado como el método de solicitud HTTP:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;form action="/foo/bar" method="POST"&gt;
    &lt;input type="hidden" name="_method" value="PUT"&gt;
    &lt;input type="hidden" name="_token" value="{{ csrf_token() }}"&gt;
&lt;/form&gt;
</code></pre>

<p>Puedes usar la directiva Blade <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@method</span>
    para generar la entrada <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_method</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;form action="/foo/bar" method="POST"&gt;
    @method('PUT')
    @csrf
&lt;/form&gt;
</code></pre>

<p></p>
<h2>Accesando la ruta actual</h2>
<p>Puedes usar los métodos <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">current</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">currentRouteName</span>,
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">currentRouteAction</span>
    en la clase facade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route</span>
    para accesar la información sobre el manejador de ruta de la solicitud entrante:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$route = Route::current();

\$name = Route::currentRouteName();

\$action = Route::currentRouteAction();
</code></pre>

<p>
    Consulta la documentación de la API sobre la

    clase subyacente de la clase facade <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route</span>


    y la

    instancia de ruta

    para revisar todos los métodos disponibles.
</p>
</div>
""";