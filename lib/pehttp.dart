import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PeHttp extends StatelessWidget {
  final String title;
  PeHttp(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmPeHttp,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmPeHttp = """
<!-- Pruebas HTTP -->
<div style='font-size: 14.2px;'>
  <h1>Pruebas HTTP</h1>
  <ul>
    <li>
      Introducción
      <ul>
        <li>Personalizando encabezados de solicitud</li>
        <li>Depurando respuestas</li>
      </ul>
    </li>
    <li>Sesión y autenticación</li>
    <li>Probando APIs JSON</li>
    <li>Probando subidas de archivos</li>
    <li>
      Aserciones disponibles
      <ul>
        <li>Aserciones de respuesta</li>
        <li>Aserciones de autenticación</li>
      </ul>
    </li>
  </ul>

  <h2>Introducción</h2>
  <p>Laravel proporciona una API muy fluida para hacer solicitudes HTTP a tu aplicación y examinar la salida. Por ejemplo, echemos un vistazo a la prueba definida a continuación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    /**
    * A basic test example.
    *
    * @return void
    */
    public function testBasicTest()
    {
        \$response = \$this-&gt;get('/');

        \$response-&gt;assertStatus(200);
    }
}
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> simula una solicitud <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">GET</span> dentro de la aplicación, mientras que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertStatus</span> comprueba que la respuesta devuelta debería tener el código de estado HTTP dado. Además de esta sencilla aserción, Laravel también contiene una variedad de aserciones para inspeccionar de la respuesta los encabezados, contenidos, estructura JSON y más.</p>

  <h3>Personalizando encabezados de solicitud</h3>
  <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withHeaders</span> para personalzar los encabezados de la solicitud antes que sean enviados a la aplicación. Esto permitirá que agregues algunos encabezados personalizados de tu preferencia a la solicitud:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

class ExampleTest extends TestCase
{
    /**
    * A basic functional test example.
    *
    * @return void
    */
    public function testBasicExample()
    {
        \$response = \$this-&gt;withHeaders([
            'X-Header' =&gt; 'Value',
        ])-&gt;json('POST', '/user', ['name' =&gt; 'Sally']);

        \$response
            -&gt;assertStatus(200)
            -&gt;assertJson([
                'created' =&gt; true,
            ]);
    }
}
</code></pre>

  <p>TIP</p>
  <p>El middleware CSRF es automáticamente deshabilitado cuando se ejecutan las pruebas.</p>

  <h3>Depurando respuestas</h3>
  <p>Luego de hacer una solicitud de prueba a tu aplicación, los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dumpHeaders</span> pueden ser usados para examinar y depurar el contenido de la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    /**
    * A basic test example.
    *
    * @return void
    */
    public function testBasicTest()
    {
        \$response = \$this-&gt;get('/');
        \$response-&gt;dumpHeaders();
        \$response-&gt;dump();
    }
}
</code></pre>

  <h2>Sesión y autenticación</h2>
  <p>Laravel proporciona varias funciones helper para trabajar con la sesión durante las pruebas HTTP. Primero, puedes colocar los datos de la sesión en un arreglo dado usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withSession</span>. Esto es útil para cargar la sesión con los datos antes de realizar una solicitud a tu aplicación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

class ExampleTest extends TestCase
{
    public function testApplication()
    {
        \$response = \$this-&gt;withSession(['foo' =&gt; 'bar'])
                            -&gt;get('/');
    }
}
</code></pre>

  <p>Un uso común de la sesión es para mantener el estado del usuario autenticado. El método helper
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">actingAs</span> proporciona una foma sencilla de autenticar un usuario dado como el usuario actual. Por ejemplo, podemos usar un model factory para generar y autenticar un usuario:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

use App\User;

class ExampleTest extends TestCase
{
    public function testApplication()
    {
        \$user = factory(User::class)-&gt;create();

        \$response = \$this-&gt;actingAs(\$user)
                            -&gt;withSession(['foo' =&gt; 'bar'])
                            -&gt;get('/');
    }
}
</code></pre>

  <p>También puedes especificar que "guard" debe ser usado para autenticar el usuario dado al pasar el nombre del guard como segundo argumento del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">actingAs</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$this-&gt;actingAs(\$user, 'api')
</code></pre>

  <h2>Probando APIs JSON</h2>
  <p>Laravel también proporciona varios helpers para probar APIs JSON y sus respuestas. Por ejemplo, los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">json</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">patch</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> pueden ser usados para hacer solicitudes con varios verbos HTTP. También puedes pasar datos y encabezados fácilmente a estos métodos. Para empezar, vamos a escribir una prueba para hacer una solicitud <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">POST</span> a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/user</span> y comprobar que los datos esperados fueron devueltos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

class ExampleTest extends TestCase
{
    /**
    * A basic functional test example.
    *
    * @return void
    */
    public function testBasicExample()
    {
        \$response = \$this-&gt;json('POST', '/user', ['name' =&gt; 'Sally']);

        \$response
            -&gt;assertStatus(200)
            -&gt;assertJson([
                'created' =&gt; true,
            ]);
    }
}
</code></pre>

  <p>TIP</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertJson</span> convierte la respuesta a un arreglo y utiliza <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PHPUnit::assertArraySubset</span> para verificar que el arreglo dado exista dentro de la respuesta JSON devuelta por la aplicación. Así, si hay otras propiedades en la respuesta JSON, esta prueba aún pasará siempre y cuando el fragmento dado esté presente.</p>

  <h3>Verificando una coincidencia JSON exacta</h3>
  <p>Si prefieres verificar que el arreglo dado esté contenido <strong>exactamente</strong> en la respuesta JSON devuelta por la aplicación, deberías usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertExactJson</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

class ExampleTest extends TestCase
{
    /**
    * A basic functional test example.
    *
    * @return void
    */
    public function testBasicExample()
    {
        \$response = \$this-&gt;json('POST', '/user', ['name' =&gt; 'Sally']);

        \$response
            -&gt;assertStatus(200)
            -&gt;assertExactJson([
                'created' =&gt; true,
            ]);
    }
}
</code></pre>

  <h2>Probando subidas de archivos</h2>
  <p>La clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\UploadedFile</span> proporciona un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> el cual puede ser usado para generar archivos de prueba o imágenes para prueba. Esto, combinado con el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span> de la clase facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span> simplifica grandemente la prueba de subidas de archivos. Por ejemplo, puedes combinar estas dos características para probar fácilmente un formulario de subida de un avatar:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Feature;

use Tests\TestCase;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithoutMiddleware;

class ExampleTest extends TestCase
{
    public function testAvatarUpload()
    {
        Storage::fake('avatars');

        \$file = UploadedFile::fake()-&gt;image('avatar.jpg');

        \$response = \$this-&gt;json('POST', '/avatar', [
            'avatar' =&gt; \$file,
        ]);

        // Assert the file was stored...
        Storage::disk('avatars')-&gt;assertExists(\$file-&gt;hashName());

        // Assert a file does not exist...
        Storage::disk('avatars')-&gt;assertMissing('missing.jpg');
    }
}
</code></pre>

  <h4>Personalización de archivo fake</h4>
  <p>Al momento de crear archivos usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">fake</span>, puedes especificar el ancho, la altura y el tamaño de la imagen con el propósito de probar mejor tus reglas de validación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>UploadedFile::fake()-&gt;image('avatar.jpg', \$width, \$height)-&gt;size(100);
</code></pre>

  <p>Además de crear imágenes, puedes crear archivos de cualquier otro tipo usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>UploadedFile::fake()-&gt;create('document.pdf', \$sizeInKilobytes);
</code></pre>

  <h2>Aserciones disponibles</h2>

  <h3>Aserciones de respuesta</h3>
  <p>
    Laravel proporciona una variedad de métodos de aserción personalizados para tus pruebas PHPUnit . Estas aserciones pueden ser accedidas en la respuesta que es retornada por los métodos de prueba <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">json</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">post</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span>:
  </p>

  <p>assertCookie assertCookieExpired assertCookieNotExpired assertCookieMissing assertDontSee assertDontSeeText assertExactJson assertForbidden assertHeader assertHeaderMissing assertJson assertJsonCount assertJsonFragment assertJsonMissing assertJsonMissingExact assertJsonMissingValidationErrors assertJsonStructure assertJsonValidationErrors assertLocation assertNotFound assertOk assertPlainCookie assertRedirect assertSee assertSeeInOrder assertSeeText assertSeeTextInOrder assertSessionHas assertSessionHasAll assertSessionHasErrors assertSessionHasErrorsIn assertSessionHasNoErrors assertSessionDoesntHaveErrors assertSessionMissing assertStatus assertSuccessful assertSuccessful assertViewHas assertViewHasAll assertViewIs assertViewMissing</p>

  <h4>assertCookie</h4>
  <p>Comprueba que la respuesta contenga el cookie dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertCookie(\$cookieName, \$value = null);
</code></pre>

  <h4>assertCookieExpired</h4>
  <p>Comprueba que la respuesta contenga el cookie dado y que esté vencido:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertCookieExpired(\$cookieName);
</code></pre>

  <h4>assertCookieNotExpired</h4>
  <p>Comprueba que la respuesta contenga la cookie dada y que no haya expirado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertCookieNotExpired(\$cookieName);
</code></pre>

  <h4>assertCookieMissing</h4>
  <p>Comprueba que la respuesta no contenga el cookie dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertCookieMissing(\$cookieName);
</code></pre>

  <h4>assertDontSee</h4>
  <p>Comprueba que la cadena dada no esté contenida dentro de la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertDontSee(\$value);
</code></pre>

  <h4>assertDontSeeText</h4>
  <p>Comprueba que la cadena dada no esté contenida dentro del texto de la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertDontSeeText(\$value);
</code></pre>

  <h4>assertExactJson</h4>
  <p>Comprueba que la respuesta contenga una coincidencia exacta de los datos JSON dados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertExactJson(array \$data);
</code></pre>

  <h4>assertForbidden</h4>
  <p>Comprueba que la respuesta tenga un código de estado "prohibido":</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertForbidden();
</code></pre>

  <h4>assertHeader</h4>
  <p>Comprueba que el encabezado dado esté presente en la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertHeader(\$headerName, \$value = null);
</code></pre>

  <h4>assertHeaderMissing</h4>
  <p>Comprueba que el encabezado dado no esté presente en la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertHeaderMissing(\$headerName);
</code></pre>

  <h4>assertJson</h4>
  <p>Comprueba que la respuesta contenga los datos JSON dados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertJson(array \$data);
</code></pre>

  <h4>assertJsonCount</h4>
  <p>Comprueba que la respuesta JSON tenga un arreglo con el número esperado de elementos en la llave dada:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertJsonCount(\$count, \$key = null);
</code></pre>

  <h4>assertJsonFragment</h4>
  <p>Comprueba que la respuesta contenga el fragmento JSON dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertJsonFragment(array \$data);
</code></pre>

  <h4>assertJsonMissing</h4>
  <p>Comprueba que la respuesta no contenga el fragmento JSON dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertJsonMissing(array \$data);
</code></pre>

  <h4>assertJsonMissingExact</h4>
  <p>Comprueba que la respuesta no contenga el fragmento exacto JSON:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertJsonMissingExact(array \$data);
</code></pre>

  <h4>assertJsonMissingValidationErrors</h4>
  <p>Comprueba que la respuesta no contenga errores de validación JSON para la llaves dadas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertJsonMissingValidationErrors(\$keys);
</code></pre>

  <h4>assertJsonStructure</h4>
  <p>Comprueba que la respuesta tenga una estructura JSON dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertJsonStructure(array \$structure);
</code></pre>

  <h4>assertJsonValidationErrors</h4>
  <p>Comprueba que la respuesta tenga los errores de validación JSON dados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertJsonValidationErrors(array \$data);
</code></pre>

  <h4>assertLocation</h4>
  <p>Comprueba que la respuesta tenga el valor URI dado en el encabezado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Location</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertLocation(\$uri);
</code></pre>

  <h4>assertNotFound</h4>
  <p>Comprueba que la respuesta tenga un código de estado "no encontrado":</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertNotFound();
</code></pre>

  <h4>assertOk</h4>
  <p>Comprueba que la respuesta tenga un código de estado 200:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertOk();
</code></pre>

  <h4>assertPlainCookie</h4>
  <p>Comprueba que la respuesta contenga el cookie dado (desencriptado):</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertPlainCookie(\$cookieName, \$value = null);
</code></pre>

  <h4>assertRedirect</h4>
  <p>Comprueba que la respuesta es una redirección a una URI dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertRedirect(\$uri);
</code></pre>

  <h4>assertSee</h4>
  <p>Comprueba que la cadena dada esté contenida dentro de la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSee(\$value);;
</code></pre>

  <h4>assertSeeInOrder</h4>
  <p>Comprueba que las cadenas dadas estén en orden dentro de la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSeeInOrder(array \$values);
</code></pre>

  <h4>assertSeeText</h4>
  <p>Comprueba que la cadena dada esté contenida dentro del texto de la respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSeeText(\$value);
</code></pre>

  <h4>assertSeeTextInOrder</h4>
  <p>Comprueba que las cadenas dadas estén en orden dentro del texto de respuesta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSeeTextInOrder(array \$values);
</code></pre>

  <h4>assertSessionHas</h4>
  <p>Comprueba que la sesión contenga la porción dada de datos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSessionHas(\$key, \$value = null);
</code></pre>

  <h4>assertSessionHasAll</h4>
  <p>Comprueba que la sesión tenga una lista dada de valores:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSessionHasAll(array \$data);
</code></pre>

  <h4>assertSessionHasErrors</h4>
  <p>Comprueba que la sesión contenga un error para el campo dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSessionHasErrors(array \$keys, \$format = null, \$errorBag = 'default');
</code></pre>

  <h4>assertSessionHasErrorsIn</h4>
  <p>Comprueba que la sesión tenga los errores dados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSessionHasErrorsIn(\$errorBag, \$keys = [], \$format = null);
</code></pre>

  <h4>assertSessionHasNoErrors</h4>
  <p>Comprueba que la sesión no contenga errores:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSessionHasNoErrors();
</code></pre>

  <h4>assertSessionDoesntHaveErrors</h4>
  <p>Comprueba que la sesión no contenga errores para las llaves dadas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSessionDoesntHaveErrors(\$keys = [], \$format = null, \$errorBag = 'default');
</code></pre>

  <h4>assertSessionMissing</h4>
  <p>Comprueba que la sesión no contenga la llave dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSessionMissing(\$key);
</code></pre>

  <h4>assertStatus</h4>
  <p>Comprueba que la respuesta tenga un código dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertStatus(\$span);
</code></pre>

  <h4>assertSuccessful</h4>
  <p>Comprueba que la respuesta tenga un código de estado de éxito (200):</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertSuccessful();
</code></pre>

  <h4>assertUnauthorized</h4>
  <p>Comprueba que la respuesta tiene un código de estado sin autorización (401):</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertUnauthorized();
</code></pre>

  <h4>assertViewHas</h4>
  <p>Comprueba que la vista de la respuesta dada contiene los valores indicados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertViewHas(\$key, \$value = null);
</code></pre>

  <h4>assertViewHasAll</h4>
  <p>Comprueba que la vista de la respuesta tiene una lista de datos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertViewHasAll(array \$data);
</code></pre>

  <h4>assertViewIs</h4>
  <p>Comprueba que la vista dada fue retornada por la ruta:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertViewIs(\$value);
</code></pre>

  <h4>assertViewMissing</h4>
  <p>Comprueba que a la vista de la respuesta le está faltando una porción de datos enlazados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$response-&gt;assertViewMissing(\$key);
</code></pre>

  <h3>Aserciones de autenticación</h3>
  <p>
    Laravel también proporciona una variedad de aserciones relacionadas con la autenticación para tus pruebas PHPUnit :
  </p>
  <table style="border: 1px solid #CFD8DC;">
    <thead>
    <tr>
      <th>Método</th>
      <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;assertAuthenticated(\$guard = null);</span></td>
      <td>Comprueba que el usuario está autenticado.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;assertGuest(\$guard = null);</span></td>
      <td>Comprueba que el usuario no está autenticado.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;assertAuthenticatedAs(\$user, \$guard = null);</span></td>
      <td>Comprueba que el usuario dado está autenticado.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;assertCredentials(array \$credentials, \$guard = null);</span></td>
      <td>Comprueba que las credenciales dadas son válidas.</td>
    </tr>
    <tr>
      <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;assertInvalidCredentials(array \$credentials, \$guard = null);</span></td>
      <td>Comprueba que las credenciales dadas no son válidas.</td>
    </tr>
    </tbody>
  </table>
</div>
""";