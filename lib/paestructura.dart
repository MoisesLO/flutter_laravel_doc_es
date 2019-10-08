import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PaEstructura extends StatelessWidget {
  final String title;
  PaEstructura(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPaEstructura,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPaEstructura = """
  <div style='font-size: 14.2px'> 
  
    <h1>Estructura de Directorios</h1>
    <ul>
      <li>Introducción</li>
      <li>
        Directorio Raíz 
        <ul>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bootstrap</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor</span></li>
        </ul>
      </li>
      <li>
        Directorio App 
        <ul>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Broadcasting</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Console</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Events</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Exceptions</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Http</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Jobs</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Listeners</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notifications</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Policies</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Providers</span></li>
          <li>Directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Rules</span></li>
        </ul>
      </li>
    </ul>
 
    <h2>Introducción</h2>
    <p>La estructura por defecto de aplicación de Laravel está pensada para proporcionar un buen punto de inicio tanto para grandes y pequeñas aplicaciones. Pero, eres libre de organizar tu aplicación como quieras. Laravel no impone casi ninguna restricción sobre donde una clase es ubicada - siempre y cuando Composer pueda cargar automáticamente la clase.</p>
    <h4>¿Donde está el directorio de modelos?</h4>
    <p>Al comenzar con Laravel, muchos desarrolladores son confundidos por la falta de un directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">models</span>. Sin embargo, la falta de dicho directorio es intencional. Encontramos la palabra "models" ambigua dado que significa muchas cosas diferentes para muchas personas. Algunos desarrolladores se refieren al "modelo" de una aplicación como la totalidad de toda su lógica de negocio, mientras que otros se refieren a los "modelos" como clases que interactuan con una base de datos relacional.</p>
    <p>Por esta razón, elegimos ubicar los modelos de Eloquent por defecto en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> y permitir al desarrollar ubicarlos en algun otro sitio si así lo eligen.</p>
 
    <h2>Directorio Raíz</h2>
 
    <h4>Directorio App</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> contiene el código prinicipal de tu aplicación. Exploraremos este directorio con más detalle pronto; sin embargo, casi todas las clases en tu aplicación estarán en este directorio.</p>
 
    <h4>Directorio Bootstrap</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bootstrap</span> contiene el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app.php</span> que maqueta el framework. Este directorio también almacena un directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> que contiene archivos generados por el framework para optimización de rendimiento como los archivos de cache de rutas y servicios.</p>
 
    <h4>Directorio Config</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span>, como el nombre implica, contiene todos los archivos de configuración de tu aplicación. Es una buena idea leer todos estos archivos y familiarizarte con todas las opciones disponibles para ti.</p>
 
    <h4>Directorio Database</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span> contiene las migraciones de tu base de datos, model factories y seeders. Si lo deseas, puedes también usar este directorio para almacenar una base de datos SQLite.</p>
 
    <h4>Directorio Public</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span> contiene el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">index.php</span>, el cual es el punto de acceso para todas las solicitudes llegan a tu aplicación y configura la autocarga. Este directorio también almacena tus assets, tales como imagenes, JavaScript y CSS.</p>
 
    <h4>Directorio Resources</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources</span> contiene tus vistas así como también tus assets sin compilar tales como LESS, Sass o JavaScript. Este directorio también almacena todos tus archivos de idioma.</p>
 
    <h4>Directorio Routes</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes</span> contiene todas las definiciones de rutas para tu aplicación. Por defecto, algunos archivos de rutas son incluidos con Laravel: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web.php</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api.php</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">console.php</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">channels.php</span>.</p>
    <p>El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web.php</span> contiene rutas que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span> coloca en el grupo de middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>, que proporciona estado de sesión, protección CSRF y encriptación de cookies. Si tu aplicación no ofrece una API sin estado, todas tus rutas probablemente serán definidas en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web.php</span>.</p>
    <p>El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api.php</span> contiene rutas que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">RouteServiceProvider</span> coloca en el grupo de middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api</span>, que proporcionan limitación de velocidad. Estas rutas están pensadadas para no tener estado, así que las solicitudes que llegan a la aplicación a través de estas rutas están pensadas para ser autenticadas mediante tokens y no tendrán acceso al estado de sesión.</p>
    <p>El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">console.php</span> es donde puedes definir todas los comandos basados en Closures de tu aplicación. Cada Closure está enlazado a una instancia de comando permitiendo una forma simple de interactuar con los métodos de entrada y salida de cada comando. Aunque este archivo no define ninguna ruta HTTP, sí define puntos de entrada en consola (rutas) a tu aplicación.</p>
    <p>El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">channels.php</span> es donde puedes registrar todos los canales de transmisión de eventos que tu aplicación soporta.</p>
 
    <h4>Directorio Storage</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage</span> contiene tus plantillas compiladas de Blade, sesiones basadas en archivos, archivos de caches y otros archivos generados por el framework. Este directorio está segregado en los directorios <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">framework</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">logs</span>. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> puede ser usado para almacenar cualquier archivo generado por tu aplicación. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">framework</span> es usado para almacenar archivos generados por el framework y cache. Finalmente, el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">logs</span> contiene los archivos de registros de tu aplicación.</p>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage/app/public</span> puede ser usado para almacenar archivos generados por el usario, tales como imagenes de perfil, que deberían ser accesibles públicamente. Debes crear un enlace simbólico en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/storage</span> que apunte a este directorio. Puedes crear el enlace usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan storage:link</span>.</p>
 
    <h4>El Directorio Tests</h4>
    <p>
      El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tests</span> contiene tus pruebas automatizadas. Una prueba de ejemplo de 
      
        PHPUnit
        <outboundlink></outboundlink>
      
      es proporcionada. Cada clase de prueba debe estar precedida por la palabra <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Test</span>. Puedes ejecutar tus pruebas usando los comandos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">phpunit</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php vendor/bin/phpunit</span>.
    </p>
 
    <h4>Directorio Vendor</h4>
    <p>
      El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor</span> contiene tus dependencias de 
      
        Composer
        <outboundlink></outboundlink>
      
      .
    </p>
 
    <h2>Directorio App</h2>
    <p>
      La mayoría de tu aplicación está almacenada el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span>. Por defecto, este directorio está regido por el nombre de espacio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App</span> y es cargado automáticamente por Composer usando el 
      
        estándar de autocarga PSR-4
        <outboundlink></outboundlink>
      
      .
    </p>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> contiene una variedad de directorios adicionales tales como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Console</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Http</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Providers</span>. Piensa en los directorios <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Console</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Http</span> como si proporcionaran una API al núcleo de tu aplicación, pero no contienen lógica de la aplicación como tal. En otras palabras, son dos formas de emtir comandos a tu aplicación. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Console</span> contiene todos tus comandos de Artisan, mientras que el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Http</span> contiene tus controladores, middleware y solicitudes.</p>
    <p>Una variedad de otros directorios serán generados dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> cuando uses los comandos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> de Artisan para generar clases. Así que, por ejemplo, el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Jobs</span> no existirá hasta que ejecutes el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:job</span> para generar una clase job.</p>
    
    <p class="custom-block-title">TIP</p>
    <p>Muchas de las clases en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> pueden ser generadas por Artisan mediante comandos. Para ver los comandos disponibles, ejecuta el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan list make</span> en tu terminal.</p>
    
  
    <h4>Directorio Broadcasting</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Broadcasting</span> contiene todas las clases de broadcast de tu aplicación. Estas clases son generadas usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:channel</span>. Este directorio no existe por defecto, pero será creado para ti cuando crees tu primer canal. Para aprender más sobre canales, revisa la documentación sobre broadcasting de eventos.</p>
    <h4>El Directorio Console</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Console</span> contiene todos los comandos personalizados de Artisan para tu aplicación. Estos comandos pueden ser generados usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:command</span>. Este directorio también almacena el kernel de tu consola, que es donde tus comandos personalizados de Artisan son registrados y tus tareas programadas son definidas.</p>
    <h4>Directorio Events</h4>
    <p>Este directorio no existe por defecto, pero será creado para ti por los comandos de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:generate</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:event</span>. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Events</span> almacena clases de eventos. Los eventos pueden ser usados para alertar a otras partes de tu aplicación que una acción dada ha ocurrido, proporcionando una gran cantidad de flexibilidad y desacoplamiento.</p>
    <h4>Directorio Exceptions</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Exceptions</span> contiene el manejador de excepciones de tu aplicación y también es un buen lugar para colocar cualquier excepción lanzada por tu aplicación. Si te gustaría personalizar cómo las excepciones son mostradas o renderizadas, debes modificar la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Handler</span> en este directorio.</p>
    <h4>Directorio Http</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Http</span> contiene tus controladores, middleware y form requests. Casi toda la lógica para manejar las solicitudes que llegan a tu aplicación serán colocadas en este directorio.</p>
    <h4>Directorio Jobs</h4>
    <p>Este directorio no existe por defecto, pero será creado para ti si ejecutas el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:job</span>. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Jobs</span> almacena las colas de trabajos para tu aplicación. Los trabajos pueden ser encolados por tu aplicación o ejecutados sincrónicamente dentro del ciclo de vida actual de la solicitud. Los trabajos que son ejecutados sincrónicamente durante la solicitud actual son algunas veces referidos como "comandos" dado que son una implementación del patrón de comandos.</p>
    <h4>Directorio Listeners</h4>
    <p>Este directorio no existe por defecto, pero será creado para ti si ejecutas los comandos de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event:generate</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:listener</span>. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Listeners</span> contiene las clases que manejan tus eventos. Los listeners de eventos reciben una instancia de evento y realizan la lógica en respuesta al evento siendo ejecutado. Por ejemplo, un evento <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">UserRegistered</span> puede ser manejado por un listener <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SendWelcomeEmail</span>.</p>
    <h4>Directorio Mail</h4>
    <p>Este directorio no existe por defecto, pero será creado para ti si ejecutas el comando de artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:mail</span>. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail</span> contiene todas tus clases que representan correos electrónicos enviados por tu aplicación. Los objetos de correo te permiten encapsular toda la lógica para construir un correo en una única y sencilla clase y que puede ser enviado usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail::send</span>.</p>
    <h4>Directorio Notifications</h4>
    <p>Este directorio no existe por defecto, pero será creado para ti si ejecutas el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:notification</span>. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Notifications</span> contiene todas las notificaciones "transaccionales" que son enviadas por tu aplicación, tales como notificaciones sencillas sobre eventos que ocurren dentro de tu aplicación. Las características de notifcaciones de Laravel abstrae el envío de notificaciones sobre una variedad de drivers como email, Slack, SMS o almacenados en la base de datos.</p>
    <h4>Directorio Policies</h4>
    <p>Este directorio no existe por defecto, pero será creado para ti si ejecutas el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:policy</span>. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Policies</span> contiene las clases de las políticas de autorización de tu aplicación. Las políticas son usadas para determinar si un usuario puede realizar una acción dada contra un recurso. Para más información, revisa la documentación sobre autorización.</p>
    <h4>Directorio Providers</h4>
    <p>El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Providers</span> contiene todos los proveedores de servicios para tu aplicación. Los proveedores de servicios maquetan tu aplicación al enlazar servicios en el contenedor de servicios, registrando eventos o realizando cualquier otra tarea para preparar tu aplicación para solicitudes entrantes.</p>
    <p>En una aplicación de Laravel nueva, este directorio ya contendrá algunos proveedores. Eres libre de agregar tus propios proveedores a este directorio según sea necesario.</p>
    <h4>Directorio Rules</h4>
    <p>Este directorio no existe por defecto, pero será creado para ti si ejecutas el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:rule</span>. El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Rules</span> contiene los objetos para las reglas de validación personalizadas de tu aplicación. Las reglas son usadas para encapsular lógica de validación complicada en un simple objeto. Para más información, revisa la documentación sobre validación.</p>
  </div>

""";