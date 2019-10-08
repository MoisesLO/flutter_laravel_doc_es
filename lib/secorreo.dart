import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class SeCorreo extends StatelessWidget {
  final String title;
  SeCorreo(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmSeCorreo,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmSeCorreo = """
<div style='font-size: 14.2px;'>
<h1>Verificación de Correo Electrónico</h1>
<ul>
    <li>Introducción</li>
    <li>Consideraciones de la base De datos</li>
    <li>
        Rutas
        <ul>
            <li>Protegiendo rutas</li>
        </ul>
    </li>
    <li>Vistas</li>
    <li>Luego de verificar correos electrónicos</li>
    <li>Eventos</li>
</ul>

<h2>Introducción</h2>
<p>Muchas aplicaciones web requieren que los usuarios verifiquen sus correos electrónicos usando la
    aplicación. En lugar de forzarte a volver a implementar esto en cada aplicación, Laravel
    proporciona métodos convenientes para enviar y verificar solicitudes de verificación de correos
    electrónicos.</p>
<h3># Preparación del modelo</h3>
<p>Para comenzar, verifica que tu modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> implementa la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Auth\MustVerifyEmail</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable implements MustVerifyEmail
{
    use Notifiable;

    // ...
}
</code></pre>


<h2>Consideraciones de la base de datos</h2>
<h4># Columna de verificación de correo electrónico</h4>
<p>Luego, tu tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span> debe contener una columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">email_verified_at</span> para
    almacenar la fecha y la hora en la que la dirección de correo electrónico fue verificada. Por
    defecto, la migración de la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span> incluida con el framework Laravel ya incluye
    esta columna. Así que, lo único que necesitas es ejecutar la migración de la base de datos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan migrate
</code></pre>


<h2>Rutas</h2>
<p>Laravel incluye la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth\VerificationController</span> que contiene la lógica
    necesaria para enviar enlaces de verificación y verificar correos electrónicos. Para registrar
    las rutas necesarias para este controlador, pasa la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">verify</span> al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth::routes</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Auth::routes(['verify' =&gt; true]);
</code></pre>


<h3># Protegiendo rutas</h3>
<p>
    El middleware de rutas
    puede ser usado para permitir que sólo usuarios autorizados puedan acceder a una ruta dada.
    Laravel viene con un middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">verified</span>, que está definido en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Auth\Middleware\EnsureEmailIsVerified</span>.
    Dado que este middleware ya está registrado en el kernel HTTP de tu aplicación, lo único que
    necesitas hacer es adjuntar el middleware a una definición de ruta:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('profile', function () {
    // Only verified users may enter...
})-&gt;middleware('verified');
</code></pre>


<h2>Vistas</h2>
<p>Laravel generará todas las vistas de verificación de correo electrónico necesarias cuando el
    comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:auth</span> sea ejecutado. Esta vista es colocada en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/auth/verify.blade.php</span>.
    Eres libre de personalizar esta vista según sea necesario para tu aplicación.</p>

<h2>Luego de verificar correos electrónicos</h2>
<p>Luego de que una dirección de correo electrónico es verificada, el usuario será redirigido
    automáticamente a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/home</span>. Puedes personalizar la ubicación de redirección
    post-verificación definiendo un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirectTo</span> o propiedad en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">VerificationController</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>protected \$redirectTo = '/dashboard';
</code></pre>


<h2>Eventos</h2>
<p>
    Laravel despacha
    eventos
    durante el proceso de verificación de correo electrónico. Puedes agregar listeners a estos
    eventos en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The event listener mappings for the application.
*
* @var array
*/
protected \$listen = [
    'Illuminate\Auth\Events\Verified' =&gt; [
        'App\Listeners\LogVerifiedUser',
    ],
];
</code></pre>
</div>
""";