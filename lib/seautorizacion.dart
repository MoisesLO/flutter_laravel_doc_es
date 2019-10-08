import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class SeAutorizacion extends StatelessWidget {
  final String title;
  SeAutorizacion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmSeAutorizacion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmSeAutorizacion = """
<div style='font-size: 14.2px;'>
<h1>Autorización</h1>
<ul>
    <li>Introducción</li>
    <li>
        Gates
        <ul>
            <li>Escribiendo gates</li>
            <li>Autorizando acciones</li>
            <li>Interceptando comprobaciones de gates</li>
        </ul>
    </li>
    <li>
        Creando políticas
        <ul>
            <li>Generando políticas</li>
            <li>Registrando políticas</li>
        </ul>
    </li>
    <li>
        Escribiendo políticas
        <ul>
            <li>Métodos de política</li>
            <li>Métodos sin modelos</li>
            <li>Usuarios invitados</li>
            <li>Filtros de política</li>
        </ul>
    </li>
    <li>
        Autorizando acciones usando políticas
        <ul>
            <li>Vía el modelo de usuario</li>
            <li>Vía middleware</li>
            <li>Vía helpers del controlador</li>
            <li>Vía plantillas de blade</li>
        </ul>
    </li>
</ul>

<h2>Introducción</h2>
<p>
    Además de proveer servicios de
    autenticación
    por defecto, Laravel además provee una forma simple de autorizar acciones del usuario contra un
    recurso dado. Como con la autenticación, el enfoque de Laravel para la autorización es simple, y
    hay dos maneras principales de autorizar acciones: <strong>gates</strong> y
    <strong>policies</strong> (puertas y políticas).
</p>
<p>Piensa en los gates y políticas como rutas y controladores. Los Gates proveen una manera simple,
    basada en funciones anónimas, para definir las reglas de autorización; mientras que las
    políticas, como los controladores, agrupan la lógica para un modelo o recurso en específico.
    Vamos a explorar los gates primero y luego las políticas.</p>
<p>No necesitas elegir entre el uso exclusivo de gates o de políticas cuando construyas una
    aplicación. Lo más probable es que la mayoría de las aplicaciones contengan una mezcla de gates
    y de políticas ¡Y eso está completamente bien! Los gates son más aplicables a acciones que no
    estén relacionadas a ningún modelo o recurso, como por ejemplo ver un tablero en el panel de
    administración. Por otro lado, las políticas deberan ser usadas cuando desees autorizar una
    acción para un modelo o recurso en particular.</p>

<h2>Gates</h2>

<h3># Escribiendo gates</h3>
<p>Los gates son funciones anónimas (Closures) que determinan si un usuario está autorizado para
    ejecutar una acción dada y típicamente son definidos en la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Providers\AuthServiceProvider</span>
    usando el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Gate</span>. Los gates siempre reciben la instancia del usuario conectado
    como el primer argumento y pueden, opcionalmente, recibir argumentos adicionales que sean
    relevantes, como por ejemplo un modelo de Eloquent:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Register any authentication / authorization services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;registerPolicies();

    Gate::define('edit-settings', function (\$user) {
        return \$user-&gt;isAdmin;
    });

    Gate::define('update-post', function (\$user, \$post) {
        return \$user-&gt;id == \$post-&gt;user_id;
    });
}
</code></pre>

<p>Los gates además pueden ser definidos escribiendo la clase y método a llamar como una cadena de
    texto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Class@method</span>, como cuando definimos controladores en las rutas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Register any authentication / authorization services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;registerPolicies();

    Gate::define('update-post', 'App\Policies\PostPolicy@update');
}
</code></pre>

<h4># Gates de recursos</h4>
<p>También puedes definir las habilidades de múltiples gates a la vez usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resource</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Gate::resource('posts', 'App\Policies\PostPolicy');
</code></pre>

<p>Esto es idéntico a definir los siguientes Gates uno por uno:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Gate::define('posts.view', 'App\Policies\PostPolicy@view');
Gate::define('posts.create', 'App\Policies\PostPolicy@create');
Gate::define('posts.update', 'App\Policies\PostPolicy@update');
Gate::define('posts.delete', 'App\Policies\PostPolicy@delete');
</code></pre>

<p>Por defecto, las habilidades <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span>, y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> serán definidas. Además puedes sobrescribir las habilidades por defecto
    pasando un arreglo como tercer argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resource</span>. Las llaves del arreglo
    definen los nombres de las habilidades mientras que los valores definen los nombres de los
    métodos. Por ejemplo, el siguiente código creará dos nuevas definiciones de Gate - <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts.image</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">posts.photo</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Gate::resource('posts', 'PostPolicy', [
    'image' =&gt; 'updateImage',
    'photo' =&gt; 'updatePhoto',
]);
</code></pre>


<h3># Autorizando acciones</h3>
<p>Para autorizar una acción usando gates, deberías usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">allows</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">denies</span>.
    Nota que no necesitas pasar el usuario autenticado cuando llames a estos métodos. Laravel se
    ocupará de esto por ti de forma automática:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Gate::allows('edit-settings')) {
    // The current user can edit settings
}

if (Gate::allows('update-post', \$post)) {
    // The current user can update the post...
}

if (Gate::denies('update-post', \$post)) {
    // The current user can't update the post...
}
</code></pre>

<p>Si quisieras determinar si un usuario en particular está autorizado para ejecutar una acción,
    puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forUser</span> del facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Gate</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Gate::forUser(\$user)-&gt;allows('update-post', \$post)) {
    // The user can update the post...
}

if (Gate::forUser(\$user)-&gt;denies('update-post', \$post)) {
    // The user can't update the post...
}
</code></pre>

<p>Puedes autorizar múltiples acciones a la vez con los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">any</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">none</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Gate::any(['update-post', 'delete-post'], \$post)) {
    // The user can update or delete the post
}

if (Gate::none(['update-post', 'delete-post'], \$post)) {
    // The user cannot update or delete the post
}
</code></pre>


<h4># Interceptando comprobaciones de gates</h4>
<p>Algunas veces, puedes querer otorgar todas las habilidades a un usuario en especifico. Puedes
    usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span> para definir un callback que es ejecutado antes de todas las
    demás comprobaciones de autorización:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Gate::before(function (\$user, \$ability) {
    if (\$user-&gt;isSuperAdmin()) {
        return true;
    }
});
</code></pre>

<p>Si el callback <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span> retorna un resultado que no es null dicho resultado será
    considerado el resultado de la comprobación.</p>
<p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">after</span> para definir un callback que será ejecutado luego de
    todas las demás comprobaciones de autorización:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Gate::after(function (\$user, \$ability, \$result, \$arguments) {
    if (\$user-&gt;isSuperAdmin()) {
        return true;
    }
});
</code></pre>

<p>Similar a la comprobación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span>, si el callback <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">after</span> retorna un
    resultado que no sea null dicho resultado será considerado el resultado de la comprobación.</p>

<h2>Creando políticas</h2>

<h3># Generando políticas</h3>
<p>Los políticas son clases que organizan la lógica de autorización para un modelo o recurso en
    particular. Por ejemplo, si tu aplicación es un blog, puedes tener un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>
    con su correspondiente <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PostPolicy</span> para autorizar acciones de usuario como crear o
    actualizar posts.</p>
<p>
    Puedes generar una política usando el
    comando de Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:policy</span>. La política generada será ubicada en el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Policies</span>. Si el directorio no existe en tu aplicación, Laravel lo creará por
    ti:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:policy PostPolicy
</code></pre>

<p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:policy</span> genera una clase de política vacía. Si quieres generar una
    clase con los métodos de política para un "CRUD" básico ya incluidos en la clase, puedes
    especificar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--model</span> al ejecutar el comando:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:policy PostPolicy --model=Post
</code></pre>


<p>TIP</p>
<p>
    Todas las políticas son resueltas a través del
    contenedor de servicios de Laravel
    , lo que te permite especificar las dependencias necesarias en el constructor de la política y
    estas serán automaticamente inyectadas.
</p>



<h3># Registrando políticas</h3>
<p>Una vez que la política exista, ésta necesita ser registrada. La clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AuthServiceProvider</span> incluída con las aplicaciones de Laravel contiene una propiedad
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">policies</span> que mapea tus modelos de Eloquent a sus políticas correspondientes.
    Registrar una política le indicará a Laravel qué política utilizar para autorizar acciones
    contra un modelo dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use App\Post;
use App\Policies\PostPolicy;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
    * The policy mappings for the application.
    *
    * @var array
    */
    protected \$policies = [
        Post::class =&gt; PostPolicy::class,
    ];

    /**
    * Register any application authentication / authorization services.
    *
    * @return void
    */
    public function boot()
    {
        \$this-&gt;registerPolicies();

        //
    }
}
</code></pre>

<h4># Política de auto-descubrimiento</h4>
<p>En lugar de registrar manualmente politicas de modelos, Laravel puede auto-descubrir politicas
    siempre y cuando el modelo y la politica sigan la convención de nombre estándar de Laravel.
    Especificamente, las politicas deben estar en un directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Policies</span> dentro del
    directorio que contiene los modelos. Así que, por ejemplo, los modelos pueden ser ubicados en el
    directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> mientras que las politicas pueden tener un sufijo. Así que, un
    modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> corresponderá a una clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserPolicy</span>.</p>
<p>Si te gustaría proporcionar tu propia lógica para descubrir politicas, puedes registar un
    callback personalizado usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Gate::guessPolicyNamesUsing</span>. Típicamente,
    este método debe ser llamado desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> del
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AuthServiceProvider</span> de tu aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Gate;

Gate::guessPolicyNamesUsing(function (\$modelClass) {
    // return policy class name...
});
</code></pre>


<p>Nota</p>
<p>Cualquier politica que está explicitamente mapeada en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AuthServiceProvider</span> tendrá
    precendencia sobre cualquier posible politica auto-descubierta.</p>


<h2>Escribiendo políticas</h2>

<h3># Métodos de política</h3>
<p>Una vez que la política haya sido registrada, puedes agregar métodos para cada acción a
    autorizar. Por ejemplo, vamos a definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span> en nuestro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PostPolicy</span>
    para detirminar si un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> dado puede actualizar una instancia de un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span> recibirá una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> y de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>
    como sus argumentos y debería retornar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> indicando si el
    usuario está autorizado para actualizar el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> o no. En el siguiente ejemplo,
    vamos a verificar si el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span> del usuario concuerda con el atributo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user_id</span> del post:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Policies;

use App\User;
use App\Post;

class PostPolicy
{
    /**
    * Determine if the given post can be updated by the user.
    *
    * @param  \App\User  \$user
    * @param  \App\Post  \$post
    * @return bool
    */
    public function update(User \$user, Post \$post)
    {
        return \$user-&gt;id === \$post-&gt;user_id;
    }
}
</code></pre>

<p>Puedes continuar definiendo métodos adicionales en la política como sea necesario para las
    diferentes acciones que este autorice. Por ejemplo, puedes definir métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> para autorizar varias acciones de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span>, pero recuerda que eres
    libre de darle los nombres que quieras a los métodos de la política.</p>

<p>TIP</p>
<p>Si usas la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--model</span> cuando generes tu política con el comando de Artisan, éste
    contendrá métodos para las acciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">restore</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forceDelete</span>.</p>


<h3># Métodos sin modelos</h3>
<p>Algunos métodos de políticas solo reciben el usuario autenticado y no una instancia del modelo
    que autorizan. Esta situación es común cuando autorizamos acciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>. Por
    ejemplo, si estás creando un blog, puedes querer revisar si un usuario está autorizado para
    crear nuevos posts o no.</p>
<p>Cuando definas métodos de política que no recibirán una instancia de otro modelo, así como el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>, debes definir el método con el usuario como único parámetro:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Determine if the given user can create posts.
*
* @param  \App\User  \$user
* @return bool
*/
public function create(User \$user)
{
    //
}
</code></pre>


<h3># Usuarios invitados</h3>
<p>Por defecto, todos los gates y políticas automáticamente retornan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> si la
    petición HTTP entrante no fue iniciada por un usuario autenticado. Sin embargo, puedes permitir
    que estas comprobaciones de autorización sean pasadas a tus gates y políticas con una
    declaración de tipo "opcional" o suministrando un valor por defecto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span> para la
    definición del argumento de usuario:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Policies;

use App\User;
use App\Post;

class PostPolicy
{
    /**
    * Determine if the given post can be updated by the user.
    *
    * @param  \App\User  \$user
    * @param  \App\Post  \$post
    * @return bool
    */
    public function update(?User \$user, Post \$post)
    {
        return \$user-&gt;id === \$post-&gt;user_id;
    }
}
</code></pre>


<h3># Filtros de política</h3>
<p>Es posible que quieras autorizar todas las acciones para algunos usuarios en un política dada.
    Para lograr esto, define un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span> en la política. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span> será ejecutado antes de los otros métodos en la política, dándote la
    oportunidad de autorizar la acción antes que el método destinado de la política sea llamado.
    Esta característica es comunmente usada para otorgar autorización a los administradores de la
    aplicación para que ejecuten cualquier acción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>public function before(\$user, \$ability)
{
    if (\$user-&gt;isSuperAdmin()) {
        return true;
    }
}
</code></pre>

<p>Si quisieras denegar todas las autorizaciones para un usuario deberías retornar
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span>. Si retornas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>, la decisión
    de autorización recaerá sobre el método de la política.</p>

<p>Nota</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span> de una clase política no será llamado si la clase no contiene un
    método con un nombre que concuerde con el nombre de la habilidad siendo revisada.</p>


<h2>Autorizando acciones usando políticas</h2>

<h3># Vía el modelo user</h3>
<p>El modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> que se incluye por defecto en tu aplicación de Laravel trae dos
    métodos para autorizar acciones: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cant</span> (puede y no puede). El
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span> acepta el nombre de la acción que deseas autorizar y el modelo
    relevante. Por ejemplo, vamos a determinar si un usuario está autorizado para actualizar un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$user-&gt;can('update', \$post)) {
    //
}
</code></pre>

<p>Si una política está registrado para el modelo dado, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span> automáticamente
    llamará a la política apropiada y retornará un resultado boleano. Si no se ha registrado una
    política para el modelo dado, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span> intentará llamar al Gate basado en
    Closures que coincida con la acción dada.</p>
<h4># Acciones que no requieren modelos</h4>
<p>Recuerda, algunas acciones como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> pueden no requerir de la instancia de un
    modelo. En estas situaciones, puedes pasar el nombre de una clase al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span>. El
    nombre de la clase ser usado para determinar cuál política usar cuando se autorice la acción:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Post;

if (\$user-&gt;can('create', Post::class)) {
    // Executes the "create" method on the relevant policy...
}
</code></pre>


<h3># Vía middleware</h3>
<p>Laravel incluye un middleware que puede autorizar acciones antes de que la petición entrante
    alcance tus rutas o controladores. Por defecto, el middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Auth\Middleware\Authorize</span>
    es asignado a la llave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span> de tu clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Kernel</span>. Vamos a
    explorar un ejemplo usando el middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span> para autorizar que un usuario pueda
    actualizar un post de un blog:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Post;

Route::put('/post/{post}', function (Post \$post) {
    // The current user may update the post...
})-&gt;middleware('can:update,post');
</code></pre>

<p>En este ejemplo, estamos pasando al middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span> dos argumentos, el primero es el
    nombre de la acción que deseamos autorizar y el segundo es el parámetro de la ruta que deseamos
    pasar al método de la política. En este caso, como estamos usando implicit model binding, un
    modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Post</span> será pasado al método de la política. Si el usuario no está autorizado
    a ejecutar la acción dada, el middleware generará una respuesta HTTP con el código de estatus
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">403</span>.</p>
<h4># Acciones que no requieren modelos</h4>
<p>Como mencionamos antes, algunas acciones como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> pueden no requerir de una
    instancia de un modelo. En estas situaciones, puedes pasar el nombre de la clase al middleware.
    El nombre de la clase será usado para determinar cuál política usar para autorizar la acción:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::post('/post', function () {
    // The current user may create posts...
})-&gt;middleware('can:create,App\Post');
</code></pre>


<h3># Vía helpers de controladores</h3>
<p>Además de proveer métodos útiles en el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>, Laravel también provee un método
    muy útil llamado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorize</span> en cualquier controlador que extienda la clase base
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers\Controller</span>. Como el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span>, este método
    acepta el nombre de la acción que quieras autorizar y el modelo relevante. Si la acción no es
    autorizada, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorize</span> arrojará una excepción de tipo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Auth\Access\AuthorizationException</span>,
    la cual será convertida por el manejador de excepciones por defecto de Laravel en una respuesta
    HTTP con un código <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">403</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PostController extends Controller
{
    /**
    * Update the given blog post.
    *
    * @param  Request  \$request
    * @param  Post  \$post
    * @return Response
    * @throws \Illuminate\Auth\Access\AuthorizationException
    */
    public function update(Request \$request, Post \$post)
    {
        \$this-&gt;authorize('update', \$post);

        // The current user can update the blog post...
    }
}
</code></pre>

<h4># Acciones que no requieren modelos</h4>
<p>Como hemos discutido previamente, algunas acciones como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> pueden no requerir
    una instancia de un modelo. En estas situaciones, deberías pasar el nombre de la clase al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorize</span>. El nombre de la clase determinará la política a usar para autorizar la
    acción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Create a new blog post.
*
* @param  Request  \$request
* @return Response
* @throws \Illuminate\Auth\Access\AuthorizationException
*/
public function create(Request \$request)
{
    \$this-&gt;authorize('create', Post::class);

    // The current user can create blog posts...
}
</code></pre>

<h4># Autorizando controladores de recursos</h4>
<p>Si estás utilizando controladores de recursos, puedes hacer uso del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorizeResource</span>
    en el constructor del controlador. Este método agregará las deficiones de middleware
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">can</span> apropiadas a los métodos del controlador de recursos.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorizeResource</span> acepta el nombre de clase del modelo como primer
    argumento y el nombre del parametro de ruta / petición que contendrá el ID del modelo como
    segundo argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Post;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PostController extends Controller
{
    public function __construct()
    {
        \$this-&gt;authorizeResource(Post::class, 'post');
    }
}
</code></pre>

<p>Los siguientes métodos de controlador serán mapeados con su método de política respectivo:</p>
<table>
    <thead>
    <tr>
        <th>Método de controlador</th>
        <th>Método de política</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>show</td>
        <td>view</td>
    </tr>
    <tr>
        <td>create</td>
        <td>create</td>
    </tr>
    <tr>
        <td>store</td>
        <td>create</td>
    </tr>
    <tr>
        <td>edit</td>
        <td>update</td>
    </tr>
    <tr>
        <td>update</td>
        <td>update</td>
    </tr>
    <tr>
        <td>destroy</td>
        <td>delete</td>
    </tr>
    </tbody>
</table>

<p>TIP</p>
<p>Puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:policy</span> con la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--model</span> para generar
    rápidamente una clase de política para un modelo dado: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan make:policy PostPolicy --model=Post</span>.
</p>


<h3># Vía plantillas de blade</h3>
<p>Cuando escribas plantillas de Blade, puedes querer mostrar una porción de la página solo si el
    usuario está autorizado para ejecutar una acción determinada. Por ejemplo, puedes querer mostrar
    un formulario para actualizar un post solo si el usuario puede actualizar el post. En
    situaciones así, puedes usar las directivas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@can</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@cannot</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@can('update', \$post)
    &lt;!-- The Current User Can Update The Post --&gt;
@elsecan('create', App\Post::class)
    &lt;!-- The Current User Can Create New Post --&gt;
@endcan

@cannot('update', \$post)
    &lt;!-- The Current User Can't Update The Post --&gt;
@elsecannot('create', App\Post::class)
    &lt;!-- The Current User Can't Create New Post --&gt;
@endcannot
</code></pre>

<p>Estas directivas son accesos directos convenientes para no tener que escribir sentencias <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@if</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@unless</span>. Las sentencias <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@can</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@cannot</span> de arriba son
    equivalentes a las siguientes sentencias, respectivamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@if (Auth::user()-&gt;can('update', \$post))
    &lt;!-- The Current User Can Update The Post --&gt;
@endif

@unless (Auth::user()-&gt;can('update', \$post))
    &lt;!-- The Current User Can't Update The Post --&gt;
@endunless
</code></pre>

<p>También puedes determinar si un usuario tiene habilidad de autorización desde una lista de
    habilidades dadas. Para lograr esto, usa la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@canary</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@canany(['update', 'view', 'delete'], \$post)
    // The current user can update, view, or delete the post
@elsecanany(['create'], \App\Post::class)
    // The current user can create a post
@endcanany
</code></pre>

<h4># Acciones que no requieren modelos</h4>
<p>Así como otros métodos de autorización, puedes pasar el nombre de una clase a las directivas
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@can</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@cannot</span> si la acción no requiere una instancia de un modelo:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@can('create', App\Post::class)
    &lt;!-- The Current User Can Create Posts --&gt;
@endcan

@cannot('create', App\Post::class)
    &lt;!-- The Current User Can't Create Posts --&gt;
@endcannot
</code></pre>
</div>
""";