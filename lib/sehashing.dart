import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class SeHashing extends StatelessWidget {
  final String title;
  SeHashing(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmSeHashing,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmSeHashing = """
<div style='font-size: 14.2px;'>
<h1>Hashing</h1>
<ul>
    <li>Introducción</li>
    <li>Configuración</li>
    <li>Uso básico</li>
</ul>

<h2>Introducción</h2>
<p>
    El
    facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Hash</span> de Laravel proporciona hashing seguro de Bcrypt y Argon2 para almacenar
    contraseñas de usuarios. Si estás usando las clases integradas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RegisterController</span> que están incluidas con tu aplicación de Laravel usarán Bcrypt
    para registro y autenticación de forma predeterminada.
</p>

<p>TIP</p>
<p>Bcrypt es una buena opción para el hashing de contraseñas dado que su "factor de trabajo" es
    ajustable, lo que quiere decir que el tiempo que toma generar un hash puede ser aumentado a
    medida que la capacidad de hardware incrementa.</p>



<h2>Configuración</h2>
<p>
    El driver de hashing por defecto para tu aplicación está configurado en el archivo de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/hashing.php</span>. Actualmente hay tres drivers soportados:

    Bcrypt


    y

    Argon2


    (variantes Argon2i y Argon2id).
</p>

<p>Nota</p>
<p>El driver Argon2i requiere PHP 7.2.0 o superior y el driver Argon2id requiere PHP 7.3.0 o
    superior.</p>


<h2>Uso básico</h2>
<p>Puedes hacer hash a una contraseña llamando al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> en el facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Hash</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;

class UpdatePasswordController extends Controller
{
    /**
    * Update the password for the user.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function update(Request \$request)
    {
        // Validate the new password length...

        \$request-&gt;user()-&gt;fill([
            'password' =&gt; Hash::make(\$request-&gt;newPassword)
        ])-&gt;save();
    }
}
</code></pre>

<h4># Ajustando el factor de trabajo de Bcrypt</h4>
<p>Si estás usando el algoritmo Bcrypt, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> te permite administrar el factor
    de trabajo del algoritmo usando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rounds</span>; sin embargo, el valor por defecto
    es aceptable para la mayoría de las aplicaciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$hashed = Hash::make('password', [
    'rounds' =&gt; 12
]);
</code></pre>

<h4># Ajustando el factor de trabajo de Argon2</h4>
<p>Si estás usando el algoritmo de Argon2, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> te permite administrar la
    carga de trabajo del algoritmo usando las opciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">memory</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">time</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">threads</span>; sin embargo, los valores por defecto son aceptables para la mayoría de las
    aplicaciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$hashed = Hash::make('password', [
    'memory' =&gt; 1024,
    'time' =&gt; 2,
    'threads' =&gt; 2,
]);
</code></pre>


<p>TIP</p>
<p>
    Para mayor información de estas opciones, revisa la

    documentación oficial de PHP


    .
</p>

<h4># Verificando una contraseña contra un hash</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">check</span> te permite verificar que una cadena de texto plano dada corresponde
    a un hash dado. Sin embargo, si estás usando el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LoginController</span> incluido con
    Laravel, probablemente no necesitarás usar esto directamente, ya que este controlador
    automáticamente llama a este método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Hash::check('plain-text', \$hashedPassword)) {
    // Las contraseñas coinciden...
}
</code></pre>

<h4># Comprobando si una contraseña necesita un nuevo hash</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">needsRehash</span> te permite determinar si el factor de trabajo usado por el
    hasher ha cambiado desde que el hash fue agregado a la contraseña:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (Hash::needsRehash(\$hashed)) {
    \$hashed = Hash::make('plain-text');
}
</code></pre>
</div>
""";