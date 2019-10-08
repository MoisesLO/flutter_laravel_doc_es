import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuControladores extends StatelessWidget {
  final String title;
  FuControladores(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuControladores,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuControladores = """
<div style='font-size: 14.2px;'>
<h1>Controladores</h1>
<ul>
    <li>Introducción</li>
    <li>
        Controladores básicos
        <ul>
            <li>Definiendo controladores</li>
            <li>Controladores y espacios de nombres</li>
            <li>Controladores de acción única</li>
        </ul>
    </li>
    <li>Middleware de controlador</li>
    <li>
        Controladores de recursos
        <ul>
            <li>Rutas de recursos parciales</li>
            <li>Nombrando rutas de recursos</li>
            <li>Nombrando parámetros de rutas de recursos</li>
            <li>Configuración regional para URIs de recursos</li>
            <li>Complementando controladores de recursos</li>
        </ul>
    </li>
    <li>Inyección de dependencias y controladores</li>
    <li>Caché de rutas</li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>En lugar de definir toda la lógica de manejo de solicitud como Closure en archivos de ruta,
    puedes desear organizar este comportamiento usando clases Controller. Los controladores pueden
    agrupar la lógica de manejo de solicitud relacionada dentro de una sola clase. Los controladores
    son almacenados en el directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Controllers</span>.
</p>
<p></p>
<h2>Controladores básicos</h2>
<p></p>
<h3>Definiendo controladores</h3>
<p>A continuación se muestra un ejemplo de una clase de controlador básica. Nota que el controlador
    extiende la clase de controlador base incluida con Laravel. La clase base proporciona unos
    cuantos métodos de conveniencia tal como el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">middleware</span>,
    el cual puede ser usado para conectar un middleware a acciones de controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\User;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
    * Show the profile for the given user.
    *
    * @param  int  \$id
    * @return View
    */
    public function show(\$id)
    {
        return view('user.profile', ['user' =&gt; User::findOrFail(\$id)]);
    }
}
</code></pre>

<p>Puedes definir una ruta a esta acción de controlador de esta forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/{id}', 'UserController@show');
</code></pre>

<p>Ahora, cuando una solicitud coincide con la URI de la ruta especificada, se ejecutará el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">show</span> de
    la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserController</span>.
    Los parámetros de ruta también se pasarán al método.</p>

<p>TIP</p>
<p>Los controladores no están <strong>obligados</strong> a extender de la clase base. Sin embargo,
    no tendrás acceso a características de conveniencia tales como los métodos <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">middleware</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validate</span>,
    y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dispatch</span>.
</p>


<p></p>
<h3>Controladores y espacios de nombres</h3>
<p>Es muy importante notar que no necesitamos especificar el espacio de nombre completo del
    controlador al momento de definir la ruta del controlador. Debido a que el <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span>
    carga sus archivos de ruta dentro de un grupo de ruta que contiene el espacio de nombre,
    solamente necesitaremos la porción del nombre de la clase que viene después de la porción <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers</span>
    del espacio de nombre.</p>
<p>Si eliges anidar tus controladores dentro del directorio <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers</span>,
    usa el nombre de clase específico relativo al espacio de nombre raíz <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers</span>.
    Así, si tu clase de controlador completa es <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers\Photos\AdminController</span>,
    deberías registrar rutas al controlador de esta forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('foo', 'Photos\AdminController@method');
</code></pre>

<p></p>
<h3>Controladores de acción única</h3>
<p>Si prefieres definir un controlador que maneja solamente una acción única, debes colocar un único
    método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__invoke</span>
    en el controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\User;
use App\Http\Controllers\Controller;

class ShowProfile extends Controller
{
    /**
    * Show the profile for the given user.
    *
    * @param  int  \$id
    * @return View
    */
    public function __invoke(\$id)
    {
        return view('user.profile', ['user' =&gt; User::findOrFail(\$id)]);
    }
}
</code></pre>

<p>Al momento de registrar rutas para controladores de acción única, no necesitarás especificar un
    método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('user/{id}', 'ShowProfile');
</code></pre>

<p>Puedes generar un controlador invocable usando la opción <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--invokable</span>
    del comando Artisan <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:controller</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:controller ShowProfile --invokable
</code></pre>

<p></p>
<h2>Middleware de controlador</h2>
<p>Los Middleware pueden ser asignados a las rutas del controlador en tus archivos de ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('profile', 'UserController@show')-&gt;middleware('auth');
</code></pre>

<p>Sin embargo, es más conveniente especificar los middleware dentro del constructor de tu
    controlador. Usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">middleware</span>
    del constructor de tu controlador, puedes asignar fácilmente los middleware a la acción del
    controlador. Incluso puedes restringir los middleware a sólo ciertos métodos en la clase del
    controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>class UserController extends Controller
{
    /**
    * Instantiate a new controller instance.
    *
    * @return void
    */
    public function __construct()
    {
        \$this-&gt;middleware('auth');

        \$this-&gt;middleware('log')-&gt;only('index');

        \$this-&gt;middleware('subscribed')-&gt;except('store');
    }
}
</code></pre>

<p>También los controladores permiten que registres los middleware usando una Closure. Esto
    proporciona una forma conveniente de definir un middleware para un solo controlador sin definir
    una clase middleware completa:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;middleware(function (\$request, \$next) {
    // ...

    return \$next(\$request);
});
</code></pre>


<p>TIP</p>
<p>Puedes asignar los middleware a un subconjunto de acciones de controlador, esto puede indicar que
    tu controlador está creciendo demasiado. En lugar de esto, considera dividir tu controlador en
    varios controladores más pequeños.</p>

<p></p>
<h2>Controladores de recursos</h2>
<p>El enrutamiento de recurso de Laravel asigna las rutas típicas "CRUD" a un controlador con una
    sola línea de código. Por ejemplo, puedes desear crear un controlador que maneje todas las
    solicitudes HTTP para "photos" almacenadas por tu aplicación. Usando el comando Artisan <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:controller</span>,
    podemos crear fácilmente tal controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:controller PhotoController --resource
</code></pre>

<p>Este comando creará un controlador en <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Controllers/PhotoController.php</span>.
    El controlador contendrá un método para cada una de las operaciones de recursos disponibles.</p>
<p>Seguidamente, puedes registrar una ruta de recurso genérica al controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::resource('photos', 'PhotoController');
</code></pre>

<p>Esta declaración de ruta única crea varias rutas para manejar una variedad de acciones del
    recurso. El controlador generado ya tendrá los métodos separados para cada una de las acciones,
    incluyendo comentarios que te informan de los verbos HTTP y URIs que manejan.</p>
<p>Puedes registrar muchos controladores de recursos a la vez pasando un arreglo al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::resources([
    'photos' =&gt; 'PhotoController',
    'posts' =&gt; 'PostController'
]);
</code></pre>

<h4>Acciones manejadas por el controlador de recursos</h4>
<table>
    <thead>
    <tr>
        <th>Tipo</th>
        <th>URI</th>
        <th>Acción</th>
        <th>Nombre de la Ruta</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>GET</td>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/photos</span>
        </td>
        <td>índice</td>
        <td>photos.index</td>
    </tr>
    <tr>
        <td>GET</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/photos/create</span>
        </td>
        <td>crear</td>
        <td>photos.create</td>
    </tr>
    <tr>
        <td>POST</td>
        <td><span
                style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/photos</span>
        </td>
        <td>guardar</td>
        <td>photos.store</td>
    </tr>
    <tr>
        <td>GET</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/photos/{photo}</span>
        </td>
        <td>mostrar</td>
        <td>photos.show</td>
    </tr>
    <tr>
        <td>GET</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/photos/{photo}/edit</span>
        </td>
        <td>editar</td>
        <td>photos.edit</td>
    </tr>
    <tr>
        <td>PUT/PATCH</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/photos/{photo}</span>
        </td>
        <td>actualizar</td>
        <td>photos.update</td>
    </tr>
    <tr>
        <td>DELETE</td>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/photos/{photo}</span>
        </td>
        <td>eliminar</td>
        <td>photos.destroy</td>
    </tr>
    </tbody>
</table>
<h4>Especificando el modelo del recurso</h4>
<p>Si estás usando el enlace de modelo de ruta (route model binding) y deseas que los métodos del
    controlador de recursos declaren el tipo de una instancia de modelo, puedes usar la opción <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--model</span>
    al momento de generar el controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:controller PhotoController --resource --model=Photo
</code></pre>

<h4>Suplantar los métodos de formulario</h4>
<p>Debido a que los formularios no pueden hacer solicitudes <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PUT</span>, <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PATCH</span>, o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DELETE</span>,
    necesitarás agregar un campo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_method</span>
    oculto para suplantar estos verbos HTTP. La directiva de Blade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@method</span>
    puede crear este campo para ti:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;form action="/foo/bar" method="POST"&gt;
    @method('PUT')
&lt;/form&gt;
</code></pre>

<p></p>
<h3>Rutas de recursos parciales</h3>
<p>Al momento de declarar una ruta de recurso, puedes especificar un subconjunto de acciones que el
    controlador debería manejar en lugar de conjunto completo de acciones por defecto.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::resource('photos', 'PhotoController')-&gt;only([
    'index', 'show'
]);

Route::resource('photos', 'PhotoController')-&gt;except([
    'create', 'store', 'update', 'destroy'
]);
</code></pre>

<h4>Rutas de recursos para APIs</h4>
<p>Al momento de declarar rutas de recursos que serán consumidas por APIs, normalmente te gustará
    excluir rutas que presentan plantillas HTML tales como <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">edit</span>.
    Por conveniencia, puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">apiResource</span>
    para excluir automáticamente éstas dos rutas:</p>
<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::apiResource('photos', 'PhotoController');
</code></pre>
<p>Puedes registrar muchos controladores de recursos de API de una sola vez pasando un arreglo al
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">apiResources</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::apiResources([
    'photos' =&gt; 'PhotoController',
    'posts' =&gt; 'PostController'
]);
</code></pre>

<p>Para generar rápidamente un controlador de recursos API que no incluya los métodos <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">edit</span>,
    usa la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--api</span>
    cuando ejecutas el comando <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:controller</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:controller API/PhotoController --api
</code></pre>

<p></p>
<h3>Nombrando rutas de recursos</h3>
<p>De forma predeterminada, todas las acciones de controlador de recursos tienen un nombre de ruta;
    sin embargo, puedes sobrescribir esos nombres al pasar un arreglo de nombres con tus
    opciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::resource('photos', 'PhotoController')-&gt;names([
    'create' =&gt; 'photos.build'
]);
</code></pre>

<p></p>
<h3>Nombrando parámetros de rutas de recursos</h3>
<p>De forma predeterminada, <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::resource</span>
    creará los parámetros de ruta para tus rutas de recursos basado en la versión "singularizada"
    del nombre de recurso. Puedes sobrescribir fácilmente esto para cada recurso usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">parameters</span>.
    El arreglo pasado al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">parameters</span>
    debería ser un arreglo asociativo de nombres de recursos y nombres de parámetros:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::resource('users', 'AdminUserController')-&gt;parameters([
    'users' =&gt; 'admin_user'
]);
</code></pre>

<p>El ejemplo anterior genera las URIs siguientes para la ruta <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">show</span> del
    recurso:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/users/{admin_user}
</code></pre>

<p></p>
<h3>Configuración regional para URIs de recursos</h3>
<p>De forma predeterminada, <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::resource</span>
    creará URIs de recursos usando verbos en Inglés. Si necesitas configurar los verbos de acción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">edit</span> a
    un idioma, puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::resourceVerbs</span>.
    Esto puede ser hecho en el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Route;

/**
* Bootstrap any application services.
*
* @return void
*/
public function boot()
{
    Route::resourceVerbs([
        'create' =&gt; 'crear',
        'edit' =&gt; 'editar',
    ]);
}
</code></pre>

<p>Una vez que los verbos han sido personalizados, un registro de ruta de recurso tal como <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::resource('fotos', 'PhotoController')</span>
    producirá las siguientes URIs:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/fotos/crear

/fotos/{foto}/editar
</code></pre>

<p></p>
<h3>Complementando controladores de recursos</h3>
<p>Si necesitas agregar rutas adicionales para un controlador de recursos más allá del conjunto
    predeterminado de rutas de recursos, deberías definir esas rutas antes de que ejecutes <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Route::resource</span>;
    de otra forma, las rutas definidas por el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resource</span>
    pueden tomar precedencia involuntariamente sobre tus rutas complementarias:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('photos/popular', 'PhotoController@method');

Route::resource('photos', 'PhotoController');
</code></pre>


<p>TIP</p>
<p>Recuerda mantener la lógica de tus controladores enfocada. Si te encuentras a ti mismo
    necesitando rutinariamente métodos fuera del conjunto típico de acciones de recurso, considera
    dividir tu controlador en dos controladores más pequeños.</p>

<p></p>
<h2>Inyección de dependencias y controladores</h2>
<h4>Inyección al constructor</h4>
<p>El contenedor de servicio de Laravel es usado para resolver todos los controladores de Laravel.
    Como resultado, estás habilitado para declarar el tipo de cualquier dependencia que tu
    controlador pueda necesitar en su constructor. Las dependencias declaradas serán automáticamente
    resueltas e inyectadas dentro de la instancia del controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Repositories\UserRepository;

class UserController extends Controller
{
    /**
    * The user repository instance.
    */
    protected \$users;

    /**
    * Create a new controller instance.
    *
    * @param  UserRepository  \$users
    * @return void
    */
    public function __construct(UserRepository \$users)
    {
        \$this-&gt;users = \$users;
    }
}
</code></pre>

<p>También puedes declarar el tipo de cualquier Contrato de Laravel. Si el contenedor puede
    resolverlo, puedes declararlo. Dependiendo de tu aplicación, inyectar tus dependencias dentro de
    tu controlador puede proporcionar mejo capacidad para pruebas.</p>
<h4>Inyección de métodos</h4>
<p>Adicional a la inyección al constructor, también puedes declarar el tipo de dependencias en los
    métodos de tu controlador. Un caso de uso común para la inyección de método está inyectando la
    instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    dentro de tus métodos de controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
    * Store a new user.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        \$name = \$request-&gt;name;

        //
    }
}
</code></pre>

<p>Si tu método de controlador también está esperando entrada de un parámetro de ruta, lista tus
    argumentos de ruta después de tus otras dependencias. Por ejemplo, si tu ruta es definida como
    esto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::put('user/{id}', 'UserController@update');
</code></pre>

<p>Aún puedes declarar el tipo de la clase <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>
    y acceder a tu parámetro <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> al
    definir tu método de controlador de la siguiente manera:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
    * Update the given user.
    *
    * @param  Request  \$request
    * @param  string  \$id
    * @return Response
    */
    public function update(Request \$request, \$id)
    {
        //
    }
}
</code></pre>

<p></p>
<h2>Caché de rutas</h2>

<p>Nota</p>
<p>Las rutas basadas en Closure no pueden ser cacheadas. Para usar caché de rutas, debes convertir
    cualquiera de las rutas Closure a clases de controlador.</p>

<p>Si tu aplicación está usando exclusivamente rutas basadas en controlador, deberías tomar ventaja
    de la caché de rutas de Laravel. Usar la cache de rutas reducirá drásticamente la cantidad de
    tiempo que toma registrar todas las rutas de tu aplicación. En algunos casos, incluso la rapidez
    de tu registro de rutas puede llegar a ser hasta 100 veces más rápida.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan route:cache
</code></pre>

<p>Después de ejecutar este comando, tu archivo de rutas cacheado será cargado en cada solicitud.
    Recuerda, si agregas cualquier ruta nueva necesitarás generar una caché de ruta nueva. Debido a
    esto, deberías ejecutar solamente el comando <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route:cache</span>
    durante el despliegue o puesta en producción del proyecto.</p>
<p>Puedes usar el comando <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route:clear</span>
    para limpiar la caché de ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan route:clear
</code></pre>
</div>
""";