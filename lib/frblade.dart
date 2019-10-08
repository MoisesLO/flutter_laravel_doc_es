import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FrBlade extends StatelessWidget {
  final String title;
  FrBlade(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFrBlade,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFrBlade = """
<div style='font-size: 14.2px;'>
        <h1>Plantillas Blade</h1>
        <ul>
            <li>Introducción</li>
            <li>
                Herencia de plantillas
                <ul>
                    <li>Definir un layout</li>
                    <li>Extender un layout</li>
                </ul>
            </li>
            <li>Componentes y slots</li>
            <li>
                Mostrando datos
                <ul>
                    <li>Frameworks de Blade y JavaScript</li>
                </ul>
            </li>
            <li>
                Estructuras de control
                <ul>
                    <li>Sentencias if</li>
                    <li>Sentencias switch</li>
                    <li>Bucles</li>
                    <li>La variable loop</li>
                    <li>Comentarios</li>
                    <li>PHP</li>
                </ul>
            </li>
            <li>
                Formularios
                <ul>
                    <li>Campo CSRF</li>
                    <li>Campo method</li>
                    <li>Errores de validación</li>
                </ul>
            </li>
            <li>
                Incluyendo sub-vistas
                <ul>
                    <li>Renderizar vistas para colecciones</li>
                </ul>
            </li>
            <li>Stacks</li>
            <li>Inyeción de servicios</li>
            <li>
                Extendiendo Blade
                <ul>
                    <li>Sentencias if personalizadas</li>
                </ul>
            </li>
        </ul>
        
        <h2>Introducción</h2>
        <p>Blade es un motor de plantillas simple y a la vez poderoso proporcionado por Laravel. A diferencia de otros motores de plantillas populares de PHP, Blade no te impide utilizar código PHP plano en sus vistas. De hecho, todas las vistas de Blade son compiladas en código PHP plano y almacenadas en caché hasta que sean modificadas, lo que significa que Blade no añade sobrecarga a tu aplicación. Los archivos de las vistas de Blade tienen la extensión <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.blade.php</span> y son usualmente almacenados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views</span>.</p>
        
            <p >TIP</p>
            <p>
                En
                
                    Styde.net
                    
                
                contamos con una
                
                    completa lección sobre Blade
                    
                
                totalmente gratuita.
            </p>
        
    
    
    <h2>Herencia de plantillas</h2>
    
    <h3 ># Definir un layout</h3>
    <p>Dos de los principales beneficios de usar Blade son <em>la herencia de plantillas</em> y <em>secciones</em>. Para empezar, veamos un ejemplo simple. Primero, vamos a examinar una página de layout "master". Ya que la mayoría de las aplicaciones web mantienen el mismo layout general a través de varias páginas, es conveniente definir este layout como una sola vista de Blade:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- Almacenado en resources/views/layouts/app.blade.php --&gt;

&lt;html&gt;
    &lt;head&gt;
        &lt;title&gt;App Name - @yield('title')&lt;/title&gt;
    &lt;/head&gt;
    &lt;body&gt;
        @section('sidebar')
            This is the master sidebar.
        @show

        &lt;div class="container"&gt;
            @yield('content')
        &lt;/div&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>
    
    <p>Como puedes ver, este archivo contiene el marcado típico de HTML. Sin embargo, toma nota de las directivas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@section</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@yield</span>. La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@section</span>, como su nombre lo indica, define una sección de contenido, mientras que la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@yield</span> es utilizada para mostrar el contenido en una sección determinada.</p>
    <p>Ahora que hemos definido un layout para nuestra aplicación, vamos a definir una página hija que herede el layout.</p>
    
    <h3 ># Extender un layout</h3>
    <p>Al definir una vista hija, utiliza la directiva de Blade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@extends</span> para indicar el layout que deberá "heredarse" en la vista hija. Las vistas que extiendan un layout de Blade pueden inyectar contenido en la sección del layout usando la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@section</span>. Recuerda, como vimos en el ejemplo anterior, los contenidos de estas secciones se mostrarán en el layout usando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@yield</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- Almacenado en resources/views/child.blade.php --&gt;

@extends('layouts.app')

@section('title', 'Page Title')

@section('sidebar')
    @@parent

    &lt;p&gt;This is appended to the master sidebar.&lt;/p&gt;
@endsection

@section('content')
    &lt;p&gt;This is my body content.&lt;/p&gt;
@endsection
</code></pre>
    
    <p>En este ejemplo, la sección <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sidebar</span> está utilizando la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@@parent</span> para adjuntar (en lugar de sobrescribir) contenido al sidebar del layout. La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@@parent</span> será reemplazada por el contenido del layout cuando la vista sea renderizada.</p>
    
        <p >TIP</p>
        <p>Contrario al ejemplo anterior, esta sección <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sidebar</span> termina con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@endsection</span> en lugar de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@show</span>. La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@endsection</span> sólo definirá una sección mientras que <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@show</span> definirá y <strong>automáticamente creará un yield</strong> de la sección.</p>
    
    <p>La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@yield</span> también acepta un valor por defecto como segundo parametro. Este valor será renderizado si la sección siendo generada es undefined:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@yield('content', View::make('view.name'))
</code></pre>
    
    <p>Las vistas de Blade se pueden retornar desde las rutas usando el helper global <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('blade', function () {
    return view('child');
});
</code></pre>
    
    
        <p >TIP</p>
        <p>
            En
            
                Styde.net
                
                    
                    
                
            
            contamos con una
            
                lección sobre layouts con Blade
                
                    
                    
                
            
            totalmente gratuita.
        </p>
    
    
    <h2>Componentes y slots</h2>
    <p>Los componentes y slots proporcionan beneficios similares a secciones y layouts; sin embargo, algunos encontrarán el modelo mental de componentes y slots más fácil de comprender. Primero, imginemos un componente "alert" reutilizable que queremos que se reutilice en toda nuestra aplicación:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- /resources/views/alert.blade.php --&gt;

&lt;div class="alert alert-danger"&gt;
    {{ \$slot }}
&lt;/div&gt;
</code></pre>
    
    
        <p>La variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{{ \$slot }}</span> tendrá el contenido que deseamos inyectar en el componente. Ahora, para construir el componente, podemos usar la directiva de Blade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@component</span>:</p>
    
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('alert')
    &lt;strong&gt;Whoops!&lt;/strong&gt; Something went wrong!
@endcomponent
</code></pre>
    
    <p>Para instruir a Laravel para que cargue la primera vista que existe desde un arreglo de posibles vistas para el componente, puedes usar la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">componentFirst</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@componentFirst(['custom.alert', 'alert'])
    &lt;strong&gt;Whoops!&lt;/strong&gt; Something went wrong!
@endcomponent
</code></pre>
    
    <p>A veces es útil definir múltiples slots para un componente. Vamos a modificar nuestro componente alerta para permitir la inyección de un "título". Los slots nombrados podrán despegarse al hacer "echo" a la variable que coincida con sus nombres:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- /resources/views/alert.blade.php --&gt;

&lt;div class="alert alert-danger"&gt;
    &lt;div class="alert-title"&gt;{{ \$title }}&lt;/div&gt;

    {{ \$slot }}
&lt;/div&gt;
</code></pre>
    
    <p>Ahora, podemos inyectar contenido en el slot nombrado usando la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@slot</span>. Cualquier contenido que no esté en la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@slot</span> será pasado al componente en la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$slot</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('alert')
    @slot('title')
        Forbidden
    @endslot

    You are not allowed to access this resource!
@endcomponent
</code></pre>
    
    <h4 ># Pasando información adicional a los componentes</h4>
    <p>En ocasiones puedes necesitar pasar información adicional al componente. Por esta razón, puedes pasar un arreglo de información como segundo argumento a la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@component</span>. Toda la información se hará disponible para la plantilla del componente como variables:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@component('alert', ['foo' =&gt; 'bar'])
    ...
@endcomponent
</code></pre>
    
    <h4 ># Agregando alias a componentes</h4>
    <p>Si tus componentes de Blade están almacenados en un subdirectorio, puedes querer agregarles un alias para tener un acceso más fácil. Por ejemplo, imagina un componente de Blade que está almacenado en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/components/alert.blade.php</span>. Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">component</span> para agregar un alias al componente de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">components.alert</span> a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">alert</span>. Típicamente, esto debe ser realizado en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Blade;

Blade::component('components.alert', 'alert');
</code></pre>
    
    <p>Una vez que el alias ha sido agregado al componente, puedes renderizarlo usando una directiva:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@alert(['type' =&gt; 'danger'])
    You are not allowed to access this resource!
@endalert
</code></pre>
    
    <p>Puedes omitir los parametros del componente si este no tiene slots adicionales:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@alert
    You are not allowed to access this resource!
@endalert
</code></pre>
    
    
    <h2>Mostrando datos</h2>
    <p>Puedes mostrar datos pasados a tu vista de Blade al envolver la variable entre llaves. Por ejemplo, dada la siguiente ruta:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('greeting', function () {
    return view('welcome', ['name' =&gt; 'Samantha']);
});
</code></pre>
    
    <p>Puedes mostrar el contenido de la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">name</span> de la siguiente manera:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>Hello, {{ \$name }}.
</code></pre>
    
    <p>No estás limitado a mostrar sólo el contenido de las variables pasadas a la vista. También puedes hacer echo al resultado de cualquier función de PHP. De hecho, puedes poner cualquier código PHP que desees dentro de la declaración echo de Blade:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>The current UNIX timestamp is {{ time() }}.
</code></pre>
    
    
        
            <p >TIP</p>
            <p>Las declaraciones de Blade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{{ }}</span> son enviadas automáticamente mediante la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">htmlspecialchars</span> de PHP para prevenir ataques XSS.</p>
        
    
    <h4 ># Mostrar datos no escapados</h4>
    
        <p>De manera predeterminada, las declaraciónes <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{{ }}</span> de Blade son enviadas mediante la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">htmlspecialchars</span> de PHP para prevenir ataques XSS. Si no deseas que tu información sea escapada, puedes utilizar la siguiente sintáxis:</p>
    
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>Hello, {!! \$name !!}.
</code></pre>
    
    
        <p >Nota</p>
        <p>Se muy cuidadoso cuando muestres contenido que sea suministrado por los usuarios de tu aplicación. Usa siempre las sentencias escapadas, ya que éstas previenen ataques XSS cuando se muestran datos suministrados por los usuarios.</p>
    
    <h4 ># Renderizar JSON</h4>
    <p>En ocasiones puedes pasar un arreglo a tu vista con la intención de renderizarla como JSON para inicializar una variable JavaScript. Por ejemplo:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;script&gt;
    var app = &lt;?php echo json_enspan(\$array); ?&gt;;
&lt;/script&gt;
</code></pre>
    
    <p>Sin embargo, en lugar de llamar manualmente a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">json_enspan</span>, puedes usar la directiva de Blade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@json</span>. La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@json</span> acepta los mismos argumentos que la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">json_enspan</span> de PHP:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;script&gt;
    var app = @json(\$array);
    var app = @json(\$array, JSON_PRETTY_PRINT);
&lt;/script&gt;
</code></pre>
    
    
        <p >Nota</p>
        <p>Sólo debes usar la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@json</span> para renderizar variables existentes como JSON. Las plantillas Blade están basadas en expresiones regulares e intentar pasar una expresión compleja a la directiva podría causar fallos inesperados.</p>
    
    <p>La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@json</span> es también útil para trabajar con componentes de Vue o atributos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data-*</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;example-component :some-prop='@json(\$array)'&gt;&lt;/example-component&gt;
</code></pre>
    
    
        <p >Nota</p>
        <p>El uso de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@json</span> en atributos de elementos requiere que esté rodeado por comillas simples.</p>
    
    <h4 ># Codificación de entidades HTML</h4>
    <p>Por defecto, Blade (y el helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">e</span> de Laravel) codificarán doblemente las entidades HTML. Si te gustaría deshabilitar la codificación doble, llama al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Blade::withoutDoubleEncoding</span> desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Bootstrap any application services.
    *
    * @return void
    */
    public function boot()
    {
        Blade::withoutDoubleEncoding();
    }
}
</code></pre>
    
    
    <h3 ># Frameworks de Blade Y JavaScript</h3>
    <p>Dado que muchos frameworks de JavaScript también usan llaves para indicar que una expresión dada debe mostrarse en el navegador, puedes utilizar el símbolo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@</span> para informar al motor de renderizado de Blade que una expresión debe permanecer intacta. Por ejemplo:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;h1&gt;Laravel&lt;/h1&gt;

Hello, @{{ name }}.
</code></pre>
    
    <p>En este ejemplo, el símbolo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@</span> será removido por Blade; sin embargo, la expresión <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"></span> permanecerá intacta por el motor de Blade, lo que permitirá que pueda ser procesada por tu framework de JavaScript.</p>
    <h4 ># La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@verbatim</span></h4>
    <p>Si estás mostrando variables de JavaScript en una gran parte de tu plantilla, puedes ajustar el HTML en la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@verbatim</span> para que no tengas que poner un prefijo en cada instrucción echo de Blade con un símbolo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@verbatim
    &lt;div class="container"&gt;
        Hello, {{ name }}.
    &lt;/div&gt;
@endverbatim
</code></pre>
    
    
    <h2>Estructuras de control</h2>
    <p>Además de la herencia de plantillas y la visualización de datos, Blade también proporciona accesos directos y convenientes para las estructuras de control comunes de PHP, tales como sentencias condicionales y bucles. Estos accesos directos proporcionan una manera muy limpia y concisa de trabajar con estructuras de control de PHP, al tiempo que permanecen familiares para sus contrapartes de PHP.</p>
    
    <h3 ># Sentencias if</h3>
    <p>Puede construir sentencias <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">if</span> usando las directivas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@if</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@elseif</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@else</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@endif</span>. Estas directivas funcionan idénticamente a sus contrapartes PHP:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@if (count(\$records) === 1)
    I have one record!
@elseif (count(\$records) &gt; 1)
    I have multiple records!
@else
    I don't have any records!
@endif
</code></pre>
    
    <p>Por conveniencia, Blade también proporciona una directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@unless</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@unless (Auth::check())
    You are not signed in.
@endunless
</code></pre>
    
    <p>Además de las directivas condicionales previamente mencionadas, las directivas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@isset</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@empty</span> pueden ser usadas como accesos directos convenientes para sus respectivas funciones PHP:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@isset(\$records)
    // \$records is defined and is not null...
@endisset

@empty(\$records)
    // \$records is "empty"...
@endempty
</code></pre>
    
    <h4 ># Directivas de autenticación</h4>
    <p>Las directivas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@auth</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@guest</span> pueden ser utilizadas para determinar rápidamente si el usuario actual está autenticado o si es un invitado:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@auth
    // The user is authenticated...
@endauth

@guest
    // The user is not authenticated...
@endguest
</code></pre>
    
    <p>Si es necesario, puede especificar el guard de autenticación que debe verificarse al usar las directivas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@auth</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@guest</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@auth('admin')
    // The user is authenticated...
@endauth

@guest('admin')
    // The user is not authenticated...
@endguest
</code></pre>
    
    <h4 ># Directivas de sección</h4>
    <p>Puede verificar si una sección tiene contenido usando la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@hasSection</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@hasSection('navigation')
    &lt;div class="pull-right"&gt;
        @yield('navigation')
    &lt;/div&gt;

    &lt;div class="clearfix"&gt;&lt;/div&gt;
@endif
</code></pre>
    
    
    <h3 ># Sentencias switch</h3>
    <p>Las sentencias switch pueden ser construidas usando las directivas <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@switch</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@case</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@break</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@default</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@endswitch</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@switch(\$i)
    @case(1)
        First case...
        @break

    @case(2)
        Second case...
        @break

    @default
        Default case...
@endswitch
</code></pre>
    
    
    <h3 ># Bucles</h3>
    <p>Además de las sentencias condicionales, Blade proporciona directivas simples para trabajar con estructuras en bucle de PHP. De nuevo, cada una de estas directivas funciona idénticamente a sus contrapartes PHP:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@for (\$i = 0; \$i &lt; 10; \$i++)
    The current value is {{ \$i }}
@endfor

@foreach (\$users as \$user)
    &lt;p&gt;This is user {{ \$user-&gt;id }}&lt;/p&gt;
@endforeach

@forelse (\$users as \$user)
    &lt;li&gt;{{ \$user-&gt;name }}&lt;/li&gt;
@empty
    &lt;p&gt;No users&lt;/p&gt;
@endforelse

@while (true)
    &lt;p&gt;I'm looping forever.&lt;/p&gt;
@endwhile
</code></pre>
    
    
        <p >TIP</p>
        <p>Cuando estés dentro del bucle, puedes usar la variable loop para obtener información valiosa acerca del bucle, como puede ser saber si estás en la primera o última iteración a través del bucle.</p>
    
    <p>Al usar bucles puede finalizarlo u omitir la iteración actual:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@foreach (\$users as \$user)
    @if (\$user-&gt;type == 1)
        @continue
    @endif

    &lt;li&gt;{{ \$user-&gt;name }}&lt;/li&gt;

    @if (\$user-&gt;number == 5)
        @break
    @endif
@endforeach
</code></pre>
    
    <p>También puede incluir la condición con la declaración en una línea:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@foreach (\$users as \$user)
    @continue(\$user-&gt;type == 1)

    &lt;li&gt;{{ \$user-&gt;name }}&lt;/li&gt;

    @break(\$user-&gt;number == 5)
@endforeach
</code></pre>
    
    
    <h3 ># La variable loop</h3>
    <p>Al realizar un ciclo, una variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop</span> estará disponible dentro del ciclo. Esta variable proporciona acceso a un poco de información útil, como el índice del ciclo actual y si es la primera o la última iteración del ciclo:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@foreach (\$users as \$user)
    @if (\$loop-&gt;first)
        This is the first iteration.
    @endif

    @if (\$loop-&gt;last)
        This is the last iteration.
    @endif

    &lt;p&gt;This is user {{ \$user-&gt;id }}&lt;/p&gt;
@endforeach
</code></pre>
    
    <p>Si estás en un bucle anidado, puedes acceder a la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop</span> del bucle padre a través de la propiedad <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">parent</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@foreach (\$users as \$user)
    @foreach (\$user-&gt;posts as \$post)
        @if (\$loop-&gt;parent-&gt;first)
            This is first iteration of the parent loop.
        @endif
    @endforeach
@endforeach
</code></pre>
    
    <p>La variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop</span> también contiene una variedad de otras propiedades útiles:</p>
    <table>
        <thead>
        <tr>
            <th>Propiedad</th>
            <th>Descripción</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;index</span></td>
            <td>El índice de la iteración del ciclo actual (comienza en 0).</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;iteration</span></td>
            <td>Iteración del ciclo actual (comienza en 1).</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;remaining</span></td>
            <td>Iteraciones restantes en el ciclo.</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;count</span></td>
            <td>La cantidad total de elementos en el arreglo que se itera.</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;first</span></td>
            <td>Si esta es la primera iteración a través del ciclo.</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;last</span></td>
            <td>Si esta es la última iteración a través del ciclo.</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;even</span></td>
            <td>Si esta es una iteración par a través del ciclo.</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;odd</span></td>
            <td>Si esta es una iteración impar a través del ciclo.</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;depth</span></td>
            <td>El nivel de anidamiento del bucle actual.</td>
        </tr>
        <tr>
            <td><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$loop-&gt;parent</span></td>
            <td>Cuando está en un bucle anidado, la variable de bucle del padre.</td>
        </tr>
        </tbody>
    </table>
    
    <h3 ># Comentarios</h3>
    <p>Blade también le permite definir comentarios en sus vistas. Sin embargo, a diferencia de los comentarios HTML, los comentarios de Blade no son incluidos en el HTML retornado por la aplicación:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>{{-- This comment will not be present in the rendered HTML --}}
</code></pre>
    
    
    <h3 ># PHP</h3>
    <p>En algunas situaciones, es útil insertar código PHP en sus vistas. Puedes usar la directiva de Blade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@php</span> para ejecutar un bloque de PHP plano en tu plantilla:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@php
    //
@endphp
</code></pre>
    
    
        <p >TIP</p>
        <p>A pesar que Blade proporciona esta función, usarla con frecuencia puede ser una señal de que tienes demasiada lógica incrustada dentro de tu plantilla.</p>
    
    
    <h2>Formularios</h2>
    
    <h3 ># Campo CSRF</h3>
    <p>
        Cada vez que defines un formulario HTML en tu aplicación, debes incluir un campo de token CSRF oculto en el formulario para que
        
            el middleware de protección CSRF
            
                
                
            
        
        pueda validar la solicitud. Puedes usar la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@csrf</span> de Blade para generar el campo de token:
    </p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;form method="POST" action="/profile"&gt;
    @csrf

        ...
&lt;/form&gt;
</code></pre>
    
    
    <h3 ># Campo method</h3>
    <p>Dado que los formularios HTML no pueden hacer solicitudes <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PUT</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">PATCH</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DELETE</span> necesitarás agregar un campo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">_method</span> oculto para suplantar estos verbos HTTP. La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@method</span> de Blade puede crear este campo por ti:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;form action="/foo/bar" method="POST"&gt;
    @method('PUT')

        ...
&lt;/form&gt;
</code></pre>
    
    
    <h3 ># Errores de validación</h3>
    <p>La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@error</span> puede ser usada para comprobar rápidamente si existen mensajes de error de validación para un atributo dado. Para una directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@error</span>, puedes imprimir la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$message</span> para mostrar el mensaje de error:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- /resources/views/post/create.blade.php --&gt;
&lt;label for="title"&gt;Post Title&lt;/label&gt;
&lt;input id="title" type="text" class="@error('title') is-invalid @enderror"&gt;
@error('title')
    &lt;div class="alert alert-danger"&gt;{{ \$message }}&lt;/div&gt;
@enderror
</code></pre>
    
    <p>Puedes pasar el nombre de un error especifico como segundo parametro de la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@error</span> para retornar los mensajes de error en páginas que contienen múltiples formularios:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;!-- /resources/views/auth.blade.php --&gt;

&lt;label for="email"&gt;Email address&lt;/label&gt;

&lt;input id="email" type="email" class="@error('email', 'login') is-invalid @enderror"&gt;

@error('email', 'login')
    &lt;div class="alert alert-danger"&gt;{{ \$message }}&lt;/div&gt;
@enderror
</code></pre>
    
    
    <h2>Incluyendo sub-vistas</h2>
    <p>La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@include</span> de Blade te permite incluir una vista de Blade desde otra vista. Todas las variables que estén disponibles en la vista padre estarán disponibles para la vista incluida:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;div&gt;
    @include('shared.errors')

    &lt;form&gt;
        &lt;!-- Form Contents --&gt;
    &lt;/form&gt;
&lt;/div&gt;
</code></pre>
    
    <p>Aunque la vista incluida heredará todos los datos disponibles en la vista principal, también puedes pasar un arreglo de datos adicionales a la vista incluida:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@include('view.name', ['some' =&gt; 'data'])
</code></pre>
    
    <p>Si utiliza <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@include</span> en una vista que no existe, Laravel lanzará un error. Si desea incluir una vista que puede o no estar presente, deberá utilizar la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@includeIf</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@includeIf('view.name', ['some' =&gt; 'data'])
</code></pre>
    
    <p>Si desea incluir una vista dependiendo de una condición booleana dada, puedes utilizar la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@includeWhen</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@includeWhen(\$boolean, 'view.name', ['some' =&gt; 'data'])
</code></pre>
    
    <p>Para incluir la primera vista que exista para un arreglo dado de vistas, puedes usar la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@includeFirst</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@includeFirst(['custom.admin', 'admin'], ['some' =&gt; 'data'])
</code></pre>
    
    
        <p >Nota</p>
        <p>Debes evitar usar las constantes <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__DIR__</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__FILE__</span> en tus vistas de Blade, ya que se referirán a la ubicación de la vista compilada en caché.</p>
    
    <h4 ># Alias de includes</h4>
    <p>Si tus includes de Blade están almacenados en un subdirectorio, puedes desear crear un alias de ellos para un acceso más fácil. Por ejemplo, imagina un include de Blade que está almacenado en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/views/includes/input.blade.php</span> con el siguiente contenido:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;input type="{{ \$type ?? 'text' }}"&gt;
</code></pre>
    
    <p>Puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">include</span> para crear un alias al include de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">includes.input</span> a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">input</span>. Normalmente, esto debería hacerse en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Blade;

Blade::include('includes.input', 'input');
</code></pre>
    
    <p>Una vez que el include tiene un alias asignado, puedes renderizalo usando el nombre del alias como una directiva de Blade:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@input(['type' =&gt; 'email'])
</code></pre>
    
    
    <h3 ># Renderizar vistas para colecciones</h3>
    <p>Puedes combinar bucles e incluirlos en una sola línea con la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@each</span> de Blade:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@each('view.name', \$jobs, 'job')
</code></pre>
    
    <p>El primer argumento es la vista parcial a renderizar por cada elemento en el arreglo o colección. El segundo argumento es el arreglo o colección que desea iterar, mientras que el tercer argumento es el nombre de la variable que será asignada a la iteración actual dentro de la vista. Así que, por ejemplo, si está iterando en un arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">jobs</span>, típicamente querrá tener acceso a cada trabajo como una variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">job</span> en su vista parcial. La llave de la iteración actual estará disponible como la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">key</span> en su vista parcial.</p>
    <p>También puede pasar un cuarto argumento a la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@each</span>. Este argumento determina la vista que se va a renderizar si el arreglo dado está vacío.</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@each('view.name', \$jobs, 'job', 'view.empty')
</code></pre>
    
    
        <p >Nota</p>
        <p>Las vistas renderizadas via <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@each</span> no heredan las variables de la vista padre. Si la vista hija requiere de estas variables, deberá usar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@foreach</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@include</span> en su lugar.</p>
    
    
    <h2>Pilas</h2>
    <p>Blade te permite agregar a pilas nombradas que pueden ser renderizados en otra parte de otra vista o layout. Esto es particularmente útil para especificar cualquier librería JavaScript requerida por las vistas hijas:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@push('scripts')
    &lt;script src="/example.js"&gt;&lt;/script&gt;
@endpush
</code></pre>
    
    <p>Puede agregar una pila tantas veces como lo necesite. Para renderizar el contenido completo de la pila, pasa el nombre de la pila a la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@stack</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;head&gt;
    &lt;!-- Head Contents --&gt;

    @stack('scripts')
&lt;/head&gt;
</code></pre>
    
    <p>Si te gustaría agregar contenido al inicio de una pila, debes usar la directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@prepend</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@push('scripts')
    This will be second...
@endpush

// Luego...

@prepend('scripts')
    This will be first...
@endprepend
</code></pre>
    
    
    <h2>Inyeción de servicios</h2>
    <p>La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@inject</span> puede ser utilizada para recuperar un servicio del contenedor de servicios de Laravel. El primer argumento pasado a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@inject</span> es el nombre de la variable en la que se colocará el servicio, mientras que el segundo argumento es el nombre de la clase o interfaz del servicio que desea resolver:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@inject('metrics', 'App\Services\MetricsService')

&lt;div&gt;
    Monthly Revenue: {{ \$metrics-&gt;monthlyRevenue() }}.
&lt;/div&gt;
</code></pre>
    
    
    <h2>Extendiendo Blade</h2>
    <p>Blade le permite definir sus propias directivas personalizadas utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">directive</span>. Cuando el compilador Blade encuentra la directiva personalizada, llamará al callback con la expresión que contiene la directiva.</p>
    <p>El siguiente ejemplo crea una directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@datetime(\$var)</span> que le da formato a la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$var</span>, la cual es una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DateTime</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
    * Register bindings in the container.
    *
    * @return void
    */
    public function register()
    {
        Blade::directive('datetime', function (\$expression) {
            return "&lt;?php echo (\$expression)-&gt;format('m/d/Y H:i'); ?&gt;";
        });
        //
    }
    /**
    * Bootstrap any application services.
    *
    * @return void
    */
    public function boot()
    {
        //
        Blade::directive('datetime', function (\$expression) {
            return "&lt;?php echo (\$expression)-&gt;format('m/d/Y H:i'); ?&gt;";
        });
    }
}
</code></pre>
    
    <p>Como podrás ver, vamos a encadenar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">format</span> en cualquier expresión que se pase a la directiva. Entonces, en este ejemplo, el PHP final generado por esta directiva será:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php echo (\$var)-&gt;format('m/d/Y H:i'); ?&gt;
</code></pre>
    
    
        <p >Nota</p>
        <p>Después de actualizar la lógica de la directiva de Blade, vas a necesitar eliminar todas las vistas de Blade guardades en caché. Las vistas de Blade en caché pueden ser eliminadas con el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view:clear</span>.</p>
    
    
    <h3 ># Sentencias if personalizadas</h3>
    <p>Programar una directiva personalizada algunas veces es más complejo de lo necesario al definir sentencias condicionales simples personalizadas. Por esa razón, Blade proporciona un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Blade:if</span> que le permitirá rápidamente definir directivas condicionales utilizando Closures. Por ejemplo, vamos a definir una condicional personalizada que verifica el entorno actual de la aplicación. Podemos hacer esto en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Facades\Blade;

/**
* Perform post-registration booting of services.
*
* @return void
*/
public function boot()
{
    Blade::if('env', function (\$environment) {
        return app()-&gt;environment(\$environment);
    });
}
</code></pre>
    
    <p>Una vez que el condicional personalizado haya sido definido, podremos usarlo fácilmente en nuestros templates:</p>
    
    <pre style='background-color: #CFD8DC; color: #37474F;'><code>@env('local')
    // The application is in the local environment...
@elseenv('testing')
    // The application is in the testing environment...
@else
    // The application is not in the local or testing environment...
@endenv
</code></pre>
</div>
""";