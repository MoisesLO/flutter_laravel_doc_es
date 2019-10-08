import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class SeContrasenia extends StatelessWidget {
  final String title;
  SeContrasenia(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmSeContrasenia,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmSeContrasenia = """
<div style='font-size: 14.2px;'>
<h1>Restablecimiento de contraseñas</h1>
<ul>
    <li>Introducción</li>
    <li>Consideraciones de la base de datos</li>
    <li>Enrutamiento</li>
    <li>Vistas</li>
    <li>Después de restablecer contraseñas</li>
    <li>Personalización</li>
</ul>

<h2>Introducción</h2>

<p>TIP TIP</p>
<p><strong>¿Quieres comenzar rápido?</strong> Simplemente ejecuta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan make:auth</span>
    en una aplicación de Laravel nueva y navega hasta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://your-app.test/register</span> o
    cualquier otra URL asignada a tu aplicación. Este simple comando se encargará de maquetar todo
    tu sistema de autenticación, ¡incluyendo el restablecimiento de contraseñas!.</p>


<p>La mayoría de las aplicaciones web proporciona una forma para que los usuarios restablecen sus
    contraseñas olvidadas. En lugar de forzarte a reimplementar esto en cada aplicación, Laravel
    proporciona métodos convenientes para enviar recordatorios de contraseñas y realizar
    restablecimientos de contraseñas.</p>

<p>TIP TIP</p>
<p>Antes de usar las características de restablecimiento de contraseñas de Laravel, tu usuario debe
    usar el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Notifications\Notifiable</span>.</p>


<h2>Consideraciones de la base de datos</h2>
<p>Para comenzar, verifica que tu modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> implementa la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Auth\CanResetPassword</span>.
    El modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span> incluído con el framework ya implementa esta interfaz y usa el
    trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Auth\Passwords\CanResetPassword</span> para incluir los métodos
    necesarios para implementar la interfaz.</p>
<h4># Generando la migración para la tabla de tokens de restablecimiento</h4>
<p>Luego, una tabla debe ser creada para almacenar los tokens de restablecimiento de contraseña. La
    migración para está tabla está incluida con Laravel por defecto y se encuentra en el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database/migrations</span>. Así que, todo lo que necesitas hacer es ejecutar tus
    migraciones de la base de datos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan migrate
</code></pre>


<h2>Enrutamiento</h2>
<p>Laravel incluye las clases <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth\ForgotPasswordController</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth\ResetPasswordController</span>
    que contienen la lógica necesaria para enviar enlaces de restablecimiento de contraseña y
    restablece contraseñas de usuarios mediante correo electrónico. Todas las rutas necesarias para
    realizar restablecimiento de contraseñas pueden ser generadas usando el comando de Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:auth</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:auth
</code></pre>


<h2>Vistas</h2>
<p>De nuevo, Laravel generará todas las vistas necesarias para el restablecimiento de contraseña
    cuando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:auth</span> es ejecutado. Estas vistas están ubicadas en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/auth/passwords</span>.
    Eres libre de personalizarlas según sea necesario para tu aplicación.</p>

<h2>Luego de resetear contraseñas</h2>
<p>Una vez que has definido las rutas y vistas para restablecer las contraseñas de tus usuarios,
    puedes acceder a la ruta en tu navegador en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/password/reset</span>. El <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ForgotPasswordController</span>
    incluido con el framework ya incluye la lógica para enviar los correos con el enlace de
    restablecimiento, mientras que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ResetPasswordController</span> incluye la lógica para
    restablecer las contraseñas de los usuarios.</p>
<p>Luego de que una contraseña es restablecida, la sesión del usuario será automáticamente iniciada
    y será redirigido a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/home</span>. Puedes personalizar la ubicación de redirección
    definiendo una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirectTo</span> en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ResetPasswordController</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>protected \$redirectTo = '/dashboard';
</code></pre>


<p>Nota</p>
<p>Por defecto, los tokens para restablecer contraseñas expiran luego de una hora. Puedes cambiar
    esto mediante la opción de restablecimiento de contraseñas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">expire</span> en tu archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/auth.php</span>.</p>


<h2>Personalización</h2>
<h4># Personalización de los guards de autenticación</h4>
<p>En tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.php</span>, puedes configurar múltiples "guards", que
    podrán ser usados para definir el comportamiento de autenticación para múltiples tablas de
    usuarios. Puedes personalizar el controlador <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ResetPasswordController</span> incluido para
    usar el guard de tu preferencia sobrescribiendo el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">guard</span> en el controlador.
    Este método debe retornar una instancia guard:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Auth;

/**
* Get the guard to be used during password reset.
*
* @return \Illuminate\Contracts\Auth\StatefulGuard
*/

protected function guard()
{
    return Auth::guard('guard-name');
}
</code></pre>

<h4># Personalización del broker de contraseña</h4>
<p>En tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth.php</span>, puedes configurar múltiples "brokers" de
    contraseñas, que pueden ser usados para restablecer contraseñas en múltiples tablas de usuarios.
    Puedes personalizar los controladores <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ForgotPasswordController</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ResetPasswordController</span>
    incluidos para usar el broker de tu elección sobrescribiendo el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broker</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Password;

/**
* Get the broker to be used during password reset.
*
* @return PasswordBroker
*/
protected function broker()
{
    return Password::broker('name');
}
</code></pre>

<h4># Personalización del correo de reseteo</h4>
<p>Puedes fácilmente modificar la clase de la notificacion usada para enviar el enlace de
    restablecimiento de contraseña al usuario. Para comenzar, sobrescribe el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sendPasswordResetNotification</span>
    en tu modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span>. Dentro de este método, puedes enviar la notificación usando
    cualquier clase que selecciones. El <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$token</span> de restablecimiento de contaseña es el
    primer argumento recibido por el método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Send the password reset notification.
*
* @param  string  \$token
* @return void
*/
public function sendPasswordResetNotification(\$token)
{
    \$this-&gt;notify(new ResetPasswordNotification(\$token));
}
</code></pre>
</div>
""";