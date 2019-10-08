import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PeConsola extends StatelessWidget {
  final String title;
  PeConsola(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HqmPeConsola,
            ),
          ],
        )
    );
  }
}

const HqmPeConsola = """
<!-- Pruebas de consola -->
<div style='font-size: 14.2px;'>
  <h1>Pruebas de consola</h1>
  <ul>
    <li>Introducción</li>
    <li>Esperando entrada / salida</li>
  </ul>
  <h2>Introducción</h2>
  <p>Además de simplificar las pruebas de HTTP, Laravel proporciona una API simple para probar las aplicaciones de consola que solicitan información al usuario.</p>

  <h2>Esperando entrada / salida</h2>
  <p>Laravel te permite "simular" (mock) fácilmente la entrada de datos por parte del usuario mediante la consola utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">expectsQuestion</span>. Además, puedes especificar el código de salida y el texto que esperas que genere el comando de la consola utilizando los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertExitspan</span> y<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">expectsOutput</span>. Por ejemplo, considera el siguiente comando de consola:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Artisan::command('question', function () {
    \$name = \$this-&gt;ask('What is your name?');

    \$language = \$this-&gt;choice('Which language do you program in?', [
        'PHP',
        'Ruby',
        'Python',
    ]);

    \$this-&gt;line('Your name is '.\$name.' and you program in '.\$language.'.');
});
</code></pre>

  <p>Puedes probar este comando con la siguiente prueba que utiliza los métodos
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">expectsQuestion</span>,<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">expectsOutput</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">assertExitspan</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Test a console command.
*
* @return void
*/
public function test_console_command()
{
    \$this-&gt;artisan('question')
            -&gt;expectsQuestion('What is your name?', 'Taylor Otwell')
            -&gt;expectsQuestion('Which language do you program in?', 'PHP')
            -&gt;expectsOutput('Your name is Taylor Otwell and you program in PHP.')
            -&gt;assertExitspan(0);
}
</code></pre>
</div>
""";