import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrColas extends StatelessWidget {
  final String title;
  PrColas(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrColas,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrColas = """
<div style='font-size: 14.2px;'>
<h1>Colas De Trabajo</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Conexiones vs. colas</li>
            <li>Notas y requisitos previos de driver</li>
        </ul>
    </li>
    <li>
        Creación de trabajos
        <ul>
            <li>Generación de clases de trabajos</li>
            <li>Estructura de clases</li>
        </ul>
    </li>
    <li>
        Despachar trabajos
        <ul>
            <li>Despacho postergado</li>
            <li>Envío sincrónico</li>
            <li>Encadenamiento de trabajos</li>
            <li>Personalizar la Cola y conexión</li>
            <li>Especificar intentos máximos de trabajos / valores de timeout</li>
            <li>Límites de rango</li>
            <li>Manejo de errores</li>
        </ul>
    </li>
    <li>Closures de dolas</li>
    <li>
        Ejecutar el worker de cola
        <ul>
            <li>Prioridades en cola</li>
            <li>Workers de cola y despliegue</li>
            <li>Expiraciones de trabajo y tiempos de espera</li>
        </ul>
    </li>
    <li>Configuración de Supervisor</li>
    <li>
        Manejo de trabajos fallidos
        <ul>
            <li>Remediando trabajos fallidos</li>
            <li>Eventos de trabajos fallidos</li>
            <li>Reintentando trabajos fallidos</li>
            <li>Ignorando modelos faltantes</li>
        </ul>
    </li>
    <li>Eventos de trabajo</li>
</ul>

<h2>Introducción</h2>

<p>TIP</p>
<p>
    Laravel ahora ofrece Horizon, un hermoso tablero y sistema de configuración para las colas
    motorizadas por Redis. Entra en
    Horizon documentation
    para más inormación.
</p>


<p>Las colas de Laravel brindan una API unificada a través de una variedad de backends de cola
    diferentes como Beanstalk, Amazon SQS, Redis, o incluso una base de datos relacional. Las colas
    permiten diferir el procesamiento de una tarea que consume tiempo, como enviar un correo
    electrónico, para un momento posterior. Diferir estas tareas acelera drásticamente las
    solicitudes web en tu aplicación.</p>
<p>
    La configuración de cola está almacenada en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/queue.php</span>. En este archivo
    encontrarás configuraciones de conexión para cada driver de cola incluido en el framework, que
    comprende una base de datos,

    Beanstalkd


    ,

    Amazon SQS


    ,

    Redis


    , y un controlador sincrónico que ejecutará trabajos inmediatamente (para uso local). Un driver
    de cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span> también está incluido, que descarta los trabajos completados de la
    cola.
</p>

<h3># Conexiones vs. colas</h3>
<p>Antes de empezar con las colas de Laravel, es importante entender la distinción entre
    "conexiones" y "colas". En tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/queue.php</span>, hay una opción de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">connections</span>. Esta opción define una conexión particular a un servicio
    de backend como Amazon SQS, Beanstalk o Redis. Sin embargo, cualquier conexión de cola dada
    puede tener múltiples "colas" las cuales pueden ser considerarse como diferentes pilas de
    trabajos en espera.</p>
<p>Ten en cuenta que cada ejemplo de configuración de conexión en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span>
    contiene un atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span>. Ésta es la cola por defecto a la cual los trabajos
    serán despachados cuando son enviados a una conexión dada. En otras palabras, si despachas un
    trabajo sin definir explícitamente a cuál cola debe ser despachado, el trabajo será colocado en
    la cola definida en el atributo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span> de la configuración de conexión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// This job is sent to the default queue...
Job::dispatch();

// This job is sent to the "emails" queue...
Job::dispatch()-&gt;onQueue('emails');
</code></pre>

<p>Algunas aplicaciones quizá no necesiten nunca insertar trabajos en múltiples colas, prefiriendo
    en su lugar tener una cola simple. Sin embargo, empujar trabajos a múltiples colas puede ser
    especialmente útil para aplicaciones que deseen priorizar o segmentar el procesamiento de sus
    trabajos, puesto que el worker de cola de Laravel permite especificar cuáles colas deben ser
    procesadas de acuerdo a su prioridad. Por ejemplo, si se insertan trabajos a una cola
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">high</span> se puede ejecutar un worker que les dé mayor prioridad de procesamiento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work --queue=high,default
</code></pre>


<h3># Notas y requisitos previos del driver</h3>
<h4># Base de datos</h4>
<p>Para utilizar el driver de cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>, necesitarás una tabla de base de datos
    para mantener los trabajos. Para generar una migración que crea esta tabla, ejecute el comando
    Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:table</span>. Una vez creada la migración, puede migrar la base de datos
    mediante el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:table

php artisan migrate
</code></pre>

<h4># Redis</h4>
<p>Para usar el controlador de cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span>, debes configurar una conexión a una base de
    datos Redis en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/database.php</span>.</p>
<p><strong>Redis Cluster</strong></p>
<p>
    Si tu conexión de cola Redis usa un Redis Cluster, tus nombres de cola deben contener un

    key hash tag


    . Esto es requerido para asegurar que todas las llaves Redis para una determinada cola sean
    colocadas en el mismo hash slot:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'redis' =&gt; [
    'driver' =&gt; 'redis',
    'connection' =&gt; 'default',
    'queue' =&gt; '{default}',
    'retry_after' =&gt; 90,
],
</code></pre>

<p><strong>Bloqueo</strong></p>
<p>Al usar la cola Redis, se puede usar la opción de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">block_for</span> para
    especificar por cuánto tiempo debería esperar el controlador para que un trabajo esté disponible
    antes de repetirse a través del bucle del worker y volver a consultar la base de datos Redis.
</p>
<p>Ajustar este valor en la carga de cola puede ser más eficiente que consultar continuamente la
    base de datos Redis buscando nuevos trabajos. Por ejemplo, puedes establecer el valor en
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">5</span> para indicar que el controlador debe bloquearse por cinco segundos mientras
    espera a que un trabajo esté disponible:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'redis' =&gt; [
    'driver' =&gt; 'redis',
    'connection' =&gt; 'default',
    'queue' =&gt; 'default',
    'retry_after' =&gt; 90,
    'block_for' =&gt; 5,
],
</code></pre>

<h4># Requisitos previos para otros controladores</h4>
<p>Las siguientes dependencias son necesarias para sus controladores respectivos:</p>
<ul>
    <li>Amazon SQS: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">aws/aws-sdk-php ~3.0</span></li>
    <li>Beanstalkd: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pda/pheanstalk ~4.0</span></li>
    <li>Redis: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">predis/predis ~1.0</span></li>
</ul>

<h2>Creación de trabajos</h2>

<h3># Generación de clases de trabajos</h3>
<p>Por defecto, todos los trabajos que se pueden poner en cola para la aplicación son almacenados en
    el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Jobs</span>. Si <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Jobs</span> no existe, será creado cuando se
    ejecute el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:job</span>. Puedes generar un nuevo trabajo en cola
    utilizando la CLI Artisan:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan make:job ProcessPodcast
</code></pre>

<p>La clase generada implementará la interfaz <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\Queue\ShouldQueue</span>,
    indicando a Laravel que el trabajo debe ser insertado a la cola de forma asíncrona.</p>

<h3># Estructura de clases</h3>
<p>Las clases de trabajo son muy sencillas, normalmente contienen un único método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> que se llama cuando la cola procesa el trabajo. Para empezar, echemos un
    vistazo a una clase de trabajo de ejemplo. En este ejemplo, vamos a pretender que administramos
    un servicio de publicación de podcasts y necesitamos procesar los archivos de podcast cargados
    antes de que se publiquen:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Jobs;

use App\Podcast;
use App\AudioProcessor;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;

class ProcessPodcast implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected \$podcast;

    /**
    * Create a new job instance.
    *
    * @param  Podcast  \$podcast
    * @return void
    */
    public function __construct(Podcast \$podcast)
    {
        \$this-&gt;podcast = \$podcast;
    }

    /**
    * Execute the job.
    *
    * @param  AudioProcessor  \$processor
    * @return void
    */
    public function handle(AudioProcessor \$processor)
    {
        // Process uploaded podcast...
    }
}
</code></pre>

<p>En este ejemplo, ten en cuenta que hemos podido pasar un modelo Eloquent directamente hacia el
    constructor del trabajo en cola. Debido al trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">SerializesModels</span> que el trabajo
    está usando, los modelos Eloquent serán serializados y deserializados correctamente cuando el
    trabajo se esté procesando. Si tu trabajo en cola acepta un modelo Eloquent en su constructor,
    sólo el identificador para el modelo será serializado en la cola. Cuando el trabajo se maneja
    realmente, el sistema de cola volverá a recuperar automáticamente la instancia del modelo
    completo de la base de datos. Todo es totalmente transparente a tu aplicación y previene
    inconvenientes que pueden surgir de serializar instancias Eloquent completas.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> es llamado cuando el trabajo es procesado por la cola. Ten en
    cuenta que podemos declarar el tipo de dependencias en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> del
    trabajo. El contenedor de servicios de Laravel automáticamente inyecta estas dependencias.</p>
<p>Si te gustaría tomar control sobre cómo el contenedor inyecta dependencias en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span>,
    puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bindMethod</span> del contenedor. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bindMethod</span>
    acepta una función de retorno (callback) que recibe el trabajo y el contenedor. Dentro del
    callback, eres libre de invocar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> de la forma que desees.
    Típicamente, deberías llamar a este método desde un proveedor de servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use App\Jobs\ProcessPodcast;

\$this-&gt;app-&gt;bindMethod(ProcessPodcast::class.'@handle', function (\$job, \$app) {
    return \$job-&gt;handle(\$app-&gt;make(AudioProcessor::class));
});
</code></pre>


<p>Nota</p>
<p>Los datos binarios, como los contenidos de imagen, deben ser pasados a través de la función
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">base64_enspan</span> antes de ser pasados a un trabajo en cola. De otra forma, el trabajo
    podría no serializarse correctamente a JSON cuando es colocado en la cola.</p>


<h2>Despachar trabajos</h2>
<p>Una vez escrita la clase de trabajo, se puede despachar usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dispatch</span> en
    el mismo trabajo. Los argumentos pasados a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dispatch</span> serán entregados al constructor
    de trabajos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Jobs\ProcessPodcast;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PodcastController extends Controller
{
    /**
    * Store a new podcast.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        // Create podcast...

        ProcessPodcast::dispatch(\$podcast);
    }
}
</code></pre>


<h3># Despacho postergado</h3>
<p>Si quieres postergar la ejecución de un trabajo en cola, puedes utilizar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delay</span> al despachar un trabajo. Por ejemplo, especifiquemos que un trabajo no
    debería estar disponible para procesamiento hasta 10 minutos después que haya sido despachado:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Jobs\ProcessPodcast;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PodcastController extends Controller
{
    /**
    * Store a new podcast.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        // Create podcast...

        ProcessPodcast::dispatch(\$podcast)
                -&gt;delay(now()-&gt;addMinutes(10));
    }
}
</code></pre>


<p>Nota</p>
<p>El servicio de cola Amazon SQS tiene un tiempo máximo de retraso de 15 minutos.</p>


<h3># Despacho sincrónico</h3>
<p>Si deseas enviar un trabajo inmediatamente (sincrónicamente), puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dispatchNow</span>.
    Al usar este método, el trabajo no se pondrá en cola y se ejecutará inmediatamente dentro del
    proceso actual:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Jobs\ProcessPodcast;
use App\Http\Controllers\Controller;

class PodcastController extends Controller
{
    /**
    * Store a new podcast.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        // Create podcast...

        ProcessPodcast::dispatchNow(\$podcast);
    }
}
</code></pre>


<h3># Encadenamiento de trabajos</h3>
<p>El encadenamiento de trabajos te permite especificar una lista de trabajos en cola que deben ser
    ejecutados en secuencia. Si un trabajo en la secuencia falla, el resto no será ejecutado. Para
    ejecutar una cadena de trabajos en cola, puedes utilizar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withChain</span> en
    cualquier trabajo a enviar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>ProcessPodcast::withChain([
    new OptimizePodcast,
    new ReleasePodcast
])-&gt;dispatch();
</code></pre>


<p>Nota</p>
<p>La eliminación de trabajos mediante el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$this-&gt;delete()</span> no impedirá que se
    procesen los trabajos encadenados. La cadena sólo dejará de ejecutarse si falla un trabajo en la
    cadena.</p>

<h4># Cola y conexión en cadena</h4>
<p>Si quieres especificar la cola y conexión por defecto que debe ser usada para los trabajos
    encadenados, se puede usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">allOnConnection</span> and <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">allOnQueue</span>.
    Estos métodos especifican la conexión y nombre de cola que debe ser usado a menos que el trabajo
    en cola sea asignado explícitamente a una diferente conexión / cola:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>ProcessPodcast::withChain([
    new OptimizePodcast,
    new ReleasePodcast
])-&gt;dispatch()-&gt;allOnConnection('redis')-&gt;allOnQueue('podcasts');
</code></pre>


<h3># Personalizar La Cola Y La Conexión</h3>
<h4># Despachar a una cola específica</h4>
<p>Al insertar trabajos en diferentes colas, puedes "categorizar" los trabajos en cola e incluso
    priorizar cuántos workers son asignados a las distintas colas. Sin embargo, es preciso resaltar
    que esto no inserta trabajos en diferentes "conexiones" de cola definidas en el archivo de
    configuración de colas, sino en colas específicas dentro de una sola conexión. Para especificar
    la cola, se usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onQueue</span> al despachar un trabajo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Jobs\ProcessPodcast;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PodcastController extends Controller
{
    /**
    * Store a new podcast.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        // Create podcast...

        ProcessPodcast::dispatch(\$podcast)-&gt;onQueue('processing');
    }
}
</code></pre>

<h4># Despachar a una conexión específica</h4>
<p>Si estás trabajando con múltiples conexiones de cola, puedes especificar en cuál conexión deseas
    insertar un trabajo. Para especificar la conexión, utiliza el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onConnection</span>
    al despachar el trabajo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\Controllers;

use App\Jobs\ProcessPodcast;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class PodcastController extends Controller
{
    /**
    * Store a new podcast.
    *
    * @param  Request  \$request
    * @return Response
    */
    public function store(Request \$request)
    {
        // Create podcast...

        ProcessPodcast::dispatch(\$podcast)-&gt;onConnection('sqs');
    }
}
</code></pre>

<p>Puedes encadenar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onConnection</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onQueue</span> para especificar la
    conexión y cola de un trabajo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>ProcessPodcast::dispatch(\$podcast)
                -&gt;onConnection('sqs')
                -&gt;onQueue('processing');
</code></pre>

<p>Alternativamente, puedes especificar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">connection</span> como una propiedad en la clase del
    trabajo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Jobs;

class ProcessPodcast implements ShouldQueue
{
    /**
        * The queue connection that should handle the job.
        *
        * @var string
        */
    public \$connection = 'sqs';
}
</code></pre>


<h3># Especificar intentos máximos de un trabajo y valores de tiempos de espera (timeout)</h3>
<h4># Número de intentos máximo</h4>
<p>Una forma de especificar el número máximo de veces que un trabajo puede ser intentado es mediante
    la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--tries</span> en la línea de comandos Artisan:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work --tries=3
</code></pre>

<p>Sin embargo, puedes tomar un camino más granular definiendo el número máximo de intentos dentro
    de la clase de trabajos. Si el número máximo de intentos está especificado en el trabajo,
    precederá sobre el valor provisto en la línea de comandos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Jobs;

class ProcessPodcast implements ShouldQueue
{
    /**
    * The number of times the job may be attempted.
    *
    * @var int
    */
    public \$tries = 5;
}
</code></pre>


<h4># Intentos basados en tiempo</h4>
<p>Como alternativa a definir cuántas veces un trabajo puede ser intentado antes de que falle,
    puedes definir en qué momento el trabajo debería pasar a tiempo de espera (timeout). Esto
    permite intentar un trabajo cualquier cantidad de veces dentro de un marco de tiempo dado. Para
    definir el momento en el que un trabajo debería pasar a timeout, se agrega un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retryUntil</span>
    en la clase de trabajos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Determine the time at which the job should timeout.
*
* @return \DateTime
*/
public function retryUntil()
{
    return now()-&gt;addSeconds(5);
}
</code></pre>


<p>TIP</p>
<p>También puedes definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retryUntil</span> en los listeners de eventos en cola.</p>

<h4># Tiempo de espera (timeout)</h4>

<p>Nota</p>
<p>La característica <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">timeout</span> está optimizada para PHP 7.1+ y la extensión
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pcntl</span>.</p>

<p>De igual modo, el número máximo de segundos para ejecutar un trabajo pueden ser especificados
    usando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--timeout</span> en la línea de comandos Artisan:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work --timeout=30
</code></pre>

<p>Sin embargo, es posible querer definir el número máximo de segundos para ejecutar un trabajo
    dentro de su clase. Si el timeout está especificado en el trabajo, prevalecerá sobre cualquier
    otro timeout especificado en la línea de comandos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Jobs;

class ProcessPodcast implements ShouldQueue
{
    /**
    * The number of seconds the job can run before timing out.
    *
    * @var int
    */
    public \$timeout = 120;
}
</code></pre>


<h3># Límite de rango</h3>

<p>Nota</p>
<p>Esta característica requiere que la aplicación pueda interactuar con un Redis server.</p>

<p>Si tu aplicación interactúa con Redis, puedes regular los trabajos en cola por tiempo o
    concurrencia. Esta característica puede ser de ayuda cuando los trabajos en cola interactúan con
    APIs que también poseen límite de frecuencia.</p>
<p>Por ejemplo, usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">throttle</span>, puedes regular cierto tipo de trabajo para
    que se ejecute sólo diez veces por minuto. Si no se puede obtener un bloqueo, normalmente debes
    liberar el trabajo de vuelta a la cola para que pueda volver a intentarlo más tarde:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Redis::throttle('key')-&gt;allow(10)-&gt;every(60)-&gt;then(function () {
    // Job logic...
}, function () {
    // Could not obtain lock...

    return \$this-&gt;release(10);
});
</code></pre>


<p>TIP</p>
<p>En el ejemplo anterior, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">key</span> puede ser cualquier cadena que identifique únicamente el
    tipo de trabajo que se quiere limitar. Por ejemplo, puedes desear construir la key basada en el
    nombre de clase del trabajo y las IDS de los modelos Eloquent en los cuáles opera.</p>


<p>Nota</p>
<p>Liberar un trabajo limitado de vuelta a la cola seguirá incrementando el número total de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">intentos</span>
    del trabajo.</p>

<p>Alternativamente, puedes especificar el número máximo de workers que pueden procesar
    simultáneamente un trabajo determinado. Esto puede ser útil cuando un trabajo en cola está
    modificando un recurso que solo debe ser modificado por un trabajo a la vez. Por ejemplo,
    utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">funnel</span>, puedes limitar los trabajos de un tipo dado para que
    solo sean procesados por un worker a la vez:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Redis::funnel('key')-&gt;limit(1)-&gt;then(function () {
    // Job logic...
}, function () {
    // Could not obtain lock...

    return \$this-&gt;release(10);
});
</code></pre>


<p>TIP</p>
<p>Al utilizar límite de frecuencias, el número de intentos que el trabajo necesitará para
    ejecutarse exitosamente puede ser difícil de determinar. Por lo tanto, es útil combinar límite
    de frecuencias con intentos basados en el tiempo.</p>


<h3># Manejo de errores</h3>
<p>Si una excepción es lanzada mientras el trabajo está siendo procesado, el trabajo será
    automáticamente liberado a la cola para que pueda ser intentado de nuevo. EL trabajo continuará
    siendo liberado hasta que haya sido intentado el número de veces máximo permitido por tu
    aplicación. El número máximo de intentos es definido por la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--tries</span> usada en
    el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span>. De forma alterna, el número máximo de intentos puede
    ser definido en la clase de trabajos en sí. Más información acerca de ejecutar el worker de cola
    se puede encontrar a continuación.</p>

<h2>Closures de colas</h2>
<p>En lugar de enviar una clase de trabajo a la cola, también puedes enviar una Closure. Esto es
    ideal para tareas rápidas y simples que deben ejecutarse fuera del ciclo de solicitud
    actual:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$podcast = App\Podcast::find(1);

dispatch(function () use (\$podcast) {
    \$podcast-&gt;publish();
});
</code></pre>

<p>Al enviar Closures a la cola, el contenido del código del Closure está firmado criptográficamente
    para que no se pueda modificar en tránsito.</p>

<h2>Ejecutar el worker de cola</h2>
<p>Laravel incluye un worker de cola que procesará trabajos nuevos a medida que éstos son insertados
    en la cola. Puedes ejecutar el worker usando el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span>. Ten en
    cuenta que una vez iniciado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span>, continuará ejecutándose hasta que sea
    detenido manualmente o hasta que la terminal sea cerrada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work
</code></pre>


<p>TIP</p>
<p>Para mantener el proceso <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span> ejecutado permanentemente en segundo plano,
    debes usar un monitor de procesos como Supervisor para asegurar que el worker de cola no deja de
    ejecutarse.</p>

<p>Recuerda, los workers en cola son procesos de larga duración y almacenan el estado de la
    aplicación iniciada en la memoria. Como resultado, no notarán cambios en la base de código
    después de que se han iniciado. Por lo tanto, durante el proceso de despliegue, asegúrate de
    reiniciar los workers de cola.</p>
<p>Alternativamente, puedes ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:listen</span>. Al usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:listen</span>,
    no tienes que reiniciar manualmente el worker luego de que tu código sea cambiado; sin embargo,
    este comando no es tan eficiente como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:listen
</code></pre>

<h4># Especificando la conexión y cola</h4>
<p>También puedes especificar qué conexión de cola debe utilizar el worker. El nombre de conexión
    pasado al comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">work</span> debe corresponder a una de las conexiones definidas en tu
    archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/queue.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work redis
</code></pre>

<p>Puedes personalizar tu worker de colas más allá al solo procesar colas particulares para una
    conexión dada. Por ejemplo, si todos tus correos electrónicos son procesados en una cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">emails</span>
    en tu cola de conexión <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span>, puedes emitir el siguiente comando para iniciar un
    worker que solo procesa dicha cola:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work redis --queue=emails
</code></pre>

<h4># Procesar un sólo trabajo</h4>
<p>La opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--once</span> puede ser usada para indicarle al worker procesar sólo un trabajo
    de la cola:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work --once
</code></pre>

<h4># Procesar todos los trabajos en cola y luego salir</h4>
<p>La opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--stop-when-empty</span> puede ser usada para indicarle al worker procesar todos
    los trabajos y luego salir elegantemente. Esta opción puede ser útil al trabajar colas de
    Laravel con un contenedor Docker si deseas desactivar el contenedor cuando la cola esté vacía:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work --stop-when-empty
</code></pre>

<h4># Consideraciones de recursos</h4>
<p>Los Daemon de workers de cola no "reinician" el framework antes de procesar cada trabajo. Por lo
    tanto, debes liberar cualquier recurso pesado luego de que cada trabajo sea completado. Por
    ejemplo, si estás realizando manipulación de imágenes con la librería GD, debes liberar la
    memoria cuando se termine con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">imagedestroy</span>.</p>

<h3># Prioridades de cola</h3>
<p>A veces puedes desear priorizar cómo se procesan las colas. Por ejemplo, en tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/queue.php</span>
    puedes establecer la <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue</span> predeterminada para tu conexión <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span> en
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">low</span>. Sin embargo, ocasionalmente puedes desear insertar un trabajo en una cola de
    prioridad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">high</span> de esta forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>dispatch((new Job)-&gt;onQueue('high'));
</code></pre>

<p>Para iniciar un worker que verifique que todos los trabajos en la cola <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">high</span> sean
    procesados antes de continuar con los tabajos en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">low</span>, pasa una lista de nombres de
    colas delimitada por comas al comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">work</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work --queue=high,low
</code></pre>


<h3># Workers de Cola y despliegue</h3>
<p>Debido a que los workers de cola son procesos de vida útil larga, no detectarán cambios en el
    código sin ser reiniciados. Así que la forma más sencilla de poner en producción una aplicación
    utilizando workers de cola es reiniciando los workers durante el proceso de despliegue. Puedes
    con elegancia reiniciar todos los workers ejecutando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:restart</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:restart
</code></pre>

<p>Este comando indicará a todos los workers de cola que "mueran" luego de terminar el procesamiento
    de su trabajo actual para que ningún trabajo existente se pierda. Como los workers de cola
    morirán cuando se ejecute el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:restart</span>, un administrador de procesos
    debe estar en ejecución, como Supervisor para reiniciar automáticamente los workers de la cola.
</p>

<p>TIP</p>
<p>La cola utiliza caché para almacenar señales de reinicio, por lo que debes verificar si un driver
    de caché está configurado debidamente en tu aplicación antes de utilizar esta
    característica.</p>


<h3># Expiraciones De Trabajo Y Tiempos De Espera</h3>
<h4># Expiración de trabajos</h4>
<p>En tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/queue.php</span>, cada conexión de cola define una
    opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry_after</span>. Esta opción especifica cuántos segundos debe esperar la
    conexión de cola antes de reintentar un trabajo que está siendo procesado. Por ejemplo, si el
    valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry_after</span> es establecido en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">90</span>, el trabajo será liberado de
    nuevo a la cola si se ha estado procesando por 90 segundos sin haber sido eliminado.
    Generalmente, debes fijar el valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry_after</span> al número máximo de segundos que
    le toma razonablemente a tus trabajos ser completamente procesados.</p>

<p>Nota</p>
<p>
    La única conexión de cola que no contiene un valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry_after</span> es Amazon SQS. SQS
    reintentará el trabajo basándose en el

    Default Visibility Timeout


    que es administrado dentro de la consola de AWS.
</p>

<h4># Worker timeouts</h4>
<p>El comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span> expone una opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--timeout</span>. <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--timeout</span>
    especifica qué tanto el proceso maestro de cola de Laravel esperará antes de detener un worker
    de cola hijo que está procesando un trabajo. A veces un proceso de cola hijo puede "congelarse"
    por varias razones, como una llamada HTTP externa que no responde. La opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--timeout</span> remueve los procesos congelados que han excedido el tiempo límite
    especificado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work --timeout=60
</code></pre>

<p>La opción de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry_after</span> y la opción CLI <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--timeout</span> son
    diferentes, pero trabajan juntas para asegurar que los trabajos no se pierdan y que los trabajos
    se procesen exitosamente sólo una vez.</p>

<p>Nota</p>
<p>El valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--timeout</span> siempre debe ser al menos unos segundos menor que el valor de
    configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry_after</span>. Esto asegurará que un worker procesando un trabajo
    determinado siempre sea detenido antes que el trabajo se reintente. Si la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--timeout</span> es mayor al valor de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry_after</span>, los trabajos
    podrían ser procesados dos veces.</p>

<h4># Duración de descanso del worker</h4>
<p>Cuando hay trabajos disponibles en cola, el worker seguirá procesando trabajos sin retraso entre
    ellos. Sin embargo, la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sleep</span> determina por cuánto tiempo "dormirá" el worker
    si no hay nuevos trabajos disponibles. Mientras duerme, el worker no procesará trabajos nuevos -
    los trabajos serán procesados luego de que el worker despierte.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work --sleep=3
</code></pre>


<h2>Configuración De Supervisor</h2>
<h4># Instalar Supervisor</h4>
<p>Supervisor es un monitor de procesos para el sistema operativo Linux y reiniciará automáticamente
    tu proceso <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span> si éste falla. Para instalar Supervisor en Ubuntu, se puede
    usar el siguiente comando:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>sudo apt-get install supervisor
</code></pre>


<p>TIP</p>
<p>
    Si configurar Supervisor por ti mismo suena abrumador, considera usar

    Laravel Forge


    , el cual instalará y configurará Supervisor automáticamente para tus proyectos en Laravel.
</p>

<h4># Configurar Supervisor</h4>
<p>Los archivos de configuración de Supervisor están almacenados generalmente en el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">/etc/supervisor/conf.d</span>. Dentro de este directorio, puedes crear cualquier número de
    archivos de configuración que le instruyan a Supervisor cómo monitorear los procesos. Por
    ejemplo, creemos un archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">laravel-worker.conf</span> que inicie y
    monitoree el proceso <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /home/forge/app.com/artisan queue:work sqs --sleep=3 --tries=3
autostart=true
autorestart=true
user=forge
numprocs=8
redirect_stderr=true
stdout_logfile=/home/forge/app.com/worker.log
</code></pre>

<p>En este ejemplo, la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">numprocs</span> le indicará a Supervisor ejecutar ocho
    procesos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span> y monitorearlos todos, reiniciándolos automáticamente si
    fallan. Debes cambiar la porción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work sqs</span> de la directiva
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">command</span> para reflejar la conexión de cola deseada.</p>
<h4># Iniciar Supervisor</h4>
<p>Una vez que el archivo de configuración haya sido creado, puedes actualizar la configuración de
    Supervisor e iniciar los procesos usando los siguientes comandos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>sudo supervisorctl reread

sudo supervisorctl update

sudo supervisorctl start laravel-worker:*
</code></pre>

<p>
    Para más información acerca de Supervisor, consulta

    la documentación de Supervisor


    .
</p>

<h2>Manejo de trabajos fallidos</h2>
<p>Algunas veces los trabajos en cola fallarán. Esto no es problema, ¡las cosas no siempre salen
    como esperamos! Laravel incluye una forma conveniente de especificar el número máximo de veces
    que un trabajo debe ser intentado. Luego que un trabajo haya excedido esta cantidad de intentos,
    será insertado en la tabla de base de datos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">failed_jobs</span>. Para crear una migración
    para la tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">failed_jobs</span> puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:failed-table</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:failed-table

php artisan migrate
</code></pre>

<p>Entonces, al ejecutar el worker de cola, debes especificar el número máximo de intentos que un
    trabajo debe intentarse usando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--tries</span> en el comando
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:work</span> Si no especificas un valor para <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--tries</span> los trabajos se
    intentarán indefinidamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work redis --tries=3
</code></pre>

<p>Adicionalmente, puedes especificar cuantos segundos debe esperar Laravel antes de volver a
    intentar un trabajo que ha fallado usando la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--delay</span>. Por defecto, un
    trabajo se vuelve a intentar inmediatamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:work redis --tries=3 --delay=3
</code></pre>

<p>Si te gustaría configurar la demora del trabajo fallido por cada trabajo, puedes hacerlo
    definiendo una propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retryAfter</span> en tu clase de cola de trabajos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* The number of seconds to wait before retrying the job.
*
* @var int
*/
public \$retryAfter = 3;
</code></pre>


<h3># Limpiar después de un trabajo fallido</h3>
<p>Se puede definir un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">failed</span> directamente en la clase de trabajo, permitiendo
    realizar una limpieza específica de trabajo cuando una falla ocurre. Esta es la ubicación
    perfecta para enviar una alerta a tus usuarios o revertir cualquier acción realizada por el
    trabajo. La <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Exception</span> que causó la falla en el trabajo será pasada al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">failed</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Jobs;

use Exception;
use App\Podcast;
use App\AudioProcessor;
use Illuminate\Bus\Queueable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;

class ProcessPodcast implements ShouldQueue
{
    use InteractsWithQueue, Queueable, SerializesModels;

    protected \$podcast;

    /**
    * Create a new job instance.
    *
    * @param  Podcast  \$podcast
    * @return void
    */
    public function __construct(Podcast \$podcast)
    {
        \$this-&gt;podcast = \$podcast;
    }

    /**
    * Execute the job.
    *
    * @param  AudioProcessor  \$processor
    * @return void
    */
    public function handle(AudioProcessor \$processor)
    {
        // Process uploaded podcast...
    }

    /**
    * The job failed to process.
    *
    * @param  Exception  \$exception
    * @return void
    */
    public function failed(Exception \$exception)
    {
        // Send user notification of failure, etc...
    }
}
</code></pre>


<h3># Eventos de trabajo fallido</h3>
<p>
    Si quieres registrar un evento para ser llamado cuando un trabajo falle, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Queue::failing</span>. Este evento representa una gran oportunidad para notificarle a tu
    equipo por correo electrónico o por

    Slack


    . Por ejemplo, puedes adjuntar una respuesta a este evento desde el
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span> incluido en Laravel:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\Queue;
use Illuminate\Queue\Events\JobFailed;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Register the service provider.
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
        Queue::failing(function (JobFailed \$event) {
            // \$event-&gt;connectionName
            // \$event-&gt;job
            // \$event-&gt;exception
        });
    }
}
</code></pre>


<h3># Reintentando trabajos fallidos</h3>
<p>Para visualizar todos los trabajos fallidos insertados en la tabla de base de datos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">failed_jobs</span>
    se puede usar el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:failed</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:failed
</code></pre>

<p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:failed</span> listará la ID del trabajo, su conexión, cola y el tiempo en
    el cual falló. La ID del trabajo puede ser usada para reintentar el trabajo fallido. Por
    ejemplo, para reintentar un trabajo fallido con una ID <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">5</span>, ejecuta el siguiente
    comando:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:retry 5
</code></pre>

<p>Para reintentar todos tus trabajos fallidos, ejecuta el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:retry</span> y pasa
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all</span> como ID:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:retry all
</code></pre>

<p>Si deseas borrar un trabajo fallido, puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:forget</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:forget 5
</code></pre>

<p>Para eliminar todos los trabajos fallidos, puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">queue:flush</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan queue:flush
</code></pre>


<h3># Ignorando modelos faltantes</h3>
<p>Cuando inyectas un modelo Eloquent en un trabajo, se serializa automáticamente antes de colocarlo
    en la cola y se restaura cuando se procesa el trabajo. Sin embargo, si el modelo ha sido
    eliminado mientras el trabajo estaba esperando a ser procesado por un trabajador, tu trabajo
    puede fallar con la excepción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ModelNotFoundException</span>.</p>
<p>Por conveniencia, puedes elegir eliminar automáticamente los trabajos con modelos faltantes
    configurando la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleteWhenMissingModels</span> de tu trabajo en
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Delete the job if its models no longer exist.
*
* @var bool
*/
public \$deleteWhenMissingModels = true;
</code></pre>


<h2>Eventos de trabajo</h2>
<p>Usando los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">after</span> en la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Queue</span>,
    puedes especificar funciones de retorno (callbacks) para que sean ejecutadas antes o después de
    que un trabajo en cola sea procesado. Estas callbacks son una gran oportunidad para realizar
    registro adicional o incrementar estadísticas para un panel de control. Generalmente, debes
    llamar a estos métodos desde un proveedor de servicios. Por ejemplo puedes usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>,
    incluido en Laravel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\Queue;
use Illuminate\Support\ServiceProvider;
use Illuminate\Queue\Events\JobProcessed;
use Illuminate\Queue\Events\JobProcessing;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Bootstrap any application services.
    *
    * @return void
    */
    public function boot()
    {
        Queue::before(function (JobProcessing \$event) {
            // \$event-&gt;connectionName
            // \$event-&gt;job
            // \$event-&gt;job-&gt;payload()
        });

        Queue::after(function (JobProcessed \$event) {
            // \$event-&gt;connectionName
            // \$event-&gt;job
            // \$event-&gt;job-&gt;payload()
        });
    }

    /**
    * Register the service provider.
    *
    * @return void
    */
    public function register()
    {
        //
    }
}
</code></pre>

<p>Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">looping</span> en la facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Queue</span>, puedes especificar
    funciones de retorno (callbacks) que se ejecuten antes que el worker intente recuperar un
    trabajo de una cola. Por ejemplo, quizás necesites registrar una Closure para deshacer cualquier
    transacción abierta por un trabajo fallido anteriormente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Queue::looping(function () {
    while (DB::transactionLevel() &gt; 0) {
        DB::rollBack();
    }
});
</code></pre>
</div>
""";