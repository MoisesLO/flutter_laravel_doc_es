import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuValidacion extends StatelessWidget {
  final String title;
  FuValidacion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuValidacion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuValidacion = """
<div style='font-size: 14.2px;'>
<h1>Validación</h1>
<ul>
    <li>Introducción</li>
    <li>
        Inicio rápido de validación
        <ul>
            <li>Definiendo las rutas</li>
            <li>Creando el controlador</li>
            <li>Escribiendo la lógica de validación</li>
            <li>Mostrando los errores de validación</li>
            <li>Una observación sobre los campos opcionales</li>
        </ul>
    </li>
    <li>
        Validación de solicitudes de formulario
        <ul>
            <li>Creando solicitudes de formulario</li>
            <li>Autorizando solicitudes de formulario</li>
            <li>Personalizando los mensajes de error</li>
            <li>Personalizando los atributos de validación</li>
        </ul>
    </li>
    <li>
        Creando validadores manualmente
        <ul>
            <li>Redirección automática</li>
            <li>Paquetes de errores con nombres</li>
            <li>Hook de validación posterior</li>
        </ul>
    </li>
    <li>
        Trabajando con los mensajes de error
        <ul>
            <li>Personalizar los mensajes de error</li>
        </ul>
    </li>
    <li>Reglas de validación disponibles</li>
    <li>Agregando reglas condicionalmente</li>
    <li>Validando arreglos</li>
    <li>
        Personalizar las reglas de validación
        <ul>
            <li>Usando objetos de regla</li>
            <li>Usando closures</li>
            <li>Usando extensiones</li>
            <li>Extensiones implicitas</li>
        </ul>
    </li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>Laravel proporciona varios enfoques diferentes para validar los datos entrantes de tu aplicación.
    De forma predeterminada, la clase base del controlador de Laravel usa una característica <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ValidatesRequests</span>
    la cual proporciona un método conveniente para validar la solicitud HTTP entrante con una
    variedad de poderosas reglas de validación.</p>
<p></p>
<h2>Inicio rápido de validación</h2>
<p>Para aprender sobre las poderosas características de validación de Laravel, vamos a observar un
    ejemplo completo validando un formulario y mostrando los mensajes de error devueltos al
    usuario.</p>
<p></p>
<h3>Definiendo las rutas</h3>
<p>Primero, vamos a asumir que tenemos las rutas siguientes definidas en nuestro archivo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/web.php</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('post/create', 'PostController@create');

Route::post('post', 'PostController@store');
</code></pre>

<p>La ruta <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">GET</span>
    mostrará un formulario al usuario para crear un nuevo post de blog, mientras que la ruta <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">POST</span>
    guardará el nuevo post de blog en la base de datos.</p>
<p></p>
<h3>Creando el controlador</h3>
<p>Luego, vamos a observar un simple controlador que maneja estas rutas. Dejaremos el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span>
    vacío por ahora:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PostController extends Controller
{
    /**
    * Show the form to create a new blog post.
    *
    * @return Response
    */
    public function create()
    {
        return view('post.create');
    }

    /**
    * Store a new blog post.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        // Validate and store the blog post...
    }
}
</code></pre>

<p></p>
<h3>Escribiendo la lógica de validación</h3>
<p>Ahora estamos listos para completar nuestro método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span> con
    la lógica para validar el nuevo post de blog. Para hacer esto, usaremos el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validate</span>
    proporcionado por el objeto <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>.
    Si las reglas de validación pasan, tu código continuará su ejecución normalmente; sin embargo,
    si la validación falla, se arrojará una excepción y la respuesta de error apropiada será
    devuelta automáticamente al usuario. En el caso de una solicitud HTTP tradicional, se generará
    una respuesta de redirección, mientras una respuesta JSON será enviada para las solicitudes
    AJAX.</p>
<p>Para lograr una mejor comprensión del método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validate</span>,
    regresemos al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Store a new blog post.
*
* @param  Request  \$request
* @return Response
*/
public function store(Request \$request)
{
    \$validatedData = \$request-&gt;validate([
        'title' =&gt; 'required|unique:posts|max:255',
        'body' =&gt; 'required',
    ]);

    // The blog post is valid...
}
</code></pre>

<p>Como puedes ver, pasamos las reglas de validación deseadas dentro del método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validate</span>.
    Otra vez, si la validación falla, se generará la respuesta apropiada. Si la validación pasa,
    nuestro controlador continuará la ejecución normalmente.</p>
<h4>Deteniendo en la primera falla de validación</h4>
<p>Algunas veces puede que desees detener la ejecución de las reglas de validación sobre un atributo
    después de la primera falla de validación. Para hacer eso, asigna la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bail</span>
    al atributo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;validate([
    'title' =&gt; 'bail|required|unique:posts|max:255',
    'body' =&gt; 'required',
]);
</code></pre>

<p>En este ejemplo, si la regla <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span> del
    atributo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">title</span>
    falla, la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">max</span> no
    será verificada. Las reglas serán validadas en el orden que sean asignadas.</p>
<h4>Una obsevación sobre los atributos anidados</h4>
<p>Si tu solicitud HTTP contiene parámetros "anidados", puedes especificarlos en tus reglas de
    validación usando la sintaxis de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;validate([
    'title' =&gt; 'required|unique:posts|max:255',
    'author.name' =&gt; 'required',
    'author.description' =&gt; 'required',
]);
</code></pre>

<p></p>
<h3>Mostrando los errores de validación</h3>
<p>
    ¿Qué sucede si los parámetros de solicitud entrantes no pasan las reglas de validación dados?
    Cómo mencionamos anteriormente, Laravel redirigirá al usuario de regreso a su ubicación previa.
    En adición, todos los errores de validación serán automáticamente
    movidos instantáneamente a la sesión
    .
</p>
<p>De nuevo, observa que no tuvimos que enlazar explícitamente los mensajes de error con la vista en
    nuestra ruta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">GET</span>.
    Esto es porque Laravel revisará los errores en la sesión de datos y los enlazará automáticamente
    a la vista si están disponibles. La variable <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$errors</span>
    será una instancia de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\MessageBag</span>.
    Para mayor información sobre cómo trabajar con este objeto, revisa su documentación.</p>

<p>TIP</p>
<p>La variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$errors</span>
    es enlazada a la vista por el middleware <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\View\Middleware\ShareErrorsFromSession</span>,
    el cual es proporcionado por el grupo de middleware <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>.
    <strong>Cuando este middleware se aplique una variable <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$errors</span>
        siempre estará disponible en tus vistas</strong>, permitiendo que asumas convenientemente
    que la variable <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$errors</span>
    está definida siempre y puede ser usada con seguridad.</p>


<p>Así, en nuestro ejemplo, el usuario será redirigido al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> de
    nuestro controlador cuando la validación falle, permitiéndonos que muestre los mensajes de error
    en la vista:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- /resources/views/post/create.blade.php --&gt;

&lt;h1&gt;Create Post&lt;/h1&gt;

@if (\$errors-&gt;any())
    &lt;div class="alert alert-danger"&gt;
        &lt;ul&gt;
            @foreach (\$errors-&gt;all() as \$error)
                &lt;li&gt;{{ \$error }}&lt;/li&gt;
            @endforeach
        &lt;/ul&gt;
    &lt;/div&gt;
@endif

&lt;!-- Create Post Form --&gt;
</code></pre>

<h4>Directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@error</span>
</h4>
<p>También puedes usar la directiva <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@error</span> de
    Blade para rápidamente comprobar si los mensajes de error de validación existen para un atributo
    dado. Dentro de una directiva <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@error</span>,
    puedes mostrar la variable <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$message</span>
    para mostrar el mensaje de error:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- /resources/views/post/create.blade.php --&gt;

&lt;label for="title"&gt;Post Title&lt;/label&gt;
&lt;input id="title" type="text" class="@error('title') is-invalid @enderror"&gt;

@error('title')
    &lt;div class="alert alert-danger"&gt;{{ \$message }}&lt;/div&gt;
@enderror
</code></pre>

<p></p>
<h3>Una observación sobre los campos opcionales</h3>
<p>De forma predeterminada, Laravel incluye los middleware <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">TrimStrings</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ConvertEmptyStringsToNull</span>
    en la pila global de middleware de tu aplicación. Estos middleware son listados en la pila por
    la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Kernel</span>.
    Debido a esto, con frecuencia necesitarás marcar tus campos "opcionales" de solicitud como <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">nullable</span>
    si no quieres que el validador considere los valores <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>
    como no válidos. Por ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;validate([
    'title' =&gt; 'required|unique:posts|max:255',
    'body' =&gt; 'required',
    'publish_at' =&gt; 'nullable|date',
]);
</code></pre>

<p>En este ejemplo, estamos especificando que el campo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">publish_at</span>
    puede que sea o <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span> o
    una representación de fecha válida. Si el modificador <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">nullable</span>
    no es agregado a la definición de la regla, el validador consideraría el <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>
    como una fecha no válida.</p>
<p></p>
<h4>Solicitudes AJAX y validación</h4>
<p>En este ejemplo, usamos un formulario tradicional para enviar datos a la aplicación. Sin embargo,
    muchas aplicaciones usan solicitudes AJAX. Al momento de usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validate</span>
    durante una solicitud AJAX, Laravel no generará una respuesta de redirección. En su lugar,
    Laravel genera una respuesta JSON conteniendo todos los errores de validación. Esta respuesta
    JSON será enviada con un código de estado HTTP 422.</p>
<p></p>
<h2>Validación de solicitud de formulario</h2>
<p></p>
<h3>Creando solicitudes de formulario (form request)</h3>
<p>Para escenarios de validación más complejos, puede que desees crear una "solicitud de formulario
    (form request)". Las Form Request son clases de solicitud personalizadas que contienen la lógica
    de validación. Para crear una clase de Form Request, usa el comando de CLI de Artisan <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:request</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:request StoreBlogPost
</code></pre>

<p>La clase generada será colocada en el directorio <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Requests</span>.
    Si este directorio no existe, será creado cuando ejecutes el comando <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:request</span>.
    Agreguemos unas cuantas reglas de validación al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rules</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the validation rules that apply to the request.
*
* @return array
*/
public function rules()
{
    return [
        'title' =&gt; 'required|unique:posts|max:255',
        'body' =&gt; 'required',
    ];
}
</code></pre>


<p>TIP</p>
<p>Puedes declarar el tipo de cualquier dependencia que necesites dentro de la firma del método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rules</span>.
    Se resolverán automáticamente a través del contenedor de servicio de Laravel.</p>

<p>Así que, ¿Cómo son evaluadas las reglas de validación? Todo lo que necesitas hacer es poner la
    referencia de la solicitud en tu método de controlador. La Form Request entrante es validada
    antes de que el método de controlador sea ejecutado, significa que no necesitas complicar tu
    controlador con ninguna lógica de validación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Store the incoming blog post.
*
* @param  StoreBlogPost  \$request
* @return Response
*/
public function store(StoreBlogPost \$request)
{
    // The incoming request is valid...

    // Retrieve the validated input data...
    \$validated = \$request-&gt;validated();
}
</code></pre>

<p>Si la validación falla, una respuesta de redirección será generada para enviar al usuario de
    vuelta a su ubicación previa. Los errores también serán movidos instantáneamente a la sesión de
    modo que estén disponibles para mostrarlos. Si la solicitud fuese una solicitud AJAX, una
    respuesta HTTP con un código de estado 422 será devuelta al usuario incluyendo una
    representación JSON de los errores de validación.</p>
<h4>Agregando hooks posteriores a solicitudes de formularios</h4>
<p>Si prefieres agregar un hook "posterior" a una Form Request, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withValidator</span>.
    Este método recibe el validador completamente construido, permitiendo que ejecutes cualquiera de
    sus métodos antes de que las reglas de validación sean evaluadas realmente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Configure the validator instance.
*
* @param  \Illuminate\Validation\Validator  \$validator
* @return void
*/
public function withValidator(\$validator)
{
    \$validator-&gt;after(function (\$validator) {
        if (\$this-&gt;somethingElseIsInvalid()) {
            \$validator-&gt;errors()-&gt;add('field', 'Something is wrong with this field!');
        }
    });
}
</code></pre>

<p></p>
<h3>Autorizando solicitudes de formularios</h3>
<p>La clase Form Request también contiene un método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorize</span>.
    Dentro de este método, puedes verificar si el usuario autenticado realmente tiene la autoridad
    para actualizar un recurso dado. Por ejemplo, puedes determinar si a un usuario le pertenece el
    comentario del blog que está intentando actualizar</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Determine if the user is authorized to make this request.
*
* @return bool
*/
public function authorize()
{
    \$comment = Comment::find(\$this-&gt;route('comment'));

    return \$comment &amp;&amp; \$this-&gt;user()-&gt;can('update', \$comment);
}
</code></pre>

<p>Dado que todas las form request extienden de la clase solicitud base (Request) de Laravel,
    podemos usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span>
    para acceder al usuario actualmente autenticado. También observa la llamada al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span>
    en el ejemplo anterior. Este método te otorga acceso a los parámetros de URI definidos en la
    ruta que es ejecutada, tal como el parámetro <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{comment}</span>
    en el ejemplo de abajo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::post('comment/{comment}');
</code></pre>

<p>Si el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorize</span>
    devuelve <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>,
    una respuesta HTTP con un código de estado 403 será devuelta automáticamente y tu método de
    controlador no se ejecutará.</p>
<p>Si planeas tener la lógica de autorización en otra parte de tu aplicación, devuelve <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> desde
    el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorize</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Determine if the user is authorized to make this request.
*
* @return bool
*/
public function authorize()
{
    return true;
}
</code></pre>


<p>TIP</p>
<p>Puedes declarar el tipo de cualquier dependencia que necesites dentro de la firma del método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">authorize</span>.
    Se resolverán automáticamente a través de Laravel contenedor de servicio.</p>

<p></p>
<h3>Personalizando los mensajes de error</h3>
<p>Puedes personalizar los mensajes de error usados por la solicitud de formulario al sobrescribir
    el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">messages</span>.
    Este método debería devolver un arreglo de atributos / pares de regla y sus correspondientes
    mensajes de error:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the error messages for the defined validation rules.
*
* @return array
*/
public function messages()
{
    return [
        'title.required' =&gt; 'A title is required',
        'body.required'  =&gt; 'A message is required',
    ];
}
</code></pre>

<p></p>
<h3>Personalizando los atributos de validación</h3>
<p>Si desea que la parte <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:attribute</span>
    de su mensaje de validación se reemplace con un nombre de atributo personalizado, puede
    especificar los nombres personalizados sobrescribiendo el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attributes</span>.
    Este método debería devolver un arreglo de pares de atributo / nombre:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get custom attributes for validator errors.
*
* @return array
*/
public function attributes()
{
    return [
        'email' =&gt; 'email address',
    ];
}
</code></pre>

<p></p>
<h2>Creando validadores manualmente</h2>
<p>Si no quieres usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">messages</span>
    en la solicitud, puedes crear una instancia de validador manualmente usando la clase facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span>.
    El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span>
    en la clase facade genera una nueva instancia del validador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;

class PostController extends Controller
{
    /**
    * Store a new blog post.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        \$validator = Validator::make(\$request-&gt;all(), [
            'title' =&gt; 'required|unique:posts|max:255',
            'body' =&gt; 'required',
        ]);

        if (\$validator-&gt;fails()) {
            return redirect('post/create')
                        -&gt;withErrors(\$validator)
                        -&gt;withInput();
        }

        // Store the blog post...
    }
}
</code></pre>

<p>El primer argumento pasado al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> son
    los datos bajo validación. El segundo argumento son las reglas de validación que deberían ser
    aplicadas a los datos.</p>
<p>Después de verificar si la validación de solicitud falló, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withErrors</span>
    para mover instantáneamente los mensajes de error a la sesión. Al momento de usar este método,
    la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$errors</span>
    será compartida automáticamente con tus vistas después de la redirección, permitiendo que los
    muestres de vuelta al usuario. El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withErrors</span>
    acepta un validador, un <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MessageBag</span>,
    o un <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span>
    de PHP.</p>
<p></p>
<h3>Redirección automática</h3>
<p>Si prefieres crear manualmente una instancia del validador pero aún tomar ventaja de la
    redirección automática ofrecida por el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validate</span>
    de la solicitud, puedes ejecutar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validate</span>
    en una instancia de validador existente. Si la validación falla, el usuario automáticamente será
    redirigido o, en el caso de una solicitud AJAX, le será devuelta una respuesta JSON:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Validator::make(\$request-&gt;all(), [
    'title' =&gt; 'required|unique:posts|max:255',
    'body' =&gt; 'required',
])-&gt;validate();
</code></pre>

<p></p>
<h3>Paquetes de errores con nombres</h3>
<p>Si tienes múltiples formularios en una sola página, puede que desees nombrar el <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MessageBag</span>
    de errores, permitiendo que obtengas los mensajes de error para un formulario específico. Pasa
    un nombre como segundo argumento a <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withErrors</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return redirect('register')
            -&gt;withErrors(\$validator, 'login');
</code></pre>

<p>Entonces puedes acceder la instancia de <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MessageBag</span>
    nombrada de la variable <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$errors</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>    {{ \$errors-&gt;login-&gt;first('email') }}
</code></pre>

<p></p>
<h3>Hook de validación posterior</h3>
<p>El validador también permite que adjuntes funciones de retorno para que sean ejecutadas después
    que se complete la validación. Esto permite que ejecutes fácilmente validación adicional e
    incluso agregar más mensajes de error a la colección de mensajes. Para empezar, usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">after</span> en
    una instancia de validador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>    \$validator = Validator::make(...);

    \$validator-&gt;after(function (\$validator) {
        if (\$this-&gt;somethingElseIsInvalid()) {
            \$validator-&gt;errors()-&gt;add('field', 'Something is wrong with this field!');
        }
    });

    if (\$validator-&gt;fails()) {
        //
    }
</code></pre>

<p></p>
<h2>Trabajando con los mensajes de error</h2>
<p>Después de ejecutar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">errors</span> en
    una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span>,
    recibirás una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\MessageBag</span>,
    la cual tiene una variedad de métodos convenientes para trabajar con los mensajes de error. La
    variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$errors</span>
    que se hace disponible automáticamente para todas las vistas también es una instancia de la
    clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MessageBag</span>.
</p>
<h4>Obteniendo el primer mensaje de error para un campo</h4>
<p>Para obtener el primer mensaje de error para un campo dado, usa el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$errors = \$validator-&gt;errors();

echo \$errors-&gt;first('email');
</code></pre>

<h4>Obteniendo todos los mensajes de error para un campo</h4>
<p>Si necesitas obtener un arreglo de todos los mensajes para un campo dado, usa el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>foreach (\$errors-&gt;get('email') as \$message) {
    //
}
</code></pre>

<p>Si estás validando un campo de formulario de arreglo, puedes obtener todos los mensajes para cada
    uno de los elementos de arreglo usando el caracter <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>foreach (\$errors-&gt;get('attachments.*') as \$message) {
    //
}
</code></pre>

<h4>Obteniendo todos los mensajes de error para todos los campos</h4>
<p>Para obtener un arreglo de todos los mensajes para todos los campos, usa el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>foreach (\$errors-&gt;all() as \$message) {
    //
}
</code></pre>

<h4>Determinando si existen mensajes para un campo</h4>
<p>El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span> puede
    ser usado para determinar si existe algún mensaje de error para un campo dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$errors-&gt;has('email')) {
    //
}
</code></pre>

<p></p>
<h3>Mensajes de error personalizados</h3>
<p>Si es necesario, puedes usar mensajes de error personalizados en vez de los predeterminados. Hay
    varias formas para especificar mensajes personalizados. Primero, puedes pasar los mensajes
    personalizados como tercer argumento al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator::make</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$messages = [
    'required' =&gt; 'The :attribute field is required.',
];

\$validator = Validator::make(\$input, \$rules, \$messages);
</code></pre>

<p>En este ejemplo, el marcador <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:attribute</span>
    será reemplazado por el nombre real del campo bajo validación. También puedes utilizar otros
    marcadores en mensajes de validación. Por ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$messages = [
    'same'    =&gt; 'The :attribute and :other must match.',
    'size'    =&gt; 'The :attribute must be exactly :size.',
    'between' =&gt; 'The :attribute value :input is not between :min - :max.',
    'in'      =&gt; 'The :attribute must be one of the following types: :values',
];
</code></pre>

<h4>Especificando un mensaje personalizado para un atributo dado</h4>
<p>Algunas veces puedes querer especificar un mensaje de error personalizado sólo para un campo
    específico. Puedes hacer eso usando notación de "punto". Especifica el nombre del atributo al
    principio, seguido por la regla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$messages = [
    'email.required' =&gt; 'We need to know your e-mail address!',
];
</code></pre>

<p></p>
<h4>Especificando mensajes personalizados en archivos por idiomas</h4>
<p>En muchos casos, probablemente especificarás tus mensajes personalizados en un archivo de idioma
    en lugar de pasarlos directamente al <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span>.
    Para hacer eso, agrega tus mensajes al arreglo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">custom</span>
    en el archivo de idioma <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang/xx/validation.php</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'custom' =&gt; [
    'email' =&gt; [
        'required' =&gt; 'We need to know your e-mail address!',
    ],
],
</code></pre>

<h4>Especificando los atributos personalizados en archivos de idiomas</h4>
<p>Si prefieres que la porción <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:attribute</span>
    de tu mensaje de validación sea reemplazada con un nombre de atributo personalizado, puedes
    especificar el nombre personalizado en el arreglo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attributes</span>
    de tu archivo de idioma <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang/xx/validation.php</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'attributes' =&gt; [
    'email' =&gt; 'email address',
],
</code></pre>

<h4>Especificando los valores personalizados en archivos de idiomas</h4>
<p>A veces es posible que necesites que la parte <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:value</span> de
    tu mensaje de validación sea reemplazada por una representación personalizada del valor. Por
    ejemplo, considera la siguiente regla que especifica que se requiere un número de tarjeta de
    crédito si el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">payment_type</span>
    tiene un valor de<span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cc</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request-&gt;validate([
    'credit_card_number' =&gt; 'required_if:payment_type,cc'
]);
</code></pre>

<p>Si esta regla de validación falla, producirá el siguiente mensaje de error:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>The credit card number field is required when payment type is cc.
</code></pre>

<p>En lugar de mostrar <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cc</span> como el
    valor del tipo de pago, puedes especificar una representación de valor personalizada en tu
    archivo de idioma <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validation</span>
    definiendo un arreglo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">values</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'values' =&gt; [
    'payment_type' =&gt; [
        'cc' =&gt; 'credit card'
    ],
],
</code></pre>

<p>Ahora, si la regla de validación falla, producirá el siguiente mensaje:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>The credit card number field is required when payment type is credit card.
</code></pre>

<p></p>
<h2>Reglas de validación disponibles</h2>
<p>Debajo hay una lista con todas las reglas de validación disponibles y su función:</p>

<p>Accepted Active URL After (Date) After Or Equal (Date) Alpha Alpha Dash Alpha Numeric Array Bail
    Before (Date) Before Or Equal (Date) Between Boolean Confirmed Date Date Equals Date Format
    Different Digits Digits Between Dimensions (Image Files) Distinct E-Mail Ends With Exists
    (Database) File Filled Greater Than Greater Than Or Equal Image (File) In In Array Integer IP
    Address JSON Less Than Less Than Or Equal Max MIME Types MIME Type By File Extension Min Not In
    Not Regex Nullable Numeric Present Regular Expression Required Required If Required Unless
    Required With Required With All Required Without Required Without All Same Size Starts With
    String Timezone Unique (Database) URL UUID</p>

<p></p>
<h4>accepted</h4>
<p>El campo bajo validación debe ser <em>yes</em>, <em>on</em>, <em>1</em>, o <em>true</em>. Esto es
    útil para validar la aceptación de "Términos de Servicio", por ejemplo.</p>
<p></p>
<h4>active_url</h4>
<p>El campo bajo validación debe tener un registro A o AAAA válido de acuerdo a la función de PHP
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dns_get_record</span>.
</p>
<p></p>
<h4>after:<em>date</em></h4>
<p>El campo bajo validación debe ser un valor después de una fecha dada. Las fechas serán pasadas a
    la función de PHP <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">strtotime</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'start_date' =&gt; 'required|date|after:tomorrow'
</code></pre>

<p>En lugar de pasar una cadena de fecha para que sea evaluada por <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">strtotime</span>,
    puedes especificar otro campo para comparar con la fecha:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'finish_date' =&gt; 'required|date|after:start_date'
</code></pre>

<p></p>
<h4>after_or_equal:<em>date</em></h4>
<p>El campo bajo validación debe ser un valor después o igual a la fecha dada. Para mayor
    información, observa la regla after.</p>
<p></p>
<h4>alpha</h4>
<p>El campo bajo validación debe estar compuesto completamente por caracteres alfabéticos.</p>
<p></p>
<h4>alpha_dash</h4>
<p>El campo bajo validación puede tener caracteres alfanuméricos, al igual que guiones cortos y
    guiones largos.</p>
<p></p>
<h4>alpha_num</h4>
<p>El campo bajo validación debe estar compuesto completamente por caracteres alfanuméricos.</p>
<p></p>
<h4>array</h4>
<p>El campo bajo validación debe ser un <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span> de
    PHP.</p>
<p></p>
<h4>bail</h4>
<p>Detiene la ejecución de las reglas de validación después del primer error de validación.</p>
<p></p>
<h4>before:<em>date</em></h4>
<p>El campo bajo validación debe ser un valor que preceda la fecha dada. Las fechas serán pasadas a
    la función PHP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">strtotime</span>.
    Además, como la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">after</span>
    el nombre de otro campo bajo validación puede suministrarse como el valor de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fecha</span>.
</p>
<p></p>
<h4>before_or_equal:<em>date</em></h4>
<p>Este campo bajo validación debe ser un valor que preceda o igual a la fecha dada. Las fechas
    serán pasadas a la función de PHP <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">strtotime</span>.
    Además, como la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">after</span>
    el nombre de otro campo bajo validación puede suministrarse como el valor de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fecha</span>.
</p>
<p></p>
<h4>between:<em>min</em>,<em>max</em></h4>
<p>El campo bajo validación debe tener un tamaño entre el <em>min</em> y <em>max</em> dados. Las
    cadenas, los números, los arreglos y los archivos se evalúan de la misma manera que la regla
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size</span>.
</p>
<p></p>
<h4>boolean</h4>
<p>El campo bajo validación debe poder ser convertido como un booleano. Las entrada aceptadas son
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">1</span>, <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">0</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">"1"</span>, y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">"0"</span>.</p>
<p></p>
<h4>confirmed</h4>
<p>El campo bajo validación debe tener un campo que coincida con <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">foo_confirmation</span>.
    Por ejemplo, si el campo bajo validación es <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">password</span>,
    un campo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">password_confirmation</span>
    que coincida debe estar presente en la entrada.</p>
<p></p>
<h4>date</h4>
<p>El campo bajo validación debe ser una fecha válida, no relativa, de acuerdo a la función de PHP
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">strtotime</span>.
</p>
<p></p>
<h4>date_equals:<em>date</em></h4>
<p>El campo bajo validación debe ser igual a la fecha dada. Las fechas serán pasadas en la función
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">strtotime</span>
    de PHP.</p>
<p></p>
<h4>date_format:<em>format</em></h4>
<p>El campo bajo validación debe coincidir con el <em>format</em> dado. Deberías usar <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">date</span>
    <strong>o</strong> <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">date_format</span>
    al momento de validar un campo, no ambos.</p>
<p></p>
<h4>different:<em>field</em></h4>
<p>El campo bajo validación debe tener un valor distinto de <em>field</em>.</p>
<p></p>
<h4>digits:<em>value</em></h4>
<p>El campo bajo validación debe ser <em>numeric</em> y debe tener una longitud exacta de
    <em>value</em>.</p>
<p></p>
<h4>digits_between:<em>min</em>,<em>max</em></h4>
<p>El campo bajo validación debe tener una longitud entre los valores de <em>min</em> y <em>max</em>
    dados.</p>
<p></p>
<h4>dimensions</h4>
<p>El archivo bajo validación debe ser una imagen que cumpla con las restricciones de dimensión como
    las especificadas por los parámetros de la regla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'avatar' =&gt; 'dimensions:min_width=100,min_height=200'
</code></pre>

<p>Las restricciones disponibles son: <em>min_width</em>, <em>max_width</em>, <em>min_height</em>,
    <em>max_height</em>, <em>width</em>, <em>height</em>, <em>ratio</em>.</p>
<p>Una restricción <em>ratio</em> debería ser representada como el ancho dividido por la altura.
    Esto puede ser especificado o por una instrucción como <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">3/2</span> o
    en decimal como <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">1.5</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'avatar' =&gt; 'dimensions:ratio=3/2'
</code></pre>

<p>Dado que esta regla requiere varios argumentos, puedes usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Rule::dimensions</span>
    para construir con fluidez la regla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Validation\Rule;

Validator::make(\$data, [
    'avatar' =&gt; [
        'required',
        Rule::dimensions()-&gt;maxWidth(1000)-&gt;maxHeight(500)-&gt;ratio(3 / 2),
    ],
]);
</code></pre>

<p></p>
<h4>distinct</h4>
<p>Al momento de trabajar con arreglos, el campo bajo validación no debe tener ningún valor
    duplicado.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'foo.*.id' =&gt; 'distinct'
</code></pre>

<p></p>
<h4>email</h4>
<p>El campo bajo validación debe estar formateado como una dirección de correo electrónico.</p>
<p></p>
<h4>ends_with:<em>foo</em>,<em>bar</em>,...</h4>
<p>El campo bajo validación debe terminar con alguno de los valores dados.</p>
<p></p>
<h4>exists:<em>table</em>,<em>column</em></h4>
<p>El campo bajo validación debe existir en una tabla de base de datos dada.</p>
<h4>Uso Básico de la Regla Exists</h4>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'state' =&gt; 'exists:states'
</code></pre>

<p>Si la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">column</span>
    no está especificada, se usará el nombre del campo.</p>
<h4>Especificando un Nombre de Columna Personalizado</h4>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'state' =&gt; 'exists:states,abbreviation'
</code></pre>

<p>Ocasionalmente, puedes necesitar especificar una conexión de base de datos para que sea usada por
    la consulta de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exists</span>.
    Puedes acompañar esto al anteponer al nombre de la conexión el nombre de la tabla usando
    sintaxis de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'email' =&gt; 'exists:connection.staff,email'
</code></pre>

<p>Si prefieres personalizar la consulta ejecutada por la regla de validación, puedes usar la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Rule</span>
    para definir con fluidez la regla. En este ejemplo, también especificaremos las reglas de
    validación como un arreglo en vez de usar el carácter <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">|</span> para
    delimitarlas.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Validation\Rule;

Validator::make(\$data, [
    'email' =&gt; [
        'required',
        Rule::exists('staff')-&gt;where(function (\$query) {
            \$query-&gt;where('account_id', 1);
        }),
    ],
]);
</code></pre>

<p></p>
<h4>file</h4>
<p>El campo bajo validación debe ser un archivo que sea cargado exitosamente.</p>
<p></p>
<h4>filled</h4>
<p>El campo bajo validación no debe estar vacío cuando esté presente.</p>
<p></p>
<h4>gt:<em>field</em></h4>
<p>El campo bajo validación debe ser mayor que el <em>field</em> dado. Los dos campos deben ser del
    mismo tipo. Las cadenas, los números, los arreglos y los archivos se evalúan utilizando las
    mismas convenciones que la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size</span>.
</p>
<p></p>
<h4>gte:<em>field</em></h4>
<p>El campo bajo validación debe ser mayor o igual que el <em>field</em> dado. Los dos campos deben
    ser del mismo tipo. Las cadenas, los números, los arreglos y los archivos se evalúan utilizando
    las mismas convenciones que la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size</span>.
</p>
<p></p>
<h4>image</h4>
<p>El archivo bajo validación debe ser una imagen (jpeg, png, bmp, gif, svg o webp)</p>
<p></p>
<h4>in:<em>foo</em>,<em>bar</em>,...</h4>
<p>El archivo bajo validación debe estar incluido en la lista dada de valores. Debido a que esta
    regla requiere con frecuencia que hagas <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">implode</span>
    a un arreglo, el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Rule::in</span>
    puede ser usado para construir fluidamente la regla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Validation\Rule;

Validator::make(\$data, [
    'zones' =&gt; [
        'required',
        Rule::in(['first-zone', 'second-zone']),
    ],
]);
</code></pre>

<p></p>
<h4>in_array:<em>anotherfield</em>.*</h4>
<p>El campo bajo validación debe existir en los valores de <em>anotherfield</em>.</p>
<p></p>
<h4>integer</h4>
<p>El campo bajo validación debe ser un entero.</p>

<p>Nota</p>
<p>Esta regla de validación no verifica que el campo sea del tipo de variable "entero", sólo que el
    campo sea una cadena o valor número que contenga un entero.</p>

<p></p>
<h4>ip</h4>
<p>El campo bajo validación debe ser una dirección IP.</p>
<h4>ipv4</h4>
<p>El campo bajo validación debe ser una dirección IPv4.</p>
<h4>ipv6</h4>
<p>El campo bajo validación debe ser una dirección IPv6.</p>
<p></p>
<h4>json</h4>
<p>El campo bajo validación debe ser una cadena JSON válida.</p>
<p></p>
<h4>lt:<em>field</em></h4>
<p>El campo bajo validación debe ser menor que el <em>field</em> dado. Los dos campos deben ser del
    mismo tipo. Las cadenas, los números, los arreglos y los archivos se evalúan utilizando las
    mismas convenciones que la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size</span>.
</p>
<p></p>
<h4>lte:<em>field</em></h4>
<p>El campo bajo validación debe ser menor o igual que el <em>field</em> dado. Los dos campos deben
    ser del mismo tipo. Las cadenas, los números, los arreglos y los archivos se evalúan utilizando
    las mismas convenciones que la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size</span>.
</p>
<p></p>
<h4>max:<em>value</em></h4>
<p>El campo bajo validación debe ser menor que o igual a un <em>valor</em> máximo. Las cadenas, los
    números, los arreglos y los archivos son evaluados de la misma forma como la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size</span>.
</p>
<p></p>
<h4>mimetypes:<em>text/plain</em>,...</h4>
<p>El archivo bajo validación debe coincidir con uno de los tipos MIME dados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'video' =&gt; 'mimetypes:video/avi,video/mpeg,video/quicktime'
</code></pre>

<p>Para determinar el tipo MIME del archivo cargado, el contenido del archivo será leído y el
    framework intentará suponer el tipo MIME, el cual puede ser distinto del tipo MIME proporcionado
    por el cliente.</p>
<p></p>
<h4>mimes:<em>foo</em>,<em>bar</em>,...</h4>
<p>El archivo bajo validación debe tener un tipo MIME correspondiente a uno con las extensiones
    listadas.</p>
<h4>Uso Básico de la Regla MIME</h4>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'photo' =&gt; 'mimes:jpeg,bmp,png'
</code></pre>

<p>Incluso aunque solamente necesites especificar las extensiones, en realidad esta regla valida
    contra el tipo MIME del archivo mediante la lectura de los contenidos del archivo y adivinando
    su tipo MIME.</p>
<p>
    Una lista completa de tipos MIME y sus correspondientes extensiones pueden ser encontrados en la
    siguiente ubicación:

    https://svn.apache.org/repos/asf/httpd/httpd/trunk/docs/conf/mime.types

</p>
<p></p>
<h4>min:<em>value</em></h4>
<p>El campo bajo validación deben tener un <em>valor</em> mínimo. Las cadenas, los números, los
    arreglos y los archivos son evaluados en la misma forma como la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size</span>.
</p>
<p></p>
<h4>not_in:<em>foo</em>,<em>bar</em>,...</h4>
<p>El campo bajo validación no debe estar incluido en la lista dada de valores. El método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Rule::notIn</span>
    puede ser usado para construir fluidamente la regla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Validation\Rule;

Validator::make(\$data, [
    'toppings' =&gt; [
        'required',
        Rule::notIn(['sprinkles', 'cherries']),
    ],
]);
</code></pre>

<p></p>
<h4>not_regex:<em>pattern</em></h4>
<p>El campo bajo validación no debe coincidir con la expresión regular dada.</p>
<p>Internamente, esta regla usa la función PHP <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preg_match</span>.
    El patrón especificado debe obedecer el mismo formato requerido por <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preg_match</span>
    y, por lo tanto, también incluir delimitadores válidos. Por ejemplo: <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">'email' =&gt; 'not_regex:/^.+\$/i'</span>.
</p>
<p><strong>Nota:</strong> Al usar los patrones <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">regex</span> /
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">not_regex</span>,
    puede ser necesario especificar reglas en un arreglo en lugar de usar delimitadores de tubería,
    especialmente si la expresión regular contiene un carácter barra <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">|</span>.</p>
<p></p>
<h4>nullable</h4>
<p>El campo bajo validación puede ser <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>. Esto
    es particularmente útil al momento de validar tipos primitivos tales como cadenas y enteros que
    pueden contener valores <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>.
</p>
<p></p>
<h4>numeric</h4>
<p>El campo bajo validación debe ser numérico.</p>
<p></p>
<h4>present</h4>
<p>El campo bajo validación debe estar presente en los datos de entrada pero puede estar vacío.</p>
<p></p>
<h4>regex:<em>pattern</em></h4>
<p>El campo bajo validación debe coincidir con la expresión regular dada.</p>
<p>Internamente, esta regla usa la función PHP <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preg_match</span>.
    El patrón especificado debe obedecer el mismo formato requerido por <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preg_match</span>
    y, por lo tanto, también incluir delimitadores válidos. Por ejemplo: <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">'email' =&gt; 'regex:/^.+@.+\$/i'</span>.
</p>
<p><strong>Nota:</strong> Al usar los patrones <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">regex</span> /
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">not_regex</span>,
    puede ser necesario especificar reglas en un arreglo en lugar de usar delimitadores de tubería,
    especialmente si la expresión regular contiene un carácter barra <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">|</span>.</p>
<p></p>
<h4>required</h4>
<p>El campo bajo validación debe estar presente entre los datos entrada y no vacío. Un campo es
    considerado "vacío" si algunas de las siguientes condiciones es cierta:</p>
<ul>
    <li>El valor es <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>.
    </li>
    <li>El valor es una cadena vacía.</li>
    <li>El valor es un arreglo vacío o un objeto <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Countable</span>
        vacío.
    </li>
    <li>El valor es un archivo cargado sin ruta.</li>
</ul>
<p></p>
<h4>required_if:<em>anotherfield</em>,<em>value</em>,...</h4>
<p>El campo bajo validación debe estar presente y no vacío si el campo <em>anotherfield</em> es
    igual a cualquier <em>valor</em>.</p>
<p>Si deseas construir una condición más compleja para la regla <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">required_if</span>,
    puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Rule::requiredIf</span>.
    Este método acepta un valor booleano o un Closure. Cuando se pasa un Closure, éste debe devolver
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>
    para indicar si el campo bajo validación es obligatorio:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Validation\Rule;

Validator::make(\$request-&gt;all(), [
    'role_id' =&gt; Rule::requiredIf(\$request-&gt;user()-&gt;is_admin),
]);

Validator::make(\$request-&gt;all(), [
    'role_id' =&gt; Rule::requiredIf(function () use (\$request) {
        return \$request-&gt;user()-&gt;is_admin;
    }),
]);
</code></pre>

<p></p>
<h4>required_unless:<em>anotherfield</em>,<em>value</em>,...</h4>
<p>El campo bajo validación debe estar presente y no vacío a menos que el campo
    <em>anotherfield</em> sea igual a cualquier <em>valor</em>.</p>
<p></p>
<h4>required_with:<em>foo</em>,<em>bar</em>,...</h4>
<p>El campo bajo validación debe estar presente y no vacío <em>solamente si</em> cualquiera de los
    otros campos especificados están presentes.</p>
<p></p>
<h4>required_with_all:<em>foo</em>,<em>bar</em>,...</h4>
<p>El campo bajo validación debe estar presente y no vacío <em>solamente si</em> todos los otros
    campos especificados están presentes.</p>
<p></p>
<h4>required_without:<em>foo</em>,<em>bar</em>,...</h4>
<p>El campo bajo validación debe estar presente y no vacío <em>solamente cuando</em> cualquiera de
    los otros campos especificados no están presentes.</p>
<p></p>
<h4>required_without_all:<em>foo</em>,<em>bar</em>,...</h4>
<p>El campo bajo validación debe estar presente y no vacío <em>solamente cuando</em> todos los demás
    campos especificados no están presentes.</p>
<p></p>
<h4>same:<em>field</em></h4>
<p>El campo <em>field</em> dado debe coincidir con el campo bajo validación.</p>
<p></p>
<h4>size:<em>value</em></h4>
<p>El campo bajo validación debe tener un tamaño que coincida con el <em>valor</em> dado. Para datos
    de cadena, el <em>valor</em> corresponde al número de caracteres. Para datos numéricos, el <em>valor</em>
    corresponde a un valor entero dado. Para un arreglo, el valor <em>size</em> corresponde con el
    número de elementos del arreglo. Para archivos, el valor de <em>size</em> corresponde al tamaño
    del archivo en kilobytes.</p>
<p></p>
<h4>starts_with:<em>foo</em>,<em>bar</em>,...</h4>
<p>El campo bajo validación debe comenzar con uno de los valores dados.</p>
<p></p>
<h4>string</h4>
<p>El campo bajo validación debe ser una cadena. Si prefieres permitir que el campo también sea
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>,
    deberías asignar la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">nullable</span>
    al campo.</p>
<p></p>
<h4>timezone</h4>
<p>El campo bajo validación debe ser un identificador de zona horaria válida de acuerdo con la
    función de PHP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">timezone_identifiers_list</span>
</p>
<p></p>
<h4>unique:<em>table</em>,<em>column</em>,<em>except</em>,<em>idColumn</em></h4>
<p>El campo bajo validación debe ser único en una tabla de base de datos dada. Si la opción <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">column</span> no
    es especificada, el nombre del campo será usado.</p>
<p><strong>Especificando un nombre de columna personalizado:</strong></p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'email' =&gt; 'unique:users,email_address'
</code></pre>

<p><strong>Conexión de base de datos personalizada</strong></p>
<p>Ocasionalmente, puedes necesitar establecer una conexión personalizada para las consultas de
    bases de datos hechas por el validador. Como has visto anteriormente, al establecer <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique:users</span>
    como una regla de validación usará la conexión de base de datos predeterminada en la consulta de
    base de datos. Para sobrescribir esto, especifica la conexión y el nombre de la tabla usando la
    sintaxis de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'email' =&gt; 'unique:connection.users,email_address'
</code></pre>

<p><strong>Forzando una regla unique para ignorar un ID dado:</strong></p>
<p>Algunas veces, puedes desear ignorar un ID dado durante la verificación de unicidad. Por ejemplo,
    considera una pantalla "update profile" que incluya el nombre del usuario, dirección de correo
    electrónico, y ubicación. Posiblemente, querrás verificar que la dirección de correo electrónico
    es única. Sin embargo, si el usuario solamente cambia el campo nombre y no el campo con el
    correo electrónico, no quieres que un error de validación sea lanzado porque el usuario ya es el
    propietario de la dirección de correo electrónico.</p>
<p>Para instruir al validador para que ignore el ID del usuario, usaremos la clase <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Rule</span> para
    definir fluidamente la regla. En este ejemplo, también especificaremos las reglas de validación
    como un arreglo en lugar de usar el carácter <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">|</span> para
    delimitar las reglas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Validation\Rule;

Validator::make(\$data, [
    'email' =&gt; [
        'required',
        Rule::unique('users')-&gt;ignore(\$user-&gt;id),
    ],
]);
</code></pre>


<p>Nota</p>
<p>Nunca debes pasar ningún input de la solicitud controlado por cualquier usuario en el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ignore</span>.
    En su lugar, sólo debes pasar un ID único generado por el sistema, como un ID autoincremental o
    UUID de una instancia de modelo Eloquent. De lo contrario, tu aplicación será vulnerable a un
    ataque de inyección SQL.</p>

<p>En lugar de pasar el valor de la clave del modelo al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ignore</span>,
    puedes pasar la instancia completa del modelo. Laravel automáticamente extraerá la clave del
    modelo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Rule::unique('users')-&gt;ignore(\$user)
</code></pre>

<p>Si tu tabla usa un nombre de columna de clave primaria en vez de <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">id</span>, puedes
    especificar el nombre de la columna al momento de llamar al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ignore</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Rule::unique('users')-&gt;ignore(\$user-&gt;id, 'user_id')
</code></pre>

<p>Por defecto, la regla <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">única</span>
    verificará la unicidad de la columna que coincide con el nombre del atributo que se valida. Sin
    embargo, puede pasar un nombre de columna diferente como segundo argumento al método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Rule::unique('users', 'email_address')-&gt;ignore(\$user-&gt;id),
</code></pre>

<p><strong>Agregando cláusulas where adicionales:</strong></p>
<p>También puedes especificar restricciones de consultas al personalizar la consulta usando el
    método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>.
    Por ejemplo, agreguemos una restricción que verifique que el <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">account_id</span>
    es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">1</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'email' =&gt; Rule::unique('users')-&gt;where(function (\$query) {
    return \$query-&gt;where('account_id', 1);
})
</code></pre>

<p></p>
<h4>url</h4>
<p>El campo bajo validación debe ser una URL válida.</p>
<p></p>
<h4>uuid</h4>
<p>El campo bajo validación debe ser un identificador único universal (UUID) RFC 4122 (versión 1, 3,
    4 o 5) válido.</p>
<p></p>
<h2>Agregando reglas condicionalmente</h2>
<h4>Validando sólo cuando un campo esté presente</h4>
<p>En algunas situaciones, puedes desear ejecutar la verificación contra un campo
    <strong>solamente</strong> si ese campo está presente en el arreglo de campos. Para conseguir
    esto rápidamente, agrega la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sometimes</span>
    en tu lista:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$v = Validator::make(\$data, [
    'email' =&gt; 'sometimes|required|email',
]);
</code></pre>

<p>En el ejemplo anterior, el campo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">email</span>
    solamente será validado si está presente en el arreglo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$data</span>.
</p>

<p>TIP</p>
<p>Si estás intentando validar un campo que siempre deba estar presente pero puede estar vacío,
    revisa esta nota sobre campos opcionales</p>

<h4>Validación condicional compleja</h4>
<p>Algunas veces puedes desear agregar reglas de validación basadas en lógica condicional más
    compleja. Por ejemplo, puedes desear solicitar un campo dado solamente si otro campo tiene un
    valor mayor que 100. O, puedes necesitar que dos campos tengan un valor dado solamente cuando
    otro campo esté presente. Agregar estas reglas de validación no tiene que ser un dolor. Primero,
    crea una instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span>
    con tus <em>reglas estáticas</em> que nunca cambian:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$v = Validator::make(\$data, [
    'email' =&gt; 'required|email',
    'games' =&gt; 'required|numeric',
]);
</code></pre>

<p>Asumamos que nuestra aplicación web es sobre coleccionistas de juegos. Si un coleccionista de
    juego se registra con nuestra aplicación y posee más de 100 juegos, queremos que explique porqué
    posee tantos juegos. Por ejemplo, quizá administre una tienda de reventa de juegos, o puede ser
    que solo disfrute coleccionar. Para agregar este requerimiento condicionalmente, podemos usar el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sometimes</span>
    en la instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$v-&gt;sometimes('reason', 'required|max:500', function (\$input) {
    return \$input-&gt;games &gt;= 100;
});
</code></pre>

<p>El primer argumento pasado al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sometimes</span>
    es el nombre del campo que estamos validando condicionalmente. El segundo argumento son las
    reglas que queremos agregar. Si la <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>
    pasada como tercer argumento devuelve <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>,
    las reglas serán agregadas. Este método hace que sea muy fácil construir validaciones
    condicionales complejas Incluso puedes agregar validaciones condicionales para varios campos de
    una sola vez:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$v-&gt;sometimes(['reason', 'cost'], 'required', function (\$input) {
    return \$input-&gt;games &gt;= 100;
});
</code></pre>


<p>TIP</p>
<p>El parámetro <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$input</span>
    pasado a tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>
    será una instancia de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Fluent</span>
    y puede ser usado para acceder a tus campos y archivos.</p>

<p></p>
<h2>Validando arreglos</h2>
<p>Validar arreglos basados en campos de entrada de formulario no tiene que ser un dolor. Puedes
    usar "notación punto" para validar atributos dentro de un arreglo. Por ejemplo, si la solicitud
    entrante contiene un campo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">photos[profile]</span>,
    puedes validarlo como sigue:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$validator = Validator::make(\$request-&gt;all(), [
    'photos.profile' =&gt; 'required|image',
]);
</code></pre>

<p>También puedes validar cada elemento de un arreglo. Por ejemplo, para validar que cada dirección
    electrónica en un campo de entrada de arreglo sea único, puedes hacer lo siguiente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$validator = Validator::make(\$request-&gt;all(), [
    'person.*.email' =&gt; 'email|unique:users',
    'person.*.first_name' =&gt; 'required_with:person.*.last_name',
]);
</code></pre>

<p>De igual forma, puedes usar el carácter <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*</span> al
    momento de especificar tus mensajes de validación en tus archivos de idiomas, haciendo que sea
    muy fácil usar un único mensaje de validación para campos basados en arreglos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'custom' =&gt; [
    'person.*.email' =&gt; [
        'unique' =&gt; 'Each person must have a unique e-mail address',
    ]
],
</code></pre>

<p></p>
<h2>Reglas de validación personalizadas</h2>
<p></p>
<h3>Usando objetos de reglas</h3>
<p>Laravel proporciona una variedad de reglas de validación útiles; sin embargo, puedes desear
    especificar algunas propias. Un método para registrar reglas de validación personalizadas es
    usar objetos de regla. Para generar un nuevo objeto de regla, puedes usar el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:rule</span>.
    Usemos este comando para generar una regla que verifique que una cadena esté en mayúscula.
    Laravel colocará la nueva regla en el directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Rules</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:rule Uppercase
</code></pre>

<p>Una vez que la regla haya sido creada, estaremos listos para definir su comportamiento. Un objeto
    de regla contiene dos métodos: <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">passes</span>
    and <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">message</span>.
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">passes</span>
    recibe el nombre y valor de atributo, y debería devolver <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> o
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>
    dependiendo de si el valor de atributo es válido o no. El método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">message</span>
    debería devolver el mensaje de error de validación que debería ser usado cuando la validación
    falle:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;

class Uppercase implements Rule
{
    /**
    * Determine if the validation rule passes.
    *
    * @param  string  \$attribute
    * @param  mixed  \$value
    * @return bool
    */
    public function passes(\$attribute, \$value)
    {
        return strtoupper(\$value) === \$value;
    }

    /**
    * Get the validation error message.
    *
    * @return string
    */
    public function message()
    {
        return 'The :attribute must be uppercase.';
    }
}
</code></pre>

<p>Por supuesto, puedes ejecutar el helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans</span> de
    tu método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">message</span>
    si prefieres devolver un mensaje de error de tus archivos de traducción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the validation error message.
*
* @return string
*/
public function message()
{
    return trans('validation.uppercase');
}
</code></pre>

<p>Una vez que la regla haya sido definida, puedes adjuntarla a un validador al pasar una instancia
    del objeto de regla con tus otras reglas de validación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Rules\Uppercase;

\$request-&gt;validate([
    'name' =&gt; ['required', 'string', new Uppercase],
]);
</code></pre>

<p></p>
<h3>Usando closures</h3>
<p>Si solo necesitas la funcionalidad de una regla personalizada una vez a lo largo de tu
    aplicación, puedes usar un Closure en lugar de un objeto de regla. El Closure recibe el nombre
    del atributo, el valor del atributo y una retorno de llamada (callback) <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$fail</span>
    que se debe llamar si falla la validación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$validator = Validator::make(\$request-&gt;all(), [
    'title' =&gt; [
        'required',
        'max:255',
        function (\$attribute, \$value, \$fail) {
            if (\$value === 'foo') {
                \$fail(\$attribute.' is invalid.');
            }
        },
    ],
]);
</code></pre>

<p></p>
<h3>Usando extensiones</h3>
<p>Otro método para registrar reglas de validación personalizadas es usar el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> en
    la clase facade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span>.
    Usemos este método dentro de un proveedor de servicio para registrar una regla de validación
    personalizada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Validator;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Register any application services.
    *
    * @return void
    */
    public function register()
    {
        //
    }

    /**
    * Bootstrap any application services.
    *
    * @return void
    */
    public function boot()
    {
        Validator::extend('foo', function (\$attribute, \$value, \$parameters, \$validator) {
            return \$value == 'foo';
        });
    }
}
</code></pre>

<p>La Closure del validador personalizada recibe cuatro argumentos: el nombre del atributo <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$attribute</span>
    que está siendo validado, el valor <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$value</span>
    del atributo, un arreglo de <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$parameters</span>
    pasado a la regla, y la instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span>.
</p>
<p>También puedes pasar una clase y método al método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> en
    vez de una Closure:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Validator::extend('foo', 'FooValidator@validate');
</code></pre>

<h4>Definiendo el mensaje de error</h4>
<p>También necesitarás definir un mensaje de error para tu regla personalizada. Puedes hacer eso o
    usando un arreglo de mensajes personalizados en línea o agregando una entrada en el archivo de
    idioma de validación. Este mensaje debería ser colocado en el primer nivel del arreglo, no
    dentro del arreglo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">custom</span>,
    el cual es solamente para mensajes de error específico de atributos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>"foo" =&gt; "Your input was invalid!",

"accepted" =&gt; "The :attribute must be accepted.",

// The rest of the validation error messages...
</code></pre>

<p>Al momento de crear una regla de validación personalizada, algunas veces puedes necesitar definir
    reemplazos de marcadores personalizados para los mensajes de error. Puedes hacer eso creando un
    Validador personalizado cómo se describió anteriormente, entonces hacer una ejecución del método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">replacer</span>
    en la clase facade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span>.
    Puedes hacer esto dentro del método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    de un proveedor de servicio:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Bootstrap any application services.
*
* @return void
*/
public function boot()
{
    Validator::extend(...);

    Validator::replacer('foo', function (\$message, \$attribute, \$rule, \$parameters) {
        return str_replace(...);
    });
}
</code></pre>

<p></p>
<h3>Extensiones implicitas</h3>
<p>De forma predeterminada, cuando un atributo que está siendo validado no está presente o contiene
    un valor vacío como es definido por la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">required</span>,
    las reglas de validación normal, incluyendo las extensiones personalizadas, no son ejecutadas.
    Por ejemplo, la regla <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span>
    no será ejecutada contra un valor <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$rules = ['name' =&gt; 'unique:users,name'];

\$input = ['name' =&gt; ''];

Validator::make(\$input, \$rules)-&gt;passes(); // true
</code></pre>

<p>Para que una regla se ejecute incluso cuando un atributo esté vacío, la regla debe implicar que
    el atributo sea obligatorio. Para crear tal extensión "implícita", usa el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator::extendImplicit()</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Validator::extendImplicit('foo', function (\$attribute, \$value, \$parameters, \$validator) {
    return \$value == 'foo';
});
</code></pre>


<p>Nota</p>
<p>Una extensión "implícita" solamente <em>implica</em> que el atributo es obligatorio. Si esto
    realmente invalida un atributo vacío o faltante depende de ti.</p>

<h4>Reglas de objetos implicitas</h4>
<p>Si te gustaría que una regla de objeto se ejecute cuando un atributo está vacío, debes
    implementar la interfaz <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Validation\ImplicitRule</span>.
    Esta interfaz funciona como una "interfaz marcador" para el validador; por lo tanto, no contiene
    ningún metodo que necesites implementar.</p>
    </div>
""";