import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PePasos extends StatelessWidget {
  final String title;
  PePasos(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmPePasos,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HqmPePasos = """
<!-- Pruebas: Primeros Pasos -->
<div style='font-size: 14.2px;'>
  <h1>Pruebas: Primeros Pasos</h1>
  <ul>
    <li>Introducción</li>
    <li>Entorno</li>
    <li>Creando y ejecutando pruebas</li>
  </ul>

  <h2>Introducción</h2>
  <p>Laravel está construido pensando en las pruebas. De hecho, el soporte para pruebas con PHPUnit es incluido de forma predeterminada y un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpunit.xml</span> ya está configurado para tu aplicación. El framework también viene con métodos de ayuda convenientes que permiten que pruebes tus aplicaciones de forma expresiva.</p>
  <p>De forma predeterminada, el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests</span> de tu aplicación contiene dos directorios: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Feature</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Unit</span>. Las pruebas unitarias (Unit) son pruebas que se enfocan en una muy pequeña porción aislada de tu código. De hecho, la mayoría de las pruebas unitarias se enfocan probablemente en un solo método. Las pruebas funcionales (Feature) pueden probar una porción más grande de tu código, incluyendo la forma en la que varios objetos interactúan entre sí e incluso una solicitud HTTP completa para un endpoint de JSON.</p>
  <p>Un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ExampleTest.php</span> es proporcionado en ambos directorios de prueba <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Feature</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Unit</span>. Después de instalar una nueva aplicación de Laravel, ejecuta
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpunit</span> en la línea de comandos para ejecutar tus pruebas.</p>

  <h2>Entorno</h2>
  <p>Al momento de ejecutar las pruebas por medio de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpunit</span>, Laravel establecerá automáticamente el entorno de configuración a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">testing</span> debido a las variables de entorno definidas en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpunit.xml</span>. Laravel también configura automáticamente la sesión y cache del manejador <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span> al momento de ejecutar las pruebas, lo que significa que ninguna sesión o cache de datos será conservada mientras las pruebas son ejecutadas.</p>
  <p>Eres libre de definir otros valores de configuración del entorno de pruebas cuando sea necesario. Las variables de entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">testing</span> pueden ser configuradas en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpunit.xml</span>, pero ¡asegurate de limpiar tu cache de configuración usando el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config:clear</span> antes de ejecutar tus pruebas!</p>
  <p>Además, puedes crear un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.testing</span> en la raíz de tu proyecto. Este archivo anulará el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> cuando ejecute las pruebas PHPUnit o cuando ejecute los comandos de Artisan con la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--env = testing</span>.</p>

  <h2>Creando y ejecutando pruebas</h2>
  <p>Para crear un nuevo caso de prueba, usa el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:test</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Create a test in the Feature directory...
php artisan make:test UserTest

// Create a test in the Unit directory...
php artisan make:test UserTest --unit
</code></pre>

  <p>Una vez que la prueba ha sido generada, puedes definir métodos de pruebas como lo harías normalmente usando PHPUnit. Para ejecutar tus pruebas, ejecuta el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpunit</span> desde tu terminal:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace Tests\Unit;

use Tests\TestCase;
use Illuminate\Foundation\Testing\RefreshDatabase;

class ExampleTest extends TestCase
{
    /**
    * A basic test example.
    *
    * @return void
    */
    public function testBasicTest()
    {
        \$this-&gt;assertTrue(true);
    }
}
</code></pre>

  <p>Nota</p>
  <p>Si defines tus propios métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">setUp</span> / <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tearDown</span> dentro de una clase de prueba, asegurate de ejecutar los respectivos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">parent::setUp()</span> / <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">parent::tearDown()</span> metodos en la clase padre.</p>
</div>
""";