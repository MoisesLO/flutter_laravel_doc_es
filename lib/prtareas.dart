import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrTareas extends StatelessWidget {
  final String title;
  PrTareas(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrTareas,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrTareas = """
<div style='font-size: 14.2px;'>
<h1>Programación de tareas</h1>
<ul>
    <li>Introducción</li>
    <li>
        Definición de programaciones
        <ul>
            <li>Programando comandos de Artisan</li>
            <li>Programando trabajos en cola</li>
            <li>Programando comandos de shell</li>
            <li>Programando opciones de frecuencias</li>
            <li>Zonas Horarias</li>
            <li>Previniendo superposición de tareas</li>
            <li>Ejecutando tareas en un servidor</li>
            <li>Tareas en segundo plano</li>
            <li>Modo de mantenimiento</li>
        </ul>
    </li>
    <li>Resultado de la Tarea</li>
    <li>Hooks de tareas</li>
</ul>

<h2>Introducción</h2>
<p>En el pasado, es posible que hayas generado una entrada Cron para cada tarea que necesitabas
    programar en su servidor. Sin embargo, esto puede convertirse rápidamente en un sufrimiento,
    dado que tu programación de tareas no está en el control de versiones y debes hacer SSH a tu
    servidor para agregar entradas Cron adicionales.</p>
<p>El programador de comandos de Laravel te permite definir tu programación de comandos de forma
    fluída y expresiva dentro de Laravel. Al usar el programador, una sola entrada Cron es necesaria
    en tu servidor. Tu programación de tareas es definida en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">schedule</span> del
    archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Console/Kernel.php</span>. Para ayudarte a comenzar, un ejemplo sencillo está
    definido dentro del método.</p>
<h3># Iniciando el programador</h3>
<p>
    Al usar el programador, sólo necesitas agregar la siguiente entrada Cron a tu servidor. Si no
    sabes cómo agregar entradas Cron a tu servidor, considera usar un servicio como

    Laravel Forge


    que puede administrar las entradas Cron por ti:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>* * * * * php /path-to-your-project/artisan schedule:run &gt;&gt; /dev/null 2&gt;&amp;1
</code></pre>

<p>Este Cron llamará al programador de tareas de Laravel cada minuto. Cuando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">schedule:run</span>
    es ejecutado, Laravel evaluará tus tareas programadas y ejecutará las tareas pendientes.</p>

<h2>Definición de programaciones</h2>
<p>Puedes definir todas tus tareas programadas en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">schedule</span> de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Console\Kernel</span>.
    Para empezar, veamos un ejemplo de programación de una tarea. En este ejemplo, programaremos una
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> que será llamada cada día a medianoche. Dentro de la <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span>
    ejecutaremos un consulta a la base de datos para vaciar una tabla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Console;

use Illuminate\Support\Facades\DB;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
    * The Artisan commands provided by your application.
    *
    * @var array
    */
    protected \$commands = [
        //
    ];

    /**
    * Define the application's command schedule.
    *
    * @param  \Illuminate\Console\Scheduling\Schedule  \$schedule
    * @return void
    */
    protected function schedule(Schedule \$schedule)
    {
        \$schedule-&gt;call(function () {
            DB::table('recent_users')-&gt;delete();
        })-&gt;daily();
    }
}
</code></pre>

<p>
    Además de programar usando Closures, también puedes usar

    objetos invocables


    . Los objetos invocables son clases PHP sencillas que contienen un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__invoke</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;call(new DeleteRecentUsers)-&gt;daily();
</code></pre>


<h3># Programando comandos de artisan</h3>
<p>
    Además de programador llamadas a Closures, también puedes programar
    comandos de Artisan
    y comandos del sistema operativo. Por ejemplo, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">command</span> para
    programar un comando de Artisan usando ya sea el nombre del comando o de la clase:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send Taylor --force')-&gt;daily();

\$schedule-&gt;command(EmailsCommand::class, ['Taylor', '--force'])-&gt;daily();
</code></pre>


<h3># Programando trabajos en colas</h3>
<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">job</span> puede ser usado para programar
    un trabajo en cola
    . Este método proporciona una forma conveniente de programar trabajos sin usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">call</span>
    para crear Closures de forma manual para agregar el trabajo a la cola:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;job(new Heartbeat)-&gt;everyFiveMinutes();

// Dispatch the job to the "heartbeats" queue...
\$schedule-&gt;job(new Heartbeat, 'heartbeats')-&gt;everyFiveMinutes();
</code></pre>


<h3># Programando comandos de shell</h3>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exec</span> puede ser usado para emitir un comando al sistema operativo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;exec('node /home/forge/script.js')-&gt;daily();
</code></pre>


<h3># Programando opciones de frecuencias</h3>
<p>Hay una variedad de programaciones que puedes asignar a tu tarea:</p>
<table>
    <thead>
    <tr>
        <th>Método</th>
        <th>Descripción</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;cron('* * * * * *');</span></td>
        <td>Ejecuta la tarea en una programación Cron personalizada</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;everyMinute();</span></td>
        <td>Ejecuta la tarea cada minuto</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;everyFiveMinutes();</span></td>
        <td>Ejecuta la tarea cada cinco minutos</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;everyTenMinutes();</span></td>
        <td>Ejecuta la tarea cada diez minutos</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;everyFifteenMinutes();</span></td>
        <td>Ejecuta la tarea cada quince minutos</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;everyThirtyMinutes();</span></td>
        <td>Ejecuta la tarea cada treinta minutos</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;hourly();</span></td>
        <td>Ejecuta la tarea cada hora</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;hourlyAt(17);</span></td>
        <td>Ejecuta la tarea cada hora en el minuto 17</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;daily();</span></td>
        <td>Ejecuta la tarea cada día a la medianoche</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;dailyAt('13:00');</span></td>
        <td>Ejecuta la tarea cada día a las 13:00</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;twiceDaily(1, 13);</span></td>
        <td>Ejecuta la tarea cada día a las 1:00 y a las 13:00</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;weekly();</span></td>
        <td>Ejecuta la tarea cada semana</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;weeklyOn(1, '8:00');</span></td>
        <td>Ejecuta a tarea cada semana los lunes a las 8:00</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;monthly();</span></td>
        <td>Ejecuta la tarea cada mes</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;monthlyOn(4, '15:00');</span></td>
        <td>Ejecuta la tarea el 4 de cada mes a las 15:00</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;quarterly();</span></td>
        <td>Ejecuta la tarea cada trimestre</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;yearly();</span></td>
        <td>Ejecuta la tarea cada año</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;timezone('America/New_York');</span></td>
        <td>Establece la zona horaria</td>
    </tr>
    </tbody>
</table>
<p>Estos métodos pueden ser combinados con restricciones adicionales para crear programaciones más
    ajustadas que sólo se ejecutan en determinados días de la semana. Por ejemplo, para programar un
    comando para que sea ejecutado los lunes:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Ejecuta una vez por semana los martes a la 1 PM...
\$schedule-&gt;call(function () {
    //
})-&gt;weekly()-&gt;mondays()-&gt;at('13:00');

// Ejecuta cada hora de 8 AM a 5 PM los días laborales...
\$schedule-&gt;command('foo')
            -&gt;weekdays()
            -&gt;hourly() method
            -&gt;timezone('America/Chicago')
            -&gt;between('8:00', '17:00');
</code></pre>

<p>A continuación hay una lista de restricciones de programación adicionales:</p>
<table>
    <thead>
    <tr>
        <th>Method</th>
        <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;weekdays();</span></td>
        <td>Limita la tarea a los días laborales</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;weekends();</span></td>
        <td>Limita la tarea a los fines de semana</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;sundays();</span></td>
        <td>Limita la tarea a los domingos</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;mondays();</span></td>
        <td>Limita la tarea a los lunes</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;tuesdays();</span></td>
        <td>Limita la tarea los martes</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;wednesdays();</span></td>
        <td>Limita la tarea a los miércoles</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;thursdays();</span></td>
        <td>Limita la tarea a los jueves</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;fridays();</span></td>
        <td>Limita la tarea a los viernes</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;saturdays();</span></td>
        <td>Limita la tarea a los sábados</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;between(\$start, \$end);</span></td>
        <td>Limita la tarea para ser ejecutado entre \$start y \$end</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;when(Closure);</span></td>
        <td>Limita la tarea dependiendo de una prueba de veracidad</td>
    </tr>
    <tr>
        <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">-&gt;environments(\$env);</span></td>
        <td>Limita la tarea a ambientes específicos</td>
    </tr>
    </tbody>
</table>
<h4># Restricciones de tiempo between</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">between</span> puede ser usado para limitar la ejecución de una tarea dependiendo
    de la hora del día:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('reminders:send')
                    -&gt;hourly()
                    -&gt;between('7:00', '22:00');
</code></pre>

<p>De forma similar, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unlessBetween</span> puede ser usado para excluir la ejecución
    de una tarea por un periodo de tiempo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('reminders:send')
                    -&gt;hourly()
                    -&gt;unlessBetween('23:00', '4:00');
</code></pre>

<h4># Restricciones de veracidad</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span> puede ser usado para limitar la ejecución de una tarea en base al
    resultado de un test de veracidad dado. En otras palabras, si la <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> dada
    retorna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>, la tarea será ejecutada siempre y cuando ninguna otra restricción
    prevenga que la tarea de ser ejecutada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')-&gt;daily()-&gt;when(function () {
    return true;
});
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">skip</span> puede ser visto como el inverso de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span>. Si el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">skip</span> retorna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>, la tarea programada no será ejecutada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')-&gt;daily()-&gt;skip(function () {
    return true;
});
</code></pre>

<p>Al usar métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span> encadenados, el comando programado sólo será ejecutado si todas
    las condiciones <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span> retornan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>.</p>
<h4># Restricciones de entorno</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">environments</span> se puede utilizar para ejecutar tareas sólo en los entornos
    dados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')
            -&gt;daily()
            -&gt;environments(['staging', 'production']);
</code></pre>


<h3># Zonas horarias</h3>
<p>Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">timezone</span>, puedes especificar que el tiempo de una tarea programada
    debe ser interpretada en una zona horaria dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('report:generate')
            -&gt;timezone('America/New_York')
            -&gt;at('02:00')
</code></pre>

<p>Si estás asignando la misma zona horaria a todas tus tareas programadas, puedes desear definir un
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">scheduleTimezone</span> en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Console/Kernel.php</span>. Este
    método debería retornar la zona horaria por defecto que debe ser asignada a todas las tareas
    programadas.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/**
* Get the timezone that should be used by default for scheduled events.
*
* @return \DateTimeZone|string|null
*/
protected function scheduleTimezone()
{
    return 'America/Chicago';
}
</code></pre>


<p>Nota</p>
<p>Recuerda que algunas zonas horarias usan horario de verano. Cuando ocurren cambios por horario de
    verano, tu tarea programada puede ejecutarse dos veces o puede no ser ejecutada. Por esto,
    recomendamos evitar programación con zona horaria en la medida de lo posible.</p>



<h3># Previniendo superposición de tareas</h3>
<p>Por defecto, las tareas programadas serán ejecutadas incluso si la instancia anterior de la tarea
    todavía está en ejecución. Para evitar esto, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withoutOverlapping</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')-&gt;withoutOverlapping();
</code></pre>

<p>En este ejemplo, el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">emails:send</span> será ejecutado cada minuto si ya
    no está siendo ejecutado. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withoutOverlapping</span> es especialmente útil si
    tienes tareas que varían drásticamente en su tiempo de ejecución, evitando que puedas predecir
    exactamente cuánto tiempo tomará una tarea.</p>
<p>Si es necesario, puedes especificar cuántos minutos deben pasar antes de que el bloqueo "sin
    superposición" expire. Por defecto, el bloqueo expirará luego de 24 horas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')-&gt;withoutOverlapping(10);
</code></pre>


<h3># Ejecutando tareas en un servidor</h3>

<p>Nota</p>
<p>Para utilizar esta característica, tu aplicación debe estar usando el controlador de caché <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">memcached</span>
    o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redis</span> como predeterminado. Además, todos los servidores deben comunicarse al
    mismo servidor central de caché.</p>

<p>Si tu aplicación está siendo ejecutada en múltiples servidores, puedes limitar un trabajo
    programado a sólo ejecutarse en un servidor. Por ejemplo, asume que se tiene una tarea
    programada que genera un reporte nuevo cada viernes en la noche. Si el programador de tareas
    está siendo ejecutado en tres servidores de worker, la tarea programada se ejecutará en todos y
    generará el reporte tres veces. ¡No es bueno!</p>
<p>Para indicar que la tarea debe ejecutarse sólo en un servidor, usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onOneServer</span> al definir la tarea programada. El primer servidor en obtener la tarea
    asegurará un bloqueo atómico en el trabajo para prevenir que otros servidores ejecuten la misma
    tarea al mismo tiempo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('report:generate')
                -&gt;fridays()
                -&gt;at('17:00')
                -&gt;onOneServer();
</code></pre>


<h3># Tareas en segundo plano</h3>
<p>Por defcto, múltiples comandos programados al mismo tiempo se ejecutarán secuencialmente. Si
    tienes comandos de ejecución larga, esto puede causar que los siguientes comandos sean
    ejecutados mucho más tarde que lo esperado. Si deseas ejecutar comandos en segundo plano para
    que todos funcionen de forma simultánea, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">runInBackground</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('analytics:report')
         -&gt;daily()
         -&gt;runInBackground();
</code></pre>


<p>Nota</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">runInBackground</span> sólo puede ser usado al programar tareas mediante los
    métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">command</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exec</span>.</p>


<h3># Modo de mantenimiento</h3>
<p>Las tareas programadas de Laravel no serán ejecutadas cuando Laravel está en modo de
    mantenimiento, dado que no queremos que tus tareas interfieran con cualquier mantenimiento
    inacabado que puedes estar realizando en tu servidor. Sin embargo, si quieres forzar la
    ejecución de una tarea incluso en modo de mantenimiento, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">evenInMaintenanceMode</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')-&gt;evenInMaintenanceMode();
</code></pre>


<h2>Resultado de la tarea</h2>
<p>El programador de Laravel proporciona múltiples métodos convenientes para trabajar con el
    resultado generado por una tarea programada. Primero, usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sendOutputTo</span>,
    puedes enviar el resultado a un archivo para una inspección posterior:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')
         -&gt;daily()
         -&gt;sendOutputTo(\$filePath);
</code></pre>

<p>Si quieres agregar el resultado a un archivo dado, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">appendOutputTo</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')
         -&gt;daily()
         -&gt;appendOutputTo(\$filePath);
</code></pre>

<p>Usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">emailOutputTo</span>, puedes enviar el resultado a una dirección de correo
    electrónico de tu preferencia. Antes de enviar por correo electrónico el resultado de una tarea,
    debes configurar los servicios de correo electrónico de Laravel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('foo')
         -&gt;daily()
         -&gt;sendOutputTo(\$filePath)
         -&gt;emailOutputTo('foo@example.com');
</code></pre>

<p>Si solo quieres enviar el resultado por correo electrónico si el comando falla, usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">emailOutputOnFailure</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('foo')
         -&gt;daily()
         -&gt;emailOutputOnFailure('foo@example.com');
</code></pre>


<p>Nota</p>
<p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">emailOutputTo</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">emailOutputOnFailure</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sendOutputTo</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">appendOutputTo</span> son exclusivos para los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">command</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exec</span>.</p>


<h2>Hooks de tareas</h2>
<p>Usando los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">before</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">after</span>, puedes especificar código que será
    ejecutado antes y después de que la tarea programada sea completada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')
         -&gt;daily()
         -&gt;before(function () {
             // Task is about to start...
         })
         -&gt;after(function () {
             // Task is complete...
         });
</code></pre>

<p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onSuccess</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onFailure</span> te permiten especificar código a
    ejecutar si la tarea programada tiene éxito o falla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')
         -&gt;daily()
         -&gt;onSuccess(function () {
            // The task succeeded...
         })
         -&gt;onFailure(function () {
            // The task failed...
        });
</code></pre>

<h4># Haciendo ping a URLs</h4>
<p>
    Usando los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pingBefore</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">thenPing</span>, el programador de tareas
    puede automáticamente hacer ping a una URL dada antes o después de que una tarea sea completada.
    Este método es útil para notificar a un servicio externo, como

    Laravel Envoyer


    , que tu tarea programada está comenzando o ha finalizado su ejecución:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')
         -&gt;daily()
         -&gt;pingBefore(\$url)
         -&gt;thenPing(\$url);
</code></pre>

<p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pingBeforeIf</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">thenPingIf</span> pueden ser usados para hacer ping
    a una URL dada sólo si la condición dada es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')
         -&gt;daily()
         -&gt;pingBeforeIf(\$condition, \$url)
         -&gt;thenPingIf(\$condition, \$url);
</code></pre>

<p>Los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pingOnSuccess</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pingOnFailure</span> pueden ser usados para hacer
    ping a una URL dada sólo si la tarea tiene éxito o falla:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$schedule-&gt;command('emails:send')
          -&gt;daily()
          -&gt;pingOnSuccess(\$successUrl)
          -&gt;pingOnFailure(\$failureUrl);
</code></pre>

<p>Todos los métodos de ping requieren el paquete HTTP Guzzle. Puedes agregar Guzzle a tu proyecto
    usando el gestor de paquetes Composer:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>composer require guzzlehttp/guzzle
</code></pre>
</div>
""";