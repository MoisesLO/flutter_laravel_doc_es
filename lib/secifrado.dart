import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class SeCifrado extends StatelessWidget {
  final String title;
  SeCifrado(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmSeCifrado,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmSeCifrado = """
<div style='font-size: 14.2px;'>
<h1>Cifrado</h1>
<ul>
    <li>Introducción</li>
    <li>Configuración</li>
    <li>Usando el cifrador</li>
</ul>

<h2>Introducción</h2>
<p>El cifrado de Laravel utiliza OpenSSL para proporcionar el cifrado AES-256 y AES-128. Se
    recomienda encarecidamente usar las funciones de cifrado incorporadas de Laravel y no intente
    desplegar tus algoritmos de cifrado "de cosecha propia". Todos los valores cifrados de Laravel
    son firmados utilizando un código de autenticación de mensaje (MAC) para que su valor subyacente
    no pueda modificarse una vez cifrado.</p>

<h2>Configuración</h2>
<p>Antes de usar el cifrado de Laravel, debes establecer la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">key</span> en tu archivo de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>. Deberías usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan key: generate</span>
    para generar esta clave, ya que este comando de Artisan usará el generador de bytes aleatorios
    seguros de PHP para construir tu clave. Si este valor no se establece correctamente, todos los
    valores cifrados por Laravel serán inseguros.</p>

<h2>Usando el cifrador</h2>
<h4># Cifrar un valor</h4>
<p>Puedes cifrar un valor usando el helper o función de ayuda <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">encrypt</span>. Todos los
    valores cifrados se cifran utilizando OpenSSL y el cifrado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AES-256-CBC</span>. Además,
    todos los valores cifrados están firmados con un código de autenticación de mensaje (MAC) para
    detectar cualquier modificación en la cadena cifrada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserController extends Controller
{
    /**
    * Store a secret message for the user.
    *
    * @param  Request  \$request
    * @param  int  \$id
    * @return Response
    */
    public function storeSecret(Request \$request, \$id)
    {
        \$user = User::findOrFail(\$id);

        \$user-&gt;fill([
            'secret' =&gt; encrypt(\$request-&gt;secret)
        ])-&gt;save();
    }
}
</code></pre>

<h4># Cifrado sin serialización</h4>
<p>Los valores cifrados se pasan a través de una serialización durante el proceso de cifrado, lo que
    permite el cifrado de objetos y matrices. De este modo, los clientes que no son PHP y reciben
    valores cifrados tendrán que des-serializar los datos. Si deseas cifrar y descifrar valores sin
    serialización, puede usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">encryptString</span> y<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decryptString</span> de
    la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Crypt</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Crypt;

\$encrypted = Crypt::encryptString('Hello world.');

\$decrypted = Crypt::decryptString(\$encrypted);
</code></pre>

<h4># Descifrando un valor</h4>
<p>Puedes descifrar los valores usando el helper o función de ayuda <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decrypt</span>. Si el
    valor no se puede descifrar correctamente, como cuando el MAC no es válido, se lanzará una
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Encryption\DecryptException</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Contracts\Encryption\DecryptException;

try {
    \$decrypted = decrypt(\$encryptedValue);
} catch (DecryptException \$e) {
    //
}
</code></pre>
</div>
""";