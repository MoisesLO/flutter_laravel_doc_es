import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrHelpers extends StatelessWidget {
  final String title;
  PrHelpers(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrHelpers,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrHelpers = """
<div style='font-size: 14.2px;'>
<h1>Helpers</h1>
<ul>
    <li>Introducción</li>
    <li>Métodos disponibles</li>
</ul>

<h2>Introducción</h2>
<p>Laravel incluye una variedad de funciones "helpers" globales de PHP. Muchas de esas funciones son
    usadas por el mismo framework; sin embargo, eres libre de usarlas en tus aplicaciones si lo
    encuentras conveniente.</p>

<h2>Métodos disponibles</h2>
<h3># Arreglos &amp; Objetos</h3>

<p>Arr::add Arr::collapse Arr::divide Arr::dot Arr::except Arr::first Arr::flatten Arr::forget
    Arr::get Arr::has Arr::last Arr::only Arr::pluck Arr::prepend Arr::pull Arr::random Arr::set
    Arr::sort Arr::sortRecursive Arr::where Arr::wrap data_fill data_get data_set head last</p>

<h3># Rutas</h3>

<p>app_path base_path config_path database_path mix public_path resource_path storage_path</p>

<h3># Cadenas</h3>

<p>__ class_basename e preg_replace_array Str::after Str::before Str::camel Str::contains
    Str::containsAll Str::endsWith Str::finish Str::is Str::kebab Str::limit Str::orderedUuid
    Str::plural Str::random Str::replaceArray Str::replaceFirst Str::replaceLast Str::singular
    Str::slug Str::snake Str::start Str::startsWith Str::studly Str::title Str::uuid trans
    trans_choice</p>

<h3># URLs</h3>

<p>action asset route secure_asset secure_url url</p>

<h3># Variados</h3>

<p>abort abort_if abort_unless app auth back bcrypt blank broadcast cache class_uses_recursive
    collect config cookie csrf_field csrf_token dd decrypt dispatch dispatch_now dump encrypt env
    event factory filled info logger method_field now old optional policy redirect report request
    rescue resolve response retry session tap throw_if throw_unless today trait_uses_recursive
    transform validator value view with</p>


<h2>Listado de Métodos</h2>

<h2>Arreglos &amp; Objetos</h2>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::add()</span> {#collection-method .first-collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::add</span> agrega una clave / valor dada a un arreglo si la clave no existe
    previamente en el arreglo o existe pero con un valor <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = Arr::add(['name' =&gt; 'Desk'], 'price', 100);

// ['name' =&gt; 'Desk', 'price' =&gt; 100]

\$array = Arr::add(['name' =&gt; 'Desk', 'price' =&gt; null], 'price', 100);

// ['name' =&gt; 'Desk', 'price' =&gt; 100]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::collapse()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::collapse</span> colapsa un arreglo de arreglos en un único arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = Arr::collapse([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);

// [1, 2, 3, 4, 5, 6, 7, 8, 9]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::divide()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::divide</span> retorna dos arreglos, uno contiene las claves y el otro
    contiene los valores del arreglo dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

[\$keys, \$values] = Arr::divide(['name' =&gt; 'Desk']);

// \$keys: ['name']

// \$values: ['Desk']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::dot()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::dot()</span> aplana un arreglo multidimensional en un arreglo de un sólo
    nivel que usa la notación de "punto" para indicar la profundidad:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]];

\$flattened = Arr::dot(\$array);

// ['products.desk.price' =&gt; 100]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::except()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::except()</span> remueve los pares clave / valor de un arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['name' =&gt; 'Desk', 'price' =&gt; 100];

\$filtered = Arr::except(\$array, ['price']);

// ['name' =&gt; 'Desk']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::first()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::first()</span> devuelve el primer elemento de un arreglo que cumpla la
    condición dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = [100, 200, 300];

\$first = Arr::first(\$array, function (\$value, \$key) {
    return \$value &gt;= 150;
});

// 200
</code></pre>

<p>Un valor por defecto puede ser pasado como un tercer parámetro al método. Este valor será
    retornado si no hay un valor que cumpla la condición:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$first = Arr::first(\$array, \$callback, \$default);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::flatten()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::flatten</span> unifica un arreglo multidimensional en un arreglo de un solo
    nivel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['name' =&gt; 'Joe', 'languages' =&gt; ['PHP', 'Ruby']];

\$flattened = Arr::flatten(\$array);

// ['Joe', 'PHP', 'Ruby']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::forget()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::forget</span> remueve un par clave / valor de un arreglo anidado usando la
    notación de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]];

Arr::forget(\$array, 'products.desk');

// ['products' =&gt; []]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::get()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::get</span> recupera un valor de un arreglo anidado usando la notación de
    "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]];

\$price = Arr::get(\$array, 'products.desk.price');

// 100
</code></pre>

<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::get</span> acepta un valor por defecto, el cual será devuelto si la clave
    especificada no es encontrada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$discount = Arr::get(\$array, 'products.desk.discount', 0);

// 0
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::has()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::has</span> comprueba si un elemento o elementos dados existen en un arreglo
    usando la notación de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['product' =&gt; ['name' =&gt; 'Desk', 'price' =&gt; 100]];

\$contains = Arr::has(\$array, 'product.name');

// true

\$contains = Arr::has(\$array, ['product.price', 'product.discount']);

// false
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::last()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::last</span> retorna el último elemento de un arreglo que cumpla la
    condición dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = [100, 200, 300, 110];

\$last = Arr::last(\$array, function (\$value, \$key) {
    return \$value &gt;= 150;
});

// 300
</code></pre>

<p>Un valor por defecto puede ser pasado como tercer argumento al método. Este valor será devuelto
    si ningún valor cumple la condición:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$last = Arr::last(\$array, \$callback, \$default);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::only()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::only</span> retorna solo el par clave / valor especificado del arreglo
    dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['name' =&gt; 'Desk', 'price' =&gt; 100, 'orders' =&gt; 10];

\$slice = Arr::only(\$array, ['name', 'price']);

// ['name' =&gt; 'Desk', 'price' =&gt; 100]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::pluck()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::pluck</span> recupera todos los valores para una clave dada de un arreglo:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = [
    ['developer' =&gt; ['id' =&gt; 1, 'name' =&gt; 'Taylor']],
    ['developer' =&gt; ['id' =&gt; 2, 'name' =&gt; 'Abigail']],
];

\$names = Arr::pluck(\$array, 'developer.name');

// ['Taylor', 'Abigail']
</code></pre>

<p>Puedes además especificar como deseas que la lista resultante sea codificada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$names = Arr::pluck(\$array, 'developer.name', 'developer.id');

// [1 =&gt; 'Taylor', 2 =&gt; 'Abigail']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::prepend()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::prepend</span> colocará un elemento al comienzo de un arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['one', 'two', 'three', 'four'];

\$array = Arr::prepend(\$array, 'zero');

// ['zero', 'one', 'two', 'three', 'four']
</code></pre>

<p>Si es necesario, puedes especificar la clave que debería ser usada por el valor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['price' =&gt; 100];

\$array = Arr::prepend(\$array, 'Desk', 'name');

// ['name' =&gt; 'Desk', 'price' =&gt; 100]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::pull()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::pull</span> retorna y remueve un par clave / valor de un arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['name' =&gt; 'Desk', 'price' =&gt; 100];

\$name = Arr::pull(\$array, 'name');

// \$name: Desk

// \$array: ['price' =&gt; 100]
</code></pre>

<p>Un valor por defecto puede ser pasado como tercer argumento del método. Este valor será devuelto
    si la clave no existe:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$value = Arr::pull(\$array, \$key, \$default);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::random()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::random</span> retorna un valor aleatorio de un arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = [1, 2, 3, 4, 5];

\$random = Arr::random(\$array);

// 4 - (retrieved randomly)
</code></pre>

<p>Puedes además especificar el número de elementos a retornar como un segundo argumento opcional.
    Nota que proveer este argumento retornará un arreglo, incluso si solo deseas un elemento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$items = Arr::random(\$array, 2);

// [2, 5] - (retrieved randomly)
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::set()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::set</span> establece un valor dentro de un arreglo anidado usando la
    notación de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]];

Arr::set(\$array, 'products.desk.price', 200);

// ['products' =&gt; ['desk' =&gt; ['price' =&gt; 200]]]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::sort()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::sort</span> clasifica un arreglo por sus valores:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = ['Desk', 'Table', 'Chair'];

\$sorted = Arr::sort(\$array);

// ['Chair', 'Desk', 'Table']
</code></pre>

<p>Puedes además clasificar el arreglo por los resultados de la función de retorno dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = [
    ['name' =&gt; 'Desk'],
    ['name' =&gt; 'Table'],
    ['name' =&gt; 'Chair'],
];

\$sorted = array_values(Arr::sort(\$array, function (\$value) {
    return \$value['name'];
}));

/*
    [
        ['name' =&gt; 'Chair'],
        ['name' =&gt; 'Desk'],
        ['name' =&gt; 'Table'],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::sortRecursive()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array_sort_recursive</span> clasifica recursivamente un arreglo usando la
    función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sort</span> para sub-arreglos numericos y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ksort</span> para sub-arreglos
    asociativos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = [
    ['Roman', 'Taylor', 'Li'],
    ['PHP', 'Ruby', 'JavaScript'],
    ['one' =&gt; 1, 'two' =&gt; 2, 'three' =&gt; 3],
];

\$sorted = Arr::sortRecursive(\$array);

/*
    [
        ['JavaScript', 'PHP', 'Ruby'],
        ['one' =&gt; 1, 'three' =&gt; 3, 'two' =&gt; 2],
        ['Li', 'Roman', 'Taylor'],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::where()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::where</span> filtra un arreglo usando la función de retorno dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$array = [100, '200', 300, '400', 500];

\$filtered = Arr::where(\$array, function (\$value, \$key) {
    return is_string(\$value);
});

// [1 =&gt; '200', 3 =&gt; '400']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::wrap()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arr::wrap</span> envuelve el valor dado en un arreglo. Si el valor dado ya es un
    arreglo este no será cambiado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$string = 'Laravel';

\$array = Arr::wrap(\$string);

// ['Laravel']
</code></pre>

<p>Si el valor dado es nulo, un arreglo vacío será devuelto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Arr;

\$nothing = null;

\$array = Arr::wrap(\$nothing);

// []
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data_fill()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data_fill</span> establece un valor faltante dentro de un arreglo anidado u
    objeto usando la notación de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]];

data_fill(\$data, 'products.desk.price', 200);

// ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]]

data_fill(\$data, 'products.desk.discount', 10);

// ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100, 'discount' =&gt; 10]]]
</code></pre>

<p>Esta función además acepta asteriscos como comodines y rellenará el objetivo en consecuencia:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = [
    'products' =&gt; [
        ['name' =&gt; 'Desk 1', 'price' =&gt; 100],
        ['name' =&gt; 'Desk 2'],
    ],
];

data_fill(\$data, 'products.*.price', 200);

/*
    [
        'products' =&gt; [
            ['name' =&gt; 'Desk 1', 'price' =&gt; 100],
            ['name' =&gt; 'Desk 2', 'price' =&gt; 200],
        ],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data_get()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data_get</span> recupera un valor de un arreglo anidado u objeto usando la
    notación de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]];

\$price = data_get(\$data, 'products.desk.price');

// 100
</code></pre>

<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data_get</span> acepta además un valor por defecto, el cual será retornado si la
    clave especificada no es encontrada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$discount = data_get(\$data, 'products.desk.discount', 0);

// 0
</code></pre>

<p>La función también acepta wildcards usando astericos, que pueden tener como objetivo cualquier
    clave del arreglo u objeto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = [
    'product-one' =&gt; ['name' =&gt; 'Desk 1', 'price' =&gt; 100],
    'product-two' =&gt; ['name' =&gt; 'Desk 2', 'price' =&gt; 150],
];

data_get(\$data, '*.name');

// ['Desk 1', 'Desk 2'];
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data_set()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">data_set</span> establece un valor dentro de un arreglo anidado u objeto usando
    la notación de "punto":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]];

data_set(\$data, 'products.desk.price', 200);

// ['products' =&gt; ['desk' =&gt; ['price' =&gt; 200]]]
</code></pre>

<p>Esta función además acepta comodines y establecerá valores en el objetivo en consecuencia:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = [
    'products' =&gt; [
        ['name' =&gt; 'Desk 1', 'price' =&gt; 100],
        ['name' =&gt; 'Desk 2', 'price' =&gt; 150],
    ],
];

data_set(\$data, 'products.*.price', 200);

/*
    [
        'products' =&gt; [
            ['name' =&gt; 'Desk 1', 'price' =&gt; 200],
            ['name' =&gt; 'Desk 2', 'price' =&gt; 200],
        ],
    ]
*/
</code></pre>

<p>Por defecto, cualquier valor existente es sobrescrito. Si deseas solo establecer un valor si no
    existe, puedes pasar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> como cuarto argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]];

data_set(\$data, 'products.desk.price', 200, false);

// ['products' =&gt; ['desk' =&gt; ['price' =&gt; 100]]]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">head()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">head</span> retorna el primer elemento en el arreglo dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$array = [100, 200, 300];

\$first = head(\$array);

// 100
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">last()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">last</span> retorna el último elemento en el arreglo dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$array = [100, 200, 300];

\$last = last(\$array);

// 300
</code></pre>


<h2>Rutas</h2>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app_path()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app_path</span> retorna la ruta completa al directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span>. Además
    puedes usar la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app_path</span> para generar una ruta completa a un archivo
    relativo al directorio de la aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = app_path();

\$path = app_path('Http/Controllers/Controller.php');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">base_path()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">base_path</span> retorna la ruta completa a la raíz del proyecto. Además puedes
    usar la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">base_path</span> para generar una ruta completa a un archivo dado relativo
    al directorio raíz del proyecto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = base_path();

\$path = base_path('vendor/bin');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config_path()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config_path</span> retorna la ruta completa al directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span>.
    Puedes además usar la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config_path</span> para generar una ruta completa a un
    archivo dado dentro del directorio de configuración de la aplicación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = config_path();

\$path = config_path('app.php');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database_path()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database_path</span> retorna la ruta completa al directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>. Puedes además usar la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database_path</span> para generar una
    ruta completa a un archivo dado dentro del directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">database</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = database_path();

\$path = database_path('factories/UserFactory.php');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mix</span> retorna la ruta al
    archivo versionado Mix
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = mix('css/app.css');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public_path()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public_path</span> retorna la ruta completa al directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public</span>.
    Puedes además usar la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">public_path</span> para generar una ruta completa a un
    archivo dado dentro del directorio public:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = public_path();

\$path = public_path('css/app.css');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resource_path()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resource_path</span> retorna la ruta completa al directorio
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resources</span>. Puedes además usar la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resource_path</span> para generar
    una ruta completa a un archivo dado dentro del directorio resources:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = resource_path();

\$path = resource_path('sass/app.scss');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage_path()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage_path</span> retorna la ruta compelta al directorio <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage</span>.
    Puedes además usar la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">storage_path</span> para generar una ruta completa a un
    archivo dado dentro del directorio storage:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$path = storage_path();

\$path = storage_path('app/file.txt');
</code></pre>


<h2>Cadenas</h2>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__</span> traduce la cadena de traducción dada o clave de traducción dada
    usando tus
    archivos de localización
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo __('Welcome to our application');

echo __('messages.welcome');
</code></pre>

<p>Si la cadena o llave de traducción especificada no existe, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__</span> retornará
    el valor dado. Así, usando el ejemplo de arriba, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">__</span> podría retornar
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">messages.welcome</span> si esa clave de traducción no existe.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">class_basename()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">class_basename</span> retorna el nombre de la clase dada con el espacio de
    nombre de la clase removido:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$class = class_basename('Foo\Bar\Baz');

// Baz
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">e()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">e</span> ejecuta la función de PHP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">htmlspecialchars</span> con la opción
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">double_enspan</span> establecida establecida a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> por defecto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo e('&lt;html&gt;foo&lt;/html&gt;');

// &amp;lt;html&amp;gt;foo&amp;lt;/html&amp;gt;
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preg_replace_array()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">preg_replace_array</span> reemplaza un patrón dado en la cadena secuencialmente
    usando un arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$string = 'The event will take place between :start and :end';

\$replaced = preg_replace_array('/:[a-z_]+/', ['8:30', '9:00'], \$string);

// The event will take place between 8:30 and 9:00
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::after()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::after</span> retorna todo después del valor dado en una cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$slice = Str::after('This is my name', 'This is');

// ' my name'
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::before()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::before</span> retorna todo antes del valor dado en una cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$slice = Str::before('This is my name', 'my name');

// 'This is '
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::camel()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::camel</span> convierte la cadena dada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">camelCase</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$converted = Str::camel('foo_bar');

// fooBar
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::contains()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::contains</span> determina si la cadena dada contiene el valor dado
    (sensible a mayúsculas y minúsculas):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$contains = Str::contains('This is my name', 'my');

// true
</code></pre>

<p>Puedes además pasar un arreglo de valores para determinar si la cadena dada contiene cualquiera
    de los valores:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$contains = Str::contains('This is my name', ['my', 'foo']);

// true
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::containsAll()</span> {#collection-method}</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::containsAll</span> determina si la cadena dada contiene todos los valores
    del arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$containsAll = Str::containsAll('This is my name', ['my', 'name']);

// true
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::endsWith()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::endsWith</span> determina si la cadena dada finaliza con el valor dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$result = Str::endsWith('This is my name', 'name');

// true
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::finish()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::finish</span> agrega una instancia individual del valor dado a una cadena
    si éste no finaliza con el valor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$adjusted = Str::finish('this/string', '/');

// this/string/

\$adjusted = Str::finish('this/string/', '/');

// this/string/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::is()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::is</span> determina si una cadena dada concuerda con un patrón dado.
    Asteriscos pueden ser usados para indicar comodines:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$matches = Str::is('foo*', 'foobar');

// true

\$matches = Str::is('baz*', 'foobar');

// false
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::kebab()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::kebab</span> convierte la cadena dada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">kebab-case</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$converted = Str::kebab('fooBar');

// foo-bar
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::limit()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::limit</span> trunca la cadena dada en la longitud especificada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$truncated = Str::limit('The quick brown fox jumps over the lazy dog', 20);

// The quick brown fox...
</code></pre>

<p>Puedes además pasar un tercer argumento para cambiar la cadena que será adjuntada al final:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$truncated = Str::limit('The quick brown fox jumps over the lazy dog', 20, ' (...)');

// The quick brown fox (...)
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::orderedUuid</span> {#collection-method}</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::orderedUuid</span> genera una "primera marca de tiempo" UUID que puede ser
    eficientemente almacenada en una columna indexada de la base de datos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

return (string) Str::orderedUuid();
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::plural()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::plural</span> convierte una cadena a su forma plural. Esta función
    actualmente solo soporta el idioma inglés:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$plural = Str::plural('car');

// cars

\$plural = Str::plural('child');

// children
</code></pre>

<p>Puedes además proporcionar un entero como segundo argumento a la función para recuperar la forma
    singular o plural de la cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$plural = Str::plural('child', 2);

// children

\$plural = Str::plural('child', 1);

// child
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::random()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::random</span> genera una cadena aleatoria con la longitud especificada.
    Esta función usa la función PHP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">random_bytes</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$random = Str::random(40);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::replaceArray()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::replaceArray</span> reemplaza un valor dado en la cadena secuencialmente
    usando un arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$string = 'The event will take place between ? and ?';

\$replaced = Str::replaceArray('?', ['8:30', '9:00'], \$string);

// The event will take place between 8:30 and 9:00
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::replaceFirst()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::replaceFirst</span> reemplaza la primera ocurrencia de un valor dado en una
    cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$replaced = Str::replaceFirst('the', 'a', 'the quick brown fox jumps over the lazy dog');

// a quick brown fox jumps over the lazy dog
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::replaceLast()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::replaceLast</span> reemplaza la última ocurrencia de un valor dado en una
    cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$replaced = Str::replaceLast('the', 'a', 'the quick brown fox jumps over the lazy dog');

// the quick brown fox jumps over a lazy dog
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::singular()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::singular</span> convierte una cadena a su forma singular. Esta función
    actualmente solo soporta el idioma inglés:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$singular = Str::singular('cars');

// car

\$singular = Str::singular('children');

// child
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::slug()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::slug</span> genera una URL amigable con la cadena dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$slug = Str::slug('Laravel 5 Framework', '-');

// laravel-5-framework
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::snake()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::snake()</span> convierte la cadena dada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">snake_case</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$converted = Str::snake('fooBar');

// foo_bar
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::start()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::start</span> agrega una instancia individual del valor dado a una cadena si
    ésta no inicia con ese valor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$adjusted = Str::start('this/string', '/');

// /this/string

\$adjusted = Str::start('/this/string', '/');

// /this/string
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::startsWith()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::startsWith</span> determina si la cadena dada comienza con el valor dado:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$result = Str::startsWith('This is my name', 'This');

// true
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::studly()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::studly</span> convierte la cadena dada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">StudlyCase</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$converted = Str::studly('foo_bar');

// FooBar
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::title()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::title</span> convierte la cadena dada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Title Case</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

\$converted = Str::title('a nice title uses the correct case');

// A Nice Title Uses The Correct Case
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::uuid()</span> {#collection-method}</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Str::uuid</span> genera un UUID (versión 4):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

return (string) Str::uuid();
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans</span> traduce la clave de traducción dada usando tus
    archivos de localización
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo trans('messages.welcome');
</code></pre>

<p>Si la clave de traducción especificada no existe, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans</span> retornará la
    clave dada. Así, usando el ejemplo de arriba, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans</span> podría retornar
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">messages.welcome</span> si la clave de traducción no existe.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans_choice()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans_choice</span> traduce la clave de traducción dada con inflexión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>echo trans_choice('messages.notifications', \$unreadCount);
</code></pre>

<p>Si la clave de traducción dada no existe, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans_choice</span> retornará la clave
    dada. Así, usando el ejemplo de arriba, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trans_choice</span> podría retornar
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">messages.notifications</span> si la clave de traducción no existe.</p>

<h2>URLs</h2>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">action()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">action</span> genera una URL para la acción del controlador dada. No necesitas
    pasar el espacio de nombre completo. En lugar de eso, pasa al controlador el nombre de clase
    relativo al espacio de nombre <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">App\Http\Controllers</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = action('HomeController@index');

\$url = action([HomeController::class, 'index']);
</code></pre>

<p>Si el método acepta parámetros de ruta, puedes pasarlos como segundo argumento al método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = action('UserController@profile', ['id' =&gt; 1]);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">asset()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">asset</span> genera una URL para un asset usando el esquema actual de la
    solicitud (HTTP o HTTPS):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = asset('img/photo.jpg');
</code></pre>

<p>Puedes configurar la URL host del asset estableciendo la variable <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">ASSET_URL</span> en tu
    archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span>. Esto puede ser útil si alojas tus assets en un servicio externo como
    Amazon S3:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>// ASSET_URL=http://example.com/assets

\$url = asset('img/photo.jpg'); // http://example.com/assets/img/photo.jpg
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span> genera una URL para el nombre de ruta dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = route('routeName');
</code></pre>

<p>Si la ruta acepta parámetros, puedes pasarlos como segundo argumento al método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = route('routeName', ['id' =&gt; 1]);
</code></pre>

<p>Por defecto, la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">route</span> genera una URL absoluta. Si deseas generar una URL
    relativa, puedes pasar <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> como tercer argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = route('routeName', ['id' =&gt; 1], false);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secure_asset()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secure_asset</span> genera una URL para un asset usando HTTPS:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = secure_asset('img/photo.jpg');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secure_url()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">secure_url</span> genera una URL HTTPS completa a la ruta dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = secure_url('user/profile');

\$url = secure_url('user/profile', [1]);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">url</span> genera una URL completa a la ruta dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$url = url('user/profile');

\$url = url('user/profile', [1]);
</code></pre>

<p>Si una ruta no es proporcionada, una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Routing\UrlGenerator</span> es
    retornada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$current = url()-&gt;current();

\$full = url()-&gt;full();

\$previous = url()-&gt;previous();
</code></pre>


<h2>Variados</h2>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort</span> arroja
    una excepción HTTP
    que será renderizada por el
    manejador de excepciones
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>abort(403);
</code></pre>

<p>Puedes además proporcionar el texto de respuesta de la excepción y las cabeceras de la respuesta
    personalizados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>abort(403, 'Unauthorized.', \$headers);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort_if()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort_if</span> arroja una excepción HTTP si una expresión booleana dada es
    evaluada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>abort_if(! Auth::user()-&gt;isAdmin(), 403);
</code></pre>

<p>Como el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort</span>, puedes proporcionar además el texto de respuesta para la
    excepción como tercer argumento y un arreglo de cabeceras de respuesta personalizadas como
    cuarto argumento.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort_unless()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort_unless</span> arroja una excepción HTTP si una expresión booleana dada es
    evaluada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>abort_unless(Auth::user()-&gt;isAdmin(), 403);
</code></pre>

<p>Como el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">abort</span>, puedes proporcionar además el texto de respuesta para la
    excepción como tercer argumento y un arreglo de cabeceras de respuesta personalizadas como
    cuarto argumento.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">app</span> retorna la instancia del
    contenedor de servicio
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$container = app();
</code></pre>

<p>Puedes pasar una clase o nombre de interfaz para resolverlo desde el contenedor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$api = app('HelpSpot\API');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">auth</span> retorna una instancia del
    autenticador
    . Puedes usarla en vez del facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Auth</span> por conveniencia:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = auth()-&gt;user();
</code></pre>

<p>Si es necesario, puedes especificar con cual instancia del guard podrías acceder:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = auth('admin')-&gt;user();
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">back()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">back</span> genera una
    respuesta de redirección HTTP
    a la ubicación previa del usuario:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return back(\$status = 302, \$headers = [], \$fallback = false);

return back();
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bcrypt()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">bcrypt</span>
    encripta
    el valor dado usando Bcrypt. Puedes usarlo como una alternativa al facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Hash</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$password = bcrypt('my-secret-password');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">blank()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">blank</span> retorna <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si el valor dado es "vacío":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>blank('');
blank('   ');
blank(null);
blank(collect());

// true

blank(0);
blank(true);
blank(false);

// false
</code></pre>

<p>Para lo inverso de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">blank</span>, mira el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filled</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">broadcast</span>
    emite
    el
    evento
    dado a sus listeners:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>broadcast(new UserRegistered(\$user));
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cache</span> puede ser usada para obtener un valor de la
    cache
    . Si la clave dada no existe en la cache, un valor opcional por defecto será retornado:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = cache('key');

\$value = cache('key', 'default');
</code></pre>

<p>Puedes agregar elementos a la cache pasando un arreglo de pares clave / valor a la función.
    También debes pasar la cantidad de segundos o la duración que el valor almacenado en caché debe
    considerarse válido:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>cache(['key' =&gt; 'value'], 300);

cache(['key' =&gt; 'value'], now()-&gt;addSeconds(10));
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">class_uses_recursive()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">class_uses_recursive</span> retorna todos los traits usados por una clase,
    incluyendo traits por todas las clases padre:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$traits = class_uses_recursive(App\User::class);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collect()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collect</span> crea una instancia de
    colecciones
    del valor dado:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['taylor', 'abigail']);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config</span> obtiene el valor de una variable de
    configuración
    . Los valores de configuración pueden ser accesados usando la sintaxis de "punto", la cual
    incluye el nombre del archivo y la opción que deseas acceder. Un valor por defecto puede ser
    especificado y es retornado si la opción de configuración no existe:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = config('app.timezone');

\$value = config('app.timezone', \$default);
</code></pre>

<p>Puedes establecer variables de configuración en tiempo de ejecución pasando un arreglo de pares
    clave / valor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>config(['app.debug' =&gt; true]);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">cookie</span> crea una nueva instancia de
    cookie
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$cookie = cookie('name', 'value', \$minutes);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">csrf_field()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">csrf_field</span> genera un campo de entrada <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hidden</span> que contiene
    el valor del token CSRF. Por ejemplo, usando la
    sintaxis de Blade
    :
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>{{ csrf_field() }}
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">csrf_token()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">csrf_token</span> recupera el valor del actual token CSRF:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$token = csrf_token();
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dd()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dd</span> desecha las variables dadas y finaliza la ejecución del script:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>dd(\$value);

dd(\$value1, \$value2, \$value3, ...);
</code></pre>

<p>Si no quieres detener la ejecución de tu script, usa la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span> en su lugar.
</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decrypt()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">decrypt</span> desencripta el valor dado usando el
    encriptador
    de Laravel:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$decrypted = decrypt(\$encrypted_value);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dispatch()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dispatch</span> empuja el
    trabajo
    dado sobre la
    cola de trabajos
    de Laravel:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>dispatch(new App\Jobs\SendEmails);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dispatch_now()</span> {#collection-method}</h4>
<p>
    La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dispatch_now</span> ejecuta el
    trabajo
    dado inmediatamente y retorna el valor de su método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">handle</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$result = dispatch_now(new App\Jobs\SendEmails);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span> desecha las variables dadas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>dump(\$value);

dump(\$value1, \$value2, \$value3, ...);
</code></pre>

<p>Si quieres parar de ejecutar el script después de desechar las variables, usa la función
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dd</span> en su lugar.</p>

<p>TIP</p>
<p>Puedes usar el comando de Artisan <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump-server</span> para interceptar todas las llamadas
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span> y mostrarlas en la ventana de tu consola en lugar de tu navegador.</p>



<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">encrypt()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">encrypt</span> encripta el valor dado usando el encriptador de Laravel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$encrypted = encrypt(\$unencrypted_value);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span> recupera el valor de una variable de entorno o retorna un valor por
    defecto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$env = env('APP_ENV');

// Returns 'production' if APP_ENV is not set...
\$env = env('APP_ENV', 'production');
</code></pre>


<p>Nota</p>
<p>Si ejecutas el comando <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">config:cache</span> durante tu proceso de despliegue, deberías estar
    seguro de que eres el único llamando a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">env</span> desde dentro de tus archivos
    de configuración. Una vez que la configuración está en caché, el archivo <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> no
    será cargado y todas las llamadas a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">.env</span> retornarán <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>.
</p>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">event</span> despacha el evento dado a sus listeners:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>event(new UserRegistered(\$user));
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">factory()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">factory</span> crea un constructor de model factories para una clase dada,
    nombre y cantidad. Este puede ser usado mientras pruebas o haces seeding:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = factory(App\User::class)-&gt;make();
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filled()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filled</span> retorna el valor dado que no esté "vacío":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>filled(0);
filled(true);
filled(false);

// true

filled('');
filled('   ');
filled(null);
filled(collect());

// false
</code></pre>

<p>Para el inverso de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filled</span>, mira el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">blank</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">info()</span> {#collection-method}</h4>
<p>La función<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">info</span> escribirá información al log:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>info('Some helpful information!');
</code></pre>

<p>Un arreglo de datos contextuales puede además ser pasado a la función:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>info('User login attempt failed.', ['id' =&gt; \$user-&gt;id]);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">logger()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">logger</span> puede ser usada para escribir mensaje de nivel <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">debug</span>
    al log:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>logger('Debug message');
</code></pre>

<p>Un arreglo de datos contextuales puede además ser pasado a la función:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>logger('User has logged in.', ['id' =&gt; \$user-&gt;id]);
</code></pre>

<p>Una instancia del logger será retornada si no hay un valor pasado a la función:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>logger()-&gt;error('You are not allowed here.');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">method_field()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">method_field</span> genera un campo de entrada HTML <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">hidden</span> que
    contiene el valor falsificado del verbo de los formularios HTTP. Por ejemplo, usando la sintaxis
    de Blade:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>&lt;form method="POST"&gt;
    {{ method_field('DELETE') }}
&lt;/form&gt;
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">now()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">now</span> crea una nueva instancia <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Carbon</span> con
    la hora actual:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$now = now();
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">old()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">old</span> recupera un viejo valor de entrada flasheado en la sesión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = old('value');

\$value = old('value', 'default');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">optional()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">optional</span> acepta cualquier argumento y te permite acceder a propiedades o
    métodos de llamada en ese objeto. Si el objeto dado es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>, las propiedades y
    métodos retornarán <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span> en vez de causar un error:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return optional(\$user-&gt;address)-&gt;street;

{!! old('name', optional(\$user)-&gt;name) !!}
</code></pre>

<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">optional</span> también acepta un Closure como segundo argumento. El Closure
    será invocado si el valor proporcionado como primer argumento no es null:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return optional(User::find(\$id), function (\$user) {
    return new DummyUser;
});
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">policy()</span> {#collection-method}</h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">policy</span> recupera una instancia de la política para una clase dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$policy = policy(App\User::class);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirect()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">redirect</span> retorna una respuesta de redirección HTTP o retorna la instancia
    del redirector si no hay argumentos llamados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return redirect(\$to = null, \$status = 302, \$headers = [], \$secure = null);

return redirect('/home');

return redirect()-&gt;route('route.name');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span> reportará una excepción usando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span> de tu
    manejador de excepciones:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>report(\$e);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">request()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">request</span> retorna la instancia de la solicitud actual u obtiene un elemento
    de entrada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$request = request();

\$value = request('key', \$default);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rescue()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rescue</span> ejecuta la función de retorno dada y almacena en cache cualquier
    excepción que ocurra durante su ejecución. Todas las excepciones que son capturadas serán
    enviadas al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">report</span> de tu manejador de excepciones; no obstante, la solicitud
    continuará procesando:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return rescue(function () {
    return \$this-&gt;method();
});
</code></pre>

<p>También puedes pasar un segundo argumento a la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">rescue</span>. Este argumento será
    el valor por "defecto" que debería ser retornado si una excepción ocurre mientras se ejecuta la
    función de retorno:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return rescue(function () {
    return \$this-&gt;method();
}, false);

return rescue(function () {
    return \$this-&gt;method();
}, function () {
    return \$this-&gt;failure();
});
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resolve()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">resolve</span> resuelve un nombre de clase o interfaz dado a su instancia usando
    elcontenedor de servicios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$api = resolve('HelpSpot\API');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">response()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">response</span> crea una instancia de respuesta u obtiene una instancia del
    factory de respuesta:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return response('Hello World', 200, \$headers);

return response()-&gt;json(['foo' =&gt; 'bar'], 200, \$headers);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">retry</span> intenta ejecutar la función de retorno dada hasta que el máximo
    número de intentos límite se cumple. Si la función de retorno no arroja una excepción, su valor
    de retorno será retornado. Si la función de retorno arroja una excepción, se volverá a intentar
    automáticamente. Si el máximo número de intentos es excedido, la excepción será arrojada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return retry(5, function () {
    // Attempt 5 times while resting 100ms in between attempts...
}, 100);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">session</span> puede ser usada para obtener o establecer valores de session:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = session('key');
</code></pre>

<p>Puedes establecer valores pasando un arreglo de pares clave / valor a la función:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>session(['chairs' =&gt; 7, 'instruments' =&gt; 3]);
</code></pre>

<p>La sesión almacenada será retornada si no se pasa un valor a la función:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$value = session()-&gt;get('key');

session()-&gt;put('key', \$value);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span> acepta dos argumentos: un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$value</span> arbitrario y una
    función de retorno. El <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$value</span> será pasado a la función de retorno y será retornado
    por la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span>. El valor de retorno de la función de retorno es irrelevante:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = tap(User::first(), function (\$user) {
    \$user-&gt;name = 'taylor';

    \$user-&gt;save();
});
</code></pre>

<p>Si no hay función de retorno para la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span>, puedes llamar cualquier método en
    el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$value</span> dado. El valor de retorno del método al que llama siempre será <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$value</span>,
    sin importar lo que el método retorna en su definición. Por ejemplo, el método de Eloquent
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span> típicamente retorna un entero. Sin embargo, podemos forzar que el método
    retorne el modelo en sí mismo encadenando el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">update</span> a través de la función
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$user = tap(\$user)-&gt;update([
    'name' =&gt; \$name,
    'email' =&gt; \$email,
]);
</code></pre>

<p>Para agregar un método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span> a una clase, puedes agregar el trait <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Traits\Tappable</span>
    a la clase. El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span> de este trait acepta un Closoure como único argumento. La
    instancia del objeto será pasada al Closure y luego retornada por el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span>:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return \$user-&gt;tap(function (\$user) {
    //
});
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">throw_if()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">throw_if</span> arroja la excepción dada si una expresión booleana dada es
    evaluada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>throw_if(! Auth::user()-&gt;isAdmin(), AuthorizationException::class);

throw_if(
    ! Auth::user()-&gt;isAdmin(),
    AuthorizationException::class,
    'You are not allowed to access this page'
);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">throw_unless()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">throw_unless</span> arroja la excepción dada si una expresión booleana dada es
    evaluada a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>throw_unless(Auth::user()-&gt;isAdmin(), AuthorizationException::class);

throw_unless(
    Auth::user()-&gt;isAdmin(),
    AuthorizationException::class,
    'You are not allowed to access this page'
);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">today()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">today</span> crea una nueva instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Carbon</span>
    para la fecha actual:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$today = today();
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trait_uses_recursive()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">trait_uses_recursive</span> retorna todos los traits usados por un trait:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$traits = trait_uses_recursive(\Illuminate\Notifications\Notifiable::class);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transform()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transform</span> ejecuta una función de retorno en un valor dado si el valor no
    está en vacío y retorna el resultado de la función de retorno:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$callback = function (\$value) {
    return \$value * 2;
};

\$result = transform(5, \$callback);

// 10
</code></pre>

<p>Un valor o <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> puede ser pasado como el tercer parámetro al método. Este valor
    será retornado si el valor dado está vacío:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$result = transform(null, \$callback, 'The value is blank');

// The value is blank
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validator()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">validator</span> crea un nueva instancia del validador con los argumentos dados.
    Puedes usarlo en vez del facade <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Validator</span> por conveniencia:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$validator = validator(\$data, \$rules, \$messages);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">value()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">value</span> retorna el valor dado. Sin embargo, si pasas un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> a la función, el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> será ejecutado y su resultado será
    devuelto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$result = value(true);

// true

\$result = value(function () {
    return false;
});

// false
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">view</span> recupera una instancia de la vista:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>return view('auth.login');
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with()</span> {#collection-method}</h4>
<p>La función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">with</span> retorna el valor dado. Si se le pasa un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> como
    segundo argumento a la función, el <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Closure</span> será ejecutado y su resultado será
    devuelto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$callback = function (\$value) {
    return (is_numeric(\$value)) ? \$value * 2 : 0;
};

\$result = with(5, \$callback);

// 10

\$result = with(null, \$callback);

// 0

\$result = with(5, null);

// 5
</code></pre>
</div>
""";