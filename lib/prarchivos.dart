import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrArchivos extends StatelessWidget {
  final String title;
  PrArchivos(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrArchivos,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrArchivos = """
<div style='font-size: 14.2px;'>
<h1>Almacenamiento De Archivos</h1>
<ul>
    <li>Introducción</li>
    <li>
        Configuración
        <ul>
            <li>Disco público</li>
            <li>Driver local</li>
            <li>Prerrequisitos del driver</li>
            <li>Cache</li>
        </ul>
    </li>
    <li>Obteniendo instancias del disco</li>
    <li>
        Retornando archivos
        <ul>
            <li>Descargando archivos</li>
            <li>URLs de archivos</li>
            <li>Metadatos de archivos</li>
        </ul>
    </li>
    <li>
        Almacenando archivos
        <ul>
            <li>Carga de archivos</li>
            <li>Visibilidad de archivos</li>
        </ul>
    </li>
    <li>Eliminando archivos</li>
    <li>Directorios</li>
    <li>Sitemas de archivos personalizados</li>
</ul>

<h2>Introducción</h2>
<p>
    Laravel proporciona una podera abstracción del sistema de archivos gracias al genial paquete de
    PHP

    Flysystem


    de Frank de Jonge. La integración de Flysystem de Laravel proporciona drivers simples de usar
    para trabajar con sistemas de archivos locales, Amazon S3 y Rackspace Cloud Storage.
</p>

<h2>Configuración</h2>
<p>La configuración del sistema de archivos está ubicada en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/filesystems.php</span>.
    Dentro de este archivo puedes configurar todos tus "discos". Cada disco representa un driver de
    almacenamiento y una ubicación de almacenamiento en particular. Configuraciones de ejemplo para
    cada driver soportado están incluídas en el archivo de configuración. Así que, modifica la
    configuración para reflejar tus preferencias de almacenamiento y credenciales.</p>
<p>Puedes configurar tantos discos como quieras e incluso tener múltiples discos que usen el mismo
    driver.</p>

<h3># El disco público</h3>
<p>
    El disco <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span> está pensado para archivos que serán publicamente accesibles. Por
    defecto, el disco <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span> usa el driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span> y almacena estos archivos
    en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage/app/public</span>. Para hacerlos accesibles desde la web, debes crear un enlace
    simbólico desde <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/storage</span> a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage/app/public</span>. Esta convención
    mantendrá tus archivos publicamente accesibles en un directorio que puede ser fácilmente
    compartido a través de despliegues al usar sistemas de despligue sin tiempo de inactividad como

    Envoyer


    .
</p>
<p>Para crear un enlace simbólico, puedes usar el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage:link</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan storage:link
</code></pre>

<p>Una vez que un archivo ha sido guardado y el enlace simbólico ha sido creado, puedes crear una
    URL a los archivos usando el helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">asset</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo asset('storage/file.txt');
</code></pre>


<h3># Driver local</h3>
<p>Al usar el driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>, todas las operaciones sobre archivos son relativas al
    directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">root</span> definido en tu archivo de configuración. Por defecto, este valor
    está establecido al directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage/app</span>. Por lo tanto, el siguiente método
    almacenará un archivo en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage/app/file.txt</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Storage::disk('local')-&gt;put('file.txt', 'Contents');
</code></pre>


<h3># Prerrequisitos del driver</h3>
<h4># Paquetes de Composer</h4>
<p>Antes de usar los drivers de SFTP, S3 o Rackspace, necesitarás instalar el paquete apropiado
    mediante Composer:</p>
<ul>
    <li>SFTP: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">league/flysystem-sftp ~1.0</span></li>
    <li>Amazon S3: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">league/flysystem-aws-s3-v3 ~1.0</span></li>
    <li>Rackspace: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">league/flysystem-rackspace ~1.0</span></li>
</ul>
<p>Algo sumamente recomendable para mejorar el rendimiento es usar un adaptador de caché.
    Necesitarás un paquete adicional para esto:</p>
<ul>
    <li>CachedAdapter: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">league/flysystem-cached-adapter ~1.0</span></li>
</ul>
<h4># Configuración del driver S3</h4>
<p>La información de configuración del driver de S3 está ubicada en tu archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/filesystems.php</span>. Este archivo contiene un arreglo de configuración de
    ejemplo para un driver de S3. Eres libre de modificar este arreglo con tu propia configuración y
    credenciales de S3. Por conveniencia, estas variables de entorno coinciden con la convención de
    nombres usada por AWS CLI.</p>
<h4># Configuración del driver FTP</h4>
<p>Las integraciones de Flysystem de Laravel funcionan bien con FTP; sin embargo, una configuración
    de ejemplo no está incluida con el archivo de configuración por defecto del framework <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filesystems.php</span>.
    Si necesitas configurar un sistema de archivos FTP, puedes usar la siguiente configuración de
    ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'ftp' =&gt; [
    'driver'   =&gt; 'ftp',
    'host'     =&gt; 'ftp.example.com',
    'username' =&gt; 'your-username',
    'password' =&gt; 'your-password',

    // Optional FTP Settings...
    // 'port'     =&gt; 21,
    // 'root'     =&gt; '',
    // 'passive'  =&gt; true,
    // 'ssl'      =&gt; true,
    // 'timeout'  =&gt; 30,
],
</code></pre>

<h4># Configuración del driver SFTP</h4>
<p>Las integraciones de Flysystem de Laravel funcionan bien con SFTP; sin embargo, una configuración
    de ejemplo no está incluída con el archivo de configuración por defecto del framework <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filesystems.php</span>.
    Si necesitas configurar un sistema de archivos SFTP, puedes usar la siguiente configuración de
    ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'sftp' =&gt; [
    'driver' =&gt; 'sftp',
    'host' =&gt; 'example.com',
    'username' =&gt; 'your-username',
    'password' =&gt; 'your-password',

    // Settings for SSH key based authentication...
    // 'privateKey' =&gt; '/path/to/privateKey',
    // 'password' =&gt; 'encryption-password',

    // Optional SFTP Settings...
    // 'port' =&gt; 22,
    // 'root' =&gt; '',
    // 'timeout' =&gt; 30,
],
</code></pre>

<h4># Configuración del driver Rackspace</h4>
<p>Las integraciones de Flysystem de Laravel funcionan bien con Rackspace; sin embargo, una
    configuración de ejemplo no está incluida con el archivo de configuración por defecto del
    framework <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filesystems.php</span>. Si necesitas configurar un sistema de archivos de
    Rackspace, puedes usar la siguiente configuración de ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'rackspace' =&gt; [
    'driver'    =&gt; 'rackspace',
    'username'  =&gt; 'your-username',
    'key'       =&gt; 'your-key',
    'container' =&gt; 'your-container',
    'endpoint'  =&gt; 'https://identity.api.rackspacecloud.com/v2.0/',
    'region'    =&gt; 'IAD',
    'url_type'  =&gt; 'publicURL',
],
</code></pre>


<h3># Cache</h3>
<p>Para habilitar la cache para un disco dado, puedes agregar una directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> a las
    opciones de configuración del disco. La opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> debe ser un arreglo de
    opciones de cache que contiene un nombre de disco <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">disk</span>, el tiempo de expiración en
    segundos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">expire</span>, y el prefijo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">prefix</span> de la cache:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'s3' =&gt; [
    'driver' =&gt; 's3',

    // Other Disk Options...

    'cache' =&gt; [
        'store' =&gt; 'memcached',
        'expire' =&gt; 600,
        'prefix' =&gt; 'cache-prefix',
    ],
],
</code></pre>


<h2>Obteniendo instancias del disco</h2>
<p>El facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span> puede ser usado para interactuar con cualquier de tus discos
    configurados. Por ejemplo, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span> en el facade para almacenar un
    avatar en el disco por defecto. Si llamas a métodos en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span> sin
    primero llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">disk</span>, la llamada al método será automáticamente pasada al
    disco por defecto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;

Storage::put('avatars/1', \$fileContents);
</code></pre>

<p>Si tus aplicaciones interactuan con múltiples discos, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">disk</span> en
    el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span> para trabajar con archivos en un disco en particular:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Storage::disk('s3')-&gt;put('avatars/1', \$fileContents);
</code></pre>


<h2>Retornando archivos</h2>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> puede ser usado para retornar el contenido de un archivo. Las cadenas
    del archivo serán retornadas por el método. Recuerda, todas las rutas del archivo deben ser
    especificadas relativas a la ubicación "raíz" configurada por el disco:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$contents = Storage::get('file.jpg');
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exists</span> puede ser usado para determinar si un archivo existe en el disco:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$exists = Storage::disk('s3')-&gt;exists('file.jpg');
</code></pre>


<h3># Descargando archivos</h3>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">download</span> puede ser usado para generar una respuesta que obliga al
    navegador del usuario a descargar el archivo al directorio dado. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">download</span>
    acepta un nombre de archivo como segundo argumento del método, que determinará el nombre del
    archivo que es visto por el usuario descargando el archivo. Finalmente, puedes pasar un arreglo
    de encabezados HTTP como tercer argumento al método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return Storage::download('file.jpg');

return Storage::download('file.jpg', \$name, \$headers);
</code></pre>


<h3># URLs de archivos</h3>
<p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> para obtener la URL del archivo dado. Si estás usando el
    driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>, esto típicamente agregará <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/storage</span> a la ruta dada y
    retornará una URL relativa al archivo. Si estás usando el driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">s3</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rackspace</span>,
    será retornada la URL remota completamente habilitada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;

\$url = Storage::url('file.jpg');
</code></pre>


<p>Nota</p>
<p>Recuerda, si estás usando el driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>, todos los archivos que deberían ser
    públicamente accesibles deben ser colocados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage/app/public</span>.
    Además, debes crear un enlace simbólico a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/storage</span> que apunte al directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage/app/public</span>.</p>


<h4># URLs temporales</h4>
<p>Para archivos almacenados usando los drivers <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">s3</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rackspace</span>, puedes
    crear una URL temporal a un archivo dado usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">temporaryUrl</span>. Este método
    acepta una ruta y una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DateTime</span> que especifica cuando la URL debería
    expirar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = Storage::temporaryUrl(
    'file.jpg', now()-&gt;addMinutes(5)
);
</code></pre>

<p>
    Si necesitas especificar

    parametros de petición de S3


    adicionales, puedes pasar el arreglo de parametros de petición como tercer argumento del método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">temporaryUrl</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = Storage::temporaryUrl(
    'file.jpg',
    now()-&gt;addMinutes(5),
    ['ResponseContentType' =&gt; 'application/octet-stream'],
);
</code></pre>

<h4># Personalización del host de URL local</h4>
<p>Si te gustaría predefinir el host para archivos almacenados en un disco usando el driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">local</span>,
    puedes agregar una opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> al arreglo de configuración del disco:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'public' =&gt; [
    'driver' =&gt; 'local',
    'root' =&gt; storage_path('app/public'),
    'url' =&gt; env('APP_URL').'/storage',
    'visibility' =&gt; 'public',
],
</code></pre>


<h3># Metadatos de archivos</h3>
<p>Además de leer y agregar archivos, Laravel también puede proporcionar información sobre los
    archivos. Por ejemplo, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">size</span> puede ser usado para obtener el tamaño del
    archivo en bytes:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;

\$size = Storage::size('file.jpg');
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">lastModified</span> retorna la marca de tiempo de UNIX de la última vez en que el
    archivo fue modificado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$time = Storage::lastModified('file.jpg');
</code></pre>


<h2>Almacenando archivos</h2>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span> puede ser usado para almacenar el contenido de archivos en un disco.
    Puedes también pasar un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">recurso</span> de PHP al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span>, que usará el
    soporte subyancete de stream de Flysystem. Usar streams es altamente recomendable al lidiar con
    archivos grandes:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;

Storage::put('file.jpg', \$contents);

Storage::put('file.jpg', \$resource);
</code></pre>

<h4># Streaming automático</h4>
<p>Si te gustaría que Laravel automáticamente haga streaming de un archivo dado a tu ubicación de
    almacenamiento, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFile</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFileAs</span>. Este
    método acepta una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\File</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Http\UploadedFile</span>
    y automáticamente hará stream del archivo a la ubicación deseada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Http\File;
use Illuminate\Support\Facades\Storage;

// Automatically generate a unique ID for file name...
Storage::putFile('photos', new File('/path/to/photo'));

// Manually specify a file name...
Storage::putFileAs('photos', new File('/path/to/photo'), 'photo.jpg');
</code></pre>

<p>Hay algunas cosas importantes a tener en cuenta sobre el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFile</span>. Observa que
    sólo especificamos un nombre de directorio, no un nombre de archivo. Por defecto, el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFile</span> generará un ID único que servirá como nombre del archivo. La extensión del
    archivo será determinada examinando el tipo MIME del archivo. La ruta al archivo será retornada
    por el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFile</span> para que puedes almacenar la ruta, incluyendo el nombre de
    archivo generado, en tu base de datos.</p>
<p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFile</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFileAs</span> también aceptan un argumento para
    especificar la "visibilidad" del archivo almacenado. Esto es particularmente útil si estás
    almacenando el archivo en disco en la nube como S3 y te gustaría que el archivo sea públicamente
    accesible:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Storage::putFile('photos', new File('/path/to/photo'), 'public');
</code></pre>

<h4># Añadir al inicio o al final de un archivo</h4>
<p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">prepend</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">append</span> te permiten escribir al inicio o final de
    un archivo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Storage::prepend('file.log', 'Prepended Text');

Storage::append('file.log', 'Appended Text');
</code></pre>

<h4># Copiando y moviendo archivos</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">copy</span> puede ser usado para copiar un archivo existente a una nueva
    ubicación en el disco, mientras que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">move</span> puede ser usado para renombrar o
    mover un archivo existente a una nueva ubicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Storage::copy('old/file.jpg', 'new/file.jpg');

Storage::move('old/file.jpg', 'new/file.jpg');
</code></pre>


<h3># Carga de archivos</h3>
<p>En las aplicaciones web, una de los casos de uso más comunes para almacenar archivos es almacenar
    archivos cargados por los usuarios como imagenes de perfil, fotos y documentos. Laravel hace que
    sea muy fácil almacenar archivos cargados usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span> en la instancia de
    un archivo cargado. Llama al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span> con la ruta en la quieres almacenar el
    archivo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class UserAvatarController extends Controller
{
    /**
    * Update the avatar for the user.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function update(Request \$request)
    {
        \$path = \$request-&gt;file('avatar')-&gt;store('avatars');

        return \$path;
    }
}
</code></pre>

<p>Hay algunas cosas importantes a tener en cuenta sobre este ejemplo. Observa que sólo
    especificamos un nombre de directorio, no un nombre de archivo. Por defecto, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span>
    generará un ID único que servirá como nombre de archivo. La extensión del archivo será
    determinada examinando el tipo MIME del archivo. La ruta al archivo será retornada por el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span> para que puedas guardar la ruta, inculyendo el nombre generado, en tu base de
    datos.</p>
<p>También puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFile</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span> para
    realizar la misma manipulación de archivo del ejemplo superior:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = Storage::putFile('avatars', \$request-&gt;file('avatar'));
</code></pre>

<h4># Especificando un nombre de archivo</h4>
<p>Si no te gustaría que un nombre de archivo sea automáticamente asignado a tu archivo almacenado,
    puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storeAs</span>, que recibe una ruta, el nombre del archivo y el
    disco (opcional) y sus argumentos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = \$request-&gt;file('avatar')-&gt;storeAs(
    'avatars', \$request-&gt;user()-&gt;id
);
</code></pre>

<p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">putFileAs</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span>, que realizará las
    mismas manipulaciones de archivos del ejemplo de arriba:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = Storage::putFileAs(
    'avatars', \$request-&gt;file('avatar'), \$request-&gt;user()-&gt;id
);
</code></pre>

<h4># Especificando un disco</h4>
<p>Por defecto, este método usará tu disco predeterminado. Si te gustaría especificar otro disco,
    pasa el nombre del disco como segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">store</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = \$request-&gt;file('avatar')-&gt;store(
    'avatars/'.\$request-&gt;user()-&gt;id, 's3'
);
</code></pre>


<h3># Visibilidad de archivos</h3>
<p>En la integración de Flysystem de Laravel, "visibilidad" es una abstracción de permisos de
    archivos a través de múltiples plataformas. Los archivos pueden ser declarados tanto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span>
    o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">private</span>. Cuando un archivo es declarado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span>, estás indicando que
    el archivo debería ser generalmente accesible por otros. Por ejemplo, al usar el driver de S3,
    puedes retornar URLs para archivos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span>.</p>
<p>Puedes establecer la visibilidad al establecer el archivo mediante el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;

Storage::put('file.jpg', \$contents, 'public');
</code></pre>

<p>Si el archivo ya ha sido almacenado, su visibilidad puede ser retornada y establecida mediante
    los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getVisibility</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">setVisibility</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$visibility = Storage::getVisibility('file.jpg');

Storage::setVisibility('file.jpg', 'public')
</code></pre>


<h2>Eliminando archivos</h2>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> acepta un solo nombre de archivo o un arreglo de archivos a
    eliminar del disco:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;

Storage::delete('file.jpg');

Storage::delete(['file.jpg', 'file2.jpg']);
</code></pre>

<p>Si es necesario, puedes especificar el disco en el que se debe eliminar el archivo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;

Storage::disk('s3')-&gt;delete('folder_path/file_name.jpg');
</code></pre>


<h2>Directorios</h2>
<h4># Obtener todos los archivos dentro de un directorio</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">files</span> retorna un arreglo de todos los archivos en un directorio dado. Si
    te gustaría retornar una lista de todos los archivos dentro de un directorio dado incluyendo
    subdirectorios, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">allFiles</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Storage;

\$files = Storage::files(\$directory);

\$files = Storage::allFiles(\$directory);
</code></pre>

<h4># Obtener todos los directorios dentro de un directorio</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">directories</span> retorna un arreglo de todos los directorios dentro de un
    directorio dado. Adicionalmente, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">allDirectories</span> para obtener
    una lista de todos los directorios dentro de un directorio dado y todos sus subdirectorios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$directories = Storage::directories(\$directory);

// Recursive...
\$directories = Storage::allDirectories(\$directory);
</code></pre>

<h4># Crear un directorio</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">makeDirectory</span> creará el directorio dado, incluyendo cualquier
    subdirectorio necesario:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Storage::makeDirectory(\$directory);
</code></pre>

<h4># Eliminar un directorio</h4>
<p>Finalmente, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleteDirectory</span> puede ser usado para eliminar un directorio y
    todos sus archivos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Storage::deleteDirectory(\$directory);
</code></pre>


<h2>Sistemas de archivos personalizados</h2>
<p>La integración de Flysystem de Laravel proporciona drivers para múltiples "drivers"; sin embargo,
    Flysystem no está limitado a estos y tiene adaptadores para muchos otros sistemas de
    almacenamiento. Puedes crear un driver personalizado si quieres usar alguno de los adaptadores
    adicionales en tu aplicación de Laravel.</p>
<p>Para configurar el sistema de archivos personalizado necesitarás un adaptador de Flysystem. Vamos
    a agregar un adaptador de Dropbox mantenido por la comunidad a nuestro proyecto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require spatie/flysystem-dropbox
</code></pre>

<p>Luego, debes crear un proveedor de servicios como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DropboxServiceProvider</span>. En el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> del proveedor, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> del facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Storage</span> para definir el driver personalizado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Storage;
use League\Flysystem\Filesystem;
use Illuminate\Support\ServiceProvider;
use Spatie\Dropbox\Client as DropboxClient;
use Spatie\FlysystemDropbox\DropboxAdapter;

class DropboxServiceProvider extends ServiceProvider
{
    /**
    * Register bindings in the container.
    *
    * @return void
    */
    public function register()
    {
        //
    }

    /**
    * Bootstrap any application services.
    *
    * @return void
    */
    public function boot()
    {
        Storage::extend('dropbox', function (\$app, \$config) {
            \$client = new DropboxClient(
                \$config['authorization_token']
            );

            return new Filesystem(new DropboxAdapter(\$client));
        });
    }
}
</code></pre>

<p>El primer argumento del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extend</span> es el nombre del driver y el segundo es una
    Closure que recibe las variables <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$app</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$config</span>. La Closure resolver
    debe retornar una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">League\Flysystem\Filesystem</span>. La variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$config</span>
    contiene los valores definidos en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/filesystems.php</span> para el disco
    especificado.</p>
<p>Luego, registra el proveedor de servicios en tu archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'providers' =&gt; [
    // ...
    App\Providers\DropboxServiceProvider::class,
];
</code></pre>

<p>Una vez que has creado y registrado el proveedor de servicios de la extensión, puedes usar el
    driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dropbox</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/filesystems.php</span>.
</p>
</div>
""";