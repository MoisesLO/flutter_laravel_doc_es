import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FrConfiguracion extends StatelessWidget {
  final String title;
  FrConfiguracion(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFrConfiguracion,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFrConfiguracion = """
<div style='font-size: 14.2px;'>
<h1>Configuración Regional</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Configurando la configuración regional</li>
        </ul>
    </li>
    <li>
        Definiendo cadenas de traducciones
        <ul>
            <li>Usando claves cortas</li>
            <li>Usando cadenas de traducciones como claves</li>
        </ul>
    </li>
    <li>
        Retornando cadenas de traducciones
        <ul>
            <li>Reemplazando parametros en cadenas de traducciones</li>
            <li>Pluralización</li>
        </ul>
    </li>
    <li>Sobrescribiendo archivos del paquete de idioma</li>
</ul>

<h2>Introducción</h2>
<p>Las características de configuración regional de Laravel proporcionan una forma conveniente de
    retornar cadenas en varios idiomas, permitiéndote soportar fácilmente múltiples idiomas en tu
    aplicación. Las cadenas de idiomas son almacenadas en archivos dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang</span>.
    Dentro de este directorio debería haber un subdirectorio para cada idioma soportado por la
    aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/resources
    /lang
        /en
            messages.php
        /es
            messages.php
</code></pre>

<p>Todos los archivos de idioma retornan un arreglo de cadenas con sus claves. Por ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

return [
    'welcome' =&gt; 'Welcome to our application'
];
</code></pre>


<h3># Configurando la configuración regional</h3>
<p>El idioma por defecto para tu aplicación se almacena en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>.
    Puedes modificar este valor en base a las necesidades de tu aplicación. También puedes cambiar
    el idioma activo en tiempo de ejecución usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">setLocale</span> en el facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Route::get('welcome/{locale}', function (\$locale) {
    App::setLocale(\$locale);

    //
});
</code></pre>

<p>Puedes configurar un "idioma alternativo", que será usado cuando el idioma activo no contiene una
    determinada cadena de traducción. Al igual que el idioma por defecto, el idioma alternativo
    también es configurado en el archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'fallback_locale' =&gt; 'en',
</code></pre>

<h4># Determinando la configuración regional actual</h4>
<p>Puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">getLocale</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isLocale</span> en el facade
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App</span> para determinar la configuración regional actual o comprobar si la
    configuración tiene un valor dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$locale = App::getLocale();

if (App::isLocale('en')) {
    //
}
</code></pre>


<h2>Definiendo cadenades de traducciones</h2>

<h3># Usando claves cortas</h3>
<p>Típicamente, las cadenas de traducciones son almacenadas en archivos dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang</span>.
    Dentro de este directorio debería haber un directorio para cada idioma soportado por la
    aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>/resources
    /lang
        /en
            messages.php
        /es
            messages.php
</code></pre>

<p>Todos los archivos de idioma retornan un arreglo de cadenas con sus claves. Por ejemplo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;?php

// resources/lang/en/messages.php

return [
    'welcome' =&gt; 'Welcome to our application'
];
</code></pre>


<h3># Usando cadenas de traducciones como claves</h3>
<p>Para aplicaciones con grandes necesidades de traducción, definir cada cadena con una "clave
    corta" puede volverse confuso rápidamente al hacer referencia a estas en tus vistas. Por este
    motivo, Laravel también proporciona soporte para definir cadenas de traducciones usando la
    traducción "por defecto" de la cadena como clave.</p>
<p>Archivos de traducción que usan cadenas de traducción como claves son almacenados como archivos
    JSON en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang</span>. Por ejemplo, si tu aplicación tiene una
    traducción en español, debes crear un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang/es.json</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>{
    "I love programming.": "Me encanta programar."
}
</code></pre>


<h2>Retornando cadenas de traducciones</h2>
<p>Puedes retornar líneas desde archivos de idioma usando la función helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__</span>. La
    función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__</span> acepta el archivo y la clave de la cadena de traducción como primer
    argumento. Por ejemplo, vamos a retornar la cadena de traducción de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">welcome</span> desde
    el archivo de idioma <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang/messages.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo __('messages.welcome');

echo __('I love programming.');
</code></pre>

<p>
    Si estás usando el
    motor de plantillas Blade
    , puedes usar la sintaxis <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">{{ }}</span> para imprimir la cadena de traducción o usar la
    directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@lang</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>{{ __('messages.welcome') }}

@lang('messages.welcome')
</code></pre>

<p>Si la cadena de traducción especificada no existe, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__</span> retornará la clave
    de la cadena de traducción. Así que, usando el ejemplo superior, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__</span>
    retornaría <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">messages.welcome</span> si la cadena de traducción no existe.</p>

<p>Nota</p>
<p>La directiva <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">@lang</span> no escapa ningún resultado. Eres <strong>totalmente
    responsable</strong> de escapar la salida al usar esta directiva.</p>



<h3># Reemplazando parametros en cadenas de traducciones</h3>
<p>Si lo deseas, puedes definir placeholders en tus cadenas de traducción. Todos los placeholders
    son precedidos por <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:</span>. Por ejemplo, puedes definir un mensaje de bienvenida con un
    nombre como placeholder:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'welcome' =&gt; 'Welcome, :name',
</code></pre>

<p>Para reemplazar los placeholders al retornar una cadena de traducción, pasa un arreglo de
    reemplazos como segundo argumento de la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo __('messages.welcome', ['name' =&gt; 'dayle']);
</code></pre>

<p>Si tu placeholder contiene sólo letras mayúsculas o sólo tiene su primera letra en mayúscula, el
    valor traducido será escrito en mayúsculas de forma correcta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'welcome' =&gt; 'Welcome, :NAME', // Welcome, DAYLE
'goodbye' =&gt; 'Goodbye, :Name', // Goodbye, Dayle
</code></pre>


<h3># Pluralización</h3>
<p>La pluralización es un problema complejo, ya que diferentes idiomas tienen una variedad de reglas
    complejas de pluralización. Usando el símbolo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">|</span>, puedes distinguir entre las formas
    singulares y plurales de una cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'apples' =&gt; 'There is one apple|There are many apples',
</code></pre>

<p>Puedes incluso crear reglas de pluralización más complejas que especifican cadenas de traducción
    para múltiples rangos de números:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'apples' =&gt; '{0} There are none|[1,19] There are some|[20,*] There are many',
</code></pre>

<p>Luego de definir una cadena de traducción que tiene opciones de pluralización, puedes usar la
    función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans_choice</span> para retornar la línea de un "conteo" dado. En este ejemplo,
    dado que el conteo es mayor que uno, la forma plural de la cadena de traducción es retornada:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo trans_choice('messages.apples', 10);
</code></pre>

<p>También puedes definir atributos de placeholder en cadenas de pluralización. Estos placeholders
    pueden ser reemplazados pasando un arreglo como tercer argumento a la función
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans_choice</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'minutes_ago' =&gt; '{1} :value minute ago|[2,*] :value minutes ago',

echo trans_choice('time.minutes_ago', 5, ['value' =&gt; 5]);
</code></pre>

<p>Si te gustaría mostrar el valor entero que fue pasado a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans_choice</span>,
    puedes también usar el placeholder <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">:count</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>'apples' =&gt; '{0} There are none|{1} There is one|[2,*] There are :count',
</code></pre>


<h2>Sobrescribiendo archivos del paquete de idioma</h2>
<p>Algunos paquetes pueden venir con sus propios archivos de idioma. En lugar de cambiar los
    archivos principales del paquete para modificar esas líneas, puedes sobrescribirlas colocando
    archivos en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang/vendor/{package}/{locale}</span>.</p>
<p>Así que, por ejemplo, si necesitas sobrescribir las cadenas de traducción en inglés en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">messages.php</span>
    para un paquete llamado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">skyrim/hearthfire</span>, debes colocar un archivo de idioma en:
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/lang/vendor/hearthfire/en/messages.php</span>. Dentro de este archivo, debes
    sólo definir las cadenas de traducción que deseas sobrescribir. Cualquier cadena de traducción
    que no sobrescribas será cargada desde los archivos de idioma originales del paquete.</p>
    </div>
""";