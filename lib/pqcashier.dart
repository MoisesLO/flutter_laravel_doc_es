import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PqCashier extends StatelessWidget {
  final String title;
  PqCashier(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPqCashier,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPqCashier = """
<!-- Laravel Cashier -->
<div style='font-size: 14.2px;'>
  <h1>Laravel Cashier</h1>
  <ul>
    <li>Introducción</li>
    <li>Actualizando cashier</li>
    <li>Instalación</li>
    <li>
      Configuración
      <ul>
        <li>Migraciones de base de datos</li>
        <li>Modelo Billable</li>
        <li>API Keys</li>
        <li>Configuración de moneda</li>
        <li>Webhooks</li>
      </ul>
    </li>
    <li>
      Suscripciones
      <ul>
        <li>Creando suscripciones</li>
        <li>Verificando el estado de suscripción</li>
        <li>Cambiando planes</li>
        <li>Cantidad de suscripción</li>
        <li>Impuestos de suscripción</li>
        <li>Fecha de anclaje de suscripción</li>
        <li>Cancelando suscripciones</li>
        <li>Reanudando suscripciones</li>
      </ul>
    </li>
    <li>
      Periodos de prueba de suscripción
      <ul>
        <li>Con tarjeta de crédito</li>
        <li>Sin tarjeta de crédito</li>
      </ul>
    </li>
    <li>
      Clientes
      <ul>
        <li>Creando clientes</li>
      </ul>
    </li>
    <li>
      Tarjetas
      <ul>
        <li>Retornando tarjetas de crédito</li>
        <li>Determinando si una tarjeta está en el archivo</li>
        <li>Actualizando tarjetas de crédito</li>
        <li>Eliminando tarjetas de crédito</li>
      </ul>
    </li>
    <li>
      Manejando webhooks de Stripe
      <ul>
        <li>Definiendo manejadores de eventos de webhooks</li>
        <li>Suscripciones fallidas</li>
        <li>Verificando las firmas del webhook</li>
      </ul>
    </li>
    <li>
      Cargos únicos
      <ul>
        <li>Carga simple</li>
        <li>Carga con factura</li>
        <li>Reembolsar cargos</li>
      </ul>
    </li>
    <li>
      Facturas
      <ul>
        <li>Generando PDFs de facturas</li>
      </ul>
    </li>
  </ul>

  <h2>Introducción</h2>
  <p>
    Laravel Cashier proporciona una expresiva interfaz fluida para los servicios de pagos en línea por suscripción de Stripe
    <outboundlink></outboundlink>
    . Maneja casi todo el código de facturación de suscripción que estás teniendo pavor de escribir. Además de la gestión de suscripción, Cashier puede manejar cupones, cambio de suscripciones, "cantidades" de suscripción, cancelación de períodos de gracia e incluso generar PDFs de facturas.
  </p>

  <p>Nota</p>
  <p>Si solamente estás trabajando con cargos de "un pago-único" y no ofreces subscripciones, no deberías usar Cashier. En lugar de eso, usa directamente los SDKs de Stripe.</p>

  <h2>Actualizando cashier</h2>
  <p>
    Al actualizar a una nueva versión mayor de Cashier, es importante que revises cuidadosamente la guía de actualización .
  </p>

  <h2>Instalación</h2>
  <p>Primero, instala el paquete de Cashier para Stripe Con Composer:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>composer require laravel/cashier
</code></pre>

  <h2>Configuración</h2>

  <h3>Migraciones de bases de datos</h3>
  <p>Antes de usar Cashier, también necesitaremos preparar la base de datos. Necesitas agregar varias columnas a tu tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">users</span> y crear una nueva tabla <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscriptions</span> para manejar todas las subscripciones de nuestros clientes:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Schema::table('users', function (Blueprint \$table) {
    \$table-&gt;string('stripe_id')-&gt;nullable()-&gt;collation('utf8mb4_bin');
    \$table-&gt;string('card_brand')-&gt;nullable();
    \$table-&gt;string('card_last_four', 4)-&gt;nullable();
    \$table-&gt;timestamp('trial_ends_at')-&gt;nullable();
});

Schema::create('subscriptions', function (Blueprint \$table) {
    \$table-&gt;bigIncrements('id');
    \$table-&gt;unsignedBigInteger('user_id');
    \$table-&gt;string('name');
    \$table-&gt;string('stripe_id')-&gt;collation('utf8mb4_bin');
    \$table-&gt;string('stripe_plan');
    \$table-&gt;integer('quantity');
    \$table-&gt;timestamp('trial_ends_at')-&gt;nullable();
    \$table-&gt;timestamp('ends_at')-&gt;nullable();
    \$table-&gt;timestamps();
});
</code></pre>

  <p>Una vez que las migraciones han sido creadas, ejecuta el comando Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">migrate</span>.
  </p>

  <h4>Modelo Billable</h4>
  <p>A continuación, agrega el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Billable</span> a tu definición de modelo. Este trait proporciona varios métodos para permitirte realizar tareas comunes de facturación, tales como creación de subscripciones, aplicación de cupones y actualización de la información de la tarjeta de crédito:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Laravel\Cashier\Billable;

class User extends Authenticatable
{
    use Billable;
}
</code></pre>

  <h3>Claves de API</h3>
  <p>Finalmente, deberías configurar tu clave de Stripe en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">services.php</span>. Puedes obtener tus claves de API de Stripe desde el panel de control de Stripe:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>'stripe' =&gt; [
    'model' =&gt; App\User::class,
    'key' =&gt; env('STRIPE_KEY'),
    'secret' =&gt; env('STRIPE_SECRET'),
    'webhook' =&gt; [
        'secret' =&gt; env('STRIPE_WEBHOOK_SECRET'),
        'tolerance' =&gt; env('STRIPE_WEBHOOK_TOLERANCE', 300),
    ],
],
</code></pre>

  <h3>Configuración de moneda</h3>
  <p>La moneda predeterminada de Cashier es Dólares estadounidenses (USD). Puedes cambiar la moneda predeterminada al ejecutar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cashier::useCurrency</span> dentro del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">boot</span> de uno de tus proveedores de servicio. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Cashier::useCurrency</span> acepta dos parámetros de cadena: la moneda y el símbolo de la moneda:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Laravel\Cashier\Cashier;

Cashier::useCurrency('eur', '€');
</code></pre>

  <h3>Webhooks</h3>
  <p>Para asegurarte de que Cashier maneja apropiadamente todos los eventos de Stripe, recomendamos profundamente configurar el manejador de webhook de Cashier.</p>

  <h2>Subscripciones</h2>

  <h3>Creando suscripciones</h3>
  <p>Para crear una suscripción, primero obtén una instancia de tu modelo facturable, el cual será típicamente una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\User</span>. Una vez que has obtenido la instancia de modelo, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">newSubscription</span> para crear la suscripción del modelo:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = User::find(1);

\$user-&gt;newSubscription('main', 'premium')-&gt;create(\$token);
</code></pre>

  <p>El primer argumento pasado al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">newSubscription</span> debería ser el nombre de la suscripción. Si tu aplicación sólo ofrece una única suscripción, puedes llamarla
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">main</span> o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">primary</span>. El segundo argumento es el plan específico al que el usuario se está suscribiendo. Este valor debería corresponder al identificador del plan en Stripe.
  </p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span> el cual acepta una tarjeta de crédito / token source de Stripe, comenzará la suscripción al igual que actualizará tu base de datos con el ID del cliente y otra información de facturación relevante.</p>
  <h4>Detalles de usuario adicionales</h4>
  <p>Si prefieres especificar detalles de cliente adicionales, puedes hacerlo pasándolos como segundo argumento del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">create</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;newSubscription('main', 'monthly')-&gt;create(\$token, [
    'email' =&gt; \$email,
]);
</code></pre>

  <p>
    Para aprender más sobre los campos adicionales soportados por Stripe, revisa la documentación sobre la creación de clientes .
  </p>
  <h4>Cupones</h4>
  <p>Si prefieres aplicar un cupón al momento de crear la suscripción, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">withCoupon</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;newSubscription('main', 'monthly')
        -&gt;withCoupon('span')
        -&gt;create(\$token);
</code></pre>

  <h3>Verificando el estado de la suscripción</h3>
  <p>Una vez que un usuario está suscrito a tu aplicación, puedes verificar fácilmente su estado de suscripción usando una variedad conveniente de métodos. Primero, el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribed</span> devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si el usuario tiene una suscripción activa, incluso si la suscripción está actualmente en su período de prueba:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;subscribed('main')) {
    //
}
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribed</span> también constituye un gran candidato para un middleware de ruta, permitiéndote filtrar el acceso a rutas y controladores basados en el estado de suscripción:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>public function handle(\$request, Closure \$next)
{
    if (\$request-&gt;user() &amp;&amp; ! \$request-&gt;user()-&gt;subscribed('main')) {
        // This user is not a paying customer...
        return redirect('billing');
    }

    return \$next(\$request);
}
</code></pre>

  <p>Si prefieres determinar si un usuario está aún dentro de su período de prueba, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onTrial</span>. Este método puede ser útil para mostrar una advertencia al usuario que todavía está en su período de prueba:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;subscription('main')-&gt;onTrial()) {
    //
}
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribedToPlan</span> puede ser usado para determinar si el usuario está suscrito a un plan dado basado en un ID de plan Stripe proporcionado. En este ejemplo, determinaremos si la suscripción <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">main</span> del usuario está activa para al plan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">monthly</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;subscribedToPlan('monthly', 'main')) {
    //
}
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">recurring</span> puede ser usado para determinar si el usuario está actualmente suscrito y ya no está dentro de su periodo de prueba:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;subscription('main')-&gt;recurring()) {
    //
}
</code></pre>

  <h4>Estado de suscripción cancelada</h4>
  <p>Para determinar si el usuario fue alguna vez un suscriptor activo, pero que ha cancelado su suscripción, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cancelled</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;subscription('main')-&gt;cancelled()) {
    //
}
</code></pre>

  <p>También puedes determinar si un usuario ha cancelado su suscripción, pero todavía está en su "período de gracia" hasta que la suscripción caduque totalmente. Por ejemplo, si un usuario cancela una suscripción el 5 de Marzo que fue planificada para expirar originalmente el 10 de Marzo, el usuario está en su "período de gracia" hasta el 10 de Marzo. Nota que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribed</span> aún devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> durante esta tiempo:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;subscription('main')-&gt;onGracePeriod()) {
    //
}
</code></pre>

  <p>Para determinar si el usuario que ha cancelado su suscripción ya no está dentro del "periodo de gracia", puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ended</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;subscription('main')-&gt;ended()) {
    //
}
</code></pre>

  <h3>Cambiando planes</h3>
  <p>Después que un usuario esté suscrito en tu aplicación, ocasionalmente puede querer cambiar a un nuevo plan de suscripción. Para cambiar un usuario a una nueva suscripción, pasa el identificador de plan al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">swap</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = App\User::find(1);

\$user-&gt;subscription('main')-&gt;swap('provider-plan-id');
</code></pre>

  <p>Si el usuario está en período de prueba, se mantendrá el período de prueba. También, si una "cantidad" existe para la suscripción esa cantidad también será conservada.</p>
  <p>Si prefieres cambiar planes y cancelar cualquier período de prueba en donde esté el usuario actualmente, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">skipTrial</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;subscription('main')
        -&gt;skipTrial()
        -&gt;swap('provider-plan-id');
</code></pre>

  <h3>Cantidad de la suscripción</h3>
  <p>Algunas veces las suscripciones son afectadas por la "cantidad". Por ejemplo, tu aplicación podría cargar 10\$ por mes <strong>por usuario</strong> en una cuenta. Para incrementar o disminuir fácilmente tu cantidad de suscripción, usa los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">incrementQuantity</span> y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decrementQuantity</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = User::find(1);

\$user-&gt;subscription('main')-&gt;incrementQuantity();

// Add five to the subscription's current quantity...
\$user-&gt;subscription('main')-&gt;incrementQuantity(5);

\$user-&gt;subscription('main')-&gt;decrementQuantity();

// Subtract five to the subscription's current quantity...
\$user-&gt;subscription('main')-&gt;decrementQuantity(5);
</code></pre>

  <p>Alternativamente, puedes establecer una cantidad específica usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateQuantity</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;subscription('main')-&gt;updateQuantity(10);
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">noProrate</span> puede ser usado para actualizar la cantidad de la suscripción sin proratear los cargos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;subscription('main')-&gt;noProrate()-&gt;updateQuantity(10);
</code></pre>

  <p>
    Para más información sobre cantidades de suscripción, consulta la documentación de Stripe .
  </p>

  <h3>Impuestos de suscripción</h3>
  <p>Para especificar el porcentaje de impuesto que un usuario paga en una suscrípción, implementa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taxPercentage</span> en tu modelo facturable y devuelve un valor numérico entre 0 y 100, sin más de 2 posiciones decimales.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>public function taxPercentage()
{
    return 20;
}
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taxPercentage</span> le permite aplicar una tasa de impuesto modelo por modelo, lo que puede ser útil para una base de usuarios que abarca varios países y tasas de impuestos.
  </p>

  <p>Nota</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taxPercentage</span> solamente aplica para cargos por suscripción. Si usas Cashier para hacer cargos de "pago único", necesitarás especificar manualmente la tasa de impuesto en ese momento.</p>

  <h4>Sincronizando los porcentajes del impuesto</h4>
  <p>Al cambiar el valor retornado por el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taxPercentage</span>, las configuraciones de impuesto en cualquier suscripción existente del usuario permanecerán igual. Si deseas actualizar el valor del impuesto para un suscripción existente con el valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">taxPercentage</span> retornado, debes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">syncTaxPercentage</span> en la instancia de suscripción del usuario:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;subscription('main')-&gt;syncTaxPercentage();
</code></pre>

  <h3>Fecha de anclaje de la suscripción</h3>

  <p>Nota</p>
  <p>Modificar la fecha de suscripción sólo es soportado por la versión de Stripe de Cashier.</p>

  <p>Por defecto, el anclaje del ciclo de facturación es la fecha en que se creó la suscripción o, si se usa un período de prueba, la fecha en que finaliza la prueba. Si deseas modificar la fecha de anclaje de facturación, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">anchorBillingCycleOn</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use App\User;
use Carbon\Carbon;

\$user = User::find(1);

\$anchor = Carbon::parse('first day of next month');

\$user-&gt;newSubscription('main', 'premium')
            -&gt;anchorBillingCycleOn(\$anchor-&gt;startOfDay())
            -&gt;create(\$token);
</code></pre>

  <p>
    Para más información sobre administrar ciclos de facturación, consulta la documentación del ciclo de facturación de Stripe

  </p>

  <h3>Cancelando suscripciones</h3>
  <p>Para cancelar una suscripción, ejecuta el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cancel</span> en la suscripción del usuario:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;subscription('main')-&gt;cancel();
</code></pre>

  <p>Cuando una suscripción es cancelada, Cashier establecerá automáticamente la columna
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ends_at</span> en tu base de datos. Esta columna es usada para conocer cuando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribed</span> debería empezar, devolviendo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>. Por ejemplo, si un cliente cancela una suscripción el primero de Marzo, pero la suscripción no estaba planificada para finalizar sino para el 5 de Marzo, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">subscribed</span> continuará devolviendo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> hasta el 5 de Marzo.</p>
  <p>Puedes determinar si un usuario ha cancelado su suscripción pero aún está en su "período de gracia" usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onGracePeriod</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;subscription('main')-&gt;onGracePeriod()) {
    //
}
</code></pre>

  <p>Si deseas cancelar una suscripción inmediatamente, ejecuta el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cancelNow</span> en la suscripción del usuario:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;subscription('main')-&gt;cancelNow();
</code></pre>

  <h3>Reanudando suscripciones</h3>
  <p>Si un usuario ha cancelado su suscripción y deseas reanudarla, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resume</span>. El usuario <strong>debe</strong> estár aún en su período de gracia con el propósito de reanudar una suscripción:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;subscription('main')-&gt;resume();
</code></pre>

  <p>Si el usuario cancela una suscripción y después reanuda esa suscripción antes que la suscripción haya expirado completamente, no será facturada inmediatamente. En lugar de eso, su suscripción será reactivada y será facturada en el ciclo de facturación original.</p>

  <h2>Períodos de prueba de suscripción</h2>

  <h3>Con información anticipada de la tarjeta de crédito</h3>
  <p>Si prefieres ofrecer períodos de prueba a tus clientes mientras continuas coleccionando información anticipada del método de pago, deberías usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trialDays</span> al momento de crear tus suscripciones:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = User::find(1);

\$user-&gt;newSubscription('main', 'monthly')
            -&gt;trialDays(10)
            -&gt;create(\$token);
</code></pre>

  <p>Este método establecerá la fecha de finalización del período de prueba del registro de suscripción dentro de la base de datos, al igual que le indicará a Stripe a no empezar a facturar al cliente hasta después de esta fecha. Al usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trialDays</span>, Cashier sobrescribirá cualquier periodo de prueba por defecto configurado para el plan en Stripe.
  </p>

  <p>Nota</p>
  <p>Si la suscripción del cliente no es cancelada antes de la fecha de finalización del período de prueba, será cargada tan pronto como expire el período de prueba, así que deberías asegurarte de notificar a tus usuarios de la fecha de finalización de su período de prueba.</p>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trialUntil</span> te permite proporcionar una instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">DateTime</span> para especificar cuando el periodo de prueba debería terminar:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Carbon\Carbon;

\$user-&gt;newSubscription('main', 'monthly')
            -&gt;trialUntil(Carbon::now()-&gt;addDays(10))
            -&gt;create(\$token);
</code></pre>

  <p>Puedes determinar si el usuario está dentro de su período de prueba utilizando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onTrial</span> de la instancia del usuario o el método<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onTrial</span> de la instancia de suscripción. Los dos ejemplos que siguen son idénticos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;onTrial('main')) {
    //
}

if (\$user-&gt;subscription('main')-&gt;onTrial()) {
    //
}
</code></pre>

  <h3>Sin información anticipada de la tarjeta de crédito</h3>
  <p>Si prefieres ofrecer períodos de prueba sin coleccionar la información anticipada del método de pago del usuario, puedes establecer la columna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trial_ends_at</span> del registro del usuario con la fecha de finalización del período de prueba deseado. Esto es hecho típicamente durante el registro del usuario:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = User::create([
    // Populate other user properties...
    'trial_ends_at' =&gt; now()-&gt;addDays(10),
]);
</code></pre>

  <p>Nota</p>
  <p>Asegúrate de agregar un mutador de fecha para <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trial_ends_at</span> en tu definición de modelo.
  </p>

  <p>Cashier se refiere a este tipo de período de prueba como un "período de prueba genérico", debido a que no está conectado a ninguna suscripción existente. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onTrial</span> en la instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">User</span> devolverá <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si la fecha actual no es mayor al valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trial_ends_at</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;onTrial()) {
    // User is within their trial period...
}
</code></pre>

  <p>También puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">onGenericTrial</span> si deseas conocer específicamente que el usuario está dentro de su período de prueba "genérico" y no ha creado una suscripción real todavía:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;onGenericTrial()) {
    // User is within their "generic" trial period...
}
</code></pre>

  <p>Una vez que estés listo para crear una suscripción real para el usuario, puedes usar el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">newSubscription</span> como es usual:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user = User::find(1);

\$user-&gt;newSubscription('main', 'monthly')-&gt;create(\$token);
</code></pre>

  <h2>Clientes</h2>

  <h3>Creando clientes</h3>
  <p>Ocasionalmente, puedes desear crear un cliente de Stripe sin iniciar una suscripción. Puedes lograr esto usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">createAsStripeCustomer</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;createAsStripeCustomer();
</code></pre>

  <p>Una vez el cliente ha sido creado en Stripe, puedes iniciar una suscripción en una fecha posterior.
  </p>

  <h2>Tarjetas</h2>

  <h3>Recuperando tarjetas de crédito</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">card</span> en la instancia del modelo facturable retorna una colección de instancias <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Laravel\Cashier\Card</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$cards = \$user-&gt;cards();
</code></pre>

  <p>Para recuperar la tarjeta por defecto, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">defaultCard</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$card = \$user-&gt;defaultCard();
</code></pre>

  <h3>Determinando si una tarjeta está en el archivo</h3>
  <p>Puedes comprobar si un cliente tiene una tarjeta de credito agregada a su cuenta usando el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hasCardOnFile</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>if (\$user-&gt;hasCardOnFile()) {
    //
}
</code></pre>

  <h3>Actualizando tarjetas de crédito</h3>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateCard</span> puede ser usado para actualizar la información de tarjeta de crédito de un cliente. Este método acepta un token de Stripe y asignará la nueva tarjeta de crédito como el método de pago por defecto:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;updateCard(\$token);
</code></pre>

  <p>Para sincronizar tu información de tarjeta con la información de la tarjeta por defecto del cliente en Stripe, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateCardFromStripe</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;updateCardFromStripe();
</code></pre>

  <h3>Eliminando tarjetas de crédito</h3>
  <p>Para eliminar una tarjeta, debes primero recuperar las tarjetas del cliente con el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cards</span>. Luego, puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">delete</span> en la instancia de la tarjeta que deseas eliminar:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>foreach (\$user-&gt;cards() as \$card) {
    \$card-&gt;delete();
}
</code></pre>

  <p>Nota</p>
  <p>Si eliminas la tarjeta por defecto, por favor asegurate de que sincronizas la nueva tarjeta por defecto con tu base de datos usando método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">updateCardFromStripe</span>.</p>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">deleteCards</span> eliminará toda la información de la tarjeta almacenada por tu aplicación:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;deleteCards();
</code></pre>

  <p>Nota</p>
  <p>Si el usuario tiene una suscripción activa, debes considerar evitar que eliminen la última forma de pago restante.</p>

  <h2>Manejando webhooks de Stripe</h2>
  <p>Stripe puede notificar tu aplicación de una variedad de eventos por medio de Webhooks. Para manejar webhooks, define una ruta que apunte al controlador de webhook de Cashier. Este controlador manejará todas las solicitudes de webhook entrantes y despacharlos al método de controlador apropiado.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::post(
    'stripe/webhook',
    '\Laravel\Cashier\Http\Controllers\WebhookController@handleWebhook'
);
</code></pre>

  <p>Nota</p>
  <p>Una vez que hayas resgistrado tu ruta, asegúrate de configurar la URL de webhook en tus opciones de configuración de panel de control de Stripe.</p>

  <p>De forma predeterminada, este controlador manejará automáticamente la cancelación de suscripciones que tengan demasiados cargos fallidos (como sean definidos por tus opciones de configuración de Stripe), actualizaciones de clientes, eliminaciones de clientes, actualizaciones de suscripciones y cambios de tarjetas de crédito; sin embargo, como vamos a descubrir pronto, puedes extender este controlador para manejar cualquier evento de webhook que quieras.
  </p>

  <p>Nota</p>
  <p>Asegurate de proteger las peticiones entrantes con el middleware [webhook de verificación de firma][/billing.html#verifying-webhook-signatures] incluido en Cashier.</p>

  <h4>Webhooks &amp; Protección CSRF</h4>
  <p>Ya que los webhooks de Stripe necesitan pasar por alto la protección CSRF de Laravel, asegurate de listar la URI como una excepción en tu middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">VerifyCsrfToken</span> o lista la ruta fuera del grupo de middleware <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">web</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>protected \$except = [
    'stripe/*',
];
</code></pre>

  <h3>Definiendo manejadores de eventos de webhooks</h3>
  <p>Cashier maneja automáticamente la cancelación de suscripción por cargos fallidos, pero si tienes eventos de webhook adicionales que te gustaría manejar, extiende el controlador de Webhook. Tus nombres de métodos deberían corresponder con la convención esperada por Cashier, específicamente, los métodos deberían tener como prefijo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span> y el nombre "camel case" del webhook que deseas manejar. Por ejemplo, si deseas manejar el webhook <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">invoice.payment_succeeded</span>, deberías agregar un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handleInvoicePaymentSucceeded</span> al controlador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;?php

namespace App\Http\Controllers;

use Laravel\Cashier\Http\Controllers\WebhookController as CashierController;

class WebhookController extends CashierController
{
    /**
    * Handle invoice payment succeeded.
    *
    * @param  array  \$payload
    * @return \Symfony\Component\HttpFoundation\Response
    */
    public function handleInvoicePaymentSucceeded(\$payload)
    {
        // Handle The Event
    }
}
</code></pre>

  <p>Luego, define una ruta a tu controlador de Cashier dentro de tu archivo
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">routes/web.php</span>:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::post(
    'stripe/webhook',
    '\App\Http\Controllers\WebhookController@handleWebhook'
);
</code></pre>

  <h3>Suscripciones fallidas</h3>
  <p>¿Qué sucedería si una tarjeta de crédito expira? No importa - Cashier incluye un controlador de Webhook que puede cancelar fácilmente la suscripción del cliente por ti. Como notaste antes, todo lo que necesitas hacer es apuntar una ruta al controlador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>Route::post(
    'stripe/webhook',
    '\Laravel\Cashier\Http\Controllers\WebhookController@handleWebhook'
);
</code></pre>

  <p>¡Y eso es todo! Los pagos fallidos serán capturados y manejados por el controlador. El controlador cancelará la suscripción del cliente cuando Stripe determina que la suscripción ha fallado (normalmente después de tres intentos de pagos fallidos).</p>

  <h3>Verificando las firmas de los webhooks</h3>
  <p>
    Para asegurar tus webhooks, puedes usar las firmas de webhook de Stripe . Por conveniencia, Cashier automáticamente incluye un middleware que verifica si la petición del webhook de Stripe entrante es válida.
  </p>
  <p>Para habilitar la verificación de webhook, asegurate de que el valor de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">stripe.webhook.secret</span> está establecido en tu archivo de configuración <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">services</span>. El valor
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secret</span> del webhook puede ser retornado desde el dashboard de tu cuenta de Stripe.
  </p>

  <h2>Cargos únicos</h2>

  <h3>Cargo simple</h3>

  <p>Nota</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">charge</span> acepta la cantidad que prefieras cargar en el <strong>denominador
    más bajo de la moneda usada por tu aplicación</strong>.</p>

  <p>Si desea realizar un "cargo único" en la tarjeta de crédito de un cliente suscrito, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">charge</span> en una instancia de modelo facturable.</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Stripe Accepts Charges In Cents...
\$stripeCharge = \$user-&gt;charge(100);
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">charge</span> acepta un arreglo como segundo argumento, permitiendo que pases algunas opciones que desees para la creación de cargo de Stripe subyacente. Consulte la documentación de Stripe sobre las opciones disponibles al crear cargos:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;charge(100, [
    'custom_option' =&gt; \$value,
]);
</code></pre>

  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">charge</span> arrojará una excepción si el cargo falla. Si el cargo es exitoso, la respuesta completa de Stripe será devuelta por el método:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>try {
    \$response = \$user-&gt;charge(100);
} catch (Exception \$e) {
    //
}
</code></pre>

  <h3>Cargo con factura</h3>
  <p>Algunas veces puedes necesitar hacer un cargo único pero también generar una factura por el cargo de modo que puedas ofrecer un recibo PDF a tu cliente. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">invoiceFor</span> permite que hagas justamente eso. Por ejemplo, vamos a facturar al cliente \$5.00 por una "cuota única":
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>// Stripe Accepts Charges In Cents...
\$user-&gt;invoiceFor('One Time Fee', 500);
</code></pre>

  <p>La factura será cargada inmediatamente contra la tarjeta de crédito del usuario. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">invoiceFor</span> también acepta un arreglo como su tercer argumento. Este arreglo contiene las opciones de facturación para el elemento de la factura. El cuarto argumento aceptado por el método es también un arreglo. Este argumento final acepta las opciones de facturación de la factura en sí:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$user-&gt;invoiceFor('Stickers', 500, [
    'quantity' =&gt; 50,
], [
    'tax_percent' =&gt; 21,
]);
</code></pre>

  <p>Nota</p>
  <p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">invoiceFor</span> creará una factura de Stripe la cual reintentará intentos de facturación fallidos. Si no quieres que las facturas reintenten cargos fallidos, necesitarás cerrarlas usando la API de Stripe después del primer cargo fallido.</p>

  <h3>Reembolsando cargos</h3>
  <p>Si necesitas reembolsar un cargo de Stripe, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">refund</span>. Este método acepta el id del cargo de Stripe como su único argumento:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$stripeCharge = \$user-&gt;charge(100);

\$user-&gt;refund(\$stripeCharge-&gt;id);
</code></pre>

  <h2>Facturas</h2>
  <p>Puedes obtener fácilmente un arreglo de facturas de modelo facturables usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">invoices</span>:
  </p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>\$invoices = \$user-&gt;invoices();

// Include pending invoices in the results...
\$invoices = \$user-&gt;invoicesIncludingPending();
</code></pre>

  <p>Al momento de listar las facturas para el cliente, puedes usar los métodos helper de factura para mostrar la información de factura relevante. Por ejemplo, puedes querer listar todas las facturas en una tabla, permitiendo que el usuario descargue fácilmente algunas de ellas:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>&lt;table&gt;
    @foreach (\$invoices as \$invoice)
        &lt;tr&gt;
            &lt;td&gt;{{ \$invoice-&gt;date()-&gt;toFormattedDateString() }}&lt;/td&gt;
            &lt;td&gt;{{ \$invoice-&gt;total() }}&lt;/td&gt;
            &lt;td&gt;&lt;a href="/user/invoice/{{ \$invoice-&gt;id }}"&gt;Download&lt;/a&gt;&lt;/td&gt;
        &lt;/tr&gt;
    @endforeach
&lt;/table&gt;
</code></pre>

  <h3>Generando PDFs de facturas</h3>
  <p>Dentro de una ruta o controlador, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">downloadInvoice</span> para generar una descarga en PDF de la factura. Este método generará automáticamente la respuesta HTTP apropiada para enviar la descarga al navegador:</p>

  <pre style="background-color: #CFD8DC; color: #37474F; font-family: monospace;"><code>use Illuminate\Http\Request;

Route::get('user/invoice/{invoice}', function (Request \$request, \$invoiceId) {
    return \$request-&gt;user()-&gt;downloadInvoice(\$invoiceId, [
        'vendor'  =&gt; 'Your Company',
        'product' =&gt; 'Your Product',
    ]);
});
</code></pre>
</div>
""";