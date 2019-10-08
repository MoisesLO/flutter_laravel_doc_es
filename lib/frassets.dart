import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class FrAssets extends StatelessWidget {
  final String title;
  FrAssets(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmFrAssets,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmFrAssets = """
<div style='font-size: 14.2px;'>
<h1>Compilación De Assets (Laravel Mix)</h1>
<ul>
    <li>Introducción</li>
    <li>Instalación y configuración</li>
    <li>Ejecutando Mix</li>
    <li>
        Trabajando con hojas de estilos
        <ul>
            <li>Less</li>
            <li>Sass</li>
            <li>Stylus</li>
            <li>PostCSS</li>
            <li>CSS plano</li>
            <li>Procesamiento de URLs</li>
            <li>Mapeo de fuente</li>
        </ul>
    </li>
    <li>
        Trabajando con JavaScript
        <ul>
            <li>Extracción de paquetes de terceros</li>
            <li>React</li>
            <li>Vanilla JS</li>
            <li>Configuración de webpack personalizada</li>
        </ul>
    </li>
    <li>Copiando archivos y yirectorios</li>
    <li>Versionando / Destrucción de caché</li>
    <li>Recarga de Browsersync</li>
    <li>Variables de entorno</li>
    <li>Notificaciones</li>
</ul>
<p></p>
<h2>Introducción</h2>
<p>

    Laravel Mix


    proporciona una API fluida para definir pasos de compilación de Webpack para tu aplicación de
    Laravel usando múltiples preprocesadores de CSS y JavaScript. A través de encadenamiento de
    cadenas simples, puedes definir fluidamente tus pipelines de assets. Por ejemplo:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.js('resources/js/app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css');
</code></pre>

<p>Si alguna vez has estado confundido o agobiado al comenzar con Webpack y la compilación de
    assets, amarás Laravel Mix. Sin embargo, no estás obligado a usarlo durante el desarollo de tu
    aplicación. Eres libre de usar cualquier pipeline de assets que desees o incluso ninguno.</p>
<p></p>
<h2>Instalación y configuración</h2>
<h4># Instalando Node</h4>
<p>Antes de ejecutar Mix, debes asegurar de que Node.js y NPM están instalados en tu máquina.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>node -v
npm -v
</code></pre>

<p>
    Por defecto, Laravel Homestead incluye todo lo que necesitas; sin embargo, si no estás usando
    Vagrant, entonces puedes fácilmente instalar la última versión de Node y NPM usando instaladores
    sencillos desde

    su página de descargas


    .
</p>
<h4># Laravel Mix</h4>
<p>El único paso restante es instalar Laravel Mix. Dentro de una instalación nueva de Laravel,
    encontrarás un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span> en la raíz de tu estructura de directorios. El
    archivo por defecto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span> incluye todo lo que necesitas para comenzar.
    Piensa en éste como tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">composer.json</span>, excepto que define dependencias de
    Node en lugar de PHP. Puedes instalar las dependencias a las cuales haces referencia ejecutando:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm install
</code></pre>

<p></p>
<h2>Ejecutando Mix</h2>
<p>
    Mix es una capa de configuración basado en

    Webpack


    , así que para ejecutar tus tareas de Mix sólo necesitas ejecutar uno de los scripts de NPM
    incluídos en el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span> por defecto de Laravel:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// Run all Mix tasks...
npm run dev

// Run all Mix tasks and minify output...
npm run production
</code></pre>

<h4># Observando cambios en los assets</h4>
<p>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run watch</span> continuará ejecutándose en tu terminal y observando todos
    los archivos relevantes por cambios. Webpack entonces automáticamente recompilará tus assets
    cuando detecte un cambio:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm run watch
</code></pre>

<p>Puedes encontrar que en algunos entornos Webpack no está actualizando los cambios en tus
    archivos. Si éste es el caso en tu sistema, considera usar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">watch-poll</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>npm run watch-poll
</code></pre>

<p></p>
<h2>Trabajando con hojas de estilos</h2>
<p>El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.mix.js</span> es el punto de entrada para toda la compilación de assets.
    Piensa en éste como un wrapper de configuración liviano alrededor de Webpack. Las tareas de Mix
    pueden ser encadenadas para definir exactamente cómo tus assets deben ser compilados.</p>
<p></p>
<h3># Less</h3>
<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">less</span> puede ser usado para compilar

    Less


    a CSS. Vamos a compilar nuestro archivo primario <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app.less</span> a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/css/app.css</span>.
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.less('resources/less/app.less', 'public/css');
</code></pre>

<p>Múltiples llamadas al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">less</span> pueden ser usadas para compilar múltiples
    archivos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.less('resources/less/app.less', 'public/css')
    .less('resources/less/admin.less', 'public/css');
</code></pre>

<p>Si deseas personalizar el nombre del archivo CSS compilado, puedes pasar una ruta de archivo
    completa como segundo argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">less</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.less('resources/less/app.less', 'public/stylesheets/styles.css');
</code></pre>

<p>
    Si necesitas sobrescribir

    opciones subyacentes de Less


    , puedes pasar un objeto como tercer argumento a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.less()</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.less('resources/less/app.less', 'public/css', {
    strictMath: true
});
</code></pre>

<p></p>
<h3># Sass</h3>
<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sass</span> te permite compilar

    Sass


    a CSS. Puedes usar el método de la siguiente manera:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.sass('resources/sass/app.scss', 'public/css');
</code></pre>

<p>De nuevo, como el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">less</span>, puedes compilar múltiples archivos de CSS a sus
    archivos de CSS respectivos e incluso personalizar el directorio de salida del CSS resultante:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.sass('resources/sass/app.sass', 'public/css')
    .sass('resources/sass/admin.sass', 'public/css/admin');
</code></pre>

<p>

    Opciones de Node-Sass


    pueden ser proporcionadas como tercer argumento:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.sass('resources/sass/app.sass', 'public/css', {
    precision: 5
});
</code></pre>

<p></p>
<h3># Stylus</h3>
<p>
    Similar a Less y Sass, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stylus</span> te permite compilar

    Stylus


    a CSS:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.stylus('resources/stylus/app.styl', 'public/css');
</code></pre>

<p>
    También puedes instalar plugins de Stylus adicionales, como

    Rupture


    . Primero, instala el plugin en cuestión mediante NPM (<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm install rupture</span>) y luego
    requiérelo en tu llamada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.stylus()</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.stylus('resources/stylus/app.styl', 'public/css', {
    use: [
        require('rupture')()
    ]
});
</code></pre>

<p></p>
<h3># PostCSS</h3>
<p>

    PostCSS


    , una herramienta poderosa para transformar tu CSS, es incluido con Laravel Mix. Por defecto,
    Mix toma ventaja del popular plugin

    Autoprefixer


    para automáticamente aplicar todos los prefijos necesarios de CSS3. Sin embargo, eres libre de
    agregar plugins adicionales que sean apropiados para tu aplicación. Primero, instala el plugin
    deseado a través de NPM y luego haz referencia a éste en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.mix.js</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.sass('resources/sass/app.scss', 'public/css')
    .options({
        postCss: [
            require('postcss-css-variables')()
        ]
    });
</code></pre>

<p></p>
<h3># CSS plano</h3>
<p>Si simplemente te gustaría concatenar algunas hojas de CSs plano a un sólo archivo, puedes usar
    el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">styles</span>.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.styles([
    'public/css/vendor/normalize.css',
    'public/css/vendor/videojs.css'
], 'public/css/all.css');
</code></pre>

<p></p>
<h3># Procesamiento de URLs</h3>
<p>Debido a que Laravel Mix está construído en base a Webpack, es importante entender algunos
    conceptos de Webpack. Para compilación de CSS, Webpack reescribirá y optimizará cualquier
    llamada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url()</span> dentro de tus hojas de estilos. Aunque esto inicialmente puede
    sonar extraño, es una pieza increiblemente poderosa de funcionalidad. Imagina que queremos
    compilar Sass que incluye una URL relativa a una imagen:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>.example {
    background: url('../images/example.png');
}
</code></pre>

<p>::: note
    Las rutas absolutas para cualquier <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url()</span> serán excluidas de la reescritura de URLs.
    Por ejemplo, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url('/images/thing.png')</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url('http://example.com/images/thing.png')</span>
    no serán modificados.
</p>

<p>Por defecto, Laravel Mix y Webpack encontrarán <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">example.png</span>, lo copiaran a tu
    directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/images</span> y luego reescribirán el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url()</span> dentro de tu
    hoja de estilos generada. Como tal, tu archivo CSS compilado será:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>.example {
    background: url(/images/example.png?d41d8cd98f00b204e9800998ecf8427e);
}
</code></pre>

<p>Tan útil como esta característica puede ser, es posible que tu estructura de directorios
    existente ya está configurada en una forma que quieres. Si este es el caso, puedes deshabilitar
    la reescritura de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url()</span> de la siguiente forma:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.sass('resources/app/app.scss', 'public/css')
    .options({
        processCssUrls: false
    });
</code></pre>

<p>Con esta adición a tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.mix.js</span>, Mix ya no igualará cualquier <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url()</span>
    o asset copiado a tu directorio público. En otras palabras, el CSS compilado se verá igual a
    como originalmente lo escribiste:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>.example {
    background: url("../images/thing.png");
}
</code></pre>

<p></p>
<h3># Mapeo de fuente</h3>
<p>Aunque deshabilitado por defecto, el mapeo de fuentes puede ser activado llamando al método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.sourceMaps()</span> en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.mix.js</span>. Aunque viene con un
    costo de compilación/rendimiento, esto proporcionará información adicional de depuración a las
    herramientas de desarrollo de tu navegador al usar assets compilados.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.js('resources/js/app.js', 'public/js')
    .sourceMaps();
</code></pre>

<p></p>
<h2>Trabajando con JavaScript</h2>
<p>Mix proporciona múltiples características para ayudarte a trabajar con archivos de JavaScript,
    como compilar ECMAScript 2015, agrupación de módulos, minificación y concatenar archivos de
    JavaScript planos. Aún mejor, todos esto funciona fácilmente, sin requirir ningún tipo de
    configuración personalizada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.js('resources/js/app.js', 'public/js');
</code></pre>

<p>Con esta única línea de código, puedes ahora tomar ventaja de:</p>
<ul>
    <li>Sintaxis de ES2015.</li>
    <li>Modulos</li>
    <li>Compilación de archivos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.vue</span>.</li>
    <li>Minifación para entornos de producción.</li>
</ul>
<p></p>
<h3># Extracción de paquetes de terceros</h3>
<p>Un potencial aspecto negativo de agrupar todo el JavaScript específico de la aplicación con tus
    paquetes de terceros es que hace que el almacenamiento en caché a largo plazo sea más difícil.
    Por ejemplo, una sóla actualización al código de tu aplicación forazará el navegador a recargar
    todas tus paquetes de terceros incluso si no han cambiado.</p>
<p>Si pretendes hacer actualizaciones frecuentes del JavaScript de tu aplicación, deberías
    considerar extraer todos tus paquetes de terceros a su propio archivo. De esta forma, un cambio
    en el código de tu aplicación no afectará el almacenamiento en caché de tu archivo grande <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor.js</span>.
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extract</span> de Mix hace que esto sea muy fácil:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.js('resources/js/app.js', 'public/js')
    .extract(['vue'])
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">extract</span> acepta un arreglo de todas los paquetes o módulos que deseas
    extraer a un archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor.js</span>. Usando el código de arriba como ejemplo, Mix
    generará los siguientes archivos:</p>
<ul>
    <li><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/js/manifest.js</span>: <em>The Webpack manifest runtime</em></li>
    <li><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/js/vendor.js</span>: <em>Your vendor libraries</em></li>
    <li><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/js/app.js</span>: <em>Your application span</em></li>
</ul>
<p>Para evitar errores de JavaScript, asegurate de cargar estos archivos en el orden adecuado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;script src="/js/manifest.js"&gt;&lt;/script&gt;
&lt;script src="/js/vendor.js"&gt;&lt;/script&gt;
&lt;script src="/js/app.js"&gt;&lt;/script&gt;
</code></pre>

<p></p>
<h3># React</h3>
<p>Mix puede automáticamente instalar los plugins de Babel necesarios para el soporte de React. Para
    comenzar, reemplaza tu llamado a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.js()</span> por <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.react()</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.react('resources/js/app.jsx', 'public/js');
</code></pre>

<p>En segundo plano, Mix descargará e incluirá el plugin de Babel <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">babel-preset-react</span>
    apropiado.</p>
<p></p>
<h3># Vanilla JS</h3>
<p>Similar a combinar hojas de estilos con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.styles()</span>, puedes también combinar y
    minificar cualquier número de archivos JavaScript con el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">scripts()</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.scripts([
    'public/js/admin.js',
    'public/js/dashboard.js'
], 'public/js/all.js');
</code></pre>

<p>Esta opción es particularmente útil para proyectos antiguos donde no necesitas compilación de
    Webpack para tu JavaScript.</p>

<p>TIP</p>
<p>Una ligera variación de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.scripts()</span> es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.babel()</span>. Su firma de
    método es identica a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">scripts</span>; sin embargo, el archivo concatenado recibirá
    compilación de Babel, que traduce cualquier código ES2015 a JavaScript plano que todos los
    navegadores entenderán.</p>

<p></p>
<h3># Configuración personalizada de webpack</h3>
<p>Detrás de cámaras, Laravel Mix hace referencia a un archivo preconfigurado <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.config.js</span>
    para ayudarte a comenzar tan rápido como sea posible. Ocasionalmente, puedes necesitar modificar
    este archivo de forma manual. Podrías tener un loader o plugin especial al que necesitas hacer
    referencia o quizás prefieres usar Stylus en lugar de Sass. En esos casos, tienes dos opciones:
</p>
<h4># Fusionar configuración personalizada</h4>
<p>
    Mix proporciona un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpackConfig</span> útil que te permite fusionar cualquier
    configuración pequeña de Webpack. Esta es una opción particularmente atractiva, ya que no
    requiere que copies y mantengas tu propia copia del archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.config.js</span>. El
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpackConfig</span> acepta un objeto, que debe contener cualquier

    configuración especifíca de Webpack


    que deseas aplicar.
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.webpackConfig({
    resolve: {
        modules: [
            path.resolve(__dirname, 'vendor/laravel/spark/resources/js')
        ]
    }
});
</code></pre>

<h4># Archivos de configuración personalizados</h4>
<p>Si te gustaría personalizar completamente tu configuración de Webpack, copia el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">node_modules/laravel-mix/setup/webpack.config.js</span>
    al directorio principal de tu proyecto. Luego, apunta todas las referencias a
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">--config</span> en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">package.json</span> al nuevo archivo de configuración
    copiado. Si deseas elegir esta forma de personalización, cualquier actualización futura al
    archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">webpack.config.js</span> debe ser manualmente agregada a tu archivo personalizado.
</p>
<p></p>
<h2>Copiando Archivos &amp; Directorios</h2>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">copy</span> puede ser usado para copiar archivos y directorios a nuevas
    ubicaciones. Esto puede ser útil cuando un asset en particular dentro de tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">node_modules</span>
    necesita ser reubicado a tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span>.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.copy('node_modules/foo/bar.css', 'public/css/bar.css');
</code></pre>

<p>Al copiar un directorio, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">copy</span> aplanará la estructura del directorio. Para
    mantener la estructura original del directorio, debes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">copyDirectory</span>
    en su lugar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.copyDirectory('resources/img', 'public/img');
</code></pre>

<p></p>
<h2>Versionando / Destrucción de caché</h2>
<p>Muchos desarrolladores prefijan sus assets compilados con una marca de tiempo o token único para
    forzar a los navegadores a cargar los assets nuevos en lugar de servir copias antiguas del
    código. Mix puede hacer esto por ti usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">version</span>.</p>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">version</span> automáticamente agregar un hash único a los nombres de archivos de
    todos los archivos compilados, permitiendo una destrucción de caché más conveniente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.js('resources/js/app.js', 'public/js')
    .version();
</code></pre>

<p>Luego de generar el archivo versionado, no sabrás el nombre exacto del archivo. Así que, debes
    usar la función global de Laravel <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix</span> dentro de tus vistas para cargar los assets
    apropiados. La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix</span> determinará automáticamente el nombre actual del
    archivo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;link rel="stylesheet" href="{{ mix('/css/app.css') }}"&gt;
</code></pre>

<p>Dado que los archivos versionados son usualmente necesarios durante el desarrollo, puedes
    instruir al proceso de versionamiento para que sólo se ejecute durante
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run production</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.js('resources/js/app.js', 'public/js');

if (mix.inProduction()) {
    mix.version();
}
</code></pre>

<p></p>
<h2>Recarga con Browsersync</h2>
<p>

    BrowserSync


    puede monitorear automáticamente los cambios en tus archivos e inyectar tus cambios al navegador
    sin requerir un refrescamiento manual. Puedes activar el soporte llamando al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix.browserSync()</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.browserSync('my-domain.test');

// Or...

// https://browsersync.io/docs/options
mix.browserSync({
    proxy: 'my-domain.test'
});
</code></pre>

<p>Puedes pasar una cadena (proxy) u objeto (configuraciones de BrowserSync) a este método. Luego,
    inicia el servidor de desarrollo de Webpack usando el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run watch</span>. Ahora,
    cuando modifiques un script o archivo de PHP, observa mientras el navegador instantaneamente
    recarga la página para reflejar tus cambios.</p>
<p></p>
<h2>Variables de entorno</h2>
<p>Puedes inyectar variables de entorno a Mix prefijando una clave en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span>
    con <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">MIX_</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>MIX_SENTRY_DSN_PUBLIC=http://example.com
</code></pre>

<p>Luego de que la variable ha sido definida en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span>, puedes acceder
    mediante el objeto <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">process.env</span>. Si el valor cambia mientras estás ejecutando una
    tarea <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">watch</span>, necesitarás reiniciar la tarea:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>process.env.MIX_SENTRY_DSN_PUBLIC
</code></pre>

<p></p>
<h2>Notificaciones</h2>
<p>Cuando esté disponible, Mix automáticamente mostrará notificaciones del sistema operativo para
    cada paquete. Esto te dará feedback instantáneo, sobre si la compilación ha sido exitosa o no.
    Sin embargo, pueden haber casos en los que preferirás deshabilitar estas notificaciones. Uno de
    esos casos puede ser ejecutar Mix en tu servidor de producción. Las notificaciones pueden ser
    deshabilitadas mediante el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">disableNotifications</span>.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>mix.disableNotifications();
</code></pre>
</div>
""";