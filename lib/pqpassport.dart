import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PqPassport extends StatelessWidget {
  final String title;
  PqPassport(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPqPassport,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPqPassport = """
<!-- Laravel Passport -->
<div style='font-size: 14.2px;'>
  <h1>Laravel Passport</h1>
  <ul>
    <li>Introducción</li>
    <li>
      Instalación
      <ul>
        <li>Inicio rápido de frontend</li>
        <li>Despliegue de passport</li>
      </ul>
    </li>
    <li>
      Configuración
      <ul>
        <li>Duración de tokens</li>
        <li>Sobrescribiendo modelos predeterminados</li>
      </ul>
    </li>
    <li>
      Emitiendo tokens de acceso
      <ul>
        <li>Administrando clientes</li>
        <li>Solicitando tokens</li>
        <li>Actualización de tokens</li>
      </ul>
    </li>
    <li>
      Tokens de permiso de contraseña
      <ul>
        <li>Creando un cliente con permiso de contraseña</li>
        <li>Solicitando tokens</li>
        <li>Solicitando todos los alcances</li>
        <li>Personalizando el campo username</li>
      </ul>
    </li>
    <li>Tokens de permiso implícitos</li>
    <li>Tokens de permiso de credenciales de cliente</li>
    <li>
      Tokens de acceso personal
      <ul>
        <li>Creando un cliente de acceso personal</li>
        <li>Administrando tokens de acceso personal</li>
      </ul>
    </li>
    <li>
      Protegiendo rutas
      <ul>
        <li>Por medio de middleware</li>
        <li>Pasando el token de acceso</li>
      </ul>
    </li>
    <li>
      Alcances de token
      <ul>
        <li>Definiendo alcances</li>
        <li>Alcance predeterminado</li>
        <li>Asignando alcances a los Tokens</li>
        <li>Verificando alcances</li>
      </ul>
    </li>
    <li>Consumiendo tu API con JavaScript</li>
    <li>Eventos</li>
    <li>Pruebas</li>
  </ul>

  <h2>Introducción</h2>
  <p>
    Laravel ya hace fácil ejecutar la autenticación por medio de los tradicionales formularios de inicio de sesión, pero ¿Qué información tenemos sobre APIs? Las APIs típicamente usan tokens para autenticar a los usuarios y no mantienen el estado de sesión entre solicitudes. Laravel hace de la autenticación de API algo muy simple usando Passport de Laravel, el cual proporciona una implementación de servidor OAuth2 completa para tu aplicación Laravel en sólo minutos. Passport está construido sobre el servidor OAuth2
    <outboundlink></outboundlink>
    que es mantenido por Andy Millington y Simon Hamp..
  </p>

  <p>Nota</p>
  <p>
    Esta documentación asume que estás familiarizado con OAuth2. Si no sabes nada sobre OAuth2, considera familiarizarte con la terminología general
    <outboundlink></outboundlink>
    y las características de Outh2 antes de continuar.
  </p>

  <h2>Instalación</h2>
  <p>Para empezar, instala Passport por medio del gestor de paquetes Composer:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require laravel/passport
</code></pre>

  <p>El proveedor de servicio de Passport registra su propio directorio de migración de base de datos con el framework, así que deberías migrar tu base de datos después de registrar el paquete. Las migraciones de Passport crearán las tablas que tu aplicación necesita para almacenar clientes y tokens de acceso:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan migrate
</code></pre>

  <p>A continuación, debes ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">passport:install</span>. Este comando creará las claves de encriptación necesarias para generar tokens de acceso seguro. Además, el comando creará clientes de "acceso personal" y "permiso de contraseña" los cuales serán usados para generar tokens de acceso:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan passport:install
</code></pre>

  <p>Después de ejecutar este comando, agrega el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Laravel\Passport\HasApiTokens</span> a tu modelo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span>. Este trait proporcionará algunos métodos helper para tu modelo los cuales permitirán que inspecciones el token y alcances del usuario autenticado:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App;

use Laravel\Passport\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;
}
</code></pre>

  <p>Lo próximo, deberías ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Passport::routes</span> dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AuthServiceProvider</span>. Este método registrará las rutas necesarias para suministrar tokens y revocar tokens de acceso, clientes y tokens de acceso personal:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Providers;

use Laravel\Passport\Passport;
use Illuminate\Support\Facades\Gate;
use Illuminate\Foundation\Support\Providers\AuthServiceProvider as ServiceProvider;

class AuthServiceProvider extends ServiceProvider
{
    /**
    * The policy mappings for the application.
    *
    * @var array
    */
    protected \$policies = [
        'App\Model' =&gt; 'App\Policies\ModelPolicy',
    ];

    /**
    * Register any authentication / authorization services.
    *
    * @return void
    */
    public function boot()
    {
        \$this-&gt;registerPolicies();

        Passport::routes();
    }
}
</code></pre>

  <p>Finalmente, en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config/auth.php</span>, debes establecer la opción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">driver</span> del guardia de autenticación de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">api</span> a
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">passport</span>. Esto indicará a tu aplicación que utilice el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">TokenGuard</span> de Passport al momento de autenticar las solicitudes de API entrantes:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'guards' =&gt; [
    'web' =&gt; [
        'driver' =&gt; 'session',
        'provider' =&gt; 'users',
    ],

    'api' =&gt; [
        'driver' =&gt; 'passport',
        'provider' =&gt; 'users',
    ],
],
</code></pre>

  <h3>Personalización de la migración</h3>
  <p>Si no vas a utilizar las migraciones predeterminadas de Passport, debes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Passport::ignoreMigrations</span> en el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">register</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AppServiceProvider</span>. Puedes exportar las migraciones por defecto usando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">php artisan vendor:publish --tag=passport-migrations</span>.
  </p>
  <p>Por defecto, Passport usa una columna de enteros para almacenar el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">user_id</span>. Si tu aplicación utiliza un tipo de columna diferente para identificar a los usuarios (por ejemplo: UUID), debes modificar las migraciones de Passport predeterminadas después de publicarlas.</p>

  <h3>Inicio rápido de frontend</h3>

  <p>Nota</p>
  <p>
    Para usar los componentes de Vue, debes estar usando el framework de JavaScript Vue . Estos componentes también usarán el framework de CSS Bootstrap. Sin embargo, incluso si no estás usando estas herramientas, los componentes sirven como una referencia valiosa para tu propia implementación de frontend.
  </p>

  <p>
    Passport viene con una API JSON que puedes usar para permitir que tus usuarios creen tokens de acceso de clientes y personal. Sin embargo, puede ser que consuma tiempo codificar un frontend para interactuar con estas APIs. Así que, Passport también incluye componentes de Vue pre-construidos que puedes usar como implementación de ejemplo o punto de inicio para tu propia implementación.
  </p>
  <p>Para publicar los componentes de Vue de Passport, usa el comando Artisan
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">vendor:publish</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan vendor:publish --tag=passport-components
</code></pre>

  <p>Los componentes publicados serán colocados en tu directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/components</span>. Una vez que los componentes han sido publicados, debes registrarlos en tu archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources/js/app.js</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Vue.component(
    'passport-clients',
    require('./components/passport/Clients.vue').default
);

Vue.component(
    'passport-authorized-clients',
    require('./components/passport/AuthorizedClients.vue').default
);

Vue.component(
    'passport-personal-access-tokens',
    require('./components/passport/PersonalAccessTokens.vue').default
);
</code></pre>

  <p>Nota</p>
  <p>
    Antes de Laravel v 5.7.19, anexar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.default</span> al registrar componentes da como resultado un error de consola. Una explicación para este cambio puedes encontrarla en las notas de lanzamiento de Laravel Mix v 4.0.0 .
  </p>

  <p>Después de registrar los componentes, asegurate de ejecutar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">npm run dev</span> para recompilar tu código CSS/JS. Una vez que has recompilado tus código CSS/JS, puedes colocar los componentes dentro de una de las plantillas de tu aplicación para empezar a crear tokens de acceso clientes y personal:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;passport-clients&gt;&lt;/passport-clients&gt;
&lt;passport-authorized-clients&gt;&lt;/passport-authorized-clients&gt;
&lt;passport-personal-access-tokens&gt;&lt;/passport-personal-access-tokens&gt;
</code></pre>

  <h3>Despliegue de passport</h3>
  <p>Al momento de usar Passport en tus servidores de producción por primera vez, es probable que debas ejecutar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">passport:keys</span>. Este comando genera las claves de encriptación que Passport necesita con el propósito de generar el token de acceso. Las claves generadas normalmente no son guardadas en control de código fuente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan passport:keys
</code></pre>

  <p>De ser necesario, puedes definir la ruta en la que se deben cargar las claves de Passport. Para lograr esto puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Passport::loadKeysFrom</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Register any authentication / authorization services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;registerPolicies();

    Passport::routes();

    Passport::loadKeysFrom('/secret-keys/oauth');
}
</code></pre>

  <h2>Configuración</h2>

  <h3>Duración de tokens</h3>
  <p>De forma predeterminada, Passport emite tokens de acceso de larga duración que caducan después de un año. Si prefieres configurar una duración de token más larga o más corta, puedes usar los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tokensExpireIn</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">refreshTokensExpireIn</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">personalAccessTokensExpireIn</span>. Estos métodos deberían ser ejecutados desde el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de tu <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">AuthServiceProvider</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>/**
* Register any authentication / authorization services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;registerPolicies();

    Passport::routes();

    Passport::tokensExpireIn(now()-&gt;addDays(15));

    Passport::refreshTokensExpireIn(now()-&gt;addDays(30));

    Passport::personalAccessTokensExpireIn(now()-&gt;addMonths(6));
}
</code></pre>

  <h3>Sobrescribiendo modelos predeterminados</h3>
  <p>Eres en libre de extender los modelos usados internamente por Passport. A continuación, puedes indicarle a Passport que utilice tus modelos personalizados a través de la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Passport</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\Models\Passport\Client;
use App\Models\Passport\Token;
use App\Models\Passport\Authspan;
use App\Models\Passport\PersonalAccessClient;

/**
* Register any authentication / authorization services.
*
* @return void
*/
public function boot()
{
    \$this-&gt;registerPolicies();

    Passport::routes();

    Passport::useTokenModel(Token::class);
    Passport::useClientModel(Client::class);
    Passport::useAuthspanModel(Authspan::class);
    Passport::usePersonalAccessClientModel(PersonalAccessClient::class);
}
</code></pre>

  <h2>Emitiendo tokens de acceso</h2>
  <p>Usar OAuth2 con códigos de autorización es la forma en que la mayoría de los desarrolladores están familiarizados con OAuth2. Al usar códigos de autorización, una aplicación cliente redireccionará un usuario a tu servidor donde aprobará o denegará la solicitud para emitir un token de acceso al cliente.</p>

  <h3>Administrando clientes</h3>
  <p>En primer lugar, los desarrolladores que crean aplicaciones que necesitan interactuar con la API de tu aplicación necesitarán registrar su aplicación con la tuya creando un "cliente". Normalmente, esto consiste en proporcionar el nombre de su aplicación y una dirección URL a la que tu aplicación puede redirigir después de que los usuarios aprueben su solicitud de autorización.
  </p>
  <h4>El comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">passport:client</span></h4>
  <p>La forma más simple de crear un cliente es usando el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">passport:client</span>. Este comando puede ser usado para crear tus propios clientes para probar tu funcionalidad OAuth2. Cuando ejecutes el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">client</span>, Passport te pedirá más información sobre tu cliente y te proporcionará un ID y clave secreta de cliente:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>php artisan passport:client
</code></pre>

  <p><strong>Redirigir URLs</strong></p>
  <p>Si deseas incluir en la lista blanca varias direcciones URL de redireccionamiento para tu cliente, puedse especificarlas mediante una lista delimitadas por comas cuando se le solicite la dirección URL mediante el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">passport:client</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>http://example.com/callback,http://examplefoo.com/callback
</code></pre>

  <p>Nota</p>
  <p>Cualquier URL que contenga comas debe estar codificada.</p>

  <h4>API JSON</h4>
  <p>Debido a que tus usuarios no podrán utilizar el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">client</span>, Passport proporciona una API JSON que puedes usar para crear clientes. Esto te ahorra la molestia de tener que codificar manualmente los controladores para crear, actualizar y eliminar clientes.</p>
  <p>
    Sin embargo, necesitarás acoplar la API JSON de Passport con tu propio frontend para proporcionar un dashboard para que tus usuarios administren sus clientes. A continuación, revisaremos todos los endpoints de API para administrar clientes. Por conveniencia, usaremos Axios para demostrar la realización de solicitudes HTTP a los endpoints.
  </p>
  <p>La API JSON está protegida por los middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth</span>; por lo tanto, sólo puede ser llamada desde tu propia aplicación. No se puede llamar desde una fuente externa.
  </p>

  <p>TIP</p>
  <p>Si no quieres implementar tu mismo el frontend completo para administra</p>
</div>
""";