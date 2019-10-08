import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class CaCiclo extends StatelessWidget {
  final String title;
  CaCiclo(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmCaCiclo,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmCaCiclo = """
<div style='font-size: 14.2px;'>
<h1> Ciclo de vida de la solicitud</h1>
<ul>
    <li>Introducción</li>
    <li>Resumen del ciclo de vida</li>
    <li>Enfoque en los proveedores de servicios</li>
</ul>

<h2> Introducción</h2>
<p>Al usar cualquier herramienta en el "mundo real", te sientes más cómodo si entiendes como esa herramienta funciona. El desarrollo de aplicaciones no es diferente. Cuando entiendes cómo tus herramientas de desarrollo funcionan, te sientes más cómodo y seguro usándolas.</p>
<p>El objetivo de este documento es darte un buen resumen sobre cómo el framework Laravel funciona. Al conocer el framework mejor, todo lo demás se siente menos "mágico" y te sentirás más cómodo construyendo tus aplicaciones. Si no entiendes todos los términos de una sola vez, ¡no te desesperes! Sólo trata de obtener una comprensión básica de lo que está sucediendo y tus conocimientos crecerán a medida que exploras otras secciones de la documentación.</p>

<h2> Resumen del ciclo de vida</h2>
<h3> Lo primero</h3>
<p>El punto de entrada para todas las solicitudes a una aplicación de Laravel es el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public/index.php</span>. Todas las solicitudes son dirigidas a este archivo por la configuración de tu servidor web (Apache / Nginx). El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">index.php</span> no contiene mucho código. En su lugar, es un punto de partida para cargar el resto del framework.</p>
<p>
    El archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">index.php</span> carga la definición de autocarga generada por Composer y luego retorna una instancia de la aplicación de Laravel desde el script <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bootstrap/app.php</span>. La primera acción tomada por Laravel es crear una instancia de la aplicación /
    contenedor de servicios
    .
</p>
<h3> Kernel de HTTP / Consola</h3>
<p>Luego, la solicitud entrante es enviada ya sea al kernel HTTP o al kernel de la consola, dependiendo del tipo de solicitud que está entrando en la aplicación. Estos dos kernels funcionan como la ubicación principal a través de la cual todas las solicitudes pasan. Por ahora, vamos a enfocarnos sólo en el kernel HTTP, que está ubicado en <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Http/Kernel.php</span>.</p>
<p>
    El kernel HTTP extiende de la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Foundation\Http\Kernel</span>, que define un arreglo de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bootstrappers</span> que se ejecutarán antes de que la solicitud sea ejecutada. Estos maquetadores configuran el manejo de errores, registros,
    detectan en el entorno de la aplicación
    y realizan otras tareas que necesitan ser ejecutadas antes de que la solicitud sea manejada.
</p>
<p>
    El kernel HTTP también define una lista de
    middleware
    HTTP que todas las solicitudes deben pasar antes de ser manejadas por la aplicación. Estos middleware manejan la lectura y escritura de la
    sesión HTTP
    , determinando si la aplicación está en modo de mantenimiento,
    verificando el token CSRF
    y más.
</p>
<p>La firma del método para el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> del kernel HTTP es bastante simple: recibe un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Request</span> y retorna un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Response</span>. Piensa en el Kernel como una caja negra grande que representa toda tu aplicación. Aliméntala con solicitudes HTTP y retornará respuestas HTTP.</p>
<h4> Proveedores de servicios</h4>
<p>
    Una de las acciones de maquetado más importantes del Kernel es cargar los
    proveedores de servicios
    de tu aplicación. Todos los proveedores de servicios de la aplicación son configurados en el arreglo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">providers</span> del archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/app.php</span>. Primero, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span> será llamado en todos los proveedores, luego, una vez que todos los proveedores sean registrados, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> será llamado.
</p>
<p>Los proveedores de servicios son responsables de estructurar todos los distintos componentes del framework, como la base de datos, colas, validaciones y componentes de rutas. Dado que estructuran y configuran cada característica ofrecida por el framework, los proveedores de servicios son el aspecto más importante de todo el proceso de estructuración de Laravel.</p>
<h4> Despachar la solicitud</h4>
<p>Una vez que la aplicación ha sido estructurada y todos los proveedores de servicios han sido registrados, la solicitud o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Request</span> será manejada por el enrutador para su despacho. El enrutador enviará la solicitud a una ruta o controlador, así como ejecutará cualquier middleware específico de ruta.</p>

<h2> Enfoque en los proveedores de servicios</h2>
<p>Los proveedores de servicios son realmente la clave para estructurar una aplicación de Laravel. La instancia de la aplicación es creada, los proveedores de servicios son registrados y la solicitud es entregada a la aplicación ya estructurada. ¡Es realmente así de simple!</p>
<p>Tener un firme conocimiento sobre cómo una aplicación de Laravel es construída y estructurada mediante proveedores de servicios es muy útil. Los proveedores de servicios por defecto de tu aplicación están almacenados en el directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app/Providers</span>.</p>
<p>Por defecto, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span> está casi vacío. Este proveedor es un buen lugar para agregar tu propia estructura de componentes y enlaces al contenedor de servicios de tu aplicación. Para aplicaciones grandes, puedes desear crear múltiples proveedores de servicios, cada uno que estructure componentes de una manera más granular.</p>
</div>
""";