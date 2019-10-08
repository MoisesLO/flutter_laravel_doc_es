import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
class PrColecciones extends StatelessWidget {
  final String title;
  PrColecciones(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView(
          children: <Widget>[
            HtmlWidget(
              HtmPrColecciones,
            ),
            Padding(
              padding: const EdgeInsets.all(25),
            )
          ],
        )
    );
  }
}

const HtmPrColecciones = """
<div style='font-size: 14.2px;'>
<h1>Colecciones</h1>
<ul>
    <li>
        Introducción
        <ul>
            <li>Creando colecciones</li>
            <li>Extendiendo colecciones</li>
        </ul>
    </li>
    <li>Métodos disponibles</li>
    <li>Mensajes de orden superior</li>
</ul>

<h2>Introducción</h2>
<p>La clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Collection</span> provee una interfaz fluida y conveniente para
    trabajar con arreglos de datos. Por ejemplo, mira el siguiente código. Usaremos la función
    helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collect</span> para crear una nueva instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> pasando un
    arreglo como parámetro, se ejecuta la función <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">strtoupper</span> en cada elemento y luego
    elimina todos los elementos vacíos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['taylor', 'abigail', null])-&gt;map(function (\$name) {
    return strtoupper(\$name);
})
-&gt;reject(function (\$name) {
    return empty(\$name);
});
</code></pre>

<p>Como puedes ver, la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> te permite encadenar sus métodos para realizar
    un mapeo fluido y reducir el arreglo subyacente. En general, las colecciones son inmutables, es
    decir, cada método de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> retorna una nueva instancia de
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span>.</p>

<h3># Creando colecciones</h3>
<p>Como se ha mencionado más arriba, el helper <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collect</span> retorna una nueva instancia de
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Illuminate\Support\Collection</span> para el arreglo dado. Entonces, crear una colección
    es tan simple como:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3]);
</code></pre>


<p>TIP</p>
<p>
    Las respuestas de
    Eloquent
    siempre retornan una instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span>.
</p>



<h3># Extendiendo colecciones</h3>
<p>Las colecciones son "macroable", es decir, te permite agregar métodos adicionales a la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> en tiempo de ejecución. Por ejemplo, el siguiente código agrega un
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toUpper</span> a la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>use Illuminate\Support\Str;

Collection::macro('toUpper', function () {
    return \$this-&gt;map(function (\$value) {
        return Str::upper(\$value);
    });
});

\$collection = collect(['first', 'second']);

\$upper = \$collection-&gt;toUpper();

// ['FIRST', 'SECOND']
</code></pre>

<p>Por lo general, los macros para una colección se declaran en un proveedor de servicios.</p>

<h2>Métodos disponibles</h2>
<p>Por el resto de esta documentación, discutiremos cada método disponible en la clase <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span>.
    Recuerda, todos estos métodos pueden estar encadenados a la manipulación fluida del arreglo
    subyacente. Además, casi todos los métodos devuelven una nueva instancia de
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span>, lo que te permite conservar la copia original de la colección cuando
    sea necesario:</p>

<p>all average avg chunk collapse combine concat contains containsStrict count countBy crossJoin dd
    diff diffAssoc diffKeys dump duplicates duplicatesStrict each eachSpread every except filter
    first firstWhere flatMap flatten flip forget forPage get groupBy has implode intersect
    intersectByKeys isEmpty isNotEmpty join keyBy keys last macro make map mapInto mapSpread
    mapToGroups mapWithKeys max median merge mergeRecursive min mode nth only pad partition pipe
    pluck pop prepend pull push put random reduce reject replace replaceRecursive reverse search
    shift shuffle slice some sort sortBy sortByDesc sortKeys sortKeysDesc splice split sum take tap
    times toArray toJson transform union unique uniqueStrict unless unlessEmpty unlessNotEmpty
    unwrap values when whenEmpty whenNotEmpty where whereStrict whereBetween whereIn whereInStrict
    whereInstanceOf whereNotBetween whereNotIn whereNotInStrict wrap zip</p>


<h2>Lista de métodos</h2>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all</span> devuelve el arreglo subyacente representado por la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([1, 2, 3])-&gt;all();

// [1, 2, 3]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">average()</span></h4>
<p>Alias del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">avg</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">avg()</span></h4>
<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">avg</span> retorna el

    promedio


    de una llave dada:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$average = collect([['foo' =&gt; 10], ['foo' =&gt; 10], ['foo' =&gt; 20], ['foo' =&gt; 40]])-&gt;avg('foo');

// 20

\$average = collect([1, 1, 2, 4])-&gt;avg();

// 2
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chunk()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">chunk</span> divide la colección en múltiples colecciones más pequeñas de un
    tamaño dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5, 6, 7]);

\$chunks = \$collection-&gt;chunk(4);

\$chunks-&gt;toArray();

// [[1, 2, 3, 4], [5, 6, 7]]
</code></pre>

<p>
    Este método es especialmente útil en las vistas cuando se trabaja con un sistema de grillas como
    el de

    Bootstrap


    . Imagina que tienes una colección de modelos Eloquent y quieres mostrar en una grilla lo
    siguiente:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>@foreach (\$products-&gt;chunk(3) as \$chunk)
    &lt;div class="row"&gt;
        @foreach (\$chunk as \$product)
            &lt;div class="col-xs-4"&gt;{{ \$product-&gt;name }}&lt;/div&gt;
        @endforeach
    &lt;/div&gt;
@endforeach
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collapse()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">collapse</span> contrae una colección de arreglos en una sola colección plana:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([[1, 2, 3], [4, 5, 6], [7, 8, 9]]);

\$collapsed = \$collection-&gt;collapse();

\$collapsed-&gt;all();

// [1, 2, 3, 4, 5, 6, 7, 8, 9]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">combine()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">combine</span> combina las llaves de la colección con los valores de otro arreglo
    o colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name', 'age']);

\$combined = \$collection-&gt;combine(['George', 29]);

\$combined-&gt;all();

// ['name' =&gt; 'George', 'age' =&gt; 29]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">concat()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">concat</span> concatena un arreglo dado o valores de una colección al final de la
    colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['John Doe']);

\$concatenated = \$collection-&gt;concat(['Jane Doe'])-&gt;concat(['name' =&gt; 'Johnny Doe']);

\$concatenated-&gt;all();

// ['John Doe', 'Jane Doe', 'Johnny Doe']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains</span> determina si la colección contiene un elemento dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name' =&gt; 'Desk', 'price' =&gt; 100]);

\$collection-&gt;contains('Desk');

// true

\$collection-&gt;contains('New York');

// false
</code></pre>

<p>También puedes pasar la llave y el valor al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains</span>, que determinará si
    existe en la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['product' =&gt; 'Desk', 'price' =&gt; 200],
    ['product' =&gt; 'Chair', 'price' =&gt; 100],
]);

\$collection-&gt;contains('product', 'Bookcase');

// false
</code></pre>

<p>Finalmente, también puedes pasar una función de retorno al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains</span> para
    realizar tu propia comprobación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$collection-&gt;contains(function (\$value, \$key) {
    return \$value &gt; 5;
});

// false
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains</span> utiliza comparaciones "flexibles" (loose) al verificar valores de
    elementos, lo que significa que una cadena con un valor entero se considerará igual a un entero
    del mismo valor. Usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">containsStrict</span> si deseas una comparación "estricta".
</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">containsStrict()</span></h4>
<p>Este método funciona igual que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains</span>; sin embargo, todos los valores se
    comparan utilizando comparaciones "estrictas".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">count()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">count</span> devuelve la cantidad total de elementos en la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4]);

\$collection-&gt;count();

// 4
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">countBy()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">count By</span> cuenta las ocurrencias de valores en la colección. Por defecto,
    el método cuenta las ocurrencias de cada elemento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 2, 2, 3]);

\$counted = \$collection-&gt;countBy();

\$counted-&gt;all();

// [1 =&gt; 1, 2 =&gt; 3, 3 =&gt; 1]
</code></pre>

<p>Sin embargo, puedes pasar una función de retorno (callback) al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">countBy</span> para
    contar todos los elementos por un valor personalizado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['alice@gmail.com', 'bob@yahoo.com', 'carlos@gmail.com']);

\$counted = \$collection-&gt;countBy(function (\$email) {
    return substr(strrchr(\$email, "@"), 1);
});

\$counted-&gt;all();

// ['gmail.com' =&gt; 2, 'yahoo.com' =&gt; 1]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">crossJoin()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">crossJoin</span> realiza un join cruzado entre los valores de la colección y los
    arreglos o colecciones dadas, devolviendo un producto cartesiano con todas las permutaciones
    posibles:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2]);

\$matrix = \$collection-&gt;crossJoin(['a', 'b']);

\$matrix-&gt;all();

/*
    [
        [1, 'a'],
        [1, 'b'],
        [2, 'a'],
        [2, 'b'],
    ]
*/

\$collection = collect([1, 2]);

\$matrix = \$collection-&gt;crossJoin(['a', 'b'], ['I', 'II']);

\$matrix-&gt;all();

/*
    [
        [1, 'a', 'I'],
        [1, 'a', 'II'],
        [1, 'b', 'I'],
        [1, 'b', 'II'],
        [2, 'a', 'I'],
        [2, 'a', 'II'],
        [2, 'b', 'I'],
        [2, 'b', 'II'],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dd()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dd</span> muestra los elementos de la colección y finaliza la ejecución del
    script:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['John Doe', 'Jane Doe']);

\$collection-&gt;dd();

/*
    Collection {
        #items: array:2 [
            0 =&gt; "John Doe"
            1 =&gt; "Jane Doe"
        ]
    }
*/
</code></pre>

<p>Si no quieres dejar de ejecutar el script, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">diff()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">diff</span> compara la colección con otra colección o una <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">arreglo</span>
    simple de PHP basado en sus valores. Este método devolverá los valores en la colección original
    que no están presentes en la colección dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$diff = \$collection-&gt;diff([2, 4, 6, 8]);

\$diff-&gt;all();

// [1, 3, 5]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">diffAssoc()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">diffAssoc</span> compara la colección con otra colección o un
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">arreglo</span> simple de PHP basado en sus claves y valores. Este método devolverá los
    pares clave / valor en la colección original que no están presentes en la colección dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    'color' =&gt; 'orange',
    'type' =&gt; 'fruit',
    'remain' =&gt; 6
]);

\$diff = \$collection-&gt;diffAssoc([
    'color' =&gt; 'yellow',
    'type' =&gt; 'fruit',
    'remain' =&gt; 3,
    'used' =&gt; 6
]);

\$diff-&gt;all();

// ['color' =&gt; 'orange', 'remain' =&gt; 6]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">diffKeys()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">diffKeys</span> compara la colección con otra colección o un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">arreglo</span>
    de PHP simple en base a sus claves. Este método devolverá los pares clave / valor en la
    colección original que no están presentes en la colección dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    'one' =&gt; 10,
    'two' =&gt; 20,
    'three' =&gt; 30,
    'four' =&gt; 40,
    'five' =&gt; 50,
]);

\$diff = \$collection-&gt;diffKeys([
    'two' =&gt; 2,
    'four' =&gt; 4,
    'six' =&gt; 6,
    'eight' =&gt; 8,
]);

\$diff-&gt;all();

// ['one' =&gt; 10, 'three' =&gt; 30, 'five' =&gt; 50]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dump</span> volca los elementos de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['John Doe', 'Jane Doe']);

\$collection-&gt;dump();

/*
    Collection {
        #items: array:2 [
            0 =&gt; "John Doe"
            1 =&gt; "Jane Doe"
        ]
    }
*/
</code></pre>

<p>Si deseas detener la ejecución del script después de volcar la colección, use el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">dd</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">duplicates()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">duplicates</span> obtiene y retorna valores duplicados de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>    \$collection = collect(['a', 'b', 'a', 'c', 'b']);

    \$collection-&gt;duplicates();

    // [2 =&gt; 'a', 4 =&gt; 'b']
</code></pre>

<p>If the collection contains arrays or objects, you can pass the key of the attributes that you
    wish to check for duplicate values:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$employees = collect([
    ['email' =&gt; 'abigail@example.com', 'position' =&gt; 'Developer'],
    ['email' =&gt; 'james@example.com', 'position' =&gt; 'Designer'],
    ['email' =&gt; 'victoria@example.com', 'position' =&gt; 'Developer'],
])

\$employees-&gt;duplicates('position');

// [2 =&gt; 'Developer']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">duplicatesStrict()</span></h4>
<p>Este método tiene la misma firma que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">duplicates</span>, sin embargo, todos los
    valores son comparandos usando comparaciones "estrictas".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">each()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">each</span> itera sobre los elementos de la colección y pasa cada elemento a una
    función de retorno (callback):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;each(function (\$item, \$key) {
    //
});
</code></pre>

<p>Si deseas detener la iteración a través de los elementos, puedes devolver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> en
    la función de retorno (callback):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;each(function (\$item, \$key) {
    if (/* some condition */) {
        return false;
    }
});
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">eachSpread()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">eachSpread</span> itera sobre los elementos de la colección, pasando cada valor
    de elemento anidado a la función de retorno (callback):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([['John Doe', 35], ['Jane Doe', 33]]);

\$collection-&gt;eachSpread(function (\$name, \$age) {
    //
});
</code></pre>

<p>Puedes detener la iteración a través de los elementos al devolver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span> en la
    función de retorno (callback):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;eachSpread(function (\$name, \$age) {
    return false;
});
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">every()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">every</span> se puede usar para verificar que todos los elementos de una
    colección pasen una comprobación dada a través de una función de retorno (callback):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([1, 2, 3, 4])-&gt;every(function (\$value, \$key) {
    return \$value &gt; 2;
});

// false
</code></pre>

<p>Si la colección está vacía, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">every</span> devolverá true:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([]);

\$collection-&gt;every(function(\$value, \$key) {
    return \$value &gt; 2;
});

// true
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">except()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">except</span> devuelve todos los elementos de la colección, excepto aquellos con
    las llaves especificadas:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['product_id' =&gt; 1, 'price' =&gt; 100, 'discount' =&gt; false]);

\$filtered = \$collection-&gt;except(['price', 'discount']);

\$filtered-&gt;all();

// ['product_id' =&gt; 1]
</code></pre>

<p>Para hacer lo contrario a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">except</span>, vea el método only.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filter()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filter</span> filtra la colección usando una función de retorno (callback),
    manteniendo solo los elementos que pasan la comprobación dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4]);

\$filtered = \$collection-&gt;filter(function (\$value, \$key) {
    return \$value &gt; 2;
});

\$filtered-&gt;all();

// [3, 4]
</code></pre>

<p>Si no se proporciona una función de retorno, se eliminarán todos los elementos de la colección
    que son equivalentes a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, null, false, '', 0, []]);

\$collection-&gt;filter()-&gt;all();

// [1, 2, 3]
</code></pre>

<p>Para hacer lo contrario a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filter</span>, echa un vistazo al método reject.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first</span> devuelve el primer elemento de la colección que pasa la comprobación
    en una función de retorno (callback) dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([1, 2, 3, 4])-&gt;first(function (\$value, \$key) {
    return \$value &gt; 2;
});

// 3
</code></pre>

<p>También puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first</span> sin argumentos para obtener el primer elemento
    de la colección. Si la colección está vacía, se devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([1, 2, 3, 4])-&gt;first();

// 1
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstWhere()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstWhere</span> devuelve el primer elemento de la colección con la clave y el
    valor proporcionado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['name' =&gt; 'Regena', 'age' =&gt; null],
    ['name' =&gt; 'Linda', 'age' =&gt; 14],
    ['name' =&gt; 'Diego', 'age' =&gt; 23],
    ['name' =&gt; 'Linda', 'age' =&gt; 84],
]);

\$collection-&gt;firstWhere('name', 'Linda');

// ['name' =&gt; 'Linda', 'age' =&gt; 14]
</code></pre>

<p>También puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstWhere</span> con un operador:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;firstWhere('age', '&gt;=', 18);

// ['name' =&gt; 'Diego', 'age' =&gt; 23]
</code></pre>

<p>Similar al método where, puedes pasar un argumento al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstWhere</span>. En este
    escenario, el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">firstWhere</span> retornará el primer elemento donde el valor de la
    clave dada es "verídico":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;firstWhere('age');

// ['name' =&gt; 'Linda', 'age' =&gt; 14]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flatMap()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flatMap</span> itera a través de la colección y pasa cada valor a una función de
    retorno (callback). La función de retorno es libre de modificar el elemento y devolverlo,
    formando así una nueva colección de elementos modificados. Entonces, el arreglo se aplana a un
    solo nivel:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['name' =&gt; 'Sally'],
    ['school' =&gt; 'Arkansas'],
    ['age' =&gt; 28]
]);

\$flattened = \$collection-&gt;flatMap(function (\$values) {
    return array_map('strtoupper', \$values);
});

\$flattened-&gt;all();

// ['name' =&gt; 'SALLY', 'school' =&gt; 'ARKANSAS', 'age' =&gt; '28'];
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flatten()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flatten</span> aplana una colección multidimensional en una de una sola
    dimensión:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name' =&gt; 'taylor', 'languages' =&gt; ['php', 'javascript']]);

\$flattened = \$collection-&gt;flatten();

\$flattened-&gt;all();

// ['taylor', 'php', 'javascript'];
</code></pre>

<p>Opcionalmente, puedes pasarle a la función un argumento de "profundidad":</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    'Apple' =&gt; [
        ['name' =&gt; 'iPhone 6S', 'brand' =&gt; 'Apple'],
    ],
    'Samsung' =&gt; [
        ['name' =&gt; 'Galaxy S7', 'brand' =&gt; 'Samsung']
    ],
]);

\$products = \$collection-&gt;flatten(1);

\$products-&gt;values()-&gt;all();

/*
    [
        ['name' =&gt; 'iPhone 6S', 'brand' =&gt; 'Apple'],
        ['name' =&gt; 'Galaxy S7', 'brand' =&gt; 'Samsung'],
    ]
*/
</code></pre>

<p>En este ejemplo, al llamar a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flatten</span> sin proporcionar la profundidad también se
    aplanarían los arreglos anidados, lo que da como resultado<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">['iPhone 6S', 'Apple', 'Galaxy S7', 'Samsung']</span>.
    Proporcionar una profundidad te permite restringir los niveles de arreglos anidados que se
    aplanarán.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flip()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flip</span> intercambia las llaves de la colección con sus valores
    correspondientes:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name' =&gt; 'taylor', 'framework' =&gt; 'laravel']);

\$flipped = \$collection-&gt;flip();

\$flipped-&gt;all();

// ['taylor' =&gt; 'name', 'laravel' =&gt; 'framework']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forget()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forget</span> elimina un elemento de la colección por su clave:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name' =&gt; 'taylor', 'framework' =&gt; 'laravel']);

\$collection-&gt;forget('name');

\$collection-&gt;all();

// ['framework' =&gt; 'laravel']
</code></pre>


<p>Nota</p>
<p>A diferencia de la mayoría de métodos de una colección, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forget</span> no devuelve una nueva
    colección modificada; modifica la colección a la que se llama.</p>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forPage()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">forPage</span> devuelve una nueva colección que contiene los elementos que
    estarían presentes en un número de página determinado. El método acepta el número de página como
    su primer argumento y la cantidad de elementos para mostrar por página como su segundo
    argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5, 6, 7, 8, 9]);

\$chunk = \$collection-&gt;forPage(2, 3);

\$chunk-&gt;all();

// [4, 5, 6]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">get</span> devuelve el elemento en una clave determinada. Si la clave no existe,
    se devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name' =&gt; 'taylor', 'framework' =&gt; 'laravel']);

\$value = \$collection-&gt;get('name');

// taylor
</code></pre>

<p>Opcionalmente, puedes pasar un valor predeterminado como segundo argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name' =&gt; 'taylor', 'framework' =&gt; 'laravel']);

\$value = \$collection-&gt;get('foo', 'default-value');

// default-value
</code></pre>

<p>Incluso puedes pasar una función de retorno (callback) como el valor por defecto. El resultado de
    la función de retorno se devolverá si la clave especificada no existe:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;get('email', function () {
    return 'default-value';
});

// default-value
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">groupBy()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">groupBy</span> agrupa los elementos de la colección con una clave determinada:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['account_id' =&gt; 'account-x10', 'product' =&gt; 'Chair'],
    ['account_id' =&gt; 'account-x10', 'product' =&gt; 'Bookcase'],
    ['account_id' =&gt; 'account-x11', 'product' =&gt; 'Desk'],
]);

\$grouped = \$collection-&gt;groupBy('account_id');

\$grouped-&gt;toArray();

/*
    [
        'account-x10' =&gt; [
            ['account_id' =&gt; 'account-x10', 'product' =&gt; 'Chair'],
            ['account_id' =&gt; 'account-x10', 'product' =&gt; 'Bookcase'],
        ],
        'account-x11' =&gt; [
            ['account_id' =&gt; 'account-x11', 'product' =&gt; 'Desk'],
        ],
    ]
*/
</code></pre>

<p>Además de pasar una clave, también puedes pasar una función de retorno (callback). La función de
    retorno debe devolver el valor de la clave por la que deseas agrupar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$grouped = \$collection-&gt;groupBy(function (\$item, \$key) {
    return substr(\$item['account_id'], -3);
});

\$grouped-&gt;toArray();

/*
    [
        'x10' =&gt; [
            ['account_id' =&gt; 'account-x10', 'product' =&gt; 'Chair'],
            ['account_id' =&gt; 'account-x10', 'product' =&gt; 'Bookcase'],
        ],
        'x11' =&gt; [
            ['account_id' =&gt; 'account-x11', 'product' =&gt; 'Desk'],
        ],
    ]
*/
</code></pre>

<p>Además de pasar una clave, también puedes pasar una función de retorno (callback). La función de
    retorno debe devolver el valor de la clave por la que deseas agrupar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$data = new Collection([
    10 =&gt; ['user' =&gt; 1, 'skill' =&gt; 1, 'roles' =&gt; ['Role_1', 'Role_3']],
    20 =&gt; ['user' =&gt; 2, 'skill' =&gt; 1, 'roles' =&gt; ['Role_1', 'Role_2']],
    30 =&gt; ['user' =&gt; 3, 'skill' =&gt; 2, 'roles' =&gt; ['Role_1']],
    40 =&gt; ['user' =&gt; 4, 'skill' =&gt; 2, 'roles' =&gt; ['Role_2']],
]);

\$result = \$data-&gt;groupBy([
    'skill',
    function (\$item) {
        return \$item['roles'];
    },
], \$preserveKeys = true);

/*
[
    1 =&gt; [
        'Role_1' =&gt; [
            10 =&gt; ['user' =&gt; 1, 'skill' =&gt; 1, 'roles' =&gt; ['Role_1', 'Role_3']],
            20 =&gt; ['user' =&gt; 2, 'skill' =&gt; 1, 'roles' =&gt; ['Role_1', 'Role_2']],
        ],
        'Role_2' =&gt; [
            20 =&gt; ['user' =&gt; 2, 'skill' =&gt; 1, 'roles' =&gt; ['Role_1', 'Role_2']],
        ],
        'Role_3' =&gt; [
            10 =&gt; ['user' =&gt; 1, 'skill' =&gt; 1, 'roles' =&gt; ['Role_1', 'Role_3']],
        ],
    ],
    2 =&gt; [
        'Role_1' =&gt; [
            30 =&gt; ['user' =&gt; 3, 'skill' =&gt; 2, 'roles' =&gt; ['Role_1']],
        ],
        'Role_2' =&gt; [
            40 =&gt; ['user' =&gt; 4, 'skill' =&gt; 2, 'roles' =&gt; ['Role_2']],
        ],
    ],
];
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">has</span> determina si existe una clave dada en la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['account_id' =&gt; 1, 'product' =&gt; 'Desk', 'amount' =&gt; 5]);

\$collection-&gt;has('product');

// true

\$collection-&gt;has(['product', 'amount']);

// true

\$collection-&gt;has(['amount', 'price']);

// false
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">implode()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">implode</span> une a los elementos de una colección. Sus argumentos dependen del
    tipo de elemento en la colección. Si la colección contiene arreglos u objetos, debes pasar la
    clave de los atributos que deseas unir y la cadena que deseas colocar entre los valores:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['account_id' =&gt; 1, 'product' =&gt; 'Desk'],
    ['account_id' =&gt; 2, 'product' =&gt; 'Chair'],
]);

\$collection-&gt;implode('product', ', ');

// Desk, Chair
</code></pre>

<p>Si la colección contiene cadenas simples o valores numéricos, pasa el separador como único
    argumento para el método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([1, 2, 3, 4, 5])-&gt;implode('-');

// '1-2-3-4-5'
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">intersect()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">intersect</span> elimina cualquier valor de la colección original que no esté
    presente en el arreglo o colección dada. La colección resultante conservará las claves de la
    colección original:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['Desk', 'Sofa', 'Chair']);

\$intersect = \$collection-&gt;intersect(['Desk', 'Chair', 'Bookcase']);

\$intersect-&gt;all();

// [0 =&gt; 'Desk', 2 =&gt; 'Chair']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">intersectByKeys()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">intersectByKeys</span> elimina cualquier clave de la colección original que no
    esté presente en el arreglo o colección dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    'serial' =&gt; 'UX301', 'type' =&gt; 'screen', 'year' =&gt; 2009
]);

\$intersect = \$collection-&gt;intersectByKeys([
    'reference' =&gt; 'UX404', 'type' =&gt; 'tab', 'year' =&gt; 2011
]);

\$intersect-&gt;all();

// ['type' =&gt; 'screen', 'year' =&gt; 2009]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isEmpty()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isEmpty</span> devuelve<span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si la colección está vacía; de lo
    contrario, se devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([])-&gt;isEmpty();

// true
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isNotEmpty()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">isNotEmpty</span> devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si la colección no está vacía; de lo
    contrario, se devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([])-&gt;isNotEmpty();

// false
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">join</span> une los valores de la colección con una cadena:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect(['a', 'b', 'c'])-&gt;join(', '); // 'a, b, c'
collect(['a', 'b', 'c'])-&gt;join(', ', ', and '); // 'a, b, and c'
collect(['a', 'b'])-&gt;join(', ', ' and '); // 'a and b'
collect(['a'])-&gt;join(', ', ' and '); // 'a'
collect([])-&gt;join(', ', ' and '); // ''
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">keyBy()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">keyBy</span> agrupa una colección por claves indicando una clave como párametro.
    Si varios elementos tienen la misma clave, solo el último aparecerá en la nueva colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['product_id' =&gt; 'prod-100', 'name' =&gt; 'Desk'],
    ['product_id' =&gt; 'prod-200', 'name' =&gt; 'Chair'],
]);

\$keyed = \$collection-&gt;keyBy('product_id');

\$keyed-&gt;all();

/*
    [
        'prod-100' =&gt; ['product_id' =&gt; 'prod-100', 'name' =&gt; 'Desk'],
        'prod-200' =&gt; ['product_id' =&gt; 'prod-200', 'name' =&gt; 'Chair'],
    ]
*/
</code></pre>

<p>También puedes pasar una función de retorno (callback) al método. La función debe devolver el
    valor de la clave de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$keyed = \$collection-&gt;keyBy(function (\$item) {
    return strtoupper(\$item['product_id']);
});

\$keyed-&gt;all();

/*
    [
        'PROD-100' =&gt; ['product_id' =&gt; 'prod-100', 'name' =&gt; 'Desk'],
        'PROD-200' =&gt; ['product_id' =&gt; 'prod-200', 'name' =&gt; 'Chair'],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">keys()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">keys</span> devuelve todas las claves de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    'prod-100' =&gt; ['product_id' =&gt; 'prod-100', 'name' =&gt; 'Desk'],
    'prod-200' =&gt; ['product_id' =&gt; 'prod-200', 'name' =&gt; 'Chair'],
]);

\$keys = \$collection-&gt;keys();

\$keys-&gt;all();

// ['prod-100', 'prod-200']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">last()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">last</span> devuelve el último elemento de la colección que pasa una condición
    dentro de una función de retorno (callback):</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([1, 2, 3, 4])-&gt;last(function (\$value, \$key) {
    return \$value &lt; 3;
});

// 2
</code></pre>

<p>También puedes llamar al método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">last</span> sin parámetros para obtener el último elemento
    de la colección. Si la colección está vacía, se devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([1, 2, 3, 4])-&gt;last();

// 4
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">macro()</span></h4>
<p>El método estático <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">macro</span> te permite agregar métodos a la clase
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span> en tiempo de ejecución. Consulta la documentación en Extendiendo
    Colecciones para mas información.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make()</span></h4>
<p>El método estático <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">make</span> crea una nueva instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Collection</span>. Más
    información en la sección de Creando Colecciones.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">map()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">map</span> itera a través de la colección y pasa cada valor a una función de
    retorno. La función de retorno es libre de modificar el elemento y devolverlo, formando así una
    nueva colección de elementos modificados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$multiplied = \$collection-&gt;map(function (\$item, \$key) {
    return \$item * 2;
});

\$multiplied-&gt;all();

// [2, 4, 6, 8, 10]
</code></pre>


<p>Nota</p>
<p>Como la mayoría de los otros métodos de colecciones, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">map</span> devuelve una nueva
    instancia de colección; no modifica la colección a la que se llama. Si quieres transformar la
    colección original, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transform</span>.</p>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mapInto()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mapInto()</span> itera sobre la colección, creando una nueva instancia de la
    clase dada pasando el valor al constructor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>class Currency
{
    /**
    * Create a new currency instance.
    *
    * @param  string  \$span
    * @return void
    */
    function __construct(string \$span)
    {
        \$this-&gt;span = \$span;
    }
}

\$collection = collect(['USD', 'EUR', 'GBP']);

\$currencies = \$collection-&gt;mapInto(Currency::class);

\$currencies-&gt;all();

// [Currency('USD'), Currency('EUR'), Currency('GBP')]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mapSpread()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mapSpread</span> itera sobre los elementos de la colección, pasando cada valor de
    elemento anidado a la función de retorno pasada como parámetro. La función de retorno es libre
    de modificar el elemento y devolverlo, formando así una nueva colección de elementos
    modificados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]);

\$chunks = \$collection-&gt;chunk(2);

\$sequence = \$chunks-&gt;mapSpread(function (\$even, \$odd) {
    return \$even + \$odd;
});

\$sequence-&gt;all();

// [1, 5, 9, 13, 17]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mapToGroups()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mapToGroups</span> agrupa los elementos de la colección por la función de retorno
    dada. La función de retorno debería devolver un arreglo asociativo que contenga una única clave
    / valor, formando así una nueva colección de valores agrupados:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    [
        'name' =&gt; 'John Doe',
        'department' =&gt; 'Sales',
    ],
    [
        'name' =&gt; 'Jane Doe',
        'department' =&gt; 'Sales',
    ],
    [
        'name' =&gt; 'Johnny Doe',
        'department' =&gt; 'Marketing',
    ]
]);

\$grouped = \$collection-&gt;mapToGroups(function (\$item, \$key) {
    return [\$item['department'] =&gt; \$item['name']];
});

\$grouped-&gt;toArray();

/*
    [
        'Sales' =&gt; ['John Doe', 'Jane Doe'],
        'Marketing' =&gt; ['Johnny Doe'],
    ]
*/

\$grouped-&gt;get('Sales')-&gt;all();

// ['John Doe', 'Jane Doe']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mapWithKeys()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mapWithKeys</span> itera a través de la colección y pasa cada valor a la función
    de retorno dada. La función de retorno debe devolver un arreglo asociativo que contiene una
    unica clave / valor:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    [
        'name' =&gt; 'John',
        'department' =&gt; 'Sales',
        'email' =&gt; 'john@example.com'
    ],
    [
        'name' =&gt; 'Jane',
        'department' =&gt; 'Marketing',
        'email' =&gt; 'jane@example.com'
    ]
]);

\$keyed = \$collection-&gt;mapWithKeys(function (\$item) {
    return [\$item['email'] =&gt; \$item['name']];
});

\$keyed-&gt;all();

/*
    [
        'john@example.com' =&gt; 'John',
        'jane@example.com' =&gt; 'Jane',
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">max()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">max</span> devuelve el valor máximo de una clave determinada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$max = collect([['foo' =&gt; 10], ['foo' =&gt; 20]])-&gt;max('foo');

// 20

\$max = collect([1, 2, 3, 4, 5])-&gt;max();

// 5
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">median()</span></h4>
<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">median</span> devuelve el

    valor medio


    de una clave dada:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$median = collect([['foo' =&gt; 10], ['foo' =&gt; 10], ['foo' =&gt; 20], ['foo' =&gt; 40]])-&gt;median('foo');

// 15

\$median = collect([1, 1, 2, 4])-&gt;median();

// 1.5
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">merge()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">merge</span> combina el arreglo o colección dada con la colección original. Si
    una clave en los elementos dados coincide con una clave de la colección original, el valor de
    los elementos dados sobrescribirá el valor en la colección original:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['product_id' =&gt; 1, 'price' =&gt; 100]);

\$merged = \$collection-&gt;merge(['price' =&gt; 200, 'discount' =&gt; false]);

\$merged-&gt;all();

// ['product_id' =&gt; 1, 'price' =&gt; 200, 'discount' =&gt; false]
</code></pre>

<p>Si las llaves de los elementos son numéricas, los valores se agregarán al final de la
    colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['Desk', 'Chair']);

\$merged = \$collection-&gt;merge(['Bookcase', 'Door']);

\$merged-&gt;all();

// ['Desk', 'Chair', 'Bookcase', 'Door']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mergeRecursive()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mergeRecursive</span> une el arreglo o colección dada de forma recursiva con la
    colección original. Si una cadena en los elementos dados coincide con una cadena en la colección
    original, entonces los valores para dichas cadenas son unidos en un arreglo, y esto es hecho de
    forma recursiva:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['product_id' =&gt; 1, 'price' =&gt; 100]);

\$merged = \$collection-&gt;merge(['product_id' =&gt; 2, 'price' =&gt; 200, 'discount' =&gt; false]);

\$merged-&gt;all();

// ['product_id' =&gt; [1, 2], 'price' =&gt; [100, 200], 'discount' =&gt; false]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">min()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">min</span> devuelve el valor mínimo de una llave determinada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$min = collect([['foo' =&gt; 10], ['foo' =&gt; 20]])-&gt;min('foo');

// 10

\$min = collect([1, 2, 3, 4, 5])-&gt;min();

// 1
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mode()</span></h4>
<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">mode</span> devuelve el

    valor moda


    de una clave dada:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$mode = collect([['foo' =&gt; 10], ['foo' =&gt; 10], ['foo' =&gt; 20], ['foo' =&gt; 40]])-&gt;mode('foo');

// [10]

\$mode = collect([1, 1, 2, 4])-&gt;mode();

// [1]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">nth()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">nth</span> crea una nueva colección que consiste en cada elemento n-ésimo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['a', 'b', 'c', 'd', 'e', 'f']);

\$collection-&gt;nth(4);

// ['a', 'e']
</code></pre>

<p>Opcionalmente puedes pasar un desplazamiento como segundo argumento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;nth(4, 1);

// ['b', 'f']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">only()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">only</span> devuelve los elementos de la colección con las claves especificadas:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['product_id' =&gt; 1, 'name' =&gt; 'Desk', 'price' =&gt; 100, 'discount' =&gt; false]);

\$filtered = \$collection-&gt;only(['product_id', 'name']);

\$filtered-&gt;all();

// ['product_id' =&gt; 1, 'name' =&gt; 'Desk']
</code></pre>

<p>Para hacer lo inverso a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">only</span>, usa el método except.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pad()</span></h4>
<p>
    El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pad</span> llenará el arreglo con el valor dado hasta que el arreglo alcance el
    tamaño especificado. Este método se comporta como la función

    array_pad


    de PHP.
</p>
<p>Para rellenar a la izquierda, debes especificar un tamaño negativo. No se realizará ningún
    relleno si el valor absoluto del tamaño dado es menor o igual que la longitud del arreglo:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['A', 'B', 'C']);

\$filtered = \$collection-&gt;pad(5, 0);

\$filtered-&gt;all();

// ['A', 'B', 'C', 0, 0]

\$filtered = \$collection-&gt;pad(-5, 0);

\$filtered-&gt;all();

// [0, 0, 'A', 'B', 'C']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">partition()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">partition</span> se puede combinar con la función PHP <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">list</span> para
    separar los elementos que pasan una comprobación dada de aquellos que no lo hacen:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5, 6]);

list(\$underThree, \$equalOrAboveThree) = \$collection-&gt;partition(function (\$i) {
    return \$i &lt; 3;
});

\$underThree-&gt;all();

// [1, 2]

\$equalOrAboveThree-&gt;all();

// [3, 4, 5, 6]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pipe()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pipe</span> pasa la colección a una función de retorno y devuelve el resultado:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3]);

\$piped = \$collection-&gt;pipe(function (\$collection) {
    return \$collection-&gt;sum();
});

// 6
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pluck()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pluck</span> recupera todos los valores para una llave dada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['product_id' =&gt; 'prod-100', 'name' =&gt; 'Desk'],
    ['product_id' =&gt; 'prod-200', 'name' =&gt; 'Chair'],
]);

\$plucked = \$collection-&gt;pluck('name');

\$plucked-&gt;all();

// ['Desk', 'Chair']
</code></pre>

<p>También puedes especificar cómo deseas que se coloquen las llaves:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$plucked = \$collection-&gt;pluck('name', 'product_id');

\$plucked-&gt;all();

// ['prod-100' =&gt; 'Desk', 'prod-200' =&gt; 'Chair']
</code></pre>

<p>Si existen llaves duplicadas, el último elemento que coincida será insertado en la colección
    recuperada:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['brand' =&gt; 'Tesla',  'color' =&gt; 'red'],
    ['brand' =&gt; 'Pagani', 'color' =&gt; 'white'],
    ['brand' =&gt; 'Tesla',  'color' =&gt; 'black'],
    ['brand' =&gt; 'Pagani', 'color' =&gt; 'orange'],
]);

\$plucked = \$collection-&gt;pluck('color', 'brand');

\$plucked-&gt;all();

// ['Tesla' =&gt; 'black', 'Pagani' =&gt; 'orange']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pop()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pop</span> elimina y devuelve el último elemento de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$collection-&gt;pop();

// 5

\$collection-&gt;all();

// [1, 2, 3, 4]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">prepend()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">prepend</span> agrega un elemento al comienzo de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$collection-&gt;prepend(0);

\$collection-&gt;all();

// [0, 1, 2, 3, 4, 5]
</code></pre>

<p>También puedes pasar un segundo argumento para establecer la clave del elemento antepuesto:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['one' =&gt; 1, 'two' =&gt; 2]);

\$collection-&gt;prepend(0, 'zero');

\$collection-&gt;all();

// ['zero' =&gt; 0, 'one' =&gt; 1, 'two' =&gt; 2]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pull()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">pull</span> elimina y devuelve un elemento de la colección por su clave:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['product_id' =&gt; 'prod-100', 'name' =&gt; 'Desk']);

\$collection-&gt;pull('name');

// 'Desk'

\$collection-&gt;all();

// ['product_id' =&gt; 'prod-100']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">push()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">push</span> agrega un elemento al final de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4]);

\$collection-&gt;push(5);

\$collection-&gt;all();

// [1, 2, 3, 4, 5]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">put</span> establece la clave y el valor dado en la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['product_id' =&gt; 1, 'name' =&gt; 'Desk']);

\$collection-&gt;put('price', 100);

\$collection-&gt;all();

// ['product_id' =&gt; 1, 'name' =&gt; 'Desk', 'price' =&gt; 100]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">random()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">random</span> devuelve un elemento aleatorio de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$collection-&gt;random();

// 4 - (retrieved randomly)
</code></pre>

<p>Opcionalmente, puedes pasar un número entero a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">random</span> para especificar cuántos
    elementos deseas recuperar al azar. Siempre se devuelve una colección de valores cuando se pasa
    explícitamente la cantidad de valores que deseas recibir:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$random = \$collection-&gt;random(3);

\$random-&gt;all();

// [2, 4, 5] - (retrieved randomly)
</code></pre>

<p>Si la colección tiene un númeno menor de elementos al solicitado, el método arrojará un <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">InvalidArgumentException</span>.
</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reduce()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reduce</span> reduce la colección a un solo valor, pasando el resultado de cada
    iteración a la iteración siguiente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3]);

\$total = \$collection-&gt;reduce(function (\$carry, \$item) {
    return \$carry + \$item;
});

// 6
</code></pre>

<p>El valor de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">\$carry</span> en la primera iteración es <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">null</span>; sin embargo,
    puedes especificar su valor inicial pasando un segundo argumento a reducir:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;reduce(function (\$carry, \$item) {
    return \$carry + \$item;
}, 4);

// 10
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reject()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reject</span> filtra la colección usando una función de retorno. La función de
    retorno debe devolver <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> si el elemento debe eliminarse de la colección
    resultante:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4]);

\$filtered = \$collection-&gt;reject(function (\$value, \$key) {
    return \$value &gt; 2;
});

\$filtered-&gt;all();

// [1, 2]
</code></pre>

<p>Para el inverso del método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reject</span>, ve el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filter</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">replace()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">replace</span> se comporta de forma similar a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">merge</span>; sin embargo, en
    adición a sobrescribir los elementos que coinciden con las cadenas, el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">replace</span> también sobrescribirá los elementos en la colección que tienen claves
    númericas coincidentes:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['Taylor', 'Abigail', 'James']);

\$replaced = \$collection-&gt;replace([1 =&gt; 'Victoria', 3 =&gt; 'Finn']);

// ['Taylor', 'Victoria', 'James', 'Finn']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">replaceRecursive()</span></h4>
<p>Este método funciona como el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">replace</span>, pero se reflejerá en arreglos y
    aplicará el mismo proceso de reemplazo a los valores internos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['Taylor', 'Abigail', ['James', 'Victoria', 'Finn']]);

\$replaced = \$collection-&gt;replaceRecursive(['Charlie', 2 =&gt; [1 =&gt; 'King']]);

\$replaced-&gt;all();

// ['Charlie', 'Abigail', ['James', 'King', 'Finn']]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reverse()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reverse</span> invierte el orden de los elementos de la colección, conservando
    las claves originales:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['a', 'b', 'c', 'd', 'e']);

\$reversed = \$collection-&gt;reverse();

\$reversed-&gt;all();

/*
    [
        4 =&gt; 'e',
        3 =&gt; 'd',
        2 =&gt; 'c',
        1 =&gt; 'b',
        0 =&gt; 'a',
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">search()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">search</span> busca en la colección el valor dado y devuelve su clave si se
    encuentra. Si el valor no se encuentra, se devuelve <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">false</span>.</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([2, 4, 6, 8]);

\$collection-&gt;search(4);

// 1
</code></pre>

<p>La búsqueda se realiza usando una comparación "flexible" (loose), lo que significa que una cadena
    con un valor entero se considerará igual a un número entero del mismo valor. Para usar una
    comparación "estricta", pasa <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span> como segundo parámetro del método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;search('4', true);

// false
</code></pre>

<p>Alternativamente, puedes pasar tu propia función de retorno para buscar el primer elemento que
    pase la validación:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection-&gt;search(function (\$item, \$key) {
    return \$item &gt; 5;
});

// 2
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shift()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shift</span> elimina y devuelve el primer elemento de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$collection-&gt;shift();

// 1

\$collection-&gt;all();

// [2, 3, 4, 5]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shuffle()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">shuffle</span> mezcla aleatoriamente los elementos en la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$shuffled = \$collection-&gt;shuffle();

\$shuffled-&gt;all();

// [3, 2, 5, 1, 4] - (generated randomly)
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slice()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">slice</span> devuelve una porción de la colección que comienza en el índice
    pasado como parámetro:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);

\$slice = \$collection-&gt;slice(4);

\$slice-&gt;all();

// [5, 6, 7, 8, 9, 10]
</code></pre>

<p>Si deseas limitar el tamaño de la porción devuelta, pase el tamaño deseado como segundo argumento
    para el método:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$slice = \$collection-&gt;slice(4, 2);

\$slice-&gt;all();

// [5, 6]
</code></pre>

<p>El segmento devuelto conservará las claves de forma predeterminada. Si no deseas conservar las
    claves originales, puedes usar el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">values</span> para volverlos a indexar.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">some()</span></h4>
<p>Alias para el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sort()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sort</span> ordena la colección. La colección ordenada conserva las claves del
    arreglo original, por lo que en este ejemplo utilizaremos el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">values</span> para
    restablecer las claves de los índices numerados consecutivamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([5, 3, 1, 2, 4]);

\$sorted = \$collection-&gt;sort();

\$sorted-&gt;values()-&gt;all();

// [1, 2, 3, 4, 5]
</code></pre>

<p>
    Si tus necesidades de ordenamiento son más avanzadas, puedes pasar una funión de retorno a
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sort</span> con tu propio algoritmo. Consulta la documentación de PHP en

    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">uasort</span>


    , que es lo que llama el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sort</span> de la colección.
</p>

<p>TIP</p>
<p>Si necesitas ordenar una colección de matrices u objetos anidados, consulta los métodos <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortBy</span>
    y <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortByDesc</span>.</p>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortBy()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortBy</span> ordena la colección con la clave dada. La colección ordenada
    conserva las claves del arreglo original, por lo que en este ejemplo utilizaremos el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">values</span> para restablecer las claves de los índices numerados consecutivamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['name' =&gt; 'Desk', 'price' =&gt; 200],
    ['name' =&gt; 'Chair', 'price' =&gt; 100],
    ['name' =&gt; 'Bookcase', 'price' =&gt; 150],
]);

\$sorted = \$collection-&gt;sortBy('price');

\$sorted-&gt;values()-&gt;all();

/*
    [
        ['name' =&gt; 'Chair', 'price' =&gt; 100],
        ['name' =&gt; 'Bookcase', 'price' =&gt; 150],
        ['name' =&gt; 'Desk', 'price' =&gt; 200],
    ]
*/
</code></pre>

<p>Puedes también pasar tu propia función de retorno para determinar como ordenar los valores de la
    colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['name' =&gt; 'Desk', 'colors' =&gt; ['Black', 'Mahogany']],
    ['name' =&gt; 'Chair', 'colors' =&gt; ['Black']],
    ['name' =&gt; 'Bookcase', 'colors' =&gt; ['Red', 'Beige', 'Brown']],
]);

\$sorted = \$collection-&gt;sortBy(function (\$product, \$key) {
    return count(\$product['colors']);
});

\$sorted-&gt;values()-&gt;all();

/*
    [
        ['name' =&gt; 'Chair', 'colors' =&gt; ['Black']],
        ['name' =&gt; 'Desk', 'colors' =&gt; ['Black', 'Mahogany']],
        ['name' =&gt; 'Bookcase', 'colors' =&gt; ['Red', 'Beige', 'Brown']],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortByDesc()</span></h4>
<p>Este método tiene la misma funcionalidad que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortBy</span>, pero ordenará la
    colección en el orden opuesto.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortKeys()</span></h4>
<p>The <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortKeys</span> method ordena la colección por las llaves del arrelgo asociativo
    subyacente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    'id' =&gt; 22345,
    'first' =&gt; 'John',
    'last' =&gt; 'Doe',
]);

\$sorted = \$collection-&gt;sortKeys();

\$sorted-&gt;all();

/*
    [
        'first' =&gt; 'John',
        'id' =&gt; 22345,
        'last' =&gt; 'Doe',
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortKeysDesc()</span></h4>
<p>Este método tiene la misma funcionalidad que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortKeys</span>, pero ordenará la
    colección en el orden opuesto.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">splice()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">splice</span> elimina y devuelve una porción de elementos comenzando en el índice
    especificado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$chunk = \$collection-&gt;splice(2);

\$chunk-&gt;all();

// [3, 4, 5]

\$collection-&gt;all();

// [1, 2]
</code></pre>

<p>Puedes pasar un segundo parámetro para limitar el tamaño del fragmento resultante:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$chunk = \$collection-&gt;splice(2, 1);

\$chunk-&gt;all();

// [3]

\$collection-&gt;all();

// [1, 2, 4, 5]
</code></pre>

<p>Además, puedes pasar un tercer parámetro que contenga los nuevos elementos para reemplazar los
    elementos eliminados de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$chunk = \$collection-&gt;splice(2, 1, [10, 11]);

\$chunk-&gt;all();

// [3]

\$collection-&gt;all();

// [1, 2, 10, 11, 4, 5]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">split()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">split</span> divide una colección en el número de grupos dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$groups = \$collection-&gt;split(3);

\$groups-&gt;toArray();

// [[1, 2], [3, 4], [5]]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sum()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sum</span> devuelve la suma de todos los elementos de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([1, 2, 3, 4, 5])-&gt;sum();

// 15
</code></pre>

<p>Si la colección contiene arreglos u objetos anidados, debes pasar una clave para determinar qué
    valores sumar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['name' =&gt; 'JavaScript: The Good Parts', 'pages' =&gt; 176],
    ['name' =&gt; 'JavaScript: The Definitive Guide', 'pages' =&gt; 1096],
]);

\$collection-&gt;sum('pages');

// 1272
</code></pre>

<p>Además, puedes pasar una función de retorno para determinar qué valores de la colección
    sumar:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['name' =&gt; 'Chair', 'colors' =&gt; ['Black']],
    ['name' =&gt; 'Desk', 'colors' =&gt; ['Black', 'Mahogany']],
    ['name' =&gt; 'Bookcase', 'colors' =&gt; ['Red', 'Beige', 'Brown']],
]);

\$collection-&gt;sum(function (\$product) {
    return count(\$product['colors']);
});

// 6
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">take()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">take</span> devuelve una nueva colección con el número especificado de elementos:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([0, 1, 2, 3, 4, 5]);

\$chunk = \$collection-&gt;take(3);

\$chunk-&gt;all();

// [0, 1, 2]
</code></pre>

<p>También puedes pasar un número entero negativo para tomar la cantidad especificada de elementos
    del final de la colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([0, 1, 2, 3, 4, 5]);

\$chunk = \$collection-&gt;take(-2);

\$chunk-&gt;all();

// [4, 5]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">tap</span> pasa la colección a la función de retorno dada, lo que te permite
    "aprovechar" la colección en un punto específico y hacer algo con los elementos sin afectar a la
    propia colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>collect([2, 4, 3, 1, 5])
    -&gt;sort()
    -&gt;tap(function (\$collection) {
        Log::debug('Values after sorting', \$collection-&gt;values()-&gt;toArray());
    })
    -&gt;shift();

// 1
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">times()</span></h4>
<p>El método estático <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">times</span> crea una nueva colección invocando una función de retorno y
    la cantidad determinada de veces:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = Collection::times(10, function (\$number) {
    return \$number * 9;
});

\$collection-&gt;all();

// [9, 18, 27, 36, 45, 54, 63, 72, 81, 90]
</code></pre>

<p>Este método puede ser útil cuando se combina con Factories para crear modelos Eloquent:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$categories = Collection::times(3, function (\$number) {
    return factory(Category::class)-&gt;create(['name' =&gt; "Category No. \$number"]);
});

\$categories-&gt;all();

/*
    [
        ['id' =&gt; 1, 'name' =&gt; 'Category #1'],
        ['id' =&gt; 2, 'name' =&gt; 'Category #2'],
        ['id' =&gt; 3, 'name' =&gt; 'Category #3'],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span> convierte la colección en un simple <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">array</span> de PHP. Si
    los valores de la colección son modelos Eloquent, los modelos también se convertirán en
    arreglos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name' =&gt; 'Desk', 'price' =&gt; 200]);

\$collection-&gt;toArray();

/*
    [
        ['name' =&gt; 'Desk', 'price' =&gt; 200],
    ]
*/
</code></pre>


<p>Nota</p>
<p><span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toArray</span> también convierte todos los objetos anidados de la colección que son una
    instancia de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">Arrayable</span> en un arreglo. En cambio, si deseas obtener el arreglo
    subyacente sin procesar, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">all</span>.</p>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toJson()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">toJson</span> convierte la colección en una cadena serializada JSON:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['name' =&gt; 'Desk', 'price' =&gt; 200]);

\$collection-&gt;toJson();

// '{"name":"Desk", "price":200}'
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transform()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transform</span> itera sobre la colección y llama a la función de retorno dada
    con cada elemento de la colección. Los elementos en la colección serán reemplazados por los
    valores devueltos de la función de retorno:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3, 4, 5]);

\$collection-&gt;transform(function (\$item, \$key) {
    return \$item * 2;
});

\$collection-&gt;all();

// [2, 4, 6, 8, 10]
</code></pre>


<p>Nota</p>
<p>A diferencia de la mayoría de otros métodos de las colecciones, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">transform</span> modifica
    la colección en sí. Si deseas crear una nueva colección en su lugar, usa el método
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">map</span>.</p>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">union()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">union</span> agrega el arreglo dado a la colección. Si el arreglo contiene claves
    que ya están en la colección original, se preferirán los valores de la colección original:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1 =&gt; ['a'], 2 =&gt; ['b']]);

\$union = \$collection-&gt;union([3 =&gt; ['c'], 1 =&gt; ['b']]);

\$union-&gt;all();

// [1 =&gt; ['a'], 2 =&gt; ['b'], 3 =&gt; ['c']]
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span> devuelve todos los elementos únicos en la colección. La colección
    devuelta conserva las claves del arreglo original, por lo que en este ejemplo utilizaremos el
    método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">values</span> para restablecer las llaves de los índices numerados
    consecutivamente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 1, 2, 2, 3, 4, 2]);

\$unique = \$collection-&gt;unique();

\$unique-&gt;values()-&gt;all();

// [1, 2, 3, 4]
</code></pre>

<p>Al tratar con arreglos u objetos anidados, puedes especificar la clave utilizada para determinar
    la singularidad:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['name' =&gt; 'iPhone 6', 'brand' =&gt; 'Apple', 'type' =&gt; 'phone'],
    ['name' =&gt; 'iPhone 5', 'brand' =&gt; 'Apple', 'type' =&gt; 'phone'],
    ['name' =&gt; 'Apple Watch', 'brand' =&gt; 'Apple', 'type' =&gt; 'watch'],
    ['name' =&gt; 'Galaxy S6', 'brand' =&gt; 'Samsung', 'type' =&gt; 'phone'],
    ['name' =&gt; 'Galaxy Gear', 'brand' =&gt; 'Samsung', 'type' =&gt; 'watch'],
]);

\$unique = \$collection-&gt;unique('brand');

\$unique-&gt;values()-&gt;all();

/*
    [
        ['name' =&gt; 'iPhone 6', 'brand' =&gt; 'Apple', 'type' =&gt; 'phone'],
        ['name' =&gt; 'Galaxy S6', 'brand' =&gt; 'Samsung', 'type' =&gt; 'phone'],
    ]
*/
</code></pre>

<p>También puedes pasar una función de retorno para determinar la singularidad del elemento:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$unique = \$collection-&gt;unique(function (\$item) {
    return \$item['brand'].\$item['type'];
});

\$unique-&gt;values()-&gt;all();

/*
    [
        ['name' =&gt; 'iPhone 6', 'brand' =&gt; 'Apple', 'type' =&gt; 'phone'],
        ['name' =&gt; 'Apple Watch', 'brand' =&gt; 'Apple', 'type' =&gt; 'watch'],
        ['name' =&gt; 'Galaxy S6', 'brand' =&gt; 'Samsung', 'type' =&gt; 'phone'],
        ['name' =&gt; 'Galaxy Gear', 'brand' =&gt; 'Samsung', 'type' =&gt; 'watch'],
    ]
*/
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span> utiliza comparaciones "flexibles" (loose) al verificar valores de
    elementos, lo que significa que una cadena con un valor entero se considerará igual a un entero
    del mismo valor. Usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">uniqueStrict</span> para filtrar usando una comparación
    "estricta".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">uniqueStrict()</span></h4>
<p>Este método tiene la misma funcionalidad que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span>; sin embargo, todos
    los valores se comparan utilizando comparaciones "estrictas".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unless()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unless</span> ejecutará una función de retorno a menos que el primer argumento
    dado al método se evalúe como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3]);

\$collection-&gt;unless(true, function (\$collection) {
    return \$collection-&gt;push(4);
});

\$collection-&gt;unless(false, function (\$collection) {
    return \$collection-&gt;push(5);
});

\$collection-&gt;all();

// [1, 2, 3, 5]
</code></pre>

<p>Para hacer lo inverso a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unless</span>, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unlessEmpty()</span></h4>
<p>Alias para el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenNotEmpty</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unlessNotEmpty()</span></h4>
<p>Alias para el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenEmpty</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unwrap()</span></h4>
<p>El método estático <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unwrap</span> devuelve los elementos subyacentes de la colección del
    valor dado cuando corresponda:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>Collection::unwrap(collect('John Doe'));

// ['John Doe']

Collection::unwrap(['John Doe']);

// ['John Doe']

Collection::unwrap('John Doe');

// 'John Doe'
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">values()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">values</span> devuelve una nueva colección con las claves restablecidas en
    enteros consecutivos:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    10 =&gt; ['product' =&gt; 'Desk', 'price' =&gt; 200],
    11 =&gt; ['product' =&gt; 'Desk', 'price' =&gt; 200]
]);

\$values = \$collection-&gt;values();

\$values-&gt;all();

/*
    [
        0 =&gt; ['product' =&gt; 'Desk', 'price' =&gt; 200],
        1 =&gt; ['product' =&gt; 'Desk', 'price' =&gt; 200],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span> ejecutará una función de retorno cuando el primer argumento dado al
    método se evalúa como <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">true</span>:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([1, 2, 3]);

\$collection-&gt;when(true, function (\$collection) {
    return \$collection-&gt;push(4);
});

\$collection-&gt;when(false, function (\$collection) {
    return \$collection-&gt;push(5);
});

\$collection-&gt;all();

// [1, 2, 3, 4]
</code></pre>

<p>Para hacer lo inverso a <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">when</span>, usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unless</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenEmpty()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenEmpty</span> ejecutará la función de retorno dada cuando la colección esté
    vacía:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['michael', 'tom']);

\$collection-&gt;whenEmpty(function (\$collection) {
    return \$collection-&gt;push('adam');
});

\$collection-&gt;all();

// ['michael', 'tom']


\$collection = collect();

\$collection-&gt;whenEmpty(function (\$collection) {
    return \$collection-&gt;push('adam');
});

\$collection-&gt;all();

// ['adam']


\$collection = collect(['michael', 'tom']);

\$collection-&gt;whenEmpty(function(\$collection) {
    return \$collection-&gt;push('adam');
}, function(\$collection) {
    return \$collection-&gt;push('taylor');
});

\$collection-&gt;all();

// ['michael', 'tom', 'taylor']
</code></pre>

<p>Para el inverso de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenEmpty</span>, ve el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenNotEmpty</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenNotEmpty()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenNotEmpty</span> ejecutará la función de retorno dada cuando la colección no
    esté vacía:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['michael', 'tom']);

\$collection-&gt;whenNotEmpty(function (\$collection) {
    return \$collection-&gt;push('adam');
});

\$collection-&gt;all();

// ['michael', 'tom', 'adam']


\$collection = collect();

\$collection-&gt;whenNotEmpty(function (\$collection) {
    return \$collection-&gt;push('adam');
});

\$collection-&gt;all();

// []


\$collection = collect();

\$collection-&gt;whenNotEmpty(function(\$collection) {
    return \$collection-&gt;push('adam');
}, function(\$collection) {
    return \$collection-&gt;push('taylor');
});

\$collection-&gt;all();

// ['taylor']
</code></pre>

<p>Para el inverso de <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenNotEmpty</span>, ve el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whenEmpty</span>.</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> filtra la colección por clave y valor pasados como parámetros:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['product' =&gt; 'Desk', 'price' =&gt; 200],
    ['product' =&gt; 'Chair', 'price' =&gt; 100],
    ['product' =&gt; 'Bookcase', 'price' =&gt; 150],
    ['product' =&gt; 'Door', 'price' =&gt; 100],
]);

\$filtered = \$collection-&gt;where('price', 100);

\$filtered-&gt;all();

/*
    [
        ['product' =&gt; 'Chair', 'price' =&gt; 100],
        ['product' =&gt; 'Door', 'price' =&gt; 100],
    ]
*/
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span> usa comparaciones "flexibles" (loose) al verificar valores de
    elementos, lo que significa que una cadena con un valor entero se considerará igual a un entero
    del mismo valor. Usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereStrict</span> para hacer comparaciones "estrictas".
</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereStrict()</span></h4>
<p>Este método tiene la misma funcionalidad que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">where</span>; sin embargo, todos los
    valores se comparan utilizando comparaciones "estrictas".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereBetween()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereBetween</span> filtra la colección dentro de un rango dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['product' =&gt; 'Desk', 'price' =&gt; 200],
    ['product' =&gt; 'Chair', 'price' =&gt; 80],
    ['product' =&gt; 'Bookcase', 'price' =&gt; 150],
    ['product' =&gt; 'Pencil', 'price' =&gt; 30],
    ['product' =&gt; 'Door', 'price' =&gt; 100],
]);

\$filtered = \$collection-&gt;whereBetween('price', [100, 200]);

\$filtered-&gt;all();

/*
    [
        ['product' =&gt; 'Desk', 'price' =&gt; 200],
        ['product' =&gt; 'Bookcase', 'price' =&gt; 150],
        ['product' =&gt; 'Door', 'price' =&gt; 100],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereIn()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereIn</span> filtra la colección por una clave / valor contenida dentro del
    arreglo dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['product' =&gt; 'Desk', 'price' =&gt; 200],
    ['product' =&gt; 'Chair', 'price' =&gt; 100],
    ['product' =&gt; 'Bookcase', 'price' =&gt; 150],
    ['product' =&gt; 'Door', 'price' =&gt; 100],
]);

\$filtered = \$collection-&gt;whereIn('price', [150, 200]);

\$filtered-&gt;all();

/*
    [
        ['product' =&gt; 'Bookcase', 'price' =&gt; 150],
        ['product' =&gt; 'Desk', 'price' =&gt; 200],
    ]
*/
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereIn</span> usa comparaciones "flexibles" (loose) al verificar valores de
    elementos, lo que significa que una cadena con un valor entero se considerará igual a un número
    entero del mismo valor. Usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereInStrict</span> para hacer comparaciones
    "estrictas".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereInStrict()</span></h4>
<p>Este método tiene la misma funcionalidad que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereIn</span>; sin embargo, todos
    los valores se comparan utilizando comparaciones "estrictas".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereInstanceOf()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereInstanceOf</span> filtra la colección por un tipo de clase dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    new User,
    new User,
    new Post,
]);

return \$collection-&gt;whereInstanceOf(User::class);
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotBetween()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotBetween</span> filtra la colección fuera de un rango dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['product' =&gt; 'Desk', 'price' =&gt; 200],
    ['product' =&gt; 'Chair', 'price' =&gt; 80],
    ['product' =&gt; 'Bookcase', 'price' =&gt; 150],
    ['product' =&gt; 'Pencil', 'price' =&gt; 30],
    ['product' =&gt; 'Door', 'price' =&gt; 100],
]);

\$filtered = \$collection-&gt;whereNotBetween('price', [100, 200]);

\$filtered-&gt;all();

/*
    [
        ['product' =&gt; 'Chair', 'price' =&gt; 80],
        ['product' =&gt; 'Pencil', 'price' =&gt; 30],
    ]
*/
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotIn()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotIn</span> filtra la colección por una clave / valor que no está contenida
    dentro del arreglo dado:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect([
    ['product' =&gt; 'Desk', 'price' =&gt; 200],
    ['product' =&gt; 'Chair', 'price' =&gt; 100],
    ['product' =&gt; 'Bookcase', 'price' =&gt; 150],
    ['product' =&gt; 'Door', 'price' =&gt; 100],
]);

\$filtered = \$collection-&gt;whereNotIn('price', [150, 200]);

\$filtered-&gt;all();

/*
    [
        ['product' =&gt; 'Chair', 'price' =&gt; 100],
        ['product' =&gt; 'Door', 'price' =&gt; 100],
    ]
*/
</code></pre>

<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotIn</span> utiliza comparaciones "flexibles" (loose) cuando se comprueban
    los valores de los elementos, lo que significa que una cadena con un valor entero se considerará
    igual a un número entero del mismo valor. Usa el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotInStrict</span> para hacer
    comparaciones "estrictas".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotInStrict()</span></h4>
<p>Este método tiene la misma funcionalidad que el método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">whereNotIn</span>; sin embargo,
    todos los valores se comparan utilizando comparaciones "estrictas".</p>

<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">wrap()</span></h4>
<p>El método estático <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">wrap</span> envuelve el valor dado en una colección cuando corresponda:
</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = Collection::wrap('John Doe');

\$collection-&gt;all();

// ['John Doe']

\$collection = Collection::wrap(['John Doe']);

\$collection-&gt;all();

// ['John Doe']

\$collection = Collection::wrap(collect('John Doe'));

\$collection-&gt;all();

// ['John Doe']
</code></pre>


<h4># <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">zip()</span></h4>
<p>El método <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">zip</span> combina los valores del arreglo con los valores de la colección
    original en el índice correspondiente:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$collection = collect(['Chair', 'Desk']);

\$zipped = \$collection-&gt;zip([100, 200]);

\$zipped-&gt;all();

// [['Chair', 100], ['Desk', 200]]
</code></pre>


<h2>Mensajes de orden superior</h2>
<p>Las colecciones también brindan soporte para "mensajes de orden superior", que son atajos para
    realizar acciones comunes en las colecciones. Los métodos de recopilación que proporcionan
    mensajes de orden superior son: <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">average</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">avg</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">contains</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">each</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">every</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">filter</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">first</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">flatMap</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">groupBy</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">keyBy</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">map</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">max</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">min</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">partition</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">reject</span>,
    <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">some</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortBy</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sortByDesc</span>, <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sum</span>, and <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">unique</span>.
</p>
<p>Se puede acceder a cada mensaje de orden superior como una propiedad dinámica en una instancia de
    colección. Por ejemplo, usemos el mensaje <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">each</span> de orden superior para llamar a un
    método en cada objeto dentro de una colección:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$users = User::where('votes', '&gt;', 500)-&gt;get();

\$users-&gt;each-&gt;markAsVip();
</code></pre>

<p>Del mismo modo, podemos usar el mensaje de orden superior <span style="background-color: #CFD8DC; color: #37474F; font-family: monospace;">sum</span> para reunir el número
    total de "votos" para una colección de usuarios:</p>

<pre style='background-color: #CFD8DC; color: #37474F;'><code>\$users = User::where('group', 'Development')-&gt;get();

return \$users-&gt;sum-&gt;votes;
</code></pre>
</div>
""";