import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FuVistas extends StatelessWidget {
  final String title;
  FuVistas(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFuVistas,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFuVistas = """
<div style='font-size: 14.2px;'>
<h1>Vistas</h1>
<ul>
    <li>Creando vistas</li>
    <li>
        Pasando datos a las vistas
        <ul>
            <li>Compartiendo datos con todas las vistas</li>
        </ul>
    </li>
    <li>View Composers</li>
</ul>
<p></p>
<h2>Creando vistas</h2>

<p>TIP</p>
<p>
    Para buscar más información sobre ¿Cómo escribir plantillas de Blade? Revisa la
    documentación de Blade
    completa para comenzar.
</p>


<p>Las vistas contienen el HTML servido por tu aplicación y separa la lógica de tu
    controlador/aplicación de la lógica de presentación. Las vistas son almacenadas en el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views</span>.
    Una vista sencilla podría lucir de esta forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- View stored in resources/views/greeting.blade.php --&gt;

&lt;html&gt;
    &lt;body&gt;
        &lt;h1&gt;Hello, {{ \$name }}&lt;/h1&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p>Ya que esta vista es almacenada en <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/greeting.blade.php</span>,
    podemos devolverla usando el helper global <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>,
    de la siguiente forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('/', function () {
    return view('greeting', ['name' =&gt; 'James']);
});
</code></pre>

<p>Como puedes ver, el primer argumento pasado al helper <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>
    corresponde al nombre del archivo de la vista en el directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views</span>.
    El segundo argumento es un arreglo de datos que debería estar disponible para la vista. En este
    caso, estamos pasando la variable <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span>,
    la cual es mostrada en la vista usando la sintaxis de Blade.</p>
<p>Las vistas también pueden estar anidadas dentro de sub-directorios del directorio <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views</span>.
    La notación de "Punto" puede ser usada para referenciar vistas anidadas. Por ejemplo, si tu
    vista está almacenada en <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/admin/profile.blade.php</span>,
    puedes hacer referencia a esta de la siguiente forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return view('admin.profile', \$data);
</code></pre>

<h4>Determinando si una vista existe</h4>
<p>Si necesitas determinar si una vista existe, puedes usar la clase facade <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">View</span>. El
    método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">exists</span>
    devolverá <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>
    si la vista existe:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\View;

if (View::exists('emails.customer')) {
    //
}
</code></pre>

<h4>Creando la primera vista disponible</h4>
<p>Usando el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first</span>,
    puedes crear la primera vista que existe en un arreglo de vistas dado. Esto es útil si tu
    aplicación o paquete permite que las vistas sean personalizadas o sobrescritas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return view()-&gt;first(['custom.admin', 'admin'], \$data);
</code></pre>

<p>También puedes ejecutar este método por medio de la clase facade <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">View</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\View;

return View::first(['custom.admin', 'admin'], \$data);
</code></pre>

<p></p>
<h2>Pasando datos a las vistas</h2>
<p>Como viste en los ejemplos previos, puedes pasar un arreglo de datos a las vistas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return view('greetings', ['name' =&gt; 'Victoria']);
</code></pre>

<p>Al momento de pasar información de esta manera, los datos deberían ser un arreglo con pares clave
    / valor. Dentro de tu vista, entonces puedes acceder a cada valor usando su clave
    correspondiente, tal como <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">&lt;?php echo \$key; ?&gt;</span>.
    Como una alternativa a pasar un arreglo completo de datos a la función helper <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>,
    puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>
    para agregar partes individuales de datos a la vista:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return view('greeting')-&gt;with('name', 'Victoria');
</code></pre>

<p></p>
<h4>Compartiendo datos con todas las vistas</h4>
<p>Ocasionalmente, puedes necesitar compartir una pieza de datos con todas las vistas que son
    renderizadas por tu aplicación. Puedes hacer eso usando el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">share</span>
    de la clase facade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">View</span>.
    Típicamente, deberías colocar las ejecuciones a <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">share</span>
    dentro del método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span>
    de un proveedor de servicio. Eres libre de agregarlos al <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>
    o generar un proveedor de servicio diferente para alojarlos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\View;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Bootstrap any application services.
    *
    * @return void
    */
    public function boot()
    {
        View::share('key', 'value');
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

<p></p>
<h2>View Composers</h2>
<p>Los view composers son funciones de retorno o métodos de clase que son ejecutados cuando una
    vista es renderizada. Si tienes datos que quieres que estén enlazados a una vista cada vez que
    la vista es renderizada, un view composer puede ayudarte a organizar esa lógica dentro de una
    sola ubicación.</p>
<p>Para este ejemplo, vamos a registrar los View Composers dentro de un proveedor de servicio.
    Usaremos la clase facade <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">View</span>
    para acceder a la implementación de contrato <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Contracts\View\Factory</span>
    subyacente. Recuerda, Laravel no incluye un directorio predeterminado para los View Composers.
    Eres libre de organizarlos del modo que desees. Por ejemplo, podrías crear un directorio <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/View/Composers</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;

class ComposerServiceProvider extends ServiceProvider
{
    /**
    * Register bindings in the container.
    *
    * @return void
    */
    public function boot()
    {
        // Using class based composers...
        View::composer(
            'profile', 'App\Http\View\Composers\ProfileComposer'
        );

        // Using Closure based composers...
        View::composer('dashboard', function (\$view) {
            //
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


<p>Nota</p>
<p>Recuerda, si creas un nuevo proveedor de servicio para contener tus registros de View Composers,
    necesitarás agregar el proveedor de servicio al arreglo <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">providers</span>
    en el archivo de configuración <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>.
</p>

<p>Ahora que hemos registrado el Composer, el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ProfileComposer@compose</span>
    será ejecutado cada vez que la vista <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">profile</span>
    esté siendo renderizada. Así que, vamos a definir la clase composer:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Http\View\Composers;

use Illuminate\View\View;
use App\Repositories\UserRepository;

class ProfileComposer
{
    /**
    * The user repository implementation.
    *
    * @var UserRepository
    */
    protected \$users;

    /**
    * Create a new profile composer.
    *
    * @param  UserRepository  \$users
    * @return void
    */
    public function __construct(UserRepository \$users)
    {
        // Dependencies automatically resolved by service container...
        \$this-&gt;users = \$users;
    }

    /**
    * Bind data to the view.
    *
    * @param  View  \$view
    * @return void
    */
    public function compose(View \$view)
    {
        \$view-&gt;with('count', \$this-&gt;users-&gt;count());
    }
}
</code></pre>

<p>Justo antes de que la vista sea renderizada, el método <span
        style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">compose</span>
    del Composer es ejecutado con la instancia <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\View\View</span>.
    Puedes usar el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span>
    para enlazar datos a la vista.</p>

<p>TIP</p>
<p>Todos los View Composers son resueltos por medio del contenedor de servicio, de modo que puedas
    colocar la referencia a cualquiera de las dependencias que necesites dentro de un constructor
    del Composer.</p>

<h4>Adjuntando un composer a múltiples vistas</h4>
<p>Puedes adjuntar un View Composer a múltiples vistas de una vez al pasar un arreglo de vistas como
    primer argumento del método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>View::composer(
    ['profile', 'dashboard'],
    'App\Http\View\Composers\MyViewComposer'
);
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer</span>
    también acepta el caracter <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">*</span> como
    un comodín, permitiendo que adjuntes un Composer a todas las vistas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>View::composer('*', function (\$view) {
    //
});
</code></pre>

<h4>View Creators</h4>
<p><strong>View Creators</strong> (creadores de vistas) son muy similares a los View Composers; sin
    embargo, son ejecutados inmediatamente después de que la vista sea instanciada en lugar de
    esperar hasta que la vista sea renderizada. Para registrar un View Creator, usa el método <span
            style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">creator</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>View::creator('profile', 'App\Http\View\Creators\ProfileCreator');
</code></pre>
</div>
""";