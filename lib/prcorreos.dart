import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrCorreos extends StatelessWidget {
  final String title;
  PrCorreos(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrCorreos,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrCorreos = """
<div style='font-size: 14.2px;'>
<h1>Correos Electrónicos</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Requisitos previos</li>
        </ul>
    </li>
    <li>Generando mailables</li>
    <li>
        Escribiendo mailables
        <ul>
            <li>Configurando el envío</li>
            <li>Configurando la vista</li>
            <li>Datos en vistas</li>
            <li>Archivos adjuntos</li>
            <li>Archivos adjuntos en línea</li>
            <li>Personalizar el mensaje de swiftMailer</li>
        </ul>
    </li>
    <li>
        Mailables en markdown
        <ul>
            <li>Generando mailables en markdown</li>
            <li>Escribiendo mensajes en markdown</li>
            <li>Personalizando los componentes</li>
        </ul>
    </li>
    <li>
        Enviando correo
        <ul>
            <li>Colas de correos</li>
        </ul>
    </li>
    <li>
        Renderizando mailables
        <ul>
            <li>Previsualizando mailables en el navegador</li>
        </ul>
    </li>
    <li>Configuración regional de mailables</li>
    <li>Correos y desarrollo Local</li>
    <li>Eventos</li>
</ul>

<h2>Introducción</h2>
<p>
    Laravel proporciona una API limpia y simple sobre la popular biblioteca

    SwiftMailer


    con drivers para SMTP, Mailgun, Postmark, SparkPost, Amazon SES y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sendmail</span>,
    permitiéndote comenzar rápidamente a enviar correos a través de un servicio local o en la nube
    de tu elección.
</p>

<h3># Requisitos previos</h3>
<p>Los drivers basados ​​en una API como Mailgun, SparkPost y Postmark suelen ser más simples y
    rápidos que los servidores SMTP. Si es posible, deberías usar uno de estos drivers. Todos los
    drivers con API requieren la biblioteca Guzzle HTTP, que puede instalarse a través del gestor de
    paquetes Composer:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require guzzlehttp/guzzle
</code></pre>

<h4># Driver Mailgun</h4>
<p>Para usar el driver de Mailgun, primero instale Guzzle, luego configura la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/mail.php</span> en
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mailgun</span>. Luego, verifica que tu archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/services.php</span> contiene las siguientes opciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'mailgun' =&gt; [
    'domain' =&gt; 'your-mailgun-domain',
    'secret' =&gt; 'your-mailgun-key',
],
</code></pre>

<p>
    Si no estás usando la

    región de Mailgun


    "US", puedes definir el endpoint de tu región en el archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">services</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'mailgun' =&gt; [
    'domain' =&gt; 'your-mailgun-domain',
    'secret' =&gt; 'your-mailgun-key',
    'endpoint' =&gt; 'api.eu.mailgun.net',
],
</code></pre>

<h4># Driver Postmark</h4>
<p>Para usar el driver de Postmark, instala el transporte de SwiftMailer de Postmark mediante
    Composer:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require wildbit/swiftmailer-postmark
</code></pre>

<p>Luego, instala Guzzle y establece la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> en tu archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/mail.php</span> a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">postmark</span>. Finalmente, verifica que tu archivo de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/services.php</span> contiene las siguientes opciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'postmark' =&gt; [
    'token' =&gt; 'your-postmark-token',
],
</code></pre>

<h4># Driver SparkPost</h4>
<p>Para usar el driver SparkPost, primero instale Guzzle, luego configura la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/mail.php</span> en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sparkpost</span>.
    Luego, verifica que tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/services.php</span> contiene las
    siguientes opciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'sparkpost' =&gt; [
    'secret' =&gt; 'your-sparkpost-key',
],
</code></pre>

<p>
    Si es necesario, puedes también configurar cuál

    endpoint de API


    debería ser usado:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'sparkpost' =&gt; [
    'secret' =&gt; 'your-sparkpost-key',
    'options' =&gt; [
        'endpoint' =&gt; 'https://api.eu.sparkpost.com/api/v1/transmissions',
    ],
],
</code></pre>

<h4># Driver SES</h4>
<p>Para usar el driver de Amazon SES, primero debes instalar Amazon AWS SDK para PHP. Puedes
    instalar esta biblioteca agregando la siguiente línea a la sección <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">require</span> del
    archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span> y ejecutando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer update</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>"aws/aws-sdk-php": "~3.0"
</code></pre>

<p>A continuación, configura la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/mail.php</span>
    en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ses</span> y verifica que tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/services.php</span>
    contiene las siguientes opciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'ses' =&gt; [
    'key' =&gt; 'your-ses-key',
    'secret' =&gt; 'your-ses-secret',
    'region' =&gt; 'ses-region',  // e.g. us-east-1
],
</code></pre>

<p>
    Si necesitas incluir

    opciones adicionales


    al ejecutar la petición <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SendRawEmail</span> de SES, puedes definir un arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">options</span>
    dentro de tu configuración de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ses</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'ses' =&gt; [
    'key' =&gt; 'your-ses-key',
    'secret' =&gt; 'your-ses-secret',
    'region' =&gt; 'ses-region',  // e.g. us-east-1
    'options' =&gt; [
        'ConfigurationSetName' =&gt; 'MyConfigurationSet',
        'Tags' =&gt; [
            [
                'Name' =&gt; 'foo',
                'Value' =&gt; 'bar',
            ],
        ],
    ],
],
</code></pre>


<h2>Generando mailables</h2>
<p>En Laravel, cada tipo de correo electrónico enviado por su aplicación se representa como una
    clase "Mailable". Estas clases se almacenan en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Mail</span>. No te
    preocupes si no ves este directorio en tu aplicación, ya que se generará para ti cuando crees tu
    primera clase mailable usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:mail</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:mail OrderShipped
</code></pre>


<h2>Escribiendo mailables</h2>
<p>Toda la configuración de una clase mailable se realiza en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">build</span>. Dentro de
    este método, puedes llamar a varios métodos como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">from</span>,<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subject</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>
    y<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attach</span> para configurar la presentación y entrega del correo electrónico.</p>

<h3># Configurando el remitente</h3>
<h4># Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">from</span></h4>
<p>Primero, exploremos la configuración del remitente para el correo electrónico. O, en otras
    palabras, para quién será el correo electrónico (from). Hay dos formas de configurar el
    remitente. En primer lugar, puede usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">from</span> dentro de su método<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">build</span>
    de la clase mailable:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;from('example@example.com')
                -&gt;view('emails.orders.shipped');
}
</code></pre>

<h4># Usando una dirección global con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">from</span></h4>
<p>Sin embargo, si tu aplicación utiliza la misma dirección "from" para todos sus correos
    electrónicos, puede resultar engorroso llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">from</span> en cada clase mailable
    que genere. En su lugar, puede especificar una dirección global "from" en su archivo de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/mail.php</span>. Esta dirección se usará si no se especifica ninguna
    otra dirección "from" dentro de la clase mailable:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'from' =&gt; ['address' =&gt; 'example@example.com', 'name' =&gt; 'App Name'],
</code></pre>

<p>Adicionalmente, puedes definir una dirección global "reply_to" dentro de tu archivo de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/mail.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'reply_to' =&gt; ['address' =&gt; 'example@example.com', 'name' =&gt; 'App Name'],
</code></pre>


<h3># Configurando la vista</h3>
<p>
    Dentro de un método 'build' de la clase Mailable, puede usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span> para
    especificar qué plantilla se debe usar al representar los contenidos del correo electrónico.
    Dado que cada correo electrónico generalmente usa una
    Plantilla Blade
    para representar sus contenidos, tienes toda la potencia y la comodidad del motor de plantillas
    Blade al construir el HTML de su correo electrónico:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;view('emails.orders.shipped');
}
</code></pre>


<p>TIP</p>
<p>Es posible que desees crear un directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/emails</span> para albergar todas
    tus plantillas de correos electrónicos; sin embargo, puedes colocarlos donde quieras siempre y
    cuando este dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views</span>.</p>


<h4># Correos con texto plano</h4>
<p>Si deseas definir una versión de texto sin formato en tu correo electrónico, puedes usar el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">text</span>. Al igual que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>, el método<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">text</span>
    acepta un nombre de plantilla que se usará para representar el contenido del correo electrónico.
    Eres libre de definir una versión HTML y de texto sin formato del mensaje:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;view('emails.orders.shipped')
                -&gt;text('emails.orders.shipped_plain');
}
</code></pre>


<h3># Datos en Vistas</h3>
<h4># A través de propiedades públicas</h4>
<p>Por lo general, querrás pasar algunos datos a tu vista que puedes utilizar al representar el HTML
    del correo electrónico. Hay dos maneras en que puedes hacer que los datos estén disponibles para
    la vista. Primero, cualquier propiedad pública definida en tu clase Mailable se pondrá
    automáticamente a disposición de la vista. Entonces, por ejemplo, puedes pasar datos al
    constructor de tu clase Mailable y establecer esos datos a propiedades públicas definidas en la
    clase:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Mail;

use App\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderShipped extends Mailable
{
    use Queueable, SerializesModels;

    /**
    * The order instance.
    *
    * @var Order
    */
    public \$order;

    /**
    * Create a new message instance.
    *
    * @return void
    */
    public function __construct(Order \$order)
    {
        \$this-&gt;order = \$order;
    }

    /**
    * Build the message.
    *
    * @return \$this
    */
    public function build()
    {
        return \$this-&gt;view('emails.orders.shipped');
    }
}
</code></pre>

<p>Una vez que los datos se han establecido en una propiedad pública, estarán automáticamente
    disponibles en tu vista, por lo que puedes acceder a ella como si tuvieras acceso a cualquier
    otro dato en tus plantillas Blade:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;div&gt;
    Price: {{ \$order-&gt;price }}
&lt;/div&gt;
</code></pre>

<h4># A través del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>:</h4>
<p>Si deseas personalizar el formato de los datos de tu correo electrónico antes de enviarlos a la
    plantilla, puedes pasar manualmente los datos a la vista mediante el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>.
    Por lo general, aún podrás pasar datos a través del constructor de la clase Mailable; sin
    embargo, debes establecer estos datos en propiedades <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">protected</span>
    o<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">private</span> para que los datos no estén automáticamente disponibles para la plantilla.
    Luego, al llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>, se pase un arreglo de datos que deseas poner a
    disposición de la plantilla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Mail;

use App\Order;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class OrderShipped extends Mailable
{
    use Queueable, SerializesModels;

    /**
    * The order instance.
    *
    * @var Order
    */
    protected \$order;

    /**
    * Create a new message instance.
    *
    * @return void
    */
    public function __construct(Order \$order)
    {
        \$this-&gt;order = \$order;
    }

    /**
    * Build the message.
    *
    * @return \$this
    */
    public function build()
    {
        return \$this-&gt;view('emails.orders.shipped')
                    -&gt;with([
                        'orderName' =&gt; \$this-&gt;order-&gt;name,
                        'orderPrice' =&gt; \$this-&gt;order-&gt;price,
                    ]);
    }
}
</code></pre>

<p>Una vez que los datos se han pasado con el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>, estarán automáticamente
    disponibles en la vista, por lo que puedes acceder a ellos como lo harías con cualquier otro
    dato en las plantillas Blade:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;div&gt;
    Price: {{ \$orderPrice }}
&lt;/div&gt;
</code></pre>


<h3># Archivos adjuntos</h3>
<p>Para agregar archivos adjuntos a un correo electrónico, podemos usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attach</span> dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">build</span> de la clase Mailable. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attach</span>
    acepta la ruta completa al archivo como su primer argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;view('emails.orders.shipped')
                -&gt;attach('/path/to/file');
}
</code></pre>

<p>Al adjuntar archivos a un mensaje, también puedes especificar el nombre para mostrar y / o el
    tipo MIME pasando un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span> como segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attach</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;view('emails.orders.shipped')
                -&gt;attach('/path/to/file', [
                    'as' =&gt; 'name.pdf',
                    'mime' =&gt; 'application/pdf',
                ]);
}
</code></pre>

<h4># Adjuntando archivos desde el disco</h4>
<p>Si has almacenado un archivo en uno de tus discos, puedes adjuntarlo al correo electrónico usando
    el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attachFromStorage</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;view('email.orders.shipped')
                -&gt;attachFromStorage('/path/to/file');
}
</code></pre>

<p>De ser necesario, puedes especificar el nombre del archivo adjunto y opciones adicionales usando
    el segundo y tercer argumento del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attachFromStorage</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;view('email.orders.shipped')
                -&gt;attachFromStorage('/path/to/file', 'name.pdf', [
                    'mime' =&gt; 'application/pdf'
                ]);
}
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attachFromStorageDisk</span> puede ser usado si necesitas especificar un disco de
    almacenamiento diferente a tu disco por defecto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;view('email.orders.shipped')
                -&gt;attachFromStorageDisk('s3', '/path/to/file');
}
</code></pre>

<h4># Archivos adjuntos desde la memoria</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attachData</span> se puede usar para adjuntar una cadena de bytes sin formato
    como un archivo adjunto. Por ejemplo, puede usar este método si ha generado un PDF en la memoria
    y desea adjuntarlo al correo electrónico sin escribirlo en el disco. El método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">attachData</span> acepta los bytes de datos brutos como su primer argumento, el nombre del
    archivo como su segundo argumento y un arreglo de opciones como su tercer argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;view('emails.orders.shipped')
                -&gt;attachData(\$this-&gt;pdf, 'name.pdf', [
                    'mime' =&gt; 'application/pdf',
                ]);
}
</code></pre>


<h3># Archivos adjuntos en línea</h3>
<p>La incrustación de imágenes en línea en sus correos electrónicos suele ser engorrosa; sin
    embargo, Laravel proporciona una forma conveniente de adjuntar imágenes a sus correos
    electrónicos y recuperar el CID apropiado. Para incrustar una imagen en línea, usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">embed</span> en la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$message</span> dentro de tu plantilla de correo
    electrónico. Laravel automáticamente hace que la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$message</span> esté disponible
    para todas tus plantillas de correo electrónico, por lo que no tienes que preocuparte por
    pasarla manualmente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;body&gt;
    Here is an image:

    &lt;img src="{{ \$message-&gt;embed(\$pathToImage) }}"&gt;
&lt;/body&gt;
</code></pre>


<p>Nota</p>
<p>La variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$message</span> no está disponible en los mensajes ya que los mensajes de
    texto plano (plain-text) no utilizan archivos adjuntos en línea.</p>

<h4># Incrustar datos adjuntos de la memoria</h4>
<p>Si ya tienes una cadena de datos en la memoria que desees incorporar a una plantilla de correo
    electrónico, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">embedData</span> en la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$message</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;body&gt;
    Here is an image from raw data:

    &lt;img src="{{ \$message-&gt;embedData(\$data, \$name) }}"&gt;
&lt;/body&gt;
</code></pre>


<h3># Personalizar el mensaje de SwiftMailer</h3>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withSwiftMessage</span> de la clase base <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mailable</span> te permite
    registrar una función anónima que se invocará con la instancia del mensaje de SwiftMailer sin
    procesar antes de enviar el mensaje. Esto le da la oportunidad de personalizar el mensaje antes
    de que se entregue:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    \$this-&gt;view('emails.orders.shipped');

    \$this-&gt;withSwiftMessage(function (\$message) {
        \$message-&gt;getHeaders()
                -&gt;addTextHeader('Custom-Header', 'HeaderValue');
    });
}
</code></pre>


<h2>Mailables en markdown</h2>
<p>Los mensajes escritos con Markdown le permiten aprovechar las plantillas y los componentes
    precompilados de las notificaciones por correo en tus documentos. Dado que los mensajes se
    escriben en Markdown, Laravel puede generar plantillas HTML atractivas para los mensajes y
    generar automáticamente una contraparte de texto sin formato.</p>

<h3># Generar mailables en markdown</h3>
<p>Para generar una clase de Mailable con una plantilla para Markdown puedes usar la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--markdown</span>
    del comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:mail</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:mail OrderShipped --markdown=emails.orders.shipped
</code></pre>

<p>Luego de generar la clase, dentro de su método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">build</span> debes llamar llame al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">markdown</span> en lugar del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>. Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">markdown</span>
    aceptan el nombre de la plantilla Markdown y un arreglo opcional de datos para poner a
    disposición de la plantilla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Build the message.
*
* @return \$this
*/
public function build()
{
    return \$this-&gt;from('example@example.com')
                -&gt;markdown('emails.orders.shipped');
}
</code></pre>


<h3># Escribir mensajes en Markdown</h3>
<p>Los correos con Markdown utilizan una combinación de componentes Blade y sintaxis Markdown que le
    permiten construir fácilmente mensajes de correo al mismo tiempo que aprovechas los componentes
    prefabricados de Laravel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('mail::message')
# Order Shipped

Your order has been shipped!

@component('mail::button', ['url' =&gt; \$url])
View Order
@endcomponent

Thanks,&lt;br&gt;
{{ config('app.name') }}
@endcomponent
</code></pre>


<p>TIP</p>
<p>No uses una sangría excesiva al escribir correos electrónicos de Markdown. Los analizadores de
    Markdown renderizarán contenido sangrado como bloques de código.</p>

<h4># Componente button</h4>
<p>El componente de botón representa un enlace de botón centrado. El componente acepta dos
    argumentos, una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> y un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">color</span> opcional. Los colores compatibles son
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">primary</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">success</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">error</span>. Puedes agregar los botones que
    desees a un mensaje:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('mail::button', ['url' =&gt; \$url, 'color' =&gt; 'success'])
View Order
@endcomponent
</code></pre>

<h4># Componente panel</h4>
<p>El componente del panel representa el bloque de texto dado en un panel que tiene un color de
    fondo ligeramente diferente que el resto del mensaje. Esto te permite llamar la atención sobre
    un bloque de texto dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('mail::panel')
This is the panel content.
@endcomponent
</code></pre>

<h4># Componente table</h4>
<p>El componente de tabla le permite transformar una tabla en Markdown a una tabla HTML. El
    componente acepta la tabla en Markdown como su contenido. La alineación de columna de tabla es
    compatible con la sintaxis de alineación de tabla de Markdown predeterminada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('mail::table')
| Laravel       | Table         | Example  |
| ------------- |:-------------:| --------:|
| Col 2 is      | Centered      | \$10      |
| Col 3 is      | Right-Aligned | \$20      |
@endcomponent
</code></pre>


<h3># Personalizar los componentes</h3>
<p>Puedes exportar todos los componentes de correo Markdown a su propia aplicación para
    personalización. Para exportar los componentes, use el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span> y la
    opción del tag <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel-mail</span> de esta forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan vendor:publish --tag=laravel-mail
</code></pre>

<p>Este comando publicará los componentes de correo Markdown en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor/mail</span>.
    El directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mail</span> contendrá un directorio<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">html</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">text</span>,
    cada uno con sus respectivas representaciones de cada componente disponible. Eres libre de
    personalizar estos componentes como desees.</p>
<h4># Personalizar el CSS</h4>
<p>Después de exportar los componentes, el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/vendor/mail/html/themes</span> contendrá un archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">default.css</span>, puedes personalizar el CSS en este archivo y sus estilos se alinearán
    automáticamente en las representaciones HTML de sus mensajes de correo Markdown.</p>
<p>Si te gustaría construir un nuevo tema para los componentes de Markdown de Laravel, puedes
    colocar un archivo CSS dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">html/themes</span>. Luego de nombrar y
    guardar tu archivo de CSS, actualiza la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">theme</span> del archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mail</span> con el nuevo nombre de tu tema.</p>
<p>Para personalizar un tema para un mailable individual, debes establecer la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$theme</span>
    de la clase mailable a el nombre del tema que debería ser usado al enviar el mailable.</p>

<h2>Enviar correo</h2>
<p>Para enviar un mensajes debes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">to</span> en el facade llamado
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">to</span> acepta una dirección de correo, una instancia de
    usuario o una colección de usuarios. Si pasas un objeto o una colección de objetos, el remitente
    utilizará automáticamente sus propiedades de "email" y "name" cuando configure los destinatarios
    del correo electrónico, por lo tanto, asegúrese de que estos atributos estén disponibles en sus
    objetos. Una vez que haya especificado sus destinatarios, puede pasar una instancia de su clase
    mailable al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">send</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Order;
use App\Mail\OrderShipped;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use App\Http\Controllers\Controller;

class OrderController extends Controller
{
    /**
    * Ship the given order.
    *
    * @param  Request  \$request
    * @param  int  \$orderId
    * @return Response
    */
    public function ship(Request \$request, \$orderId)
    {
        \$order = Order::findOrFail(\$orderId);

        // Ship order...

        Mail::to(\$request-&gt;user())-&gt;send(new OrderShipped(\$order));
    }
}
</code></pre>

<p>No estás limitado a especificar los destinatarios "a" al enviar un mensaje. Eres libre de
    configurar los destinatarios "a", "cc" y "bcc", todo dentro de una única llamada a un método
    encadenado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Mail::to(\$request-&gt;user())
    -&gt;cc(\$moreUsers)
    -&gt;bcc(\$evenMoreUsers)
    -&gt;send(new OrderShipped(\$order));
</code></pre>


<h2>Renderizar mailables</h2>
<p>Algunas veces puedes querer capturar el contenido HTML de un mailable sin enviarlo. Para lograr
    esto, puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">render</span> del mailable. Este método retornará los
    contenidos evaluados del mailable como una cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$invoice = App\Invoice::find(1);

return (new App\Mail\InvoicePaid(\$invoice))-&gt;render();
</code></pre>


<h3># Previsualizar mailables en el navegador</h3>
<p>Al diseñar una plantilla mailable, es conveniente previsualizar rápidamente el mailable
    renderizado en tu navegador como una plantilla de Blade corriente. Por esta razón, Laravel te
    permite retornar cualquier mailable directamente desde un Closure de ruta o un controlador.
    Cuando un mailable es retornado, será renderizado y mostrado en el navegador, permitiéndote
    previsualizar su diseño sin necesidad de enviarlo a una dirección de correo electrónico
    real:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('mailable', function () {
    \$invoice = App\Invoice::find(1);

    return new App\Mail\InvoicePaid(\$invoice);
});
</code></pre>


<h3># Correo en cola</h3>
<h4># Poniendo en cola un correo electronico</h4>
<p>Con el envío de correos electrónicos puede alargar drásticamente el tiempo de respuesta de su
    aplicación, muchos desarrolladores eligen poner correos electrónicos en cola para el envío en
    segundo plano. Laravel lo hace fácil usando su función incorporada API de cola unificada. Para
    poner en cola un correo, use el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail</span> después
    de especificar los destinatarios del mensaje:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Mail::to(\$request-&gt;user())
    -&gt;cc(\$moreUsers)
    -&gt;bcc(\$evenMoreUsers)
    -&gt;queue(new OrderShipped(\$order));
</code></pre>

<p>Este método se encargará automáticamente de insertar un trabajo en la cola para que el mensaje se
    envíe en segundo plano. Necesitarás configurar tus colas antes de usar esta característica.</p>
<h4># Cola de mensajes retrasada</h4>
<p>Si deseas retrasar la entrega de un mensaje de correo electrónico en cola, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">later</span>. Como primer argumento, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">later</span> acepta una instancia
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DateTime</span> que indica cuándo se debe enviar el mensaje:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$when = now()-&gt;addMinutes(10);

Mail::to(\$request-&gt;user())
    -&gt;cc(\$moreUsers)
    -&gt;bcc(\$evenMoreUsers)
    -&gt;later(\$when, new OrderShipped(\$order));
</code></pre>

<h4># Enviar a queues específicas</h4>
<p>Como todas las clases mailable generadas usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:mail</span> usan el trait
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Bus\Queueable</span> puedes llamar a los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onQueue</span> y<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onConnection</span>
    en cualquier instancia de clase mailable, lo que te permite especificar la conexión y nombre de
    cola para el mensaje:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$message = (new OrderShipped(\$order))
                -&gt;onConnection('sqs')
                -&gt;onQueue('emails');

Mail::to(\$request-&gt;user())
    -&gt;cc(\$moreUsers)
    -&gt;bcc(\$evenMoreUsers)
    -&gt;queue(\$message);
</code></pre>

<h4># En cola por defecto</h4>
<p>Si tienes clases mailables que deseas que siempre se pongan en cola, puedes implementar la
    interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ShouldQueue</span> en la clase. Ahora, incluso si llamas al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">send</span> cuando envies correos el mailable se pondrá en cola ya que implementa la
    interfaz:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Contracts\Queue\ShouldQueue;

class OrderShipped extends Mailable implements ShouldQueue
{
    //
}
</code></pre>


<h2>Configuración regional de mailables</h2>
<p>Laravel te permite enviar mailables en una configuración regional diferente al del idioma actual,
    e incluso recordará dicha configuración si el correo es agregado a una cola.</p>
<p>Para lograr esto, el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Mail</span> ofrece un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locale</span> para
    establecer el idioma deseado. La aplicación cambiará a dicho configuración regional cuando el
    mailable sea formateado y luego volverá a la configuración anterior cuando el formato es
    completado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Mail::to(\$request-&gt;user())-&gt;locale('es')-&gt;send(
    new OrderShipped(\$order)
);
</code></pre>

<h3># Configuración regional de usuarios</h3>
<p>Algunas veces, las aplicaciones almacenan la configuración regional preferida de cada usuario. Al
    implementar la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">HasLocalePreference</span> en uno o más de tus modelos, puedes
    instruir a Laravel a usar dicha configuración almacenado al enviar correos electrónicos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Contracts\Translation\HasLocalePreference;

class User extends Model implements HasLocalePreference
{
    /**
    * Get the user's preferred locale.
    *
    * @return string
    */
    public function preferredLocale()
    {
        return \$this-&gt;locale;
    }
}
</code></pre>

<p>Una vez has implementado la interfaz, Laravel automáticamente usará la configuración regional
    preferida al enviar mailables y notificaciones al modelo. Por lo tanto, no hay necesidad de
    llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">locale</span> al usar esta interfaz:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Mail::to(\$request-&gt;user())-&gt;send(new OrderShipped(\$order));
</code></pre>


<h2>Correos y desarrollo local</h2>
<p>Al desarrollar una aplicación que envía correos electrónicos, probablemente no deseas enviar
    correos electrónicos a direcciones reales. Laravel proporciona varias formas de "desactivar" el
    envío real de correos electrónicos durante el desarrollo local.</p>
<h4># Driver Log</h4>
<p>En lugar de enviar sus correos electrónicos, el driver de correos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">log</span> escribirá
    todos los mensajes de correo electrónico en tus archivos de logs para su inspección. Para
    obtener más información sobre cómo configurar su aplicación por entorno, revisa la configuración
    en la documentación.</p>
<h4># Destinatario universal</h4>
<p>Otra solución proporcionada por Laravel es establecer un destinatario universal de todos los
    correos electrónicos enviados por el framework. De esta forma, todos los correos electrónicos
    generados por tu aplicación serán enviados a una dirección específica, en lugar de la dirección
    realmente especificada al enviar el mensaje. Esto se puede hacer a través de la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">to</span> en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/mail.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'to' =&gt; [
    'address' =&gt; 'example@example.com',
    'name' =&gt; 'Example'
],
</code></pre>

<h4># Mailtrap</h4>
<p>
    Finalmente, puedes usar un servicio como

    Mailtrap


    y el driver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">smtp</span> para enviar sus mensajes de correo electrónico a un buzón
    'ficticio' donde puedes verlos en un verdadero cliente de correo electrónico. Este enfoque tiene
    el beneficio de permitirle inspeccionar realmente los correos electrónicos finales en el visor
    de mensajes de Mailtrap.
</p>

<h2>Eventos</h2>
<p>Laravel dispara dos eventos durante el proceso de envío de mensajes de correo. El evento <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MessageSending</span>
    se dispara antes de que se envíe un mensaje, mientras que el evento<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MessageSent</span> se
    dispara después de que se ha enviado un mensaje. Recuerda, estos eventos se disparan cuando el
    correo <em>se envía</em>, no cuando se pone en cola. Puedes registrar un detector de eventos
    para este evento en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">EventServiceProvider</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The event listener mappings for the application.
*
* @var array
*/
protected \$listen = [
    'Illuminate\Mail\Events\MessageSending' =&gt; [
        'App\Listeners\LogSendingMessage',
    ],
    'Illuminate\Mail\Events\MessageSent' =&gt; [
        'App\Listeners\LogSentMessage',
    ],
];
</code></pre>
</div>
""";