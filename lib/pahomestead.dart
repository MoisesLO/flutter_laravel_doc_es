import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PaHomestead extends StatelessWidget {
  final String title;
  PaHomestead(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPaHomestead,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPaHomestead = """
  <div style='font-size: 14.2px;'>
  
    <h1>Laravel Valet</h1>
    <ul>
      <li>
        Introducción 
        <ul>
          <li>Valet o Homestead</li>
        </ul>
      </li>
      <li>
        Instalación 
        <ul>
          <li>Actualización</li>
        </ul>
      </li>
      <li>
        Activar sitios 
        <ul>
          <li>El comando "Park"</li>
          <li>El comando "Link"</li>
          <li>Asegurar sitios con TLS</li>
        </ul>
      </li>
      <li>Compartir sitios</li>
      <li>Variables de entorno específicas del sitio</li>
      <li>
        Drivers de Valet personalizados 
        <ul>
          <li>Drivers locales</li>
        </ul>
      </li>
      <li>Otros comandos de Valet</li>
    </ul>
    <p></p>
    <h2>Introducción</h2>
    <p>Valet es un entorno de desarrollo de Laravel para Mac. No requiere de Vagrant ni de modificar el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/etc/hosts</span>. Incluso permite compartir tus sitios a través de túneles locales. <em>Genial ¿Verdad?</em></p>
    <p>
      Laravel Valet configura tu Mac para que siempre inicie el servicio de 
      
        Nginx
        
      
      en segundo plano al iniciar tu computadora. Después, 
      
        DnsMasq
        
      
      actuará como servidor proxy, procesando todas las peticiones en el dominio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*.test</span> apuntando a los sitios instalados en tu computadora local.
    </p>
    <p>En otras palabras, es un entorno de desarrollo de Laravel sorprendentemente rápido y solamente utiliza cerca de 7MB de RAM. Laravel Valet no está pensado para ser un reemplazo de Vagrant y Homestead, en su lugar presenta una alternativa flexible y rápida, lo cual es una buena opción para quienes tengan una cantidad limitada de RAM.</p>
    <p>Por defecto, Valet brinda soporte para las siguientes tecnologías, pero no está limitado a sólo ellas:</p>
    <ul>
      <li>
        
          Laravel
          
        
      </li>
      <li>
        
          Lumen
          
        
      </li>
      <li>
        
          Bedrock
          
        
      </li>
      <li>
        
          CakePHP 3
          
        
      </li>
      <li>
        
          Concrete5
          
        
      </li>
      <li>
        
          Contao
          
        
      </li>
      <li>
        
          Craft
          
        
      </li>
      <li>
        
          Drupal
          
        
      </li>
      <li>
        
          Jigsaw
          
        
      </li>
      <li>
        
          Joomla
          
        
      </li>
      <li>
        
          Katana
          
        
      </li>
      <li>
        
          Kirby
          
        
      </li>
      <li>
        
          Magento
          
        
      </li>
      <li>
        
          OctoberCMS
          
        
      </li>
      <li>
        
          Sculpin
          
        
      </li>
      <li>
        
          Slim
          
        
      </li>
      <li>
        
          Statamic
          
        
      </li>
      <li>Static HTML</li>
      <li>
        
          Symfony
          
        
      </li>
      <li>
        
          WordPress
          
        
      </li>
      <li>
        
          Zend
          
        
      </li>
    </ul>
    <p>Además, es posible extender Valet con tu propio driver personalizado.</p>
    <p></p>
    <h3>Valet o Homestead</h3>
    <p>
      Como sabrás, Laravel ofrece 
      <router-link to="/homestead.html">Homestead</router-link>
      , otro entorno de desarrollo local de Laravel. Homestead y Valet difieren en cuanto a la audiencia a la que están pensados y su aproximación al desarrollo local. Homestead ofrece toda una máquina virtual de Ubuntu con Nginx instalado y configurado. Homestead es una muy buena elección si deseas tener un entorno de desarrollo virtualizado de Linux o si te encuentras trabajando con Windows / Linux.
    </p>
    <p>
      Por otro lado, Valet solamente es soportado por Mac y requiere que instales PHP y un servidor de base de datos directamente en tu equipo local. Esto puede lograrse fácilmente haciendo uso de 
      
        Homebrew
        
      
      con comandos como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">brew install php</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">brew install mysql</span>. Valet proporciona un entorno de desarrollo local bastante rápido haciendo un uso mínimo de consumo de recursos, lo cual es genial para desarrolladores que solamente requieran de PHP / MySQL y no necesiten de todo un entorno virtualizado de desarrollo.
    </p>
    <p>Tanto Valet como Homestead son buenas elecciones para configurar tu entorno de desarrollo de Laravel. El que sea que vayas a elegir depende completamente de tu gusto personal o las necesidades de tu equipo.</p>
    <p></p>
    <h2>Instalación</h2>
    <p>
      <strong>
        Valet requiere de macOS y 
        
          Homebrew
          
        
        . Antes de comenzar, asegurate de que ningún otro programa como Apache o Nginx esté utilizando el puerto 80 de tu computadora.
      </strong>
    </p>
    <ul>
      <li>
        Instala o actualiza 
        
          Homebrew
          
        
        a su última versión con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">brew update</span>.
      </li>
      <li>Instala PHP 7.3 usando Homebrew con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">brew install homebrew/php/php</span>.</li>
      <li>
        Instala 
        
          Composer
          
        
        .
      </li>
      <li>Instala Valet por medio de Composer con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer global require laravel/valet</span>. Asegúrate de que el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">~/.composer/vendor/bin</span> se encuentre en el "PATH" de tu sistema.</li>
      <li>Ejecuta el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet install</span>. Esto va a configurar e instalar Valet y DnsMasq y va a registrar el daemon de Valet para que se inicie junto con el sistema operativo.</li>
    </ul>
    <p>Una vez que Valet haya sido instalado, trata de hacer ping a cualquier dominio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*.test</span> desde tu terminal usando un comando como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ping foobar.test</span>. Si Valet ha sido instalado correctamente deberás ver una respuesta de ese dominio en la dirección <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">127.0.0.1</span>.</p>
    <p>Valet iniciará automaticamente su daemon cada vez que el sistema inicie. Por lo tanto, si Valet se instaló adecuadamente, no hay necesidad de volver a ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet start</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet install</span>.</p>
    <h4>Utilizar otro dominio</h4>
    <p>Por defecto, Valet actuará como servidor de tus proyectos usando el TLD <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.test</span>. Si lo prefieres, puedes cambiar este dominio por otro de tu elección utilizando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet tld dominio</span>.</p>
    <p>Por ejemplo, si deseas utilizar el dominio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.app</span> en lugar de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.test</span>, ejecuta desde la terminal el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet tld app</span> y Valet ahora funcionará como servidor de tus proyectos pero ahora con el dominio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*.app</span>.</p>
    <h4>Base de datos</h4>
    <p>Si necesitas de una base de datos, puedes instalar MySQL ejecutando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">brew install mysql@5.7</span> desde la terminal. Una vez que haya sido instalado, necesitarás iniciar el servicio de manera manual con el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">brew services start mysql@5.7</span>. Podrás conectarte a tu base de datos en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">127.0.0.1</span> utilizando el usuario <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">root</span> sin ninguna contraseña.</p>
    <h4>Versiones de PHP</h4>
    <p>Valet te permite cambiar entre versiones de PHP usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet use php@version</span>. Valet instalará la versión de PHP especificada mediante Brew si aún no está instalada:</p>
    
      <pre style='background-color: #CFD8DC; color: #37474F;'><code>valet use php@7.2

valet use php
</code></pre>
    
    <p></p>
    <h3>Actualización</h3>
    <p>Puedes actualizar tu instalación de Valet ejecutando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer global update</span> desde la terminal. Después de actualizar, es una buena práctica ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet install</span> para que valet pueda hacer actualizaciones adicionales en sus archivos de configuración en caso de ser necesario.</p>
    <h4>Actualizar a Valet 2.0</h4>
    <p>Valet 2.0 cambió de utilizar el servidor web Caddy a Nginx, por lo que antes de hacer esta actualización deberás ejecutar los siguientes comandos para detener y desinstalar el daemon existente de Caddy.</p>
    
      <pre style='background-color: #CFD8DC; color: #37474F;'><code>valet stop
valet uninstall
</code></pre>
    
    <p>Después, deberás actualizar tu versión de Valet a la más reciente. Dependiendo de cómo se hizo la instalación de Valet, puedes hacerlo por medio de Git o de Composer. Si tu instalación fue por medio de Composer, deberás ejecutar el siguiente comando para actualizar a su versión más reciente.</p>
    
      <pre style='background-color: #CFD8DC; color: #37474F;'><code>composer global require laravel/valet
</code></pre>
    
    <p>Una vez que se haya descargado el código fuente de Valet, deberás ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">install</span>:</p>
    
      <pre style='background-color: #CFD8DC; color: #37474F;'><code>valet install
valet restart
</code></pre>
    
    <p>Después de actualizar, será necesario volver a indicar los directorios de tus sitios con los comandos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">park</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">link</span> según sea el caso.</p>
    <p></p>
    <h2>Activar sitios</h2>
    <p>Una vez que Valet haya sido instalado, estarás listo para activar sitios. Valet proporciona dos comandos para ayudarte a activar sitios de Laravel: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">park</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">link</span>.</p>
    <p> <strong>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">park</span></strong></p>
    <ul>
      <li>Crea un nuevo directorio en tu Mac ejecutando algo como lo siguiente en la terminal <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mkdir ~/Sites</span>. Después, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cd ~/Sites</span> y ejecuta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet park</span>. Este comando va a registrar tu directorio actual como una ruta en la que Valet deberá buscar los sitios.</li>
      <li>Después, crea un nuevo sitio de laravel dentro de este directorio: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel new blog</span>.</li>
      <li>Abre tu navegador y dirígete a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://blog.test</span>.</li>
    </ul>
    <p><strong>Y eso es todo</strong>. Ahora, cada proyecto de Laravel que crees dentro de tu directorio ~/Sites será visible desde el navegador utilizando la convención <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://folder-name.test</span>.</p>
    <p> <strong>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">link</span></strong></p>
    <p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">link</span> también puede ser utilizado para enlazar sitios de Laravel. Este comando es útil si deseas configurar un solo sitio en un directorio y no todos los sitios dentro de él.</p>
    <ul>
      <li>Para utilizar este comando, deberás dirigirte a uno de tus proyectos desde la terminal y ejecutar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet link app-name</span>. Valet creará un enlace simbólico en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">~/.config/valet/Sites</span> el cuál apuntará hacia tu directorio actual.</li>
      <li>Después de ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">link</span>, podrás acceder al sitio desde tu navegador en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">http://app-name.test</span>.</li>
    </ul>
    <p>Para ver un listado de todos los directorios enlazados, ejecuta el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet links</span>. Para destruir algún enlace simbólico deberás utilizar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet unlink app-name</span>.</p>
    
      <p>TIP</p>
      <p>Puedes utilizar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet link</span> para configurar el mismo proyecto para multiples (sub)dominios. Para agregar un subdominio o un dominio diferente para tu proyecto ejecuta <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet link subdomain.app-name</span>.</p>
    
  
  <p> <strong>Asegurar sitios con TLS</strong></p>
  <p>Por defecto, Valet mostrará los sitios a través de HTTP plano. Sin embargo, si deseas que esté encriptado con TLS para ser utilizado con HTTP/2, el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secure</span> está disponible. Por ejemplo, si tu sitio está funcionando con Valet en el dominio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel.test</span>, podrás ejecutar el siguiente comando para asegurarlo:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>valet secure laravel
</code></pre>
  
  <p>Para quitar esta seguridad al sitio y revertir los cambios de nuevo hacia HTTP plano, deberás utilizar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unsecure</span>. Al igual que el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secure</span>, este comando acepta el nombre del host al que se desea quitar la encriptación TLS.</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>valet unsecure laravel
</code></pre>
  
  <p></p>
  <h2>Compartir sitios</h2>
  <p>Valet incluso tiene un comando para compartir tus sitios locales con el mundo, sin necesidad de instalar software adicional. Solo necesitas tener instalado Valet:</p>
  <p>Para compartir un sitio, deberás dirigirte hacia el directorio del sitio desde la terminal y ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet share</span>. Una URL accesible de manera pública será copiada a tu portapapeles y estará lista para que la pegues directamente en tu navegador.</p>
  <p>Para detener la ejecución de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">share</span> en tu sitio, presiona <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Control + C</span> para cancelar el proceso.</p>
  <p></p>
  <h2>Variables de entorno específicas del sitio</h2>
  <p>Algunas aplicaciones que utilizan otros frameworks pueden depender de las variables de entorno del servidor, pero no proporcionan una manera para que esas variables sean configuradas dentro de tu proyecto. Valet te permite configurar variables de entorno específicas del sitio agregando un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.valet-env.php</span> dentro de la raíz de tu proyecto. Estas variables se agregarán al arreglo global <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$_SERVER</span>:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

return [
    'WEBSITE_NAME' =&gt; 'My Blog',
];
</code></pre>
  
  <p></p>
  <h2>Drivers de Valet personalizados</h2>
  <p>Puedes escribir tu propio "driver" de Valet para utilizar aplicaciones de PHP que se estén ejecutando en otro framework o en un CMS que no sea soportado de manera nativa por Valet. Cuando se hace la instalación de Valet, es creado un directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">~/.config/valet/Drivers</span> que contiene un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SampleValetDriver.php</span>. Este archivo contiene la implementación de un driver de muestra para demostrar cómo escribir un driver personalizado. Escribir un driver solo requiere que implementes tres métodos: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">serves</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isStaticFile</span>, y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">frontControllerPath</span>.</p>
  <p>Los tres métodos reciben los valores de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$sitePath</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$siteName</span>, y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$uri</span> como argumentos. La variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$sitePath</span> es la ruta completa del sitio que será configurado en tu equipo, algo como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/Users/Lisa/Sites/my-project</span>. La variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$siteName</span> representa la porción "host" / "site-name" del dominio {<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">my-project</span>}. La variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$uri</span> es la petición URI entrante (<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/foo/bar</span>).</p>
  <p>Una vez que hayas terminado con tu driver de valet personalizado, se deberá colocar en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">~/.config/valet/Drivers</span> usando la convención <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">FrameworkValetDriver.php</span> para nombrarlo. Por ejemplo, si estás escribiendo un driver personalizado de valet para WordPress, tu archivo deberá ser <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">WordPressValetDriver.php</span>.</p>
  <p>Echemos un vistazo a la implementación de ejemplo en cada uno de los metodos del driver personalizado de Valet.</p>
  <h4>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">serves</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">serves</span> deberá retornar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si tu driver debe encargarse de las peticiones entrantes. De otra manera, este método deberá retornar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>. Por lo tanto, dentro de este método deberás intentar determinar si el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$sitePath</span> dado contiene un proyecto del tipo que deseas configurar.</p>
  <p>Por ejemplo, vamos a pretender que estamos escribiendo un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">WordPressValetDriver</span>. Nuestro método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">serves</span> podría verse mas o menos como esto:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Determine if the driver serves the request.
*
* @param  string  \$sitePath
* @param  string  \$siteName
* @param  string  \$uri
* @return bool
*/
public function serves(\$sitePath, \$siteName, \$uri)
{
    return is_dir(\$sitePath.'/wp-admin');
}
</code></pre>
  
  <h4>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isStaticFile</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isStaticFile</span> deberá determinar si la petición entrante para un archivo es estático, como puede ser una imagen o una hoja de estilo. Si el archivo es estático, el método deberá retornar la ruta absoluta del archivo en disco. Si la petición entrante no es para un archivo estático, el metodo deberá retornar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Determine if the incoming request is for a static file.
*
* @param  string  \$sitePath
* @param  string  \$siteName
* @param  string  \$uri
* @return string|false
*/
public function isStaticFile(\$sitePath, \$siteName, \$uri)
{
    if (file_exists(\$staticFilePath = \$sitePath.'/public/'.\$uri)) {
        return \$staticFilePath;
    }

    return false;
}
</code></pre>
  
  
    <p>Nota</p>
    <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isStaticFile</span> solo será llamado si el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">serves</span> retorna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> para las peticiones entrantes y la URI es diferente a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/</span>.</p>
  
  <h4>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">frontControllerPath</span></h4>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">frontControllerPath</span> deberá retornar la ruta absoluta del "front controller" de tu aplicación, que usualmente es el archivo "index.php" o su equivalente:</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the fully resolved path to the application's front controller.
*
* @param  string  \$sitePath
* @param  string  \$siteName
* @param  string  \$uri
* @return string
*/
public function frontControllerPath(\$sitePath, \$siteName, \$uri)
{
    return \$sitePath.'/public/index.php';
}
</code></pre>
  
  <p></p>
  <h3>Drivers locales</h3>
  <p>Si deseas definir un driver de Valet personalizado para una aplicación sencilla, deberás crear un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LocalValetDriver.php</span> en el directorio raíz de tu aplicación. El driver personalizado deberá extender de la clase base <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ValetDriver</span> o extender del driver de alguna aplicación existente, como puede ser <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">LaravelValetDriver</span>.</p>
  
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>class LocalValetDriver extends LaravelValetDriver
{
    /**
    * Determine if the driver serves the request.
    *
    * @param  string  \$sitePath
    * @param  string  \$siteName
    * @param  string  \$uri
    * @return bool
    */
    public function serves(\$sitePath, \$siteName, \$uri)
    {
        return true;
    }

    /**
    * Get the fully resolved path to the application's front controller.
    *
    * @param  string  \$sitePath
    * @param  string  \$siteName
    * @param  string  \$uri
    * @return string
    */
    public function frontControllerPath(\$sitePath, \$siteName, \$uri)
    {
        return \$sitePath.'/public_html/index.php';
    }
}
</code></pre>
  
  <p></p>
  <h2>Otros comandos de Valet</h2>
  <table>
    <thead>
      <tr>
        <th>Comando</th>
        <th>Descripción</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet forget</span></td>
        <td>Ejecuta este comando desde el directorio donde ejecutaste el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">park</span> para eliminarlo de la lista de directorios configurados.</td>
      </tr>
      <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet log</span></td>
        <td>Ver una lista de logs escritos por servicios de Valet.</td>
      </tr>
      <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet paths</span></td>
        <td>Ver una lista de directorios configurados.</td>
      </tr>
      <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet restart</span></td>
        <td>Reiniciar el daemon de Valet.</td>
      </tr>
      <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet start</span></td>
        <td>Iniciar el daemon de Valet.</td>
      </tr>
      <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet stop</span></td>
        <td>Detener el daemon de Valet.</td>
      </tr>
      <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">valet uninstall</span></td>
        <td>Desinstalar el daemon de Valet.</td>
      </tr>
    </tbody>
  </table>
</div>
""";