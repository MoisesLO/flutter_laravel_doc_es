import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class SeApi extends StatelessWidget {
  final String title;
  SeApi(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmSeApi,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmSeApi = """
<div style='font-size: 14.2px;'>
<h1>Autenticación de API</h1>
<ul>
    <li>Introducción</li>
    <li>
        Configuración
        <ul>
            <li>Migraciones de la base de datos</li>
        </ul>
    </li>
    <li>
        Generando tokens
        <ul>
            <li>Hashing tokens</li>
        </ul>
    </li>
    <li>Protegiendo rutas</li>
    <li>Pasando tokens en peticiones</li>
</ul>

<h2>Introducción</h2>
<p>Por defecto, Laravel viene con una sencilla solución para autenticación de API mediante tokens
    aleatorios asignados a cada usuario de tu aplicación. En tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/auth.php</span>,
    un guard <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api</span> ya está definido y utiliza un driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">token</span>. Este driver
    es responsable de inspeccionar el token de la API en la petición entrante y verificar que
    coincida con el token asignado al usuario en la base de datos.</p>
<blockquote>
    <p>
        <strong>Nota:</strong> Aunque Laravel viene con un sencillo guard de autenticación basado en
        token, te recomendamos considerar usar
        Laravel Passport
        para aplicaciones robustas en producción que ofrecen autenticación de API.
    </p>
</blockquote>

<h2>Configuración</h2>

<h3># Preparando la base de datos</h3>
<p>
    Antes de usar el driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">token</span>, necesitarás
    crear una migración
    que agrega una columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api_token</span> a tu tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Schema::table('users', function (\$table) {
    \$table-&gt;string('api_token', 80)-&gt;after('password')
                        -&gt;unique()
                        -&gt;nullable()
                        -&gt;default(null);
});
</code></pre>

<p>Una vez que la migración ha sido creada, ejecuta el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate</span>.</p>

<p>TIP</p>
<p>Si eliges usar un nombre de columna diferente, asegurate de actualizar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage_key</span>
    de la configuración de tu API en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/auth.php</span>.</p>



<h2>Generando tokens</h2>
<p>Una vez que la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api_token</span> ha sido agregada a tu tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span>,
    estás listo para asignar tokens de API aleatorios a cada usuario que se registra en tu
    aplicación. Debes asignar dichos tokens cuando un modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> es creado para el
    usuario durante el registro. Al usar el scaffolding de autenticación proporcionado por el
    paquete de composer <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel/ui</span>, esto puede ser hecho en el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;
use Illuminate\Support\Facades\Hash;

/**
* Create a new user instance after a valid registration.
*
* @param  array  \$data
* @return \App\User
*/
protected function create(array \$data)
{
    return User::create([
        'name' =&gt; \$data['name'],
        'email' =&gt; \$data['email'],
        'password' =&gt; Hash::make(\$data['password']),
        'api_token' =&gt; Str::random(60),
    ]);
}
</code></pre>


<h3># Hashing tokens</h3>
<p>En los ejemplos de arriba, los tokens de API son almacenados en tu base de datos como texto
    plano. Si te gustaría agregar un hash a tus tokens de API usando hashing SHA-256, puedes
    establecer la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hash</span> de la configuración del guard de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api</span> a
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>. El guard <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api</span> está definido en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/auth.php</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'api' =&gt; [
    'driver' =&gt; 'token',
    'provider' =&gt; 'users',
    'hash' =&gt; true,
],
</code></pre>

<h4># Generando tokens con hash</h4>
<p>Al usar tokens de API con hash, no debes generar tus tokens de API durante el registro del
    usuario. En su lugar, necesitarás implementar tu propia página de administración de tokens de
    API dentro de tu aplicación. Esta página debe permitir a los usuarios inicializar y refrescar
    sus token de API. Cuando un usuario realiza una petición para inicializar o refrescar su token,
    debes almacenar una copia con hash del token en la base de datos y retornar una copia de texto
    plano del token a la vista / frontend del cliente para ser mostrado una sola vez.</p>
<p>Por ejemplo, un método de controlador que inicializa / refresca el token para un usuario dado y
    retorna el texto plano del token como una respuesta JSON pudiera verse de la siguiente
    manera:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Support\Str;
use Illuminate\Http\Request;

class ApiTokenController extends Controller
{
    /**
    * Update the authenticated user's API token.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @return array
    */
    public function update(Request \$request)
    {
        \$token = Str::random(60);

        \$request-&gt;user()-&gt;forceFill([
            'api_token' =&gt; hash('sha256', \$token),
        ])-&gt;save();

        return ['token' =&gt; \$token];
    }
}
</code></pre>


<p>TIP</p>
<p>Dado que los tokens de la API en el ejemplo supierior tienen suficiente entropía, es impractico
    crear "tablas arcoiris" que buscar el valor original del token con hash. Por lo tanto, métodos
    de hashing lentos como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bcrypt</span> son innecesarios.</p>


<h2>Protegiendo rutas</h2>
<p>Laravel incluye un guard de autenticación que validará automáticamente tokens de API en
    peticiones entrantes. Sólo necesitas especificar el middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth:api</span> en
    cualquier ruta que requiera un token de acceso válido:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Http\Request;

Route::middleware('auth:api')-&gt;get('/user', function(Request \$request) {
    return \$request-&gt;user();
});
</code></pre>


<h2>Pasando tokens En peticiones</h2>
<p>Hay muchas formas de pasar el token de la API a tu aplicación. Discutiremos cada una de esas
    formas mientras usamos el paquete HTTP Guzzle para demostrar su uso. Puedes elegir cualquiera de
    estas formas dependiendo de las necesidades de tu aplicación.</p>
<h4># Query string</h4>
<p>Los usuarios de tu API pueden especificar su token como un valor de cadena de consulta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api_token</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$response = \$client-&gt;request('GET', '/api/user?api_token='.\$token);
</code></pre>

<h4># Request payload</h4>
<p>Los usuarios de tu API pueden incluir su token de API en los parametros del formulario de la
    petición como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api_token</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$response = \$client-&gt;request('POST', '/api/user', [
    'headers' =&gt; [
        'Accept' =&gt; 'application/json',
    ],
    'form_params' =&gt; [
        'api_token' =&gt; \$token,
    ],
]);
</code></pre>

<h4># Bearer token</h4>
<p>Los usuarios de tu API pueden proporcionar su token de API como un token <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Bearer</span> en
    el encabezado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Authorization</span> de la petición:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$response = \$client-&gt;request('POST', '/api/user', [
    'headers' =&gt; [
        'Authorization' =&gt; 'Bearer '.\$token,
        'Accept' =&gt; 'application/json',
    ],
]);
</code></pre>
</div>
""";