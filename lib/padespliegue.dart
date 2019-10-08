import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PaDespliegue extends StatelessWidget {
  final String title;
  PaDespliegue(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPaDespliegue,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPaDespliegue = """

  
    <h1>Despliegue</h1>
    <ul>
      <li>Introducción</li>
      <li>
        Configuración del servidor 
        <ul>
          <li>Nginx</li>
        </ul>
      </li>
      <li>
        Optimización 
        <ul>
          <li>Optimizar autoloader</li>
          <li>Optimizar configuración local</li>
          <li>Optimizar carga de rutas</li>
        </ul>
      </li>
      <li>Deploy en forge</li>
    </ul>
    <p></p>
    <h2>Introducción</h2>
    <p>Una vez que estés listo para hacer deploy de tu aplicación de Laravel a producción, deberías considerar algunos aspectos importantes para hacer que tu aplicación se ejecute de la forma más eficientemente posible. En este documento, vamos a cubrir muy buenos puntos para hacer que tu aplicación de Laravel sea desplegada correctamente.</p>
    <p></p>
    <h2>Configuración del servidor</h2>
    <p></p>
    <h3>Nginx</h3>
    <p>
      Si estás haciendo deploy de tu aplicación hacia un servidor que está ejecutando Nginx, puedes utilizar el siguiente archivo de configuración como punto de inicio para configurar tu servidor web. Principalmente, este archivo tendrá que ser personalizado dependiendo de la configuración de tu servidor. Si deseas asistencia en la administración de tu servidor, considera utilizar un servicio como 
      
        Laravel Forge
        
      
      :
    </p>
    
      <pre style='background-color: #CFD8DC; color: #37474F;'><code>server {
    listen 80;
    server_name example.com;
    root /example.com/public;

    add_header X-Frame-Options "SAMEORIGIN";
    add_header X-XSS-Protection "1; mode=block";
    add_header X-Content-Type-Options "nosniff";

    index index.html index.htm index.php;

    charset utf-8;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    error_page 404 /index.php;

    location ~ \.php\$ {
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$realpath_root\$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.(?!well-known).* {
        deny all;
    }
}
</code></pre>
    
    <p></p>
    <h2>Optimización</h2>
    <p></p>
    <h3>Optimizar autoloader</h3>
    <p>Al hacer deploy a producción, debes asegurarte de optimizar el autoloader de Composer, para que éste pueda localizar rápidamente el archivo apropiado para cargar una clase dada:</p>
    
      <pre style='background-color: #CFD8DC; color: #37474F;'><code>composer install --optimize-autoloader --no-dev
</code></pre>
    
    
      <p>TIP</p>
      <p>Adicionalmente, para optimizar el autoloader, deberás asegurarte de incluir siempre el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.lock</span> al controlador de versiones de tu proyecto. Las dependencias de tu proyecto se instalarán más rápido cuando exista el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.lock</span>.</p>
    
  
  <p></p>
  <h3>Optimizar configuración local</h3>
  <p>Al hacer deploy de tu aplicación a producción, deberás asegurarte de ejecutar el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config:cache</span> durante el proceso de deploy:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan config:cache
</code></pre>
  
  <p>Este comando combinará todos los archivos de configuración de Laravel en un solo archivo en caché, lo que reduce en gran medida la cantidad de consultas que el framework debe hacer al sistema de archivos cuando carga tus valores de configuración.</p>
  
    <p>Nota</p>
    <p>Si ejecutas el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config:cache</span> durante el proceso de despliegue, debes asegurarte de que sólo estás llamando a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span> desde dentro de tus archivos de configuración. Una vez que la configuración ha sido agregada, el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> no será cargado y todas las llamadas a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span> retornarán <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>.</p>
  
  <p></p>
  <h3>Optimizar carga de rutas</h3>
  <p>Si estás construyendo una aplicación muy grande que contenga muchas rutas, deberías asegurarte de ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route:cache</span> de Artisan durante el proceso de deploy.</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan route:cache
</code></pre>
  
  <p>Este comando reduce todas tus rutas registradas en una única llamada al método dentro del archivo en cache, mejorando el rendimiento de registro de rutas cuando se tienen cientos de ellas.</p>
  
    <p>Nota</p>
    <p>Ya que esta característica utiliza la serialización de PHP, sólo se pueden almacenar en cache las rutas para las aplicaciones que estén basadas exclusivamente en controladores. PHP no es capaz de serealizar Closures.</p>
  
  <p></p>
  <h2>Deploy en forge</h2>
  <p>
    Si no estás del todo listo para administrar la configuración de tu servidor o si no te sientes cómodo configurando los diferentes servicios necesarios para ejecutar aplicaciones robustas de Laravel, 
    
      Laravel Forge
    es una excelente alternativa.
  </p>
  <p>Laravel Forge puede crear servidores en varios proveedores de infraestructura como pueden ser DigitalOcean, Linode, AWS y más. Adicionalmente, Forge instala y administra todas las herramientas necesarias para construir aplicaciones robustas de Laravel como Nginx, MySQL, Redis, Memcached, Beanstalk y más.</p>

""";