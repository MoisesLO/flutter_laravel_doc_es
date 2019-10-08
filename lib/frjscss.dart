import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FrJsCss extends StatelessWidget {
  final String title;
  FrJsCss(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFrJsCss,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFrJsCss = """
<div style='font-size: 14.2px;'>
<h1>JavaScript y Estructuración de CSS</h1>
<ul>
    <li>Introducción</li>
    <li>Escribiendo CSS</li>
    <li>
        Escribiendo JavaScript
        <ul>
            <li>Escribiendo componentes de Vue</li>
            <li>Usando React</li>
        </ul>
    </li>
</ul>

<h2>Introducción</h2>
<p>
    Mientras Laravel no dicta la pauta sobre que pre-procesadores de JavaScript o CSS usar, si
    proporciona un punto de inicio básico usando

    Bootstrap


    y

    Vue


    que será de utilidad para muchas aplicaciones. De forma predeterminada, Laravel usa

    NPM


    para instalar ambos paquetes de frontend.
</p>
<h4># CSS</h4>
<p>
    Laravel Mix
    proporciona una clara y expresiva API sobre compilación de Sass o Less, las cuales son
    extensiones de CSS plano que agregan variables, mixins y otras poderosas características que
    hacen el trabajo con CSS mucho más divertido. En este documento, discutiremos brevemente la
    compilación CSS en general; sin embargo, deberías consultar la
    documentación de Laravel Mix
    completa para mayor información sobre compilación de Sass o Less.
</p>
<h4># JavaScript</h4>
<p>
    Laravel no requiere que uses un framework o biblioteca de JavaScript específica para construir
    tus aplicaciones. De hecho, no tienes que usar JavaScript en lo absoluto. Sin embargo, Laravel
    sí incluye algunas de las estructuras básicas para hacer más fácil los primeros pasos para
    escribir JavaScript moderno usando el framework

    Vue


    . Vue proporciona una API expresiva para construir aplicaciones de JavaScript robustas usando
    componentes. Como con CSS, podemos usar Laravel Mix para compilar fácilmente componentes de
    JavaScript en un único archivo de JavaScript para los eventos del navegador.
</p>
<h4># Removiendo la estructura del frontend</h4>
<p>Si prefieres remover la estructura del frontend de tu aplicación, puedes usar el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preset</span>. Este comando, cuando se combina con la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">none</span>, eliminará
    la maquetación de Bootstrap y Vue de tu aplicación, dejando solamente un archivo Sass en blanco
    y unas cuántas bibliotecas de utilidades de JavaScript comunes.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan preset none
</code></pre>


<h2>Escribiendo CSS</h2>
<p>El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span> de Laravel incluye el paquete <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bootstrap</span> que te
    ayuda a empezar a hacer un prototipo del frontend de tu aplicación usando Bootstrap. Sin
    embargo, siéntete libre de agregar o eliminar los paquetes del archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span>
    como sea necesario para tu aplicación. No es obligatorio que uses el framework Bootstrap para
    construir tu aplicación de Laravel - se proporciona un buen punto de inicio para aquellos que
    elijan usarlo.</p>
<p>
    Antes de compilar tu CSS, instala las dependencias de frontend de tu proyecto usando el

    gestor de paquetes para Node (NPM)


    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm install
</code></pre>

<p>
    Una vez que las dependencias hayan sido instaladas usando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm install</span>, puedes
    compilar tus archivos Sass a CSS plano usando
    Laravel Mix
    . El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run dev</span> procesará las instrucciones en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.mix.js</span>.
    Típicamente, tu CSS compilado estará ubicado en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/css</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm run dev
</code></pre>

<p>
    El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.mix.js</span> incluido de forma predeterminada con Laravel compilará el
    archivo Sass <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/sass/app.scss</span>. Este archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app.scss</span> importa un
    archivo de variables Sass y carga Bootstrap, el cual proporciona un buen punto de comienzo para
    la mayoría de las aplicaciones. Siéntete libre de personalizar el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app.scss</span>
    en la forma que desees o incluso usar un pre-procesador completamente diferente
    configurando Laravel Mix
    .
</p>

<h2>Escribiendo JavaScript</h2>
<p>
    Todas las dependencias de JavaScript requeridas por tu aplicación pueden ser encontradas en el
    archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span> en el directorio principal del proyecto. Este archivo es
    similar a un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span> excepto que éste específica las dependencias de
    JavaScript en lugar de las dependencias de PHP. Puedes instalar estas dependencias usando el

    gestor de paquetes de Node (NPM)


    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm install
</code></pre>


<p>TIP</p>
<p>De forma predeterminada, el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span> de Laravel incluye unos cuantos
    paquetes tales como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vue</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">axios</span> para ayudarte a empezar a construir tu
    aplicación de JavaScript. Siéntete libre de agregar o eliminar del archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span> según sea necesario para tu aplicación.</p>


<p>Una vez que los paquetes sean instalados, puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run dev</span> para
    compilar tus recursos. Webpack es un empaquetador de módulos para aplicaciones modernas en
    JavaScript. Cuando ejecutes el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run dev</span>, Webpack ejecutará las
    instrucciones en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.mix.js</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm run dev
</code></pre>

<p>De forma predeterminada, el archivo de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.mix.js</span> de Laravel compila tu archivo
    Sass y él de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/app.js</span>. Dentro de el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app.js</span> puedes
    registrar tus componentes de Vue o, si prefieres un framework distinto, configurar tu propia
    aplicación de JavaScript. Tu JavaScript compilado será colocado típicamente en el directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/js</span>.</p>

<p>TIP</p>
<p>El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app.js</span> cargará el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/bootstrap.js</span> el cual
    estructura y configura Vue, Axios, jQuery, y todas las demás dependencias de javaScript. Si
    tienes dependencias adicionales de JavaScript que configurar, puedes hacerlo en este archivo.
</p>


<h3># Escribiendo componentes de Vue</h3>
<p>
    De forma predeterminada, las aplicaciones nuevas de Laravel contienen un componente de Vue
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ExampleComponent.vue</span> ubicado en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/components</span>.
    El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ExampleComponent.vue</span> es un ejemplo de un

    componente Vue de archivo único


    el cual define su plantilla HTML y JavaScript en el mismo archivo. Los componentes de archivo
    único proporcionan un enfoque muy conveniente para construir aplicaciones manejadas por
    JavaScript. El componente de ejemplo es registrado en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app.js</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Vue.component(
    'example-component',
    require('./components/ExampleComponent.vue')
);
</code></pre>

<p>Para usar el componente en tu aplicación, puedes colocarlo en una de tus plantillas HTML. Por
    ejemplo, después de ejecutar el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make:auth</span> para maquetar las
    pantallas de registro y autenticación de tu aplicación, podrías colocar el componente en la
    plantilla de Blade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">home.blade.php</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@extends('layouts.app')

@section('content')
    &lt;example-component&gt;&lt;/example-component&gt;
@endsection
</code></pre>


<p>TIP</p>
<p>Recuerda, deberías ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run dev</span> cada vez que cambies un
    componente de Vue. O, puedes ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run watch</span> para monitorear y
    recompilar automáticamente tus componentes cada vez que sean modificados.</p>

<p>
    Si estás interesado en aprender más sobre escribir componentes de Vue, deberías leer la

    Documentación de Vue


    , la cual proporciona un minucioso resumen fácil de leer del framework Vue.
</p>

<p>TIP</p>
<p>
    En

    Styde.net


    contamos con un

    completo curso sobre Vue.js


    que cubre todo los aspectos del framework.
</p>


<h3># Usando React</h3>
<p>Si prefieres usar React para construir tu aplicación de JavaScript, Laravel hace que sea una
    tarea fácil la de intercambiar la estructuración de Vue con la de React. En una aplicación nueva
    de Laravel, puedes usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preset</span> con la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">react</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>php artisan preset react
</code></pre>

<p>Este único comando removerá la estructuración de Vue y la reemplazará con la de React, incluyendo
    un componente de ejemplo.</p>
    </div>
""";