import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PqSocialite extends StatelessWidget {
  final String title;
  PqSocialite(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPqSocialite,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPqSocialite = """
<!-- Laravel Socialite -->
<div style='font-size: 14.2px;'>
  <h1>Laravel Socialite</h1>
  <ul>
    <li>Introducción</li>
    <li>Actualizando Socialite</li>
    <li>Instalación</li>
    <li>Configuración</li>
    <li>Enrutamiento</li>
    <li>Parámetros opcionales</li>
    <li>Alcances de acceso</li>
    <li>Autenticación sin estado</li>
    <li>Obteniendo detalles de usuario</li>
  </ul>

  <h2>Introducción</h2>
  <p>
    Además de la típica, autenticación basada en formularios, Laravel también proporciona una sencilla y conveniente forma de autenticar con proveedores OAuth usando Laravel Socialite
    <outboundlink></outboundlink>
    . Actualmente Socialite soporta autenticación con Facebook, Twitter, LinkedIn, Google, Github, GitLab y Bitbucket.
  </p>

  <p>TIP</p>
  <p>
    Los adaptadores para otras plataformas son listados en el sitio web de Proveedores de Socialite
    <outboundlink></outboundlink>
    manejado por la comunidad.
  </p>

  <h2>Actualizando Socialite</h2>
  <p>
    Al actualizar a una nueva versión principal de Socialite, es importante que revise cuidadosamente la guía de actualización .
  </p>

  <h2>Instalación</h2>
  <p>Para empezar con Socialite, usa Composer para agregar el paquete a las dependencias de tu proyecto:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require laravel/socialite
</code></pre>

  <h2>Configuración</h2>
  <p>Antes de usar Socialite, también necesitaras agregar las credenciales para los servicios OAuth que tu aplicación utiliza. Estas credenciales deberían estar colocadas en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/services.php</span>, y debería usar la clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">facebook</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">twitter</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">linkedin</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">google</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">github</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">gitlab</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bitbucket</span> dependiendo del proveedor que tu aplicación requiera. Por ejemplo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'github' =&gt; [
    'client_id' =&gt; env('GITHUB_CLIENT_ID'),         // Your GitHub Client ID
    'client_secret' =&gt; env('GITHUB_CLIENT_SECRET'), // Your GitHub Client Secret
    'redirect' =&gt; 'http://your-callback-url',
],
</code></pre>

  <p>TIP</p>
  <p>Si la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirect</span> contiene una ruta relativa, será resuelta automáticamente a una URL completamente calificada.</p>

  <h2>Enrutamiento</h2>
  <p>A continuación, ¡estás listo para autenticar usuarios! Necesitarás dos rutas: una para redireccionar el usuario al proveedor OAuth y otra para recibir la función de retorno del proveedor después de la autenticación. Accederemos a Socialite usando la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Socialite</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Controllers\Auth;

use Socialite;

class LoginController extends Controller
{
    /**
    * Redirect the user to the GitHub authentication page.
    *
    * @return \Illuminate\Http\Response
    */
    public function redirectToProvider()
    {
        return Socialite::driver('github')-&gt;redirect();
    }

    /**
    * Obtain the user information from GitHub.
    *
    * @return \Illuminate\Http\Response
    */
    public function handleProviderCallback()
    {
        \$user = Socialite::driver('github')-&gt;user();

        // \$user-&gt;token;
    }
}
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirect</span> se toma la tarea de enviar el usuario al proveedor OAuth, mientras que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span> leerá la solicitud entrante y obtendrá lá información del usuario desde el proveedor.</p>
  <p>Necesitarás definir las rutas para tus métodos de controlador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::get('login/github', 'Auth\LoginController@redirectToProvider');
Route::get('login/github/callback', 'Auth\LoginController@handleProviderCallback');
</code></pre>

  <h2>Parámetros opcionales</h2>
  <p>Un número de proveedores OAuth soportan parámetros opcionales en la solicitud de redirección. Para incluir algunos de los parámetros opcionales en la solicitud, llama el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span> con un arreglo asociativo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return Socialite::driver('google')
    -&gt;with(['hd' =&gt; 'example.com'])
    -&gt;redirect();
</code></pre>

  <p>Nota</p>
  <p>Al momento de usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>, procura no pasar algunas palabras reservadas tales como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">state</span> or <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">response_type</span>.</p>

  <h2>Alcances de acceso</h2>
  <p>Antes de redirecionar al usuario, también puedes agregar "alcances (scopes)" adicionales en la solicitud usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">scopes</span>. Este método mezclará todos los alcances existentes con los que suministras:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return Socialite::driver('github')
    -&gt;scopes(['read:user', 'public_repo'])
    -&gt;redirect();
</code></pre>

  <p>Puedes sobrescribir todos los alcances existentes usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">setScopes</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return Socialite::driver('github')
    -&gt;setScopes(['read:user', 'public_repo'])
    -&gt;redirect();
</code></pre>

  <h2>Autenticación sin estado</h2>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stateless</span> puede ser usado para deshabilitar la verificación de estado de sesión. Esto es útil al momento de agregar la autenticación de una red social a una API.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>return Socialite::driver('google')-&gt;stateless()-&gt;user();
</code></pre>

  <h2>Obteniendo detalles de usuario</h2>
  <p>Una vez que tengas una instancia de usuario, puedes aprovechar de obtener algunos detalles del usuario:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = Socialite::driver('github')-&gt;user();

// OAuth Two Providers
\$token = \$user-&gt;token;
\$refreshToken = \$user-&gt;refreshToken; // not always provided
\$expiresIn = \$user-&gt;expiresIn;

// OAuth One Providers
\$token = \$user-&gt;token;
\$tokenSecret = \$user-&gt;tokenSecret;

// All Providers
\$user-&gt;getId();
\$user-&gt;getNickname();
\$user-&gt;getName();
\$user-&gt;getEmail();
\$user-&gt;getAvatar();
</code></pre>

  <h4>Obteniendo Los detalles de usuario desde un token (OAuth2)</h4>
  <p>Si ya tienes un token de acceso válido de un usuario, puedes obtener sus detalles usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">userFromToken</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = Socialite::driver('github')-&gt;userFromToken(\$token);
</code></pre>

  <h4>Obteniendo los detalles de usuario desde un token y secreto (OAuth1)</h4>
  <p>Si ya tienes un par válido de token / secreto de un usuario, puedes obtener sus detalles usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">userFromTokenAndSecret</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = Socialite::driver('twitter')-&gt;userFromTokenAndSecret(\$token, \$secret);
</code></pre>
</div>
""";