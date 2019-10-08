import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PaConfiguracion extends StatelessWidget {
  final String title;
  PaConfiguracion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPaConfiguracion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPaConfiguracion = """
<div style='font-size: 14.2px;'> 
    <h1>Configuración</h1>
    <ul>
      <li>Introducción</li>
      <li>
        Configuración del entorno 
        <ul>
          <li>Tipos de variables de entorno</li>
          <li>Recuperar la configuración del entorno</li>
          <li>Determinando el entorno actual</li>
          <li>Ocultar variables de entorno a páginas de depuración</li>
        </ul>
      </li>
      <li>Acceder a valores de configuración</li>
      <li>Almacenamiento en caché de la configuración</li>
      <li>Modo de mantenimiento</li>
    </ul>
    
    <h2>Introducción</h2>
    <p>Todos los archivos de configuración para el framework Laravel están almacenados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span>. Cada opción está documentada, así que no dudes en consultar los archivos y familiarizarte con las opciones disponibles para ti.</p>
    
    <h2>Configuración del entorno</h2>
    <p>A menudo es útil tener diferentes valores de configuración basados en el entorno en el que se ejecuta la aplicación. Por ejemplo, es posible que desees utilizar un servidor de caché localmente diferente al servidor que usas en producción.</p>
    <p>Para hacer esto sencillo, Laravel utiliza la librería de PHP DotEnv por Vance Lucas. En una nueva instalación de Laravel, el directorio raíz de tu aplicación contendrá un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.example</span>. Si instalas Laravel por medio de Composer, este archivo será renombrado automáticamente a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span>. De lo contrario, deberás renombrar el archivo manualmente.</p>
    <p>Tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> deberá omitirse en el sistema de control de versiones de tu aplicación, ya que cada desarrollador / servidor que usa tu aplicación puede requerir una configuración de entorno diferente. Además, esto sería un riesgo de seguridad en caso de que un intruso obtenga acceso al repositorio de control de versiones de tu aplicación.</p>
    <p>Si estás desarrollando con un equipo, es posible que desees continuar incluyendo el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.example</span> en tu aplicación. Al poner valores de ejemplo (placeholder) en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.example</span>, otros desarrolladores en tu equipo podrán ver claramente cuáles variables de entorno se necesitan para ejecutar tu aplicación. También puedes crear un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.testing</span>. Este archivo sobrescribirá el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> al ejecutar pruebas con PHPUnit o al ejecutar comandos de Artisan con la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--env=testing</span>.</p>
    
    <p>TIP</p>
    <p>Cualquier variable en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> puede ser anulada por variables de entorno externas tales como variables de entorno de nivel de servidor o de nivel de sistema.</p>
    
  
  
  <h3>Tipos de variables de entorno</h3>
  <p>Todas las variables en tus archivos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> se traducen como cadenas, así que algunos valores reservados han sido creados para permitirte retornar un rango más amplio de tipos desde la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env()</span>:</p>
  <table style="border: 1px solid #CFD8DC">
    <thead>
      <tr>
        <th>Valor en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span></th>
        <th>Valor en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env()</span></th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>true</td>
        <td>(booleano) true</td>
      </tr>
      <tr>
        <td>(true)</td>
        <td>(booleano) true</td>
      </tr>
      <tr>
        <td>false</td>
        <td>(booleano) false</td>
      </tr>
      <tr>
        <td>(false)</td>
        <td>(booleano) false</td>
      </tr>
      <tr>
        <td>empty</td>
        <td>(cadena) ''</td>
      </tr>
      <tr>
        <td>(empty)</td>
        <td>(cadena) ''</td>
      </tr>
      <tr>
        <td>null</td>
        <td>(null) null</td>
      </tr>
      <tr>
        <td>(null)</td>
        <td>(null) null</td>
      </tr>
    </tbody>
  </table>
  <p>Si necesitas definir una variable de entorno con un valor que contiene espacios, puedes hacerlo  encerrando el valor en comillas dobles.</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>APP_NAME="My Application"
</code></pre>
  
  
  <h3>Recuperar la configuración del entorno</h3>
  <p>Todas las variables listadas en este archivo van a ser cargadas en la variable super-global de PHP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$_ENV</span> cuando tu aplicación reciba una solicitud. Sin embargo, puedes utilizar el helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span> para recuperar valores de estas variables en tus archivos de configuración. De hecho, si revisas los archivos de configuración de Laravel, podrás notar que varias de estas opciones ya están utilizando este helper:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>'debug' =&gt; env('APP_DEBUG', false),
</code></pre>
  
  <p>El segundo valor pasado a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span> es el "valor predeterminado". Este valor será utilizado si no se encuentra una variable de entorno existente para la clave proporcionada.</p>
  
  <h3>Determinando el entorno actual</h3>
  <p>El entorno actual de la aplicación es determinado por medio de la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">APP_ENV</span> desde tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span>. Puedes acceder a este valor por medio del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">environment</span> del facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App</span>:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>\$environment = App::environment();
</code></pre>
  
  <p>También puedes pasar argumentos al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">environment</span> para verificar si el entorno coincide con un valor determinado. El método va a retornar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si el entorno coincide con cualquiera de los valores dados:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>if (App::environment('local')) {
    // The environment is local
}

if (App::environment(['local', 'staging'])) {
    // The environment is either local OR staging...
}
</code></pre>
  
  
    <p>TIP</p>
    <p>La detección del entorno actual de la aplicación puede ser anulada por una variable de entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">APP_ENV</span> a nivel del servidor. Esto puede ser útil cuando necesites compartir la misma aplicación para diferentes configuraciones de entorno, para que puedas configurar un host determinado para que coincida con un entorno determinado en las configuraciones de tu servidor.</p>
  
  
  <h3>Ocultar variables de entorno a páginas de depuración</h3>
  <p>Cuando una excepción no es capturada y la variable de entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">APP_DEBUG</span> es igual a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>, la página de depuración mostrará todas las variables de entorno y sus contenidos. En algunos casos vas a querer ocultar ciertas variables. Puedes hacer esto actualizando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">debug_blacklist</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>.</p>
  <p>Algunas variables están disponibles tanto en las variables de entorno y en los datos del servidor / petición. Por lo tanto, puede que necesites ocultarlos tanto para <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$_ENV</span> como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$_SERVER</span>:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>return [

    // ...

    'debug_blacklist' =&gt; [
        '_ENV' =&gt; [
            'APP_KEY',
            'DB_PASSWORD',
        ],

        '_SERVER' =&gt; [
            'APP_KEY',
            'DB_PASSWORD',
        ],

        '_POST' =&gt; [
            'password',
        ],
    ],
];
</code></pre>
  
  
  <h2>Acceder a valores de configuración</h2>
  <p>Puedes acceder fácilmente a tus valores de configuración utilizando la funcion helper global <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span> desde cualquier lugar de tu aplicación. Se puede acceder a los valores de configuración usanto la sintaxis de "punto", que incluye el nombre del archivo y la opción a la que deseas acceder. También puedes especificar un valor predeterminado que se devolverá si la opción de configuración no existe:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = config('app.timezone');
</code></pre>
  
  <p>Para establecer valores de configuración en tiempo de ejecución, pasa un arreglo al helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span>:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>config(['app.timezone' =&gt; 'America/Chicago']);
</code></pre>
  
  
  <h2>Almacenamiento en caché de la configuración</h2>
  <p>Para dar a tu aplicación un aumento de velocidad, debes almacenar en caché todos tus archivos de configuración en un solo archivo usando el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config:cache</span>. Esto combinará todas las opciónes de configuración para tu aplicación en un solo archivo que será cargado rápidamente por el framework.</p>
  <p>Usualmente deberías ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan config:cache</span> como parte de tu rutina de despliegue a producción. El comando no se debe ejecutar durante el desarrollo local ya que las opciones de configuración con frecuencia deberán cambiarse durante el desarrollo de tu aplicación.</p>
  
    <p>Nota</p>
    <p>Si ejecutas el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config:cache</span> durante el proceso de despliegue, debes asegurarte de llamar solo a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span> desde tus archivos de configuración. Una vez que la configuración se ha almacenado en caché, el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> no será cargado y todas las llamadas a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span> retornarán <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>.</p>
  
  
  <h2>Modo de mantenimiento</h2>
  <p>Cuando tu aplicación se encuentre en modo de mantenimiento, se mostrará una vista personalizada para todas las solicitudes en tu aplicación. Esto facilita la "desactivación" de tu aplicación mientras se está actualizando o cuando se realiza mantenimiento. Se incluye una verificación de modo de mantenimiento en la pila de middleware predeterminada para tu aplicación. Si la aplicación está en modo de mantenimiento, una excepción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MaintenanceModeException</span> será lanzada con un código de estado 503.</p>
  <p>Para habilitar el modo de mantenimiento, ejecuta el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">down</span>:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan down
</code></pre>
  
  <p>También puedes proporcionar las opciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">message</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry</span> al comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">down</span>. El valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">message</span> se puede usar para mostrar o registrar un mensaje personalizado, mientras que el valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry</span> se establecerá como el valor de cabecera HTTP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Retry-After</span>:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan down --message="Upgrading Database" --retry=60
</code></pre>
  
  <p>Incluso en modo de mantenimiento, se les puede permitir acceder a la aplicación a direcciones IP  o redes específicas usando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">allow</span> del comando:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan down --allow=127.0.0.1 --allow=192.168.0.0/16
</code></pre>
  
  <p>Para deshabilitar el modo de mantenimiento, usa el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">up</span>:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan up
</code></pre>
  
  
    <p>TIP</p>
    <p>Puedes personalizar la plantilla predeterminada del modo de mantenimiento al definir tu propia plantilla en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/errors/503.blade.php</span>.</p>
  
  <h4>Modo de mantenimiento y colas</h4>
  <p>Mientras tu aplicación esté en modo de mantenimiento, no se manejarán trabajos en cola. Los trabajos continuarán siendo manejados de forma normal una vez que la aplicación esté fuera del modo de mantenimiento.</p>
  <h4>Alternativas al modo de mantenimiento</h4>
  <p>Como el modo de mantenimiento requiere que tu aplicación tenga varios segundos de tiempo de inactividad, considera alternativas como Envoyer para lograr hacer deploy de Laravel sin tiempo de inactividad.</p>
</div>
""";