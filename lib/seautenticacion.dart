import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class SeAutenticacion extends StatelessWidget {
  final String title;
  SeAutenticacion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmSeAutenticacion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmSeAutenticacion = """
<div style='font-size: 14.2px;'>
<h1>Autenticación</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Consideraciones de la base de datos</li>
        </ul>
    </li>
    <li>
        Inicio rápido de dutenticación
        <ul>
            <li>Enrutamiento</li>
            <li>Vistas</li>
            <li>Autenticando</li>
            <li>Retornando el usuario autenticado</li>
            <li>Proteger Rutas</li>
            <li>Regulación De Inicio De Sesión</li>
        </ul>
    </li>
    <li>
        Autenticar usuarios manualmente
        <ul>
            <li>Recordar usuarios</li>
            <li>Otros métodos de autenticación</li>
        </ul>
    </li>
    <li>
        Autenticación HTTP básica
        <ul>
            <li>Autenticación HTTP básica sin estado</li>
        </ul>
    </li>
    <li>
        Cerrar sesión
        <ul>
            <li>Invalidar sesiones en otros dispositivos</li>
        </ul>
    </li>
    <li>

        Autenticar con redes sociales


    </li>
    <li>
        Agregar guards personalizados
        <ul>
            <li>Guards de closures de peticiones</li>
        </ul>
    </li>
    <li>
        Agregar proveedores de usuarios personalizados
        <ul>
            <li>La interfaz UserProvider</li>
            <li>La interfaz Authenticatable</li>
        </ul>
    </li>
    <li>Eventos</li>
</ul>

<h2>Introducción</h2>

<p>TIP</p>
<p><strong>¿Quieres comenzar rápido?</strong> Instala el paquete de Composer <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel/ui</span>
    y ejecuta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan ui vue --auth</span> en una nueva aplicación de Laravel. Luego,
    dirígete en tu navegador a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://tu-app.test/register</span> o cualquier otra URL
    asignada a tu aplicación. ¡Estos dos comandos se encargarán de generar todo el sistema de
    autenticación!</p>


<p>Laravel hace la implementación de la autenticación algo muy sencillo. De hecho, casi todo se
    configura para ti por defecto. El archivo de configuración de la autenticación está localizado
    en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/auth.php</span>, el cual contiene varias opciones bien documentadas para ajustar
    el comportamiento de los servicios de autenticación.</p>
<p>En esencia, las características de la autenticación de Laravel están compuestas de "guards"
    (guardias) y "providers" (proveedores). Los Guards definen cómo los usuarios son autenticados
    para cada petición. Por ejemplo, Laravel contiene un guard <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span> el cual mantiene
    el estado utilizando el almacenamiento de sesión y las cookies.</p>
<p>Los proveedores definen cómo se retornan los usuarios de tu almacenamiento persistente. Laravel
    cuenta con soporte para recuperar los usuarios utilizando Eloquent y el constructor de consultas
    de la base de datos. Sin embargo, eres libre de definir los proveedores adicionales que requiera
    tu aplicación.</p>
<p>¡No te preocupes si esto suena confuso por el momento! Muchas aplicaciones nunca necesitarán
    modificar la configuración predeterminada de la autenticación.</p>

<h3># Consideraciones de la base de datos</h3>
<p>De manera predeterminada, Laravel incluye un Modelo de Eloquent <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> en tu
    directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span>. Este modelo puede ser utilizado por el controlador de autenticación
    predeterminado de Eloquent. Si tu aplicación no utiliza Eloquent, deberás utilizar el
    controlador de autenticación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span> el cual utiliza el constructor de consultas
    (query builder) de Laravel.</p>
<p>Al crear el esquema de la base de datos para el modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span>, asegúrate de que la
    columna password sea de al menos 60 caracteres de longitud. Mantener una longitud de columna de
    cadena predeterminada a 255 caracteres sería una buena opción.</p>
<p>Además, debes verificar que tu tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span> (o equivalente) contenga un campo nulo de
    tipo cadena llamado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">remember_token</span> de 100 caracteres. Esta columna se usará para
    almacenar un token para los usuarios que seleccionen la opción "remember me" (recuérdame) cuando
    inicien sesión en tu aplicación.</p>

<h2>Inicio rápido de autenticación</h2>
<p>Laravel viene con varios controladores de autenticación preconstruidos, los cuales están
    localizados en el nombre de espacio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers\Auth</span>. <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span>
    maneja el registro de usuarios nuevos, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span> maneja la autenticación,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ForgotPasswordController</span> maneja el envío de correos electrónicos para restablecer
    la contraseña y el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ResetPasswordController</span> contiene la lógica para reiniciar
    contraseñas. Cada uno de estos controladores utiliza un trait para incluir los métodos
    necesarios. En la mayoría de los casos no tendrás que modificar estos controladores en lo
    absoluto.</p>

<h3># Enrutamiento</h3>
<p>El paquete de Laravel <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel/ui</span> proporciona una manera rápida de generar todas las
    rutas y vistas que necesitas para la autenticación con unos simples comando:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require laravel/ui
php artisan ui vue --auth
</code></pre>

<p>Este comando debe ser utilizado en aplicaciones nuevas e instalará vistas de diseño, registro e
    inicio de sesión, así como todas las rutas necesarias para la autenticación. También será
    generado un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">HomeController</span> que se encargará de manejar las peticiones posteriores
    al login, como mostrar el dashboard de la aplicación.</p>

<p>TIP</p>
<p>Si tu aplicación no necesita registro, puedes desactivarlo eliminando el recién creado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span>
    y modificando tu declaración de ruta: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth::routes(['register' =&gt; false]);</span>.</p>


<h3># Vistas</h3>
<p>Como se mencionó en la sección anterior, el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan ui vue --auth</span> del
    paquete <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel/ui</span> creará todas las vistas que se necesiten para la autenticación y
    las colocará en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/auth</span>.</p>
<p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ui</span> también creará el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/layouts</span>, el
    cual contendrá la plantilla base para tu aplicación. Todas estas vistas usan el framework de CSS
    Bootstrap, pero eres libre de modificarlo en base a tus preferencias.</p>

<h3># Autenticación</h3>
<p>Ahora que ya tienes tus rutas y vistas configuradas para los controladores de autenticación
    incluidos con el framework, ¡estás listo para registrar y autenticar usuarios nuevos para tu
    aplicación! Puedes acceder a tu aplicación en el navegador ya que los controladores de
    autenticación contienen la lógica (a través de traits) para autenticar usuarios existentes y
    almacenar usuarios nuevos en la base de datos.</p>
<h4># Personalizar rutas</h4>
<p>Cuando un usuario se ha autenticado exitosamente, será redirigido a la URI <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/home</span>.
    Puedes personalizar la ubicación de redireccionamiento post-autenticación definiendo una
    propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirectTo</span> en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ResetPasswordController</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">VerificationController</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>protected \$redirectTo = '/';
</code></pre>

<p>Luego, debes modificar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> del middleware
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RedirectIfAuthenticated</span> para usar tu nueva URI al redirigir al usuario.</p>
<p>Si la ruta de redireccionamiento necesita generar lógica personalizada puedes definir un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirectTo</span> en lugar de una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirectTo</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>protected function redirectTo()
{
    return '/path';
}
</code></pre>


<p>TIP</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirectTo</span> toma precedencia sobre la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirectTo</span>.
</p>

<h4># Personalizar usuario</h4>
<p>Por defecto, Laravel utiliza el campo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">email</span> para la autenticación. Si deseas
    modificar esto, puedes definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">username</span> en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>public function username()
{
    return 'username';
}
</code></pre>

<h4># Personalizar guard</h4>
<p>También puedes personalizar el "guard" que es utilizado para autenticar y registrar usuarios.
    Para empezar, define un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guard</span> en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ResetPasswordController</span>. Este método debe devolver una instancia de guard:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Auth;

protected function guard()
{
    return Auth::guard('guard-name');
}
</code></pre>

<h4># Validación / Personalizar almacenamiento</h4>
<p>Para modificar los campos del formulario que son requeridos cuando se registren usuarios nuevos
    en tu aplicación, o para personalizar cómo los nuevos usuarios son almacenados en tu base de
    datos, puedes modificar la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span>. Esta clase es responsable de
    validar y crear usuarios nuevos en tu aplicación.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validator</span> de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span> contiene las reglas de
    validación para los usuarios nuevos de tu aplicación. Eres libre de modificar este método según
    te convenga.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span> es responsable de crear
    registros nuevos de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> en tu base de datos usando el ORM Eloquent. Eres libre
    de modificar este método de acuerdo a las necesidades de tu base de datos.</p>

<h3># Retornando el usuario autenticado</h3>
<p>Puedes acceder al usuario autenticado por medio del facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Auth;

// Get the currently authenticated user...
\$user = Auth::user();

// Get the currently authenticated user's ID...
\$id = Auth::id();
</code></pre>

<p>Alternativamente, una vez que el usuario haya sido autenticado, puedes aceder al usuario
    autenticado mediante una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\Request</span>. Recuerda que las
    clases a las cuales se le declaren el tipo serán inyectadas automáticamente en los métodos de tu
    controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ProfileController extends Controller
{
    /**
        * Update the user's profile.
        *
        * @param  Request  \$request
        * @return Response
        */
    public function update(Request \$request)
    {
        // \$request-&gt;user() returns an instance of the authenticated user...
    }
}
</code></pre>

<h4># Determinar si el usuario actual está autenticado</h4>
<p>Para determinar si el usuario actual está loggeado en tu aplicación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">check</span>
    del facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span>, el cual devolverá <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si el usuario está
    autenticado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Auth;

if (Auth::check()) {
    // The user is logged in...
}
</code></pre>


<p>TIP</p>
<p>Aún cuando es posible determinar si un usuario está autenticado utilizando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">check</span>, típicamente deberás usar un middleware para verificar que el usuario está
    autenticado antes de permitir al usuario acceder a ciertas rutas / controladores. Para aprender
    más acerca de esto, echa un vistazo a la documentación para proteger rutas.</p>


<h3># Proteger rutas</h3>
<p>Puedes utilizar middleware de rutas para permitir acceder a ciertas rutas a los usuarios
    autenticados. Laravel incluye un middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth</span>, el cual está definido en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Auth\Middleware\Authenticate</span>.
    Ya que este middleware está registrado en tu kernel HTTP, todo lo que necesitas hacer es
    adjuntar el middleware a la definición de la ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('profile', function () {
    // Only authenticated users may enter...
})-&gt;middleware('auth');
</code></pre>

<p>Si estás utilizando controladores, puedes hacer una llamada al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">middleware</span>
    desde el constructor de tu controlador en lugar de adjuntarlo a la definición de la ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>public function __construct()
{
    \$this-&gt;middleware('auth');
}
</code></pre>

<h4># Redireccionar usuarios no autenticados</h4>
<p>Cuando el middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth</span> detecta un usuario no autorizado, redirigirá al usuario a
    la ruta nombrada <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">login</span>. Puedes modificar este comportamiento actualizando la
    función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirectTo</span> en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Middleware/Authenticate.php</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the path the user should be redirected to.
*
* @param  \Illuminate\Http\Request  \$request
* @return string
*/
protected function redirectTo(\$request)
{
    return route('login');
}
</code></pre>

<h4># Especificar un guard</h4>
<p>Cuando adjuntes el middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth</span> a una ruta, también puedes especificar cuál guard
    deberá ser utilizado para autenticar al usuario. El guard especificado deberá corresponder a una
    de las llaves en el arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guards</span> del archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>public function __construct()
{
    \$this-&gt;middleware('auth:api');
}
</code></pre>


<h3># Regulación De Inicio De Sesión</h3>
<p>Si estás utilizando la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span> incorporada en Laravel, el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Foundation\Auth\ThrottlesLogins</span>
    se encontrará incluído en tu controlador. De manera predeterminada, el usuario no será capaz de
    iniciar sesión durante un minuto si falla al proveer las credenciales correctas después de
    varios intentos. El regulador (o throttle) es único para el nombre de usuario / dirección de
    correo electrónico del usuario y su dirección IP.</p>

<h2>Autenticar usuarios manualmente</h2>
<p>Nota que no estás obligado a utilizar los controladores de autenticación incluidos en Laravel. Si
    deseas eliminar estos controladores, tendrás que encargarte de administrar la autenticación de
    usuarios utilizando las clases de autenticación de Laravel directamente. No te preocupes, ¡es
    algo sencillo!.</p>
<p>Vamos a acceder a los servicios de autenticación de Laravel por medio del facade, así que hay que
    asegurarnos de importar el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span> al inicio de la clase. Después, veamos el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attempt</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /**
    * Handle an authentication attempt.
    *
    * @param  \Illuminate\Http\Request \$request
    *
    * @return Response
    */
    public function authenticate(Request \$request)
    {
        \$credentials = \$request-&gt;only('email', 'password');

        if (Auth::attempt(\$credentials)) {
            // Authentication passed...
            return redirect()-&gt;intended('dashboard');
        }
    }
}
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attempt</span> acepta un arreglo de pares llave / valor como primer argumento.
    Los valores en el arreglo serán utilizados para encontrar el usuario en la tabla de tu base de
    datos. Así que, en el ejemplo anterior, el usuario se obtiene por el valor de la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">email</span>.
    Si se encuentra el usuario, la contraseña encriptada obtenida de la base de datos será comparada
    con el valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">password</span> pasado al método en el arreglo. No debes encriptar la
    contraseña especificada para el valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">password</span>, ya que el framework automáticamente
    va a encriptarlo antes de compararlo con la contraseña almacenada en la base de datos. Si dos
    contraseñas encriptadas coinciden, se iniciará una sesión autenticada para el usuario.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attempt</span> va a devolver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si la autenticación fue exitosa.
    De otra forma, devolverá <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">intended</span> del redireccionador va a redirigir al usuario a la URL que
    intentaba acceder antes de ser interceptado por el middleware de autenticación. Una URI de
    fallback puede ser proporcionada al método en caso de que el destino solicitado no esté
    disponible.</p>
<h4># Especificar condiciones adicionales</h4>
<p>Si lo deseas, puedes agregar condiciones extras a la consulta de autenticación además del correo
    electrónico del usuario y su contraseña. Por ejemplo, podemos verificar que un usuario esté
    marcado como "active":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Auth::attempt(['email' =&gt; \$email, 'password' =&gt; \$password, 'active' =&gt; 1])) {
    // The user is active, not suspended, and exists.
}
</code></pre>


<p>Nota</p>
<p>En estos ejemplos, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">email</span> no es una opción requerida, solamente es utilizado como
    ejemplo. Debes utilizar cualquier columna que corresponda a "username" en tu base de datos.</p>

<h4># Acceso a instancias específicas de guard</h4>
<p>Puedes especificar qué instancia de guard deseas usar utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guard</span> en
    el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span>. Esto te permitirá administrar la autentincación para partes
    separadas de tu aplicación utilizando modelos autenticables o tablas de usuarios independientes.
</p>
<p>El nombre del guard pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guard</span> deberá corresponder a uno de los guards
    configurados en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Auth::guard('admin')-&gt;attempt(\$credentials)) {
    //
}
</code></pre>

<h4># Cerrar sesión</h4>
<p>Para desconectar usuarios de tu aplicación, debes utilizar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">logout</span> del
    facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span>. Esto va a borrar la información de autenticación en la sesión del
    usuario:</p>
<pre style='background-color: #CFD8DC; color: #37474F;'><code>Auth::logout();
</code></pre>

<h3># Recordar usuarios</h3>
<p>Si desea proporcionar la funcionalidad de "recordarme" en tu aplicación, puedes pasar un valor
    booleano como segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attempt</span>, que mantendrá al usuario
    autenticado indefinidamente, o hasta que cierre su sesión manualmente. Tu tabla
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span> deberá incluir una columna de tipo string llamada <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">remember_token</span>,
    que será utilizada para almacenar el token de "recordarme".</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Auth::attempt(['email' =&gt; \$email, 'password' =&gt; \$password], \$remember)) {
    // The user is being remembered...
}
</code></pre>


<p>TIP</p>
<p>Si estás utilizando el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span> integrado en tu instalación de Laravel, la
    lógica apropiada para "recordar" usuarios ya se encontrará implementada por los traits
    utilizados por el controlador.</p>

<p>Si estás "recordando" usuarios, puedes utilizar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">viaRemember</span> para
    determinar si el usuario se ha autenticado utilizando la cookie "recordarme":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Auth::viaRemember()) {
    //
}
</code></pre>


<h3># Otros métodos de autenticación</h3>
<h4># Autenticar una instancia de usuario</h4>
<p>Si necesitas registrar una instancia de usuario existente en tu aplicación, puedes llamar al
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">login</span> con la instancia de usuario. El objeto proporcionado deberá ser una
    implementación de la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Auth\Authenticatable</span>. El modelo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> incluido en Laravel ya implementa esta interfaz:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Auth::login(\$user);

// Login and "remember" the given user...
Auth::login(\$user, true);
</code></pre>

<p>Puedes especificar la instancia de guard que desees utilizar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Auth::guard('admin')-&gt;login(\$user);
</code></pre>

<h4># Autenticar un usuario por ID</h4>
<p>Para autenticar un usuario en tu aplicación por su ID, debes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loginUsingId</span>. Este método acepta la clave primaria del usuario que deseas
    autenticar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Auth::loginUsingId(1);

// Login and "remember" the given user...
Auth::loginUsingId(1, true);
</code></pre>

<h4># Autenticar un usuario una vez</h4>
<p>Puedes utilizar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">once</span> para autenticar un usuario en tu aplicación para una
    única solicitud. No se utilizarán sesiones o cookies, lo que significa que este método puede ser
    bastante útil al construir una API sin estado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Auth::once(\$credentials)) {
    //
}
</code></pre>


<h2>Autenticación HTTP básica</h2>
<p>
    La

    autenticación HTTP básica


    proporciona una manera rápida de autenticar usuarios en tu aplicación sin configurar una página
    de "login" dedicada. Para iniciar, adjunta el middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.basic</span> a tu ruta. El
    middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.basic</span> está incluido en el framework de Laravel, por lo que no hay
    necesidad de definirlo:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('profile', function () {
    // Only authenticated users may enter...
})-&gt;middleware('auth.basic');
</code></pre>

<p>Una vez que el middleware haya sido adjuntado a la ruta, se preguntará automáticamente por las
    credenciales al acceder a la ruta desde tu navegador. Por defecto, el middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.basic</span>
    va a usar la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">email</span> en el registro del usuario como "nombre de usuario".</p>
<h4># Una nota sobre FastCGI</h4>
<p>Si estás usando PHP FastCGI, la Autentincación Básica HTTP podría no funcionar correctamente por
    defecto. Las siguientes líneas deberán ser agregadas a tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.htaccess</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>RewriteCond %{HTTP:Authorization} ^(.+)\$
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]
</code></pre>


<h3># Autenticación HTTP básica sin estado</h3>
<p>También puedes utilizar la Autenticación HTTP Básica sin establecer una cookie de identificación
    en la sesión, esto es particularmente útil para la autenticacíon API. Para hacer esto define un
    middleware que llame al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onceBasic</span>. Si el método no devuelve ninguna
    respuesta, la petición puede pasarse a la aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Middleware;

use Illuminate\Support\Facades\Auth;

class AuthenticateOnceWithBasicAuth
{
    /**
    * Handle an incoming request.
    *
    * @param  \Illuminate\Http\Request  \$request
    * @param  \Closure  \$next
    * @return mixed
    */
    public function handle(\$request, \$next)
    {
        return Auth::onceBasic() ?: \$next(\$request);
    }

}
</code></pre>

<p>A continuación registra el middleware de ruta y adjúntalo a la ruta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('api/user', function () {
    // Only authenticated users may enter...
})-&gt;middleware('auth.basic.once');
</code></pre>


<h2>Logging Out</h2>
<p>Para cerrar manualmente la sesión de un usuario en tu aplicación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">logout</span>
    en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span>. Esto limpiará la información de autenticación en la sesión del
    usuario:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Auth;

Auth::logout();
</code></pre>


<h3># Invalidando sesiones en otros dispositivos</h3>
<p>Laravel también proporciona un mecanismo para invalidar y "sacar" las sesiones de un usuario que
    están activas en otros dispositivos sin invalidar la sesión en el dispositivo actual. Antes de
    comenzar, debes asegurarte de que el middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Session\Middleware\AuthenticateSession</span>
    está presente y no está comentado en tu clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Kernel.php</span> del grupo de
    middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'web' =&gt; [
    // ...
    \Illuminate\Session\Middleware\AuthenticateSession::class,
    // ...
]
</code></pre>

<p>Luego, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">logoutOtherDevices</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span>. Este
    método requiere que el usuario proporcione su contraseña actual, que tu aplicación debe aceptar
    mediante un campo de formulario:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Auth;

Auth::logoutOtherDevices(\$password);
</code></pre>


<p>Nota</p>
<p>Cuando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">logoutOtherDevices</span> es invocado, las otras sesiones del usuario
    serán invalidadas completamente, lo que quiere decir que serán "sacadas" de todos los guards en
    los que previamente estaban autenticadas.</p>


<h2>Agregar guards personalizados</h2>
<p>Puedes definir tu propio guard de autenticación utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> en el
    facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span>. Debes colocar la llamada a este método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> en el
    proveedor de servicios. Ya que Laravel cuenta con un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AuthServiceProvider</span>, puedes
    colocar el código en ese proveedor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use App\Services\Auth\JwtGuard;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
    * Register any application authentication / authorization services.
    *
    * @return void
    */
    public function boot()
    {
        \$this-&gt;registerPolicies();

        Auth::extend('jwt', function (\$app, \$name, array \$config) {
            // Return an instance of Illuminate\Contracts\Auth\Guard...

            return new JwtGuard(Auth::createUserProvider(\$config['provider']));
        });
    }
}
</code></pre>

<p>Como puedes ver en el ejemplo anterior, el callback pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> deberá
    retornar una implementación de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Auth\Guard</span>. Esta interfaz
    contiene algunos métodos que tendrás que implementar para definir un guard personalizado. Una
    vez que tu guard personalizado haya sido definido, podrás utilizar este guard en la
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guards</span> de tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'guards' =&gt; [
    'api' =&gt; [
        'driver' =&gt; 'jwt',
        'provider' =&gt; 'users',
    ],
],
</code></pre>


<h3># Guards de closures de peticiones</h3>
<p>La forma más sencilla de implementar un sistema de autenticación basado en peticiones HTTP es
    usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth:viaRequest</span>. Este método te permite definir rápidamente tu
    proceso de autenticación usando sólo un Closure.</p>
<p>Para comenzar, llama al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth::viaRequest</span> dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AuthServiceProvider</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">viaRequest</span> acepta el nombre de un
    driver de autenticación como su primer argumento. Este nombre puede ser cualquier cadena que
    describa tu guard personalizado. El segundo argumento pasado al método debe ser un Closure que
    reciba la petición HTTP entrante y retorne una instancia de usuario o, si la autenticación
    falla, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

/**
* Register any application authentication / authorization services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;registerPolicies();

    Auth::viaRequest('custom-token', function (\$request) {
        return User::where('token', \$request-&gt;token)-&gt;first();
    });
}
</code></pre>

<p>Una vez que tu driver de autenticación personalizado ha sido definido, úsalo como un driver
    dentro de la configuración de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guards</span> de tu archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'guards' =&gt; [
    'api' =&gt; [
        'driver' =&gt; 'custom-token',
    ],
],
</code></pre>


<h2>Agregar proveedores de usuario personalizados</h2>
<p>Si no estás utilizando una base de datos relacional tradicional para almacenar a tus usuarios,
    deberás extender Laravel con tu propio proveedor de autenticación. Usaremos el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">provider</span>
    en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span> para definir un proveedor de usuarios personalizado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\Auth;
use App\Extensions\RiakUserProvider;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
    * Register any application authentication / authorization services.
    *
    * @return void
    */
    public function boot()
    {
        \$this-&gt;registerPolicies();

        Auth::provider('riak', function (\$app, array \$config) {
            // Return an instance of Illuminate\Contracts\Auth\UserProvider...

            return new RiakUserProvider(\$app-&gt;make('riak.connection'));
        });
    }
}
</code></pre>

<p>Después de haber registrado el proveedor utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">provider</span>, puedes
    cambiar al nuevo proveedor de usuarios en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.php</span>.
    Primero, define un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">provider</span> que utilice tu nuevo controlador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'providers' =&gt; [
    'users' =&gt; [
        'driver' =&gt; 'riak',
    ],
],
</code></pre>

<p>Finalmente, puedes utilizar este proveedor en tu configuración de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guards</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'guards' =&gt; [
    'web' =&gt; [
        'driver' =&gt; 'session',
        'provider' =&gt; 'users',
    ],
],
</code></pre>


<h3># La interfaz UserProvider</h3>
<p>Las implementaciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Auth\UserProvider</span> son responsables
    solamente de obtener una implementación de
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Auth\Authenticatable</span> desde un sistema de almacenamiento
    persistente, como MySQL, Riak, etc. Estas dos interfaces permiten a los mecanismos de
    autenticación de Laravel continuar funcionando independientemente de cómo esté almacenada la
    información del usuario o qué tipo de clase es utilizado para representarlo.</p>
<p>Echemos un vistaso a la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Auth\UserProvider</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace Illuminate\Contracts\Auth;

interface UserProvider {

    public function retrieveById(\$identifier);
    public function retrieveByToken(\$identifier, \$token);
    public function updateRememberToken(Authenticatable \$user, \$token);
    public function retrieveByCredentials(array \$credentials);
    public function validateCredentials(Authenticatable \$user, array \$credentials);

}
</code></pre>

<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retrieveById</span> generalmente recibe una clave que representa al usuario,
    como un ID auto-incrementable de una base de datos MySQL. La implementación <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Authenticatable</span>
    que coincida con el ID deberá ser recuperado y retornado por el método.</p>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retireveByToken</span> recupera un usuario por su <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$identifier</span>
    único y su <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$token</span> "recordar datos", almacenados en el campo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">remember_token</span>. Como en el método anterior, la implementación
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Authenticatable</span> deberá ser retornado.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateRememberToken</span> actualiza el campo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$user</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">remember_token</span>
    con el nuevo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$token</span>. Un nuevo token es asignado en un inicio de sesión con
    "recordar datos" o cuando el usuario cierre su sesión.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retrieveByCredentials</span> recupera el arreglo de credenciales pasadas al
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth::attempt</span> cuando intenta loguearse a la aplicación. El método "consulta"
    el almacenamiento persistente en busca de las credenciales que coincidan con las del usuario.
    Típicamente, este método va a ejecutar una consulta con una condición "where" en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$credentials['username']</span>.
    El método deberá retornar una implementación de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Authenticatable</span>. <strong>Este
        método no debe intentar realizar ninguna validación o autenticación por contraseña.</strong>
</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validateCredentials</span> deberá comparar el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$user</span> proporcionado
    con sus <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$credentials</span> para autenticar el usuario. Por ejemplo, este método puede
    utilizar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Hash::check</span> para comparar los valores de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$user-&gt;getAuthPassword()</span>
    al valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$credentials['password']</span>. Este método deberá retornar
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> indicando si la contraseña es válida o no.</p>

<h3># La interfaz Authenticatable</h3>
<p>Ahora que hemos explorado cada uno de los métodos en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserProvider</span>, vamos a echar un
    vistazo a la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Authenticatable</span>. Recuerda, el proveedor deberá retornar
    implementaciones de esta interfaz desde los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retrieveById</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retrieveByToken</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retrieveByCredentials</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace Illuminate\Contracts\Auth;

interface Authenticatable {

    public function getAuthIdentifierName();
    public function getAuthIdentifier();
    public function getAuthPassword();
    public function getRememberToken();
    public function setRememberToken(\$value);
    public function getRememberTokenName();

}
</code></pre>

<p>Esta interfaz es simple. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getAuthIdentifierName</span> debe retornar el nombre del
    campo "clave primaria" del usuario y el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getAuthIdentifier</span> deberá retornar la
    "clave primaria" del usuario. En un backend MySQL, nuevamente, esto deberá ser la clave
    auto-incrementable. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getAuthPassword</span> deberá retornar la contraseña
    encriptada del usuario. Esta interfaz permite que el sistema de autenticación funcione con
    cualquier clase de usuario, independientemente de qué capa de abstracción o qué ORM se está
    utilizando. Por defecto, Laravel incluye una clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> en el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> que implementa esta interfaz, por lo que puedes consultar esta clase para
    obtener un ejemplo de implementación.</p>

<h2>Eventos</h2>
<p>Laravel genera una variedad de eventos durante el proceso de autenticación. Puedes adjuntar
    listeners a estos eventos en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The event listener mappings for the application.
*
* @var array
*/
protected \$listen = [
    'Illuminate\Auth\Events\Registered' =&gt; [
        'App\Listeners\LogRegisteredUser',
    ],

    'Illuminate\Auth\Events\Attempting' =&gt; [
        'App\Listeners\LogAuthenticationAttempt',
    ],

    'Illuminate\Auth\Events\Authenticated' =&gt; [
        'App\Listeners\LogAuthenticated',
    ],

    'Illuminate\Auth\Events\Login' =&gt; [
        'App\Listeners\LogSuccessfulLogin',
    ],

    'Illuminate\Auth\Events\Failed' =&gt; [
        'App\Listeners\LogFailedLogin',
    ],

    'Illuminate\Auth\Events\Logout' =&gt; [
        'App\Listeners\LogSuccessfulLogout',
    ],

    'Illuminate\Auth\Events\Lockout' =&gt; [
        'App\Listeners\LogLockout',
    ],

    'Illuminate\Auth\Events\PasswordReset' =&gt; [
        'App\Listeners\LogPasswordReset',
    ],
];
</code></pre>
</div>
""";