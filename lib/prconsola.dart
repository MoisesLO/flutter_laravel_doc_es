import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrConsola extends StatelessWidget {
  final String title;
  PrConsola(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrConsola,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrConsola = """
<div style='font-size: 14.2px;'>
<h1>Consola artisan</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Tinker (REPL)</li>
        </ul>
    </li>
    <li>
        Escritura de comandos
        <ul>
            <li>Generación de comandos</li>
            <li>Estructura de un comando</li>
            <li>Comandos de función anónima (closure)</li>
        </ul>
    </li>
    <li>
        Definición de expectativas de entrada
        <ul>
            <li>Argumentos</li>
            <li>Opciones</li>
            <li>Arreglos como entradas</li>
            <li>Descripciones de entrada</li>
        </ul>
    </li>
    <li>
        Entrada/Salida de comandos
        <ul>
            <li>Recuperación de entradas</li>
            <li>Solicitud de entradas</li>
            <li>Escritura de salida</li>
        </ul>
    </li>
    <li>Registro de comandos</li>
    <li>
        Ejecución de comandos de forma programática
        <ul>
            <li>Llamando comandos desde otros comandos</li>
        </ul>
    </li>
</ul>

<h2>Introducción</h2>
<p>Artisan es la interfaz de línea de comando incluida con Laravel. Provee un número de comandos
    útiles que pueden ayudarte mientras construyes tu aplicación. Para ver una lista de todos los
    comandos Artisan disponibles, puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">list</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan list
</code></pre>

<p>También cada comando incluye una "ayuda" en pantalla, la cual muestra y describe los argumentos y
    opciones disponibles. Para ver una pantalla de ayuda, coloca <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">help</span> antes del nombre
    del comando:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan help migrate
</code></pre>

<h3># Tinker REPL</h3>
<p>
    Todas las aplicaciones de Laravel incluyen Tinker, un REPL desarrollado usando el paquete

    PsySH


    . Tinker te permite interactuar con toda tu aplicación de Laravel en la línea de comando,
    incluyendo el ORM Eloquent, colas de trabajo, eventos, entre otros. Para entrar en el entorno de
    Tinker, ejecuta el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tinker</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan tinker
</code></pre>

<p>Puedes publicar el archivo de configuración de Tinker usando el comando vendor:publish:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan vendor:publish --provider="Laravel\Tinker\TinkerServiceProvider"
</code></pre>

<h4># Lista blanca de comandos</h4>
<p>Tinker utiliza una lista blanca para determinar qué comandos de Artisan pueden ejecutarse dentro
    de su shell. Por defecto, puedes ejecutar los comandos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">clear-compiled</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">down</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">inspire</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">optimize</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">up</span>. Si deseas hacer una lista blanca de más comandos, puede
    agregarlos al arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">command</span> en tu archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tinker.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'commands' =&gt; [
    // App\Console\Commands\ExampleCommand::class,
],
</code></pre>

<h4># Lista negra de alias</h4>
<p>Por lo general, Tinker automáticamente asigna alias a las clases según las necesites en Tinker.
    Sin embargo, es posible que desees que nunca se agreguen alias a algunas clases. Puedes lograr
    esto listando las clases en el arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dont_alias</span> de tu archivo de configuración
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tinker.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'dont_alias' =&gt; [
    App\User::class,
],
</code></pre>


<h2>Escritura de comandos</h2>
<p>Además de los comandos proporcionados por Artisan, también puedes crear tus propios comandos
    personalizados. Los comandos son típicamente almacenados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Console/Commands</span>;
    sin embargo, eres libre de escoger tu propia ubicación de almacenamiento, siempre y cuando tus
    comandos puedan ser cargados por Composer.</p>

<h3># Generación de comandos</h3>
<p>Para crear un nuevo comando, usa el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:command</span>. Este comando
    creará una nueva clase de comando en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Console/Commands</span>. No te
    preocupes si este directorio no existe en tu aplicación, pues éste será creado la primera vez
    que ejecutes el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:command</span>. El comando generado incluirá el
    conjunto de propiedades y métodos por defecto que están presentes en todos los comandos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:command SendEmails
</code></pre>


<h3># Estructura de un comando</h3>
<p>Después de generar tu comando, debes rellenar las propiedades <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">signature</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">description</span>
    de la clase, las cuales serán usadas cuando se muestra tu comando en la pantalla
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">list</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> será llamado cuando tu comando es ejecutado.
    Puedes colocar tu lógica del comando en este método.</p>

<p>TIP</p>
<p>Para una mayor reutilización del código, es una buena práctica mantener ligeros tus comandos de
    consola y dejar que se remitan a los servicios de aplicaciones para llevar a cabo sus tareas. En
    el siguiente ejemplo, toma en cuenta que inyectamos una clase de servicio para hacer el "trabajo
    pesado" de enviar los correos electrónicos.</p>


<p>Echemos un vistazo a un comando de ejemplo. Observa que podemos inyectar cualquier dependencia
    que necesitemos en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle()</span> del comando. El contenedor de servicios de
    Laravel automáticamente inyectará todas las dependencias cuyos tipos (interfaces y/o clases)
    estén asignados en los parámetros del constructor (type-hinting):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Console\Commands;

use App\User;
use App\DripEmailer;
use Illuminate\Console\Command;

class SendEmails extends Command
{
    /**
    * The name and signature of the console command.
    *
    * @var string
    */
    protected \$signature = 'email:send {user}';

    /**
    * The console command description.
    *
    * @var string
    */
    protected \$description = 'Send drip e-mails to a user';

    /**
    * Create a new command instance.
    *
    * @return void
    */
    public function __construct()
    {
        parent::__construct();
    }

    /**
    * Execute the console command.
    *
    * @param  \App\DripEmailer  \$drip
    * @return mixed
    */
    public function handle(DripEmailer \$drip)
    {
        \$drip-&gt;send(User::find(\$this-&gt;argument('user')));
    }
}
</code></pre>


<h3># Comandos usando una función anónima (closure)</h3>
<p>Los comandos basados en Closure proporcionan una alternativa para definir comandos de consola
    como clases. De la misma manera que los Closures de rutas son una alternativa para los
    controladores, piensa en los Closures de comandos como una alternativa a las clases de comandos.
    Dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">commands</span> de tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Console/Kernel.php</span>,
    Laravel carga el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/console.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Register the Closure based commands for the application.
*
* @return void
*/
protected function commands()
{
    require base_path('routes/console.php');
}
</code></pre>

<p>Aunque este archivo no define rutas HTTP, define los puntos de entrada (rutas) a tu aplicación
    basados en consola. Dentro de este archivo, puedes definir todas sus rutas basadas en Closure
    usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Artisan::command</span>. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">command</span> acepta dos
    argumentos: la firma del comando y un Closure, el cual recibe los argumentos y opciones de los
    comandos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Artisan::command('build {project}', function (\$project) {
    \$this-&gt;info("Building {\$project}!");
});
</code></pre>

<p>El Closure está vinculado a la instancia del comando subyacente, así tienes acceso completo a
    todos los métodos helper a los que normalmente podrías acceder en una clase de comando
    completa.</p>
<h4># Determinación de tipos (type-hinting) de dependencias</h4>
<p>Además de recibir los argumentos y opciones de tu comando, en los Closures de comandos puedes
    también determinar los tipos de las dependencias adicionales que te gustaría resolver del
    contenedor de servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\User;
use App\DripEmailer;

Artisan::command('email:send {user}', function (DripEmailer \$drip, \$user) {
    \$drip-&gt;send(User::find(\$user));
});
</code></pre>

<h4># Descripciones de un closure de comando</h4>
<p>Al definir un comando basado en Closure, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">describe</span> para agregar
    una descripción al comando. Esta descripción será mostrada cuando ejecutes los comandos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan list</span>
    o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan help</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Artisan::command('build {project}', function (\$project) {
    \$this-&gt;info("Building {\$project}!");
})-&gt;describe('Build the project');
</code></pre>


<h2>Definición de expectativas de entrada</h2>
<p>Al escribir comandos de consola, es común recopilar información del usuario a través de
    argumentos u opciones. Laravel hace que sea muy conveniente definir la entrada que esperas del
    usuario usando la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">signature</span> en tus comandos. La propiedad
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">signature</span> te permite definir el nombre, los argumentos y las opciones para el
    comando en una sintaxis tipo ruta simple y expresiva.</p>

<h3># Argumentos</h3>
<p>Todos los argumentos y opciones suministrados por el usuario están envueltos en llaves. En el
    siguiente ejemplo, el comando define un argumento <strong>obligatorio</strong> <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The name and signature of the console command.
*
* @var string
*/
protected \$signature = 'email:send {user}';
</code></pre>

<p>También puedes hacer que los argumentos sean opcionales y definir valores predeterminados para
    los argumentos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Optional argument...
email:send {user?}

// Optional argument with default value...
email:send {user=foo}
</code></pre>


<h3># Opciones</h3>
<p>Las opciones, como los argumentos, son otra forma de entrada de usuario. Las opciones son
    prefijadas por dos guiones (<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--</span>) cuando se especifican en la línea de comando. Hay
    dos tipos de opciones: aquellas que reciben un valor y las que no. Las opciones que no reciban
    un valor se comportarán como un "interruptor" booleano. Echemos un vistazo a un ejemplo de este
    tipo de opción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The name and signature of the console command.
*
* @var string
*/
protected \$signature = 'email:send {user} {--queue}';
</code></pre>

<p>En este ejemplo, la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--queue</span> puede ser especificada cuando ejecutas el comando
    Artisan. Si la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--queue</span> es pasada, su valor será <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>. En caso
    contrario, el valor será <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan email:send 1 --queue
</code></pre>


<h4># Opciones con valores</h4>
<p>Vamos a ver una opción que espera un valor. Si el usuario debe especificar un valor para una
    opción, agrega como sufijo el signo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">=</span> al nombre de la opción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The name and signature of the console command.
*
* @var string
*/
protected \$signature = 'email:send {user} {--queue=}';
</code></pre>

<p>En este ejemplo, el usuario puede pasar un valor para la opción, de esta manera:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan email:send 1 --queue=default
</code></pre>

<p>Puedes asignar valores por defecto a las opciones especificando el valor predeterminado después
    del nombre de la opción. Si ningún valor es pasado por el usuario, el valor por defecto será
    usado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>email:send {user} {--queue=default}
</code></pre>


<h4># Atajos de opciones</h4>
<p>Para asignar un atajo cuando defines una opción, puedes especificarlo antes del nombre de la
    opción y usar un delimitador <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">|</span> para separar el atajo del nombre completo de la
    opción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>email:send {user} {--Q|queue}
</code></pre>


<h3># Arreglos como entradas</h3>
<p>Si deseas definir argumentos u opciones para esperar entradas de arreglos, puedes usar el
    carácter <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*</span>. Primero, vamos a ver un ejemplo que especifica un arreglo como
    argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>email:send {user*}
</code></pre>

<p>Al llamar a este método, los argumentos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span> pueden pasarse en orden a la línea de
    comando. Por ejemplo, el siguiente comando establecerá el valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user</span> como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">['foo', 'bar']</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan email:send foo bar
</code></pre>

<p>Al definir una opción que espera un arreglo como entrada, cada valor de la opción pasado al
    comando debería ser prefijado con el nombre de la opción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>    email:send {user} {--id=*}

    php artisan email:send --id=1 --id=2
</code></pre>


<h3># Descripciones de entrada</h3>
<p>Puedes asignar descripciones para los argumentos y opciones de entrada separando el parámetro de
    la opción usando dos puntos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:</span>. Si necesitas un poco más de espacio para definir tu
    comando, no dudes en extender la definición a través de múltiples líneas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The name and signature of the console command.
*
* @var string
*/
protected \$signature = 'email:send
                        {user : The ID of the user}
                        {--queue= : Whether the job should be queued}';
</code></pre>


<h2>Entrada y salida (E/S) de comandos</h2>

<h3># Recuperación de entrada</h3>
<p>Cuando tu comando es ejecutado, obviamente necesitarás acceder a los valores de los argumentos y
    opciones aceptados por tu comando. Para ello, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">argument</span> y
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">option</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Execute the console command.
*
* @return mixed
*/
public function handle()
{
    \$userId = \$this-&gt;argument('user');

    //
}
</code></pre>

<p>Si necesitas recuperar todos los argumentos como un arreglo, llama al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">arguments</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$arguments = \$this-&gt;arguments();
</code></pre>

<p>Las opciones pueden ser recuperadas con tanta facilidad como argumentos utilizando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">option</span>. Para recuperar todas las opciones como un arreglo, llama al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">options</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Retrieve a specific option...
\$queueName = \$this-&gt;option('queue');

// Retrieve all options...
\$options = \$this-&gt;options();
</code></pre>

<p>Si el argumento o la opción no existe, será retornado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>.</p>

<h3># Solicitud de entrada</h3>
<p>Además de mostrar salidas, puedes también pedir al usuario que proporcione información durante la
    ejecución del comando. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ask</span> le indicará al usuario la pregunta dada,
    aceptará su entrada, y luego devolverá la entrada del usuario a tu comando:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Execute the console command.
*
* @return mixed
*/
public function handle()
{
    \$name = \$this-&gt;ask('What is your name?');
}
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secret</span> es similar a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ask</span>, pero la entrada del usuario no será
    visible para ellos cuando la escriban en la consola. Este método es útil cuando se solicita
    información confidencial tal como una contraseña:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$password = \$this-&gt;secret('What is the password?');
</code></pre>

<h4># Pedir confirmación</h4>
<p>Si necesitas pedirle al usuario una simple confirmación, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">confirm</span>. Por defecto, este método devolverá <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>. Sin embargo, si el
    usuario ingresa <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">y</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">yes</span> en respuesta a la solicitud, el método
    devolverá <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>if (\$this-&gt;confirm('Do you wish to continue?')) {
    //
}
</code></pre>

<h4># Autocompletado</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">anticipate</span> puede ser usado para proporcionar autocompletado para posibles
    opciones. El usuario aún puede elegir cualquier respuesta, independientemente de las sugerencias
    de autocompletado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$this-&gt;anticipate('What is your name?', ['Taylor', 'Dayle']);
</code></pre>

<h4># Preguntas de selección múltiple</h4>
<p>Si necesitas darle al usuario un conjunto de opciones predefinadas, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">choice</span>.
    Puedes establecer el índice del valor predeterminado del arreglo que se devolverá si no se
    escoge ninguna opción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$name = \$this-&gt;choice('What is your name?', ['Taylor', 'Dayle'], \$defaultIndex);
</code></pre>


<h3># Escritura de salida</h3>
<p>Para enviar datos de salida a la consola, usa los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">line</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">info</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">comment</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">question</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">error</span>. Cada uno de estos métodos
    usará colores ANSI apropiados para su propósito. Por ejemplo, vamos a mostrar alguna información
    general al usuario. Normalmente, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">info</span> se mostrará en la consola como
    texto verde:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Execute the console command.
*
* @return mixed
*/
public function handle()
{
    \$this-&gt;info('Display this on the screen');
}
</code></pre>

<p>Para mostrar un mensaje de error, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">error</span>. El texto del mensaje de error
    es típicamente mostrado en rojo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;error('Something went wrong!');
</code></pre>

<p>Si desea mostrar la salida de consola sin color, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">line</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;line('Display this on the screen');
</code></pre>

<h4># Diseños de tabla</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">table</span> hace que sea fácil formatear correctamente varias filas / columnas
    de datos. Simplemente pasa los encabezados y filas al método. El ancho y la altura se calcularán
    dinámicamente en función de los datos dados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$headers = ['Name', 'Email'];

\$users = App\User::all(['name', 'email'])-&gt;toArray();

\$this-&gt;table(\$headers, \$users);
</code></pre>

<h4># Barras de progreso</h4>
<p>Para tareas de larga ejecución, podría ser útil mostrar un indicador de progreso. Usando el
    objeto de salida, podemos iniciar, avanzar y detener la Barra de Progreso. Primero, define el
    número total de pasos por los que el proceso pasará. Luego, avanza la barra de progreso después
    de procesar cada elemento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$users = App\User::all();

\$bar = \$this-&gt;output-&gt;createProgressBar(count(\$users));

\$bar-&gt;start();

foreach (\$users as \$user) {
    \$this-&gt;performTask(\$user);

    \$bar-&gt;advance();
}

\$bar-&gt;finish();
</code></pre>

<p>
    Para opciones más avanzadas, verifica la

    documentación del componente Progress Bar de Symfony


    .
</p>

<h2>Registro de comandos</h2>
<p>Debido a la llamada al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">load</span> en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">commands</span> del kernel de
    tu consola, todos los comandos dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Console/Commands</span> se
    registrarán automáticamente con Artisan. De hecho, puedes realizar llamadas adicionales al
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">load</span> para escanear otros directorios en busca de comandos Artisan:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Register the commands for the application.
*
* @return void
*/
protected function commands()
{
    \$this-&gt;load(__DIR__.'/Commands');
    \$this-&gt;load(__DIR__.'/MoreCommands');

    // ...
}
</code></pre>

<p>También puedes registrar comandos manualmente agregando su nombre de clase en la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$commands</span>
    de tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Console/Kernel.php</span>. Cuando Artisan arranca, todos los comandos
    listados en esta propiedad serán resueltos por el contenedor de servicios y serán registrados
    con Artisan:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>protected \$commands = [
    Commands\SendEmails::class
];
</code></pre>


<h2>Ejecución de comandos de forma programática</h2>
<p>En ocasiones, es posible que desees ejecutar un comando de Artisan fuera de la interfaz de línea
    de comandos (CLI). Por ejemplo, puedes desear ejecutar un comando Artisan de una ruta o
    controlador. Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Artisan</span> para
    lograr esto. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span> acepta el nombre o la clase del comando como primer
    argumento y un arreglo de parámetros del comando como segundo argumento. El código de salida
    será devuelto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/foo', function () {
    \$exitspan = Artisan::call('email:send', [
        'user' =&gt; 1, '--queue' =&gt; 'default'
    ]);

    //
});
</code></pre>

<p>Alternativamente, puedes pasar todo el comando de Artisan para el metodo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span> como
    una cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Artisan::call('email:send 1 --queue=default');
</code></pre>

<p>Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span> en el facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Artisan</span>, puedes incluso poner en
    cola comandos Artisan para ser procesados en segundo plano por tus queue workers. Antes de usar
    este método, asegurate que tengas configurado tu cola y se esté ejecutando un oyente de cola
    (queue listener):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/foo', function () {
    Artisan::queue('email:send', [
        'user' =&gt; 1, '--queue' =&gt; 'default'
    ]);

    //
});
</code></pre>

<p>También puedes especificar la conexión o cola a la que debes enviar el comando Artisan:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Artisan::queue('email:send', [
    'user' =&gt; 1, '--queue' =&gt; 'default'
])-&gt;onConnection('redis')-&gt;onQueue('commands');
</code></pre>

<h4># Pasando valores de tipo arreglo</h4>
<p>Si tu comando define una opción que acepta un arreglo, puedes pasar un arreglo de valores a la
    opción:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/foo', function () {
    \$exitspan = Artisan::call('email:send', [
        'user' =&gt; 1, '--id' =&gt; [5, 13]
    ]);
});
</code></pre>

<h4># Pasando valores booleanos</h4>
<p>Si necesitas especificar el valor de una opción que no acepta valores de tipo cadena, tal como la
    opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--force</span> en el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate:refresh</span>, debes pasar
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$exitspan = Artisan::call('migrate:refresh', [
    '--force' =&gt; true,
]);
</code></pre>


<h3># Llamando comandos desde otros comandos</h3>
<p>Algunas veces puedes desear llamar otros comandos desde un comando Artisan existente. Puedes
    hacerlo usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span>. Este método acepta el nombre del comando y un
    arreglo de parámetros del comando:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Execute the console command.
*
* @return mixed
*/
public function handle()
{
    \$this-&gt;call('email:send', [
        'user' =&gt; 1, '--queue' =&gt; 'default'
    ]);

    //
}
</code></pre>

<p>Si deseas llamar a otro comando de consola y eliminar toda su salida, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">callSilent</span>. Este método tiene la misma firma que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$this-&gt;callSilent('email:send', [
    'user' =&gt; 1, '--queue' =&gt; 'default'
]);
</code></pre>
</div>
""";