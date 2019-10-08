import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PeDusk extends StatelessWidget {
  final String title;
  PeDusk(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmPeDusk,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmPeDusk = """
<!-- Laravel Dusk -->
<div style='font-size: 14.2px;'>
  <h1>Laravel Dusk</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Instalación
      <ul>
        <li>Administrando las instalaciones de ChromeDriver</li>
        <li>Usando otros navegadores</li>
      </ul>
    </li>
    <li>
      Primeros pasos
      <ul>
        <li>Generando pruebas</li>
        <li>Ejecutar pruebas</li>
        <li>Manejo de entorno</li>
        <li>Creando navegadores</li>
        <li>Macros de navegador</li>
        <li>Autenticación</li>
        <li>Migraciones de base de datos</li>
      </ul>
    </li>
    <li>
      Interactuando con elementos
      <ul>
        <li>Selectores de Dusk</li>
        <li>Haciendo clic en enlaces</li>
        <li>Texto, valores y atributos</li>
        <li>Usando formularios</li>
        <li>Adjuntando archivos</li>
        <li>Usando el teclado</li>
        <li>Usando el ratón</li>
        <li>Diálogos de JavaScript</li>
        <li>Alcance de selectores</li>
        <li>Esperando por elementos</li>
        <li>Haciendo aserciones de Vue</li>
      </ul>
    </li>
    <li>Aserciones disponibles</li>
    <li>
      Páginas
      <ul>
        <li>Generando páginas</li>
        <li>Configurando páginas</li>
        <li>Visitando páginas</li>
        <li>Selectores abreviados</li>
        <li>Métodos de página</li>
      </ul>
    </li>
    <li>
      Componentes
      <ul>
        <li>Generando componentes</li>
        <li>Usando componentes</li>
      </ul>
    </li>
    <li>
      Integración continua
      <ul>
        <li>CircleCI</li>
        <li>spanship</li>
        <li>Heroku CI</li>
        <li>Travis CI</li>
      </ul>
    </li>
  </ul>

  <h2>Introducción</h2>
  <p>
    Laravel Dusk proporciona una API de automatización y prueba para navegador expresiva y fácil de usar. De forma predeterminada, Dusk no requiere que instales JDK o Selenium en tu computador. En su lugar, Dusk usa una instalación de ChromeDriver
    <outboundlink></outboundlink>
    independiente. Sin embargo, siéntete libre de utilizar cualquier otro driver compatible con Selenium que desees.
  </p>

  <h2>Instalación</h2>
  <p>Para empezar, debes agregar la dependencia de Composer <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel/dusk</span> a tu proyecto:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require --dev laravel/dusk
</code></pre>

  <p>Nota</p>
  <p>Si estás registrando manualmente el proveedor de servicio de Dusk, <strong>nunca</strong> deberías registrarlo en tu entorno de producción, ya que hacerlo así podría conducir a que usuarios arbitrarios sean capaces de autenticarse en tu aplicación.</p>

  <p>Después de la instalación del paquete Dusk, ejecuta el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk:install</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk:install
</code></pre>

  <p>Un directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Browser</span> será creado dentro de tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests</span> y contendrá una prueba de ejemplo. Seguido, establece la variable de entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">APP_URL</span> en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span>. Este valor debería coincidir con la URL que uses para acceder a tu aplicación en un navegador.</p>
  <p>Para ejecutar tus pruebas, usa el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span>. El comando
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span> acepta cualquier argumento que también sea aceptado por el comando
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpunit</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk
</code></pre>

  <p>Si tuviste fallos en las pruebas la última vez que se ejecutó el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span>, puedes ahorrar tiempo volviendo a ejecutar las pruebas fallidas usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk:
  fail</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk:fails
</code></pre>

  <h3>Administrando las instalaciones de ChromeDriver</h3>
  <p>Si te gustaria instalar una versión diferente de ChromeDriver a la incluida con Laravel Dusk, puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk:chrome-driver</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code># Install the latest version of ChromeDriver for your OS...
php artisan dusk:chrome-driver

# Install a given version of ChromeDriver for your OS...
php artisan dusk:chrome-driver 74

# Install a given version of ChromeDriver for all supported OSs...
php artisan dusk:chrome-driver --all
</code></pre>

  <p>Nota</p>
  <p>Dusk requiere que los binarios de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chromedriver</span> sean ejecutables. Si tienes problemas para ejecutar Dusk, asegurate de que los binarios sean ejecutables con el siguiente comando:
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chmod -R 0755 vendor/laravel/dusk/bin/</span>.</p>

  <h3>Usando otros navegadores</h3>
  <p>
    De forma predeterminada, Dusk usa Google Chrome y una instalación de ChromeDriver independiente para ejecutar tus pruebas de navegador. Sin embargo, puedes iniciar tu propio servidor Selenium y ejecutar tus pruebas en cualquier navegador que desees.
  </p>
  <p>Para empezar, abre tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests/DuskTestCase.php</span>, el cual es el caso de prueba de Dusk básico para tu aplicación. Dentro de este archivo, puedes remover la ejecución del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">startChromeDriver</span>. Esto evitará que Dusk inicie automáticamente ChromeDriver:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Prepare for Dusk test execution.
*
* @beforeClass
* @return void
*/
public static function prepare()
{
    // static::startChromeDriver();
}
</code></pre>

  <p>Luego de esto, puedes modificar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> para conectar a la URL y puerto de tu preferencia. Además, puedes modificar las "capacidades deseadas" que deberían ser pasadas al WebDriver:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Create the RemoteWebDriver instance.
*
* @return \Facebook\WebDriver\Remote\RemoteWebDriver
*/
protected function driver()
{
    return RemoteWebDriver::create(
        'http://localhost:4444/wd/hub', DesiredCapabilities::phantomjs()
    );
}
</code></pre>

  <h2>Primeros pasos</h2>

  <h3>Generando pruebas</h3>
  <p>Para generar una prueba de Dusk, usa el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk:make</span>. La prueba generada será colocada en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests/Browser</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk:make LoginTest
</code></pre>

  <h3>Ejecutando pruebas</h3>
  <p>Para ejecutar tus pruebas de navegador, usa el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk
</code></pre>

  <p>Si tuviste fallos en las pruebas la última vez que se ejecutó el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span>, puedes ahorrar tiempo volviendo a ejecutar las pruebas fallidas usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk:
  fail</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk:fails
</code></pre>

  <p>
    El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span> acepta cualquier argumento que sea aceptado normalmente por el administrador de pruebas de PHPUnit, permitiendo que ejecutes solamente las pruebas para un grupo dado, etc:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk --group=foo
</code></pre>

  <h4>Iniciando manualmente ChromeDriver</h4>
  <p>De forma predeterminada, Dusk intentará automáticamente iniciar ChromeDriver. Si esto no funciona para tu sistema en particular, puedes iniciar manualmente ChromeDriver antes de ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span>. Si eliges iniciar manualmente ChromeDriver, debes comentar la siguiente línea de tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests/DuskTestCase.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Prepare for Dusk test execution.
*
* @beforeClass
* @return void
*/
public static function prepare()
{
    // static::startChromeDriver();
}
</code></pre>

  <p>Además, si inicias ChromeDriver en un puerto diferente a 9515, deberías modificar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> de la misma clase:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Create the RemoteWebDriver instance.
*
* @return \Facebook\WebDriver\Remote\RemoteWebDriver
*/
protected function driver()
{
    return RemoteWebDriver::create(
        'http://localhost:9515', DesiredCapabilities::chrome()
    );
}
</code></pre>

  <h3>Manejo de entorno</h3>
  <p>Para forzar que Dusk use su propio archivo de entorno al momento de ejecutar las pruebas, crea un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.dusk.{environment}</span> en el directorio raíz de tu proyecto. Por ejemplo, si estás iniciando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span> desde tu entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>, deberías crear un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.dusk.local</span>.</p>
  <p>Al momento de ejecutar pruebas, Dusk respaldará tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> y renombrará tu entorno Dusk a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span>. Una vez que las pruebas han sido completadas, tu archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> será restaurado.</p>

  <h3>Creando navegadores</h3>
  <p>Para empezar, vamos a escribir una prueba que verifica que podemos entrar a nuestra aplicación. Después de generar una prueba, podemos modificarla para visitar la página de login, introducir algunas credenciales y presionar el botón "Login". Para crear una instancia del navegador, ejecuta el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">browse</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Browser;

use App\User;
use Tests\DuskTestCase;
use Laravel\Dusk\Chrome;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class ExampleTest extends DuskTestCase
{
    use DatabaseMigrations;

    /**
    * A basic browser test example.
    *
    * @return void
    */
    public function testBasicExample()
    {
        \$user = factory(User::class)-&gt;create([
            'email' =&gt; 'taylor@laravel.com',
        ]);

        \$this-&gt;browse(function (\$browser) use (\$user) {
            \$browser-&gt;visit('/login')
                    -&gt;type('email', \$user-&gt;email)
                    -&gt;type('password', 'password')
                    -&gt;press('Login')
                    -&gt;assertPathIs('/home');
        });
    }
}
</code></pre>

  <p>Como puedes ver en el ejemplo anterior, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">browse</span> acepta una función callback. Una instancia de navegador será pasada automáticamente a esta función de retorno por Dusk y es el objeto principal utilizado para interactuar y hacer aserciones en la aplicación.
  </p>

  <p>TIP TIP</p>
  <p>Esta prueba puede ser usada para probar la pantalla login generada por el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:auth</span>.
  </p>

  <h4>Creando múltiples navegadores</h4>
  <p>Algunas veces puedes necesitar múltiples navegadores con el propósito de ejecutar apropiadamente una prueba. Por ejemplo, múltiples navegadores pueden ser necesitados para probar una pantalla de conversaciones que interactúa con websockets. Para crear múltiples navegadores, "solicita" más de un navegador en la firma del callback dado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">browse</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$this-&gt;browse(function (\$first, \$second) {
    \$first-&gt;loginAs(User::find(1))
            -&gt;visit('/home')
            -&gt;waitForText('Message');

    \$second-&gt;loginAs(User::find(2))
            -&gt;visit('/home')
            -&gt;waitForText('Message')
            -&gt;type('message', 'Hey Taylor')
            -&gt;press('Send');

    \$first-&gt;waitForText('Hey Taylor')
            -&gt;assertSee('Jeffrey Way');
});
</code></pre>

  <h4>Redimensionando las ventanas del navegador</h4>
  <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resize</span> para ajustar el tamaño de la ventana del navegador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;resize(1920, 1080);
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">maximize</span> puede ser usado para maximizar la ventana del navegador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;maximize();
</code></pre>

  <h3>Macros de navegador</h3>
  <p>Si desea definir un método de navegador personalizado que puedas reutilizar en una variedad de tus pruebas, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">macro</span> en la clase<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Browser</span>. Normalmente, deberías llamar a este método desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> del proveedor de servicios:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Providers;

use Laravel\Dusk\Browser;
use Illuminate\Support\ServiceProvider;

class DuskServiceProvider extends ServiceProvider
{
    /**
    * Register the Dusk's browser macros.
    *
    * @return void
    */
    public function boot()
    {
        Browser::macro('scrollToElement', function (\$element = null) {
            \$this-&gt;script("\$('html, body').animate({ scrollTop: \$('\$element').offset().top }, 0);");

            return \$this;
        });
    }
}
</code></pre>

  <p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">macro</span> acepta un nombre como primer argumento y un Closure como segundo. El Closure del macro se ejecutará cuando se llame al macro como un método en una implementación de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Browser</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$this-&gt;browse(function (\$browser) use (\$user) {
    \$browser-&gt;visit('/pay')
            -&gt;scrollToElement('#credit-card-details')
            -&gt;assertSee('Enter Credit Card Details');
});
</code></pre>

  <h3>Autenticación</h3>
  <p>Frecuentemente, estarás probando páginas que requieren autenticación. Puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loginAs</span> de Dusk con el propósito de evitar interactuar con la pantalla de login durante cada prueba. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loginAs</span> acepta un ID de usuario o una instancia de modelo de usuario:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$this-&gt;browse(function (\$first, \$second) {
    \$first-&gt;loginAs(User::find(1))
            -&gt;visit('/home');
});
</code></pre>

  <p>Nota</p>
  <p>Después de usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">loginAs</span>, la sesión de usuario será mantenida para todas las pruebas dentro del archivo.</p>

  <h3>Migraciones de bases de datos</h3>
  <p>Cuando tu prueba requiere migraciones, como el ejemplo de autenticación visto antes, nunca deberías usar el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RefreshDatabase</span>. El trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RefreshDatabase</span> se apoya en transacciones de base de datos, las cuales no serán aplicables a traves de las solicitudes HTTP. En su lugar, usa el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DatabaseMigrations</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Browser;

use App\User;
use Tests\DuskTestCase;
use Laravel\Dusk\Chrome;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class ExampleTest extends DuskTestCase
{
    use DatabaseMigrations;
}
</code></pre>

  <h2>Interactuando con elementos</h2>

  <h3>Selectores de Dusk</h3>
  <p>Elegir buenos selectores CSS para interactuar con elementos es una de las partes más difíciles de escribir las pruebas de Dusk. Con el tiempo, los cambios del diseño frontend pueden causar que los selectores CSS como los siguientes dañen tus pruebas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// HTML...

&lt;button&gt;Login&lt;/button&gt;

// Test...

\$browser-&gt;click('.login-page .container div &gt; button');
</code></pre>

  <p>Los selectores de Dusk permiten que te enfoques en la escritura de pruebas efectivas en vez de recordar selectores CSS. Para definir un selector, agrega un atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk</span> a tu elemento HTML. Después, agrega un prefijo al selector con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@</span> para manipular el elemento conectado dentro de una prueba de Dusk:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// HTML...

&lt;button dusk="login-button"&gt;Login&lt;/button&gt;

// Test...

\$browser-&gt;click('@login-button');
</code></pre>

  <h3>Haciendo clic en enlaces</h3>
  <p>Para hacer clic sobre un enlace, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">clickLink</span> en la instancia del navegador. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">clickLink</span> hará clic en el enlace que tiene el texto dado en la pantalla:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;clickLink(\$linkText);
</code></pre>

  <p>Nota</p>
  <p>Este método interactúa con jQuery. Si jQuery no está disponible en la página, Dusk lo inyectará automáticamente de modo que esté disponible por la duración de la prueba.</p>

  <h3>Texto, Valores y Atributos</h3>
  <h4>Obteniendo y estableciendo valores</h4>
  <p>Dusk proporciona varios métodos para interactuar con el texto de pantalla, valor y atributos de elementos en la página actual. Por ejemplo, para obtener el "valor" de un elemento que coincida con un selector dado, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">value</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Retrieve the value...
\$value = \$browser-&gt;value('selector');

// Set the value...
\$browser-&gt;value('selector', 'value');
</code></pre>

  <h4>Obteniendo texto</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">text</span> puede ser usado para obtener el texto de pantalla de un elemento que coincida con el selector dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$text = \$browser-&gt;text('selector');
</code></pre>

  <h4>Obteniendo atributos</h4>
  <p>Finalmente, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attribute</span> puede ser usado para obtener un atributo de un elemento que coincida con el selector dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$attribute = \$browser-&gt;attribute('selector', 'value');
</code></pre>

  <h3>Usando Formularios</h3>
  <h4>Escribiendo valores</h4>
  <p>Dusk proporciona una variedad de métodos para interactuar con formularios y elementos de entrada. Primero, vamos a echar un vistazo a un ejemplo de escribir texto dentro de un campo de entrada:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;type('email', 'taylor@laravel.com');
</code></pre>

  <p>Nota que, aunque el método acepta uno si es necesario, no estamos obligados a pasar un selector CSS dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">type</span>. Si un selector CSS no es proporcionado, Dusk buscará un campo de entrada con el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> dado. Finalmente, Dusk intentará encontrar un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">textarea</span> con el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> dado.</p>
  <p>Para agregar texto a un campo sin limpiar su contenido, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">append</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;type('tags', 'foo')
        -&gt;append('tags', ', bar, baz');
</code></pre>

  <p>Puedes limpiar el valor de un campo usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">clear</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;clear('email');
</code></pre>

  <h4>Listas desplegables</h4>
  <p>Para seleccionar un valor en un cuadro de selección de lista desplegable, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>. Al momento de pasar un valor al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">select</span>, deberías pasar el valor de opción a resaltar en lugar del texto mostrado en pantalla:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;select('size', 'Large');
</code></pre>

  <p>Puedes seleccionar una opción aleatoria al omitir el segundo parámetro:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;select('size');
</code></pre>

  <h4>Casillas de verificación</h4>
  <p>Para "marcar" un campo de casilla de verificación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">check</span>. Al igual que muchos otros métodos relacionados con entradas, un selector CSS completo no es obligatorio. Si un selector que coincida exactamente no puede ser encontrado, Dusk buscará una casilla de verificación con un atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> coincidente.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;check('terms');

\$browser-&gt;uncheck('terms');
</code></pre>

  <h4>Botones de radio</h4>
  <p>Para "seleccionar" una opción de botón de radio, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">radio</span>. Al igual que muchos otros métodos relacionados con campos, un selector CSS completo no es obligatorio. Si un selector que coincida exactamente no puede ser encontrado, Dusk buscará un radio con atributos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">value</span> coincidentes:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;radio('version', 'php7');
</code></pre>

  <h3>Adjuntando archivos</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attach</span> puede ser usado para adjuntar un archivo a un elemento
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">file</span>. Al igual que muchos otros métodos relacionados con campos, un selector CSS completo no es obligatorio. Si un selector que coincida exactamente no puede ser encontrado, Dusk buscará un campo de archivo con atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> coincidente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;attach('photo', __DIR__.'/photos/me.png');
</code></pre>

  <p>Nota</p>
  <p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attach</span> requiere que la extensión de PHP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Zip</span> esté instalada y habilitada en tu servidor.</p>

  <h3>Usando el teclado</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">keys</span> permite que proporciones secuencias de entrada más complejas para un elemento dado que lo permitido normalmente por el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">type</span>. Por ejemplo, puedes mantener presionada las teclas modificadoras al introducir valores. En este ejemplo, la tecla
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shift</span> será mantenida presionada mientras la palabra <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taylor</span> es introducida dentro del elemento que coincida con el selector dado. Después de que la palabra
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taylor</span> sea tipeada, la palabra <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">otwell</span> será tipeada sin alguna tecla modificadora:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;keys('selector', ['{shift}', 'taylor'], 'otwell');
</code></pre>

  <p>Incluso puedes enviar una "tecla de función" al selector CSS principal que contiene tu aplicación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;keys('.app', ['{command}', 'j']);
</code></pre>

  <p>TIP TIP</p>
  <p>
    Todas las teclas modificadoras se envuelven entre corchetes <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{}</span> y coinciden con las constantes definidas en la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Facebook\WebDriver\WebDriverKeys</span>, la cual puede ser encontrada en GitHub .
  </p>

  <h3>Usando el Ratón</h3>
  <h4>Haciendo clic sobre elementos</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">click</span> puede ser usado para "clickear" sobre un elemento que coincida con el selector dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;click('.selector');
</code></pre>

  <h4>Mouseover</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mouseover</span> puede ser usado cuando necesitas mover el ratón sobre un elemento que coincida con el selector dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;mouseover('.selector');
</code></pre>

  <h4>Arrastrar y soltar</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">drag</span> puede ser usado para arrastrar un elemento que coincida con el selector dado hasta otro elemento:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;drag('.from-selector', '.to-selector');
</code></pre>

  <p>O, puedes arrastrar un elemento en una única dirección:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;dragLeft('.selector', 10);
\$browser-&gt;dragRight('.selector', 10);
\$browser-&gt;dragUp('.selector', 10);
\$browser-&gt;dragDown('.selector', 10);
</code></pre>

  <h3>Diálogos de JavaScript</h3>
  <p>Dusk provee de varios métodos para interactuar con Diálogos de JavaScript:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Wait for a dialog to appear:
\$browser-&gt;waitForDialog(\$seconds = null);

// Assert that a dialog has been displayed and that its message matches the given value:
\$browser-&gt;assertDialogOpened('value');

// Type the given value in an open JavaScript prompt dialog:
\$browser-&gt;typeInDialog('Hello World');
</code></pre>

  <p>Para cerrar un Diálogo de JavaScript abierto, haga clic en el botón Aceptar o OK:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;acceptDialog();
</code></pre>

  <p>Para cerrar un Diálogo de JavaScript abierto, haga clic en el botón Cancelar (solo para un diálogo de confirmación):</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;dismissDialog();
</code></pre>

  <h3>Alcance de selectores</h3>
  <p>Algunas veces puedes querer ejecutar varias operaciones dentro del alcance de un selector dado. Por ejemplo, puedes querer comprobar que algunos textos existen unicamente dentro de una tabla y después presionar un botón dentro de la tabla. Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span> para completar esta tarea. Todas las operaciones ejecutadas dentro de la función de retorno dada al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span> serán exploradas en el selector original:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;with('.table', function (\$table) {
    \$table-&gt;assertSee('Hello World')
            -&gt;clickLink('Delete');
});
</code></pre>

  <h3>Esperando por elementos</h3>
  <p>Al momento de probar aplicaciones que usan JavaScript de forma extensiva, frecuentemente se vuelve necesario "esperar" por ciertos elementos o datos estén disponibles antes de proceder con una prueba. Dusk hace esto fácilmente. Usando una variedad de métodos, puedes esperar que los elementos estén visibles en la página e incluso esperar hasta que una expresión de JavaScript dada se evalúe como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>.</p>
  <h4>Esperando</h4>
  <p>Si necesitas pausar la prueba por un número de milisegundos dado, usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pause</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;pause(1000);
</code></pre>

  <h4>Esperando por selectores</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waitFor</span> puede ser usado para pausar la ejecución de la prueba hasta que el elemento que coincida con el selector CSS dado sea mostrado en la página. De forma predeterminada, esto pausará la prueba por un máximo de cinco segundos antes de arrojar una excepción. Si es necesario, puedes pasar un umbral de tiempo de expiración personalizado como segundo argumento del método:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Wait a maximum of five seconds for the selector...
\$browser-&gt;waitFor('.selector');

// Wait a maximum of one second for the selector...
\$browser-&gt;waitFor('.selector', 1);
</code></pre>

  <p>También puede esperar hasta que el selector dado no se encuentre en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;waitUntilMissing('.selector');

\$browser-&gt;waitUntilMissing('.selector', 1);
</code></pre>

  <h4>Estableciendo el alcance de selectores cuando estén disponibles</h4>
  <p>Ocasionalmente, puedes querer esperar por un selector dado y después interactuar con el elemento que coincida con el selector. Por ejemplo, puedes querer esperar hasta que una ventana modal esté disponible y después presionar el botón "OK" dentro de esa ventana. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenAvailable</span> puede ser usado en este caso. Todas las operaciones de elementos ejecutadas dentro de la función de retorno dada serán ejecutadas dentro del selector original:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;whenAvailable('.modal', function (\$modal) {
    \$modal-&gt;assertSee('Hello World')
            -&gt;press('OK');
});
</code></pre>

  <h4>Esperando por texto</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waitForText</span> puede ser usado para esperar hasta que el texto dado sea mostrado en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Wait a maximum of five seconds for the text...
\$browser-&gt;waitForText('Hello World');

// Wait a maximum of one second for the text...
\$browser-&gt;waitForText('Hello World', 1);
</code></pre>

  <h4>Esperando por enlaces</h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waitForLink</span> puede ser usado para esperar hasta que un enlace dado sea mostrada en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Wait a maximum of five seconds for the link...
\$browser-&gt;waitForLink('Create');

// Wait a maximum of one second for the link...
\$browser-&gt;waitForLink('Create', 1);
</code></pre>

  <h4>Esperando por la localización de la página</h4>
  <p>Al momento de hacer una comprobación de ruta tal como
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$browser-&gt;assertPathIs('/home')</span>, la comprobación puede fallar si <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">window.location.pathname</span> está siendo actualizada asincrónicamente. Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waitForLocation</span> para esperar por la localización que tenga un valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;waitForLocation('/secret');
</code></pre>

  <p>También puede esperar la localización de una ruta con nombre:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;waitForRoute(\$routeName, \$parameters);
</code></pre>

  <h4>Esperando por recargas de página</h4>
  <p>Si necesita hacer aserciones después de que se ha recargado una página, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waitForReload</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;click('.some-action')
        -&gt;waitForReload()
        -&gt;assertSee('something');
</code></pre>

  <h4>Esperando por expresiones de JavaScript</h4>
  <p>Algunas veces puedes querer pausar la ejecución de una prueba hasta que una expresión de JavaScript dada se evalúe a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>. Puedes completar fácilmente esto usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waitUntil</span>. Al momento de pasar una expresión a este método, no necesitas incluir al final la palabra clave <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">return</span> o un punto y coma <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">;</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Wait a maximum of five seconds for the expression to be true...
\$browser-&gt;waitUntil('App.dataLoaded');

\$browser-&gt;waitUntil('App.data.servers.length &gt; 0');

// Wait a maximum of one second for the expression to be true...
\$browser-&gt;waitUntil('App.data.servers.length &gt; 0', 1);
</code></pre>

  <h4>Esperando por expresiones de Vue</h4>
  <p>Los siguientes métodos puedes ser usados para esperar hasta que un atributo de componente de Vue dado tenga un determinado valor:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Wait until the component attribute contains the given value...
\$browser-&gt;waitUntilVue('user.name', 'Taylor', '@user');

// Wait until the component attribute doesn't contain the given value...
\$browser-&gt;waitUntilVueIsNot('user.name', null, '@user');
</code></pre>

  <h4>Esperando por una función de retorno</h4>
  <p>Muchos de los métodos de "espera" en Dusk confían en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waitUsing</span> subyacente. Puedes usar este método directamente para esperar por una función de retorno dada que devuelva
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">waitUsing</span> acepta el máximo número de segundos para esperar la Closure, el intervalo en el cual la Closure debería ser evaluada y un mensaje opcional de falla:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;waitUsing(10, 1, function () use (\$something) {
    return \$something-&gt;isReady();
}, "Something wasn't ready in time.");
</code></pre>

  <h3>Haciendo aserciones de Vue</h3>
  <p>
    Inclusive Dusk permite que hagas comprobaciones en el estado de componente de datos de Vue . Por ejemplo, imagina que tu aplicación contiene el siguiente componente de Vue:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// HTML...

&lt;profile dusk="profile-component"&gt;&lt;/profile&gt;

// Component Definition...

Vue.component('profile', {
    template: '&lt;div&gt;{{ user.name }}&lt;/div&gt;',

    data: function () {
        return {
            user: {
                name: 'Taylor'
            }
        };
    }
});
</code></pre>

  <p>Puedes comprobar el estado del componente de Vue de esta manera:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* A basic Vue test example.
*
* @return void
*/
public function testVue()
{
    \$this-&gt;browse(function (Browser \$browser) {
        \$browser-&gt;visit('/')
                -&gt;assertVue('user.name', 'Taylor', '@profile-component');
    });
}
</code></pre>

  <h2>Aserciones disponibles</h2>
  <p>Dusk proporciona una variedad de aserciones que puedes hacer en tu apliación. Todas las aserciones disponibles están documentadas en la tabla de abajo:</p>

  <p>assertTitle assertTitleContains assertUrlIs assertSchemeIs assertSchemeIsNot assertHostIs assertHostIsNot assertPortIs assertPortIsNot assertPathBeginsWith assertPathIs assertPathIsNot assertRouteIs assertQueryStringHas assertQueryStringMissing assertFragmentIs assertFragmentBeginsWith assertFragmentIsNot assertHasCookie assertCookieMissing assertCookieValue assertPlainCookieValue assertSee assertDontSee assertSeeIn assertDontSeeIn assertSourceHas assertSourceMissing assertSeeLink assertDontSeeLink assertInputValue assertInputValueIsNot assertChecked assertNotChecked assertRadioSelected assertRadioNotSelected assertSelected assertNotSelected assertSelectHasOptions assertSelectMissingOptions assertSelectHasOption assertValue assertVisible assertPresent assertMissing assertDialogOpened assertEnabled assertDisabled assertFocused assertNotFocused assertVue assertVueIsNot assertVueContains assertVueDoesNotContain</p>

  <h4>assertTitle</h4>
  <p>Comprueba que el título de la página coincida con el texto dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertTitle(\$title);
</code></pre>

  <h4>assertTitleContains</h4>
  <p>Comprueba que el título de página contenga el texto dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertTitleContains(\$title);
</code></pre>

  <h4>assertUrlIs</h4>
  <p>Comprueba que la URL actual (sin la cadena de consulta) coincida con la cadena dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertUrlIs(\$url);
</code></pre>

  <h4>assertSchemeIs</h4>
  <p>Comprueba que el esquema de la URL actual coincide con el esquema dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSchemeIs(\$scheme);
</code></pre>

  <h4>assertSchemeIsNot</h4>
  <p>Comprueba que el esquema de la URL actual no coincide con el esquema dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSchemeIsNot(\$scheme);
</code></pre>

  <h4>assertHostIs</h4>
  <p>Comprueba que el Host de la URL actual coincide con el Host dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertHostIs(\$host);
</code></pre>

  <h4>assertHostIsNot</h4>
  <p>Comprueba que el Host de la URL actual no coincide con el Host dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertHostIsNot(\$host);
</code></pre>

  <h4>assertPortIs</h4>
  <p>Comprueba que el puerto de la URL actual coincide con el puerto dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertPortIs(\$port);
</code></pre>

  <h4>assertPortIsNot</h4>
  <p>Comprueba que el puerto de la URL actual no coincide con el puerto dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertPortIsNot(\$port);
</code></pre>

  <h4>assertPathBeginsWith</h4>
  <p>Comprueba que la ruta de la URL actual comience con la ruta dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertPathBeginsWith(\$path);
</code></pre>

  <h4>assertPathIs</h4>
  <p>Comprueba que la ruta actual coincida con la ruta dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertPathIs('/home');
</code></pre>

  <h4>assertPathIsNot</h4>
  <p>Comprueba que la ruta actual no coincida con la ruta dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertPathIsNot('/home');
</code></pre>

  <h4>assertRouteIs</h4>
  <p>Comprueba que la URL actual coincida con la URL de ruta nombrada dada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertRouteIs(\$name, \$parameters);
</code></pre>

  <h4>assertQueryStringHas</h4>
  <p>Comprueba que el parámetro de cadena para una consulta dada está presente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertQueryStringHas(\$name);
</code></pre>

  <p>Comprueba que el parámetro de cadena para una consulta dada está presente y tiene un valor dado:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertQueryStringHas(\$name, \$value);
</code></pre>

  <h4>assertQueryStringMissing</h4>
  <p>Comprueba que el parámetro de cadena para una consulta dada está ausente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertQueryStringMissing(\$name);
</code></pre>

  <h4>assertFragmentIs</h4>
  <p>Comprueba que el fragmento actual coincide con el fragmento dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertFragmentIs('anchor');
</code></pre>

  <h4>assertFragmentBeginsWith</h4>
  <p>Comprueba que el fragmento actual comienza con el fragmento dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertFragmentBeginsWith('anchor');
</code></pre>

  <h4>assertFragmentIsNot</h4>
  <p>AComprueba que el fragmento actual no coincide con el fragmento dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertFragmentIsNot('anchor');
</code></pre>

  <h4>assertHasCookie</h4>
  <p>Comprueba que el cookie dado está presente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertHasCookie(\$name);
</code></pre>

  <h4>assertCookieMissing</h4>
  <p>Comprueba que el cookie dado no está presente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertCookieMissing(\$name);
</code></pre>

  <h4>assertCookieValue</h4>
  <p>Comprueba que un cookie tenga un valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertCookieValue(\$name, \$value);
</code></pre>

  <h4>assertPlainCookieValue</h4>
  <p>Comprueba que un cookie desencriptado tenga un valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertPlainCookieValue(\$name, \$value);
</code></pre>

  <h4>assertSee</h4>
  <p>Comprueba que el texto dado está presente en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSee(\$text);
</code></pre>

  <h4>assertDontSee</h4>
  <p>Comprueba que el texto dado no está presente en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertDontSee(\$text);
</code></pre>

  <h4>assertSeeIn</h4>
  <p>Comprueba que el texto dado está presente dentro del selector:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSeeIn(\$selector, \$text);
</code></pre>

  <h4>assertDontSeeIn</h4>
  <p>Comprueba que el texto dado no está presente dentro del selector:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertDontSeeIn(\$selector, \$text);
</code></pre>

  <h4>assertSourceHas</h4>
  <p>Comprueba que el código fuente dado está presente en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSourceHas(\$span);
</code></pre>

  <h4>assertSourceMissing</h4>
  <p>Comprueba que el código fuente dado no está presente en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSourceMissing(\$span);
</code></pre>

  <h4>assertSeeLink</h4>
  <p>Comprueba que el enlace dado está presente en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSeeLink(\$linkText);
</code></pre>

  <h4>assertDontSeeLink</h4>
  <p>Comprueba que el enlace dado está no presente en la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertDontSeeLink(\$linkText);
</code></pre>

  <h4>assertInputValue</h4>
  <p>Comprueba que el campo de entrada dado tiene el valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertInputValue(\$field, \$value);
</code></pre>

  <h4>assertInputValueIsNot</h4>
  <p>Comprueba que el campo de entrada dado no tiene el valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertInputValueIsNot(\$field, \$value);
</code></pre>

  <h4>assertChecked</h4>
  <p>Comprueba que la casilla de verificación está marcada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertChecked(\$field);
</code></pre>

  <h4>assertNotChecked</h4>
  <p>Comprueba que la casilla de verificación no está marcada:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertNotChecked(\$field);
</code></pre>

  <h4>assertRadioSelected</h4>
  <p>Comprueba que el campo de radio está seleccionado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertRadioSelected(\$field, \$value);
</code></pre>

  <h4>assertRadioNotSelected</h4>
  <p>Comprueba que el campo de radio no está seleccionado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertRadioNotSelected(\$field, \$value);
</code></pre>

  <h4>assertSelected</h4>
  <p>Comprueba que la lista desplegable tiene seleccionado el valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSelected(\$field, \$value);
</code></pre>

  <h4>assertNotSelected</h4>
  <p>Comprueba que la lista desplegable no tiene seleccionado el valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertNotSelected(\$field, \$value);
</code></pre>

  <h4>assertSelectHasOptions</h4>
  <p>Comprueba que el arreglo dado de valores están disponibles para ser seleccionados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSelectHasOptions(\$field, \$values);
</code></pre>

  <h4>assertSelectMissingOptions</h4>
  <p>Comprueba que el arreglo dado de valores no están disponibles para ser seleccionados:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSelectMissingOptions(\$field, \$values);
</code></pre>

  <h4>assertSelectHasOption</h4>
  <p>Comprueba que el valor dado está disponible para ser seleccionado en el campo dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertSelectHasOption(\$field, \$value);
</code></pre>

  <h4>assertValue</h4>
  <p>Comprueba que el elemento que coincida con el selector dado tenga el valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertValue(\$selector, \$value);
</code></pre>

  <h4>assertVisible</h4>
  <p>Comprueba que el elemento que coincida con el selector dado sea visible:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertVisible(\$selector);
</code></pre>

  <h4>assertPresent</h4>
  <p>Comprueba que el elemento que coincida con el selector dado está presente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertPresent(\$selector);
</code></pre>

  <h4>assertMissing</h4>
  <p>Comprueba que el elemento que coincida con el selector dado no sea visible:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertMissing(\$selector);
</code></pre>

  <h4>assertDialogOpened</h4>
  <p>Comprueba que un diálogo JavaScript con un mensaje dado ha sido abierto:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertDialogOpened(\$message);
</code></pre>

  <h4>assertEnabled</h4>
  <p>Comprueba que el campo dado está activado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertEnabled(\$field);
</code></pre>

  <h4>assertDisabled</h4>
  <p>Comprueba que el campo dado está desactivado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertDisabled(\$field);
</code></pre>

  <h4>assertFocused</h4>
  <p>Comprueba que el campo dado está enfocado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertFocused(\$field);
</code></pre>

  <h4>assertNotFocused</h4>
  <p>Comprueba que el campo dado no está enfocado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertNotFocused(\$field);
</code></pre>

  <h4>assertVue</h4>
  <p>Comprueba que una propiedad de datos de un componente de Vue dado coincida con el valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertVue(\$property, \$value, \$componentSelector = null);
</code></pre>

  <h4>assertVueIsNot</h4>
  <p>Comprueba que una propiedad de datos de un componente de Vue dado no coincida con el valor dado:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertVueIsNot(\$property, \$value, \$componentSelector = null);
</code></pre>

  <h4>assertVueContains</h4>
  <p>Comprueba que una propiedad de datos de un componente de Vue dado es un arreglo y contiene el valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertVueContains(\$property, \$value, \$componentSelector = null);
</code></pre>

  <h4>assertVueDoesNotContain</h4>
  <p>Comprueba que una propiedad de datos de un componente de Vue dado es un arreglo y no contiene el valor dado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;assertVueDoesNotContain(\$property, \$value, \$componentSelector = null);
</code></pre>

  <h2>Páginas</h2>
  <p>Alguna veces, las pruebas requieren que varias acciones complicadas sean ejecutadas en secuencia. Esto puede hacer tus pruebas más difíciles de leer y entender. Las páginas permiten que definas acciones expresivas que entonces pueden ser ejecutadas en una página dada usando un solo método. Las páginas también permiten que definas abreviaturas para selectores comunes para tu aplicación o una página única.</p>

  <h3>Generando páginas</h3>
  <p>Para generar un objeto de página, usa el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk:page</span>. Todos los objetos de página serán colocados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests/Browser/Pages</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk:page Login
</code></pre>

  <h3>Configurando páginas</h3>
  <p>De forma predeterminada, las páginas tienen tres métodos: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assert</span>, y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">elements</span>. Discutiremos los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assert</span> ahora. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">elements</span> será discutido con más detalle debajo.</p>
  <h4>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> debería devolver la ruta de la URL que representa la página. Dusk usará esta URL al momento de navegar a la página en el navegador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the URL for the page.
*
* @return string
*/
public function url()
{
    return '/login';
}
</code></pre>

  <h4>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assert</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assert</span> puede hacer algunas aserciones necesarias para verificar que el navegador en realidad está en la página dada. Completar este método no es necesario; sin embargo, eres libre de hacer estas aserciones si lo deseas. Estas aserciones serán ejecutadas automáticamente al momento de navegar hacia la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Assert that the browser is on the page.
*
* @return void
*/
public function assert(Browser \$browser)
{
    \$browser-&gt;assertPathIs(\$this-&gt;url());
}
</code></pre>

  <h3>Navegando hacia las páginas</h3>
  <p>Una vez que se ha configurado una página, puedes navegar a ella utilizando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">visit</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Tests\Browser\Pages\Login;

\$browser-&gt;visit(new Login);
</code></pre>

  <p>A veces es posible que ya estés en una página determinada y necesitas "cargar" los selectores y métodos dentro del contexto de prueba actual. Esto es común al momento de presionar un botón y ser redireccionado a una página dada sin navegar explícitamente a ésta. En esta situación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">on</span> para cargar la página.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Tests\Browser\Pages\CreatePlaylist;

\$browser-&gt;visit('/dashboard')
        -&gt;clickLink('Create Playlist')
        -&gt;on(new CreatePlaylist)
        -&gt;assertSee('@create');
</code></pre>

  <h3>Selectores abreviados</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">elements</span> de páginas permite que definas abreviaturas rápidas, fáciles de recordar para cualquier selector CSS en tu página. Por ejemplo, vamos a definir una abreviación para el campo "email" de la página login de la aplicación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the element shortcuts for the page.
*
* @return array
*/
public function elements()
{
    return [
        '@email' =&gt; 'input[name=email]',
    ];
}
</code></pre>

  <p>Ahora, puedes usar este selector de abreviación en cualquier lugar que usarías un selector de CSS completo:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$browser-&gt;type('@email', 'taylor@laravel.com');
</code></pre>

  <h4>Selectores de abreviaturas globales</h4>
  <p>Después de instalar Dusk, una clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Page</span> básica será colocada en tu directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests/Browser/Pages</span>. Esta clase contiene un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">siteElements</span> el cual puede ser usado para definir selectores de abreviaturas globales que deberían estar disponibles en cada página en cada parte de tu aplicación:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Get the global element shortcuts for the site.
*
* @return array
*/
public static function siteElements()
{
    return [
        '@element' =&gt; '#selector',
    ];
}
</code></pre>

  <h3>Métodos de página</h3>
  <p>Además de los métodos predeterminados definidos en páginas, puedes definir métodos adicionales, los cuales pueden ser usados en cualquier parte de tus pruebas. Por ejemplo, vamos a imaginar que estamos construyendo una aplicación para administración de música. Una acción común para una página de la aplicación podría ser crear una lista de reproducción. En lugar de volver a escribir la lógica para crear una lista de reproducción en cada prueba, puedes definir un método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">createPlaylist</span> en una clase de página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Browser\Pages;

use Laravel\Dusk\Browser;

class Dashboard extends Page
{
    // Other page methods...

    /**
    * Create a new playlist.
    *
    * @param  \Laravel\Dusk\Browser  \$browser
    * @param  string  \$name
    * @return void
    */
    public function createPlaylist(Browser \$browser, \$name)
    {
        \$browser-&gt;type('name', \$name)
                -&gt;check('share')
                -&gt;press('Create Playlist');
    }
}
</code></pre>

  <p>Una vez que el método ha sido definido, puedes usarlo dentro de cualquier prueba que utilice la página. La instancia de navegador será pasada automáticamente al método de la página:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Tests\Browser\Pages\Dashboard;

\$browser-&gt;visit(new Dashboard)
        -&gt;createPlaylist('My Playlist')
        -&gt;assertSee('My Playlist');
</code></pre>

  <h2>Componentes</h2>
  <p>Los componentes son similares a “los objetos de página” de Dusk, pero son planeados para partes de UI y funcionalidades que sean reusadas en otras partes de tu aplicación, tal como una barra de navegación o ventana de notificación. Como tal, los componentes no son enlazados a URLs específicas.
  </p>

  <h3>Generando componentes</h3>
  <p>Para generar un componente, usa el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dusk:component</span>. Los nuevos componentes son colocados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">test/Browser/Components</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan dusk:component DatePicker
</code></pre>

  <p>Como se muestra antes, un "calendario" es un ejemplo de un componente que puede existir en cualquier parte de tu aplicación en una variedad de páginas. Puede volverse complejo escribir manualmente lógica de automatización de navegador para seleccionar una fecha entre docenas de pruebas en cualquier parte de tu software de prueba. En lugar de esto, podemos definir un componente de Dusk para representar el calendario, permitiendo encapsular esa lógica dentro del componente:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Browser\Components;

use Laravel\Dusk\Browser;
use Laravel\Dusk\Component as BaseComponent;

class DatePicker extends BaseComponent
{
    /**
    * Get the root selector for the component.
    *
    * @return string
    */
    public function selector()
    {
        return '.date-picker';
    }

    /**
    * Assert that the browser page contains the component.
    *
    * @param  Browser  \$browser
    * @return void
    */
    public function assert(Browser \$browser)
    {
        \$browser-&gt;assertVisible(\$this-&gt;selector());
    }

    /**
    * Get the element shortcuts for the component.
    *
    * @return array
    */
    public function elements()
    {
        return [
            '@date-field' =&gt; 'input.datepicker-input',
            '@month-list' =&gt; 'div &gt; div.datepicker-months',
            '@day-list' =&gt; 'div &gt; div.datepicker-days',
        ];
    }

    /**
    * Select the given date.
    *
    * @param  \Laravel\Dusk\Browser  \$browser
    * @param  int  \$month
    * @param  int  \$day
    * @return void
    */
    public function selectDate(\$browser, \$month, \$day)
    {
        \$browser-&gt;click('@date-field')
                -&gt;within('@month-list', function (\$browser) use (\$month) {
                    \$browser-&gt;click(\$month);
                })
                -&gt;within('@day-list', function (\$browser) use (\$day) {
                    \$browser-&gt;click(\$day);
                });
    }
}
</code></pre>

  <h3>Usando componentes</h3>
  <p>Una vez que el componente ha sido definido, fácilmente podemos seleccionar una fecha dentro del calendario desde cualquier prueba. Y, si la lógica necesaria para seleccionar una fecha cambia, solamente necesitaremos actualizar el componente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Browser;

use Tests\DuskTestCase;
use Laravel\Dusk\Browser;
use Tests\Browser\Components\DatePicker;
use Illuminate\Foundation\Testing\DatabaseMigrations;

class ExampleTest extends DuskTestCase
{
    /**
    * A basic component test example.
    *
    * @return void
    */
    public function testBasicExample()
    {
        \$this-&gt;browse(function (Browser \$browser) {
            \$browser-&gt;visit('/')
                    -&gt;within(new DatePicker, function (\$browser) {
                        \$browser-&gt;selectDate(1, 2018);
                    })
                    -&gt;assertSee('January');
        });
    }
}
</code></pre>

  <h2>Integración continua</h2>

  <h3>CircleCI</h3>
  <p>Si estás usando CircleCI para ejecutar tus pruebas de Dusk, puedes usar este archivo de configuración como punto de partida. Al igual que con TravisCI, usaremos el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php
  artisan serve</span> para ejecutar el servidor web integrado de PHP:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>version: 2
jobs:
    build:
        steps:
            - run: sudo apt-get install -y libsqlite3-dev
            - run: cp .env.testing .env
            - run: composer install -n --ignore-platform-reqs
            - run: npm install
            - run: npm run production
            - run: vendor/bin/phpunit

            - run:
                name: Start Chrome Driver
                command: ./vendor/laravel/dusk/bin/chromedriver-linux
                background: true

            - run:
                name: Run Laravel Server
                command: php artisan serve
                background: true

            - run:
                name: Run Laravel Dusk Tests
                command: php artisan dusk
</code></pre>

  <h3>spanship</h3>
  <p>
    Para ejecutar pruebas de Dusk en spanship , agrega los siguientes comandos a tu proyecto spanship. Estos comandos son sólo un punto de partida y eres libre de agregar los comandos adicionales que necesites:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>phpenv local 7.2
cp .env.testing .env
mkdir -p ./bootstrap/cache
composer install --no-interaction --prefer-dist
php artisan key:generate
nohup bash -c "php artisan serve 2&gt;&amp;1 &amp;" &amp;&amp; sleep 5
php artisan dusk
</code></pre>

  <h3>Heroku CI</h3>
  <p>
    Para ejecutar tus pruebas de Dusk en Heroku CI , agrega el siguiente buildpack de Google Chrome y scripts a tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app.json</span> de Heroku:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>{
    "environments": {
        "test": {
            "buildpacks": [
                { "url": "heroku/php" },
                { "url": "https://github.com/heroku/heroku-buildpack-google-chrome" }
            ],
            "scripts": {
                "test-setup": "cp .env.testing .env",
                "test": "nohup bash -c './vendor/laravel/dusk/bin/chromedriver-linux &gt; /dev/null 2&gt;&amp;1 &amp;' &amp;&amp; nohup bash -c 'php artisan serve &gt; /dev/null 2&gt;&amp;1 &amp;' &amp;&amp; php artisan dusk"
            }
        }
    }
}
</code></pre>

  <h3>Travis CI</h3>
  <p>
    Para ejecutar tus pruebas de Dusk en Travis CI , usa la siguiente configuración en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.travis.yml</span>. Ya que Travis CI no es un entorno gráfico, necesitaremos tomar algunos pasos extras con el propósito de ejecutar un navegador Chrome. En adición a esto, usaremos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan serve</span> para ejecutar el servidor web integrado de PHP:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>language: php

php:
    - 7.3

addons:
    chrome: stable

install:
    - cp .env.testing .env
    - travis_retry composer install --no-interaction --prefer-dist --no-suggest
    - php artisan key:generate

before_script:
    - google-chrome-stable --headless --disable-gpu --remote-debugging-port=9222 http://localhost &amp;
    - php artisan serve &amp;

script:
    - php artisan dusk
</code></pre>

  <p>En tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.testing</span>, ajusta el valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">APP_URL</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>APP_URL=http://127.0.0.1:8000
</code></pre>
</div>
""";