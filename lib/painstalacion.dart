import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class Instalacion extends StatelessWidget {
  final String title;
  Instalacion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: toolbar,
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmInstalacion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

Row toolbar = Row(
    children: <Widget>[
      Expanded(child: Text('Instalacion')),
      Icon(Icons.menu),
    ]
);


const HtmInstalacion = """
<div style='font-size: 14.3px;'>  
    <h1> Instalación</h1>
    <ul>
      <li>
        Instalación 
        <ul>
          <li>Requisitos del servidor</li>
          <li>Instalar Laravel</li>
          <li>Configuración</li>
        </ul>
      </li>
      <li>
        Configuración del servidor web 
        <ul>
          <li>URLs amigables</li>
        </ul>
      </li>
    </ul>
    <p></p>
    <h2>Instalación</h2>  
    <h3>Requisitos del servidor</h3>
    <p>El framework Laravel tiene algunos requisitos del sistema. Todos estos requisitos son cubiertos por la máquina virtual Laravel Homestead, así que es altamente recomendable que uses Homestead como tu entorno local de desarrollo de Laravel.</p>
    <p>Sin embargo, si no estás utilizando Homestead, deberás asegurarte de que tu servidor cumpla con los siguientes requisitos:</p>
    <ul>
      <li>PHP &gt;= 7.1.3</li>
      <li>BCMath PHP Extension</li>
      <li>Ctype PHP Extension</li>
      <li>JSON PHP Extension</li>
      <li>Mbstring PHP Extension</li>
      <li>Extensión OpenSSL de PHP</li>
      <li>Extensión PDO de PHP</li>
      <li>Extensión Tokenizer de PHP</li>
      <li>Extensión XML de PHP</li>
    </ul>  
    <h3>Instalar Laravel</h3>
    <p>
      Laravel utiliza Composer para administrar sus dependencias. Por lo que, antes de utilizar Laravel, deberás asegurarte de tener Composer instalado en tu sistema.
    </p>
  
    <p >TIP</p>
    <p>
      En la lección instalación de Composer y Laravel del curso gratuito Laravel desde cero
              
      de Styde puedes ver el proceso de instalación paso a paso.
    </p>
  
    <h4> Mediante el instalador de Laravel</h4>
    <p>Primero, descarga el instalador de Laravel usando Composer:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>composer global require laravel/installer</pre style='background-color: #CFD8DC; color: #37474F;'></code>
  
    <p>Asegurate de colocar el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor/bin</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$PATH</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> para que el ejecutable de Laravel pueda ser localizado en tu sistema. Este directorio existe en diferentes ubicaciones según el sistema operativo que estés utilizando; sin embargo, algunas de las ubicaciones más comunes son las siguientes:</p>
    <ul>
      <li>macOS: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$HOME/.composer/vendor/bin</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"></li>
      <li>GNU / Distribuciones Linux: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$HOME/.config/composer/vendor/bin</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"></li>
      <li>Windows: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">%USERPROFILE%\AppData\Roaming\Composer\vendor\bin</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"></li>
    </ul>
    <p>Una vez instalado, el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel new</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> creará una nueva instalación de Laravel en el directorio que especifiques. Por ejemplo, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel new blog</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> creará un directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">blog</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> que contendrá una nueva instalación de Laravel con todas las dependiencias de Laravel ya instaladas:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>laravel new blog</pre style='background-color: #CFD8DC; color: #37474F;'></code>
  
  <h4> Mediante composer create-project</h4>
  <p>Alternativamente, también puedes instalar Laravel ejecutando el comando de Composer <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create-project</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> en tu terminal:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>composer create-project --pre style='background-color: #CFD8DC; color: #37474F;'fer-dist laravel/laravel blog
</pre style='background-color: #CFD8DC; color: #37474F;'></code>
  
  <h4> Servidor de desarrollo local</h4>
  <p>Si tienes instalado PHP de manera local y te gustaría utilizar el servidor de desarrollo incorporado en PHP para servir tu aplicación, puedes usar el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">serve</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">. Este comando iniciará un servidor de desarrollo en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://localhost:8000</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan serve    
</pre style='background-color: #CFD8DC; color: #37474F;'></code>
  
  <p>Otras opciones de desarrollo local más robustas están disponibles mediante Homestead y Valet.</p>
  <p></p>
  <h3>Configuración</h3>
  <h4> Directorio público</h4>
  <p>Después de haber instalado Laravel, deberás configurar el documento raíz de tu servidor web para que sea el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">. El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">index.php</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> en este directorio funciona como controlador frontal (front controller) para todas las peticiones HTTP que entran a tu aplicación.</p>
  <h4> Archivos de configuración</h4>
  <p>Todos los archivos de configuración para el framework Laravel están almacenados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">. Cada opción está documentada, así que siéntete libre de revisar estos archivos y familiarizarte con las opciones disponibles para ti.</p>
  <h4> Permisos para directorios</h4>
  <p>Después de haber instalado Laravel, necesitarás congigurar algunos permisos. Los directorios dentro de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bootstrap/cache</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> deberán tener permiso de escritura para tu servidor web o Laravel no va a funcionar. Si estás utilizando la máquina virtual Homestead, estos permisos ya están establecidos.</p>
  <h4> Clave de la aplicación</h4>
  <p>Lo siguiente que debes hacer después de instalar Laravel es establecer la clave de tu aplicación a una cadena aleatoria. Si instalastes Laravel mediante Composer o el instalador de Laravel, esta clave ya ha sido establecida por el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan key:generate</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.</p>
  <p>Típicamente, esta cadena debe tener una longitud de 32 caracteres. La clave puede ser establecida en el archivo de entorno <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">. Si no has renombrado el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env.example</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">, deberás hacerlo ahora. <strong>Si la clave de la aplicación no está establecida, ¡las sesiones de usuario y otros datos encriptados no serán seguros!</strong></p>
  <h4> Configuración adicional</h4>
  <p>Laravel casi no necesita de configuración adicional. ¡Eres libre de empezar a desarrollar! Sin embargo, puede que quieras revisar el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> y su documentación. Contiene varias opciones como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">timezone</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locale</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> que es posible que desees ajustar en tu aplicación.</p>
  <p>También puede que quieras configurar algunos componentes adicionales de Laravel, como:</p>
  <ul>
    <li>Cache</li>
    <li>Base de Datos</li>
    <li>Sesiones</li>
  </ul>
  <p></p>
  <h2>Configuración del servidor web</h2>
  <p></p>
  <h3>URLs amigables</h3>
  <h4>Apache</h4>
  <p>Laravel incluye un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/.htaccess</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> que es utilizado para proporcionar URLs sin el controlador frontal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">index.php</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> en la ruta. Antes de servir tu aplicación de Laravel con Apache, asegúrate de habilitar el módulo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mod_rewrite</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> para que tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.htaccess</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> funcione correctamente.</p>
  <p>Si el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.htaccess</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"> que viene con Laravel no funciona con tu instalación de Apache, prueba esta alternativa:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>Options +FollowSymLinks -Indexes
RewriteEngine On

RewriteCond %{HTTP:Authorization} .
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^ index.php [L]</pre style='background-color: #CFD8DC; color: #37474F;'></code>
  
  <h4> Nginx</h4>
  <p>Si estás utilizando Nginx, la siguiente directiva en la configuación de tu sitio va a dirigir todas las peticiones al controlador frontal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">index.php</span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>location / {
    try_files \$uri \$uri/ /index.php?\$query_string;
}
</pre style='background-color: #CFD8DC; color: #37474F;'></code>
  
  <p>Cuando uses Homestead o Valet, las URLs amigables serán configuradas automáticamente.</p>

</div>
  
""";