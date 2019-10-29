import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:laravel/blocks/theme.dart';
import 'package:laravel/bdconsultas.dart';
import 'package:laravel/bdmigraciones.dart';
import 'package:laravel/bdpaginacion.dart';
import 'package:laravel/bdprimeros.dart';
import 'package:laravel/bdredis.dart';
import 'package:laravel/bdseeding.dart';
import 'package:laravel/blocks/theme.dart';
import 'package:laravel/painstalacion.dart';
import 'package:laravel/paconfiguracion.dart';
import 'package:laravel/paestructura.dart';
import 'package:laravel/pahomestead.dart';
import 'package:laravel/pavalet.dart';
import 'package:laravel/padespliegue.dart';
import 'package:laravel/caciclo.dart';
import 'package:laravel/cacontenedor.dart';
import 'package:laravel/caproveedores.dart';
import 'package:laravel/cafacades.dart';
import 'package:laravel/cacontratos.dart';
import 'package:laravel/furutas.dart';
import 'package:laravel/fumiddleware.dart';
import 'package:laravel/fuproteccion.dart';
import 'package:laravel/fucontroladores.dart';
import 'package:laravel/fusolicitudes.dart';
import 'package:laravel/furespuestas.dart';
import 'package:laravel/fuvistas.dart';
import 'package:laravel/fugeneracion.dart';
import 'package:laravel/fusesion.dart';
import 'package:laravel/fuvalidacion.dart';
import 'package:laravel/fuerrores.dart';
import 'package:laravel/fulogin.dart';
import 'package:laravel/frblade.dart';
import 'package:laravel/frconfiguracion.dart';
import 'package:laravel/frjscss.dart';
import 'package:laravel/frassets.dart';
import 'package:laravel/seapi.dart';
import 'package:laravel/seautenticacion.dart';
import 'package:laravel/seautorizacion.dart';
import 'package:laravel/secifrado.dart';
import 'package:laravel/secontrasenia.dart';
import 'package:laravel/secorreo.dart';
import 'package:laravel/sehashing.dart';
import 'package:laravel/prconsola.dart';
import 'package:laravel/prarchivos.dart';
import 'package:laravel/prbroadcasting.dart';
import 'package:laravel/prcache.dart';
import 'package:laravel/prcolecciones.dart';
import 'package:laravel/prcorreos.dart';
import 'package:laravel/preventos.dart';
import 'package:laravel/prhelpers.dart';
import 'package:laravel/prnotificaciones.dart';
import 'package:laravel/prpaquetes.dart';
import 'package:laravel/prtareas.dart';
import 'package:laravel/prcolas.dart';
import 'package:laravel/orapi.dart';
import 'package:laravel/orcolecciones.dart';
import 'package:laravel/ormutators.dart';
import 'package:laravel/orpasos.dart';
import 'package:laravel/orrelaciones.dart';
import 'package:laravel/orserializacion.dart';
import 'package:laravel/peconsola.dart';
import 'package:laravel/pedatos.dart';
import 'package:laravel/pedusk.dart';
import 'package:laravel/pehttp.dart';
import 'package:laravel/pemocking.dart';
import 'package:laravel/pepasos.dart';
import 'package:laravel/pqcashier.dart';
import 'package:laravel/pqdusk.dart';
import 'package:laravel/pqenvoy.dart';
import 'package:laravel/pqhorizon.dart';
import 'package:laravel/pqpassport.dart';
import 'package:laravel/pqscout.dart';
import 'package:laravel/pqsocialite.dart';
import 'package:laravel/pqtelescope.dart';

//FirebaseAdMob.instance.initialize(appId: "ca-app-pub-5852042324891789~3661138134");
//myBanner..load()..show();
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_)=>
          ThemeCharger(ThemeData.light()),
      child: MaterialAppWithTheme(),
    );
  }
}


class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeCharger>(context);
    return MaterialApp(
      theme: theme.getTheme(),
      routes: <String, WidgetBuilder> {
        "/painstalacion": (BuildContext context)=> Instalacion("Instalacion"),
        "/paconfiguracion": (BuildContext context)=> PaConfiguracion("Configuracion"),
        "/paestructura": (BuildContext context)=> PaEstructura("Estructura de Directorios"),
        "/pahomestead": (BuildContext context)=> PaHomestead("Laravel Homestead"),
        "/pavalet": (BuildContext context)=> PaValet("Laravel Valet"),
        "/padespliegue": (BuildContext context)=> PaDespliegue("Desplieque"),

        "/caciclo": (BuildContext context)=> CaCiclo("Ciclo de vida de la solicitud"),
        "/cacontenedor": (BuildContext context)=> CaContenedor("Contenedor de servicios"),
        "/caproveedores": (BuildContext context)=> CaProveedores("Proveedores de Servicios"),
        "/cafacades": (BuildContext context)=> CaFacades("Facades"),
        "/cacontratos": (BuildContext context)=> CaContratos("Contratos"),

        "/furutas": (BuildContext context)=> FuRutas("Rutas"),
        "/fumiddleware": (BuildContext context)=> FuMiddleware("Middleware"),
        "/fuproteccion": (BuildContext context)=> FuProteccion("Protección CSRF"),
        "/fucontroladores": (BuildContext context)=> FuControladores("Controladores"),
        "/fusolicitudes": (BuildContext context)=> FuSolicitudes("Solicitudes HTTP"),
        "/furespuestas": (BuildContext context)=> FuRespuestas("Respuestas HTTP"),
        "/fuvistas": (BuildContext context)=> FuVistas("Vistas"),
        "/fugeneracion": (BuildContext context)=> FuGeneracion("Generación de URLs"),
        "/fusesion": (BuildContext context)=> FuSession("Sesión HTTP"),
        "/fuvalidacion": (BuildContext context)=> FuValidacion("Validación"),
        "/fuerrores": (BuildContext context)=> FuErrores("Manejo de errores"),
        "/fulogin": (BuildContext context)=> FuLogin("Registro (Logging)"),

        "/frblade": (BuildContext context)=> FrBlade("Plantillas Blade"),
        "/frconfiguracion": (BuildContext context)=> FrConfiguracion("Configuración regional"),
        "/frjscss": (BuildContext context)=> FrJsCss("JavaScript y estructuración de CSS"),
        "/frassets": (BuildContext context)=> FrAssets("Compilación De Assets"),

        "/seautenticacion": (BuildContext context)=> SeAutenticacion("Autenticación"),
        "/seapi": (BuildContext context)=> SeApi("Autenticación de API"),
        "/seautorizacion": (BuildContext context)=> SeAutorizacion("Autorización"),
        "/secorreo": (BuildContext context)=> SeCorreo("Verificación de correo electrónico"),
        "/secifrado": (BuildContext context)=> SeCifrado("Cifrado"),
        "/sehashing": (BuildContext context)=> SeHashing("Hashing"),
        "/secontrasenia": (BuildContext context)=> SeContrasenia("Restablecimiento de contraseñas"),

        "/prconsola": (BuildContext context)=> PrConsola("Consola artisan"),
        "/prbroadcasting": (BuildContext context)=> PrBroadcasting("Broadcasting"),
        "/prcache": (BuildContext context)=> PrCache("Cache"),
        "/prcolecciones": (BuildContext context)=> PrColecciones("Colecciones"),
        "/preventos": (BuildContext context)=> PrEventos("Eventos"),
        "/prarchivos": (BuildContext context)=> PrArchivos("Almacenamiento de archivos"),
        "/prhelpers": (BuildContext context)=> PrHelpers("Helpers"),
        "/prcorreos": (BuildContext context)=> PrCorreos("Correos electrónicos"),
        "/prnotificaciones": (BuildContext context)=> PrNotificaciones("Notificaciones"),
        "/prpaquetes": (BuildContext context)=> PrPaquetes("Desarrollo de paquetes"),
        "/prcolas": (BuildContext context)=> PrColas("Colas de trabajo"),
        "/prtareas": (BuildContext context)=> PrTareas("Programación de tareas"),

        "/bdprimeros": (BuildContext context)=> BdPrimeros("Primeros pasos"),
        "/bdconsultas": (BuildContext context)=> BdConsultas("Constructor de consultas"),
        "/bdpaginacion": (BuildContext context)=> BdPaginacion("Paginación"),
        "/bdmigraciones": (BuildContext context)=> BdMigraciones("Migraciones"),
        "/bdseeding": (BuildContext context)=> BdSeeding("Seeding"),
        "/bdredis": (BuildContext context)=> BdRedis("Redis"),

        "/orpasos": (BuildContext context)=> OrPasos("Primeros Pasos"),
        "/orrelaciones": (BuildContext context)=> OrRelaciones("Relaciones"),
        "/orcolecciones": (BuildContext context)=> OrColecciones("Colecciones"),
        "/ormutators": (BuildContext context)=> OrMutators("Mutators"),
        "/orapi": (BuildContext context)=> OrApi("Recursos API"),
        "/orserializacion": (BuildContext context)=> OrSerializacion("Serialización"),

        "/pepasos": (BuildContext context)=> PePasos("Primeros Pasos"),
        "/pehttp": (BuildContext context)=> PeHttp("HTTP"),
        "/peconsola": (BuildContext context)=> PeConsola("Pruebas de consola"),
        "/pedusk": (BuildContext context)=> PeDusk("Laravel Dusk"),
        "/pedatos": (BuildContext context)=> PeDatos("Pruebas de base de datos"),
        "/pemocking": (BuildContext context)=> PeMocking("Mocking"),


        "/pqcashier": (BuildContext context)=> PqCashier("Laravel Cashier"),
        "/pqdusk": (BuildContext context)=> PqDusk("Laravel Dusk"),
        "/pqenvoy": (BuildContext context)=> PqEnvoy("Laravel Envoy"),
        "/pqhorizon": (BuildContext context)=> PqHorizon("Laravel Horizon"),
        "/pqpassport": (BuildContext context)=> PqPassport("Laravel Passport"),
        "/pqscout": (BuildContext context)=> PqScout("Scout para Laravel"),
        "/pqsocialite": (BuildContext context)=> PqSocialite("Laravel Socialite"),
        "/pqtelescope": (BuildContext context)=> PqTelescope("Laravel Telescope"),

      },
      home: HomeMenu(),
    );
  }
}


class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeCharger>(context);
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-5852042324891789~3661138134");
    myBanner..load()..show();
    myInterstitial
      ..load()
      ..show(
        anchorType: AnchorType.bottom,
        anchorOffset: 0.0,
        horizontalCenterOffset: 0.0,
      );
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: new EdgeInsets.all(0.0),
          children: <Widget>[
            UserAccountsDrawerHeader(
                margin: EdgeInsets.only(bottom: 0.0),
                accountEmail: new Text("elnaufrago2009@gmail.com"),
                accountName: new Text("Moises Linares"),
                currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.white70,
                  child: new Text("ML"),
                )
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.angleRight),
              title: Text('Tema Claro'),
              onTap: (){
                theme.setTheme(ThemeData.light());
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.angleRight),
              title: Text('Tema Oscuro'),
              onTap: (){
                theme.setTheme(ThemeData.dark());
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(FontAwesomeIcons.timesCircle),
              title: Text('Cerrar'),
              onTap: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Laravel Tutorial'),
      ),
      body: ListView(
        children: <Widget>[
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.home),
              title: Text('Primeros pasos', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('configuracion, estructura, homestead y despliegue'),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('instalación'),
                  onTap: (){
                    Navigator.pushNamed(context, '/painstalacion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('configuración'),
                  onTap: (){
                    Navigator.pushNamed(context, '/paconfiguracion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('estructura de directorios'),
                  onTap: (){
                    Navigator.pushNamed(context, '/paestructura');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel homestead'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pahomestead');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel valet'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pavalet');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('despliegue'),
                  onTap: (){
                    Navigator.pushNamed(context, '/padespliegue');
                  }
              ),
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.cog),
              subtitle: Text('ciclo de vida, contenedor, proveedores y facades'),
              title: Text('Conceptos de arquitectura', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('ciclo de vida de la solicitud'),
                  onTap: (){
                    Navigator.pushNamed(context, '/caciclo');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('contenedor de servicios'),
                  onTap: (){
                    Navigator.pushNamed(context, '/cacontenedor');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('proveedores de Servicios'),
                  onTap: (){
                    Navigator.pushNamed(context, '/caproveedores');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('facades'),
                  onTap: (){
                    Navigator.pushNamed(context, '/cafacades');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('contratos'),
                  onTap: (){
                    Navigator.pushNamed(context, '/cacontratos');
                  }
              )
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.solidFolder),
              subtitle: Text('rutas, controladores, vistas, validacion y errores'),
              title: Text('Fundamentos', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('rutas'),
                  onTap: (){
                    Navigator.pushNamed(context, '/furutas');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('middleware'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fumiddleware');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('protección CSRF'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fuproteccion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('controladores'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fucontroladores');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('solicitudes HTTP'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fusolicitudes');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('respuestas HTTP'),
                  onTap: (){
                    Navigator.pushNamed(context, '/furespuestas');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('vistas'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fuvistas');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('generación de URLs'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fugeneracion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('sesión HTTP'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fusesion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('validación'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fuvalidacion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('manejo de errores'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fuerrores');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('registro (Logging)'),
                  onTap: (){
                    Navigator.pushNamed(context, '/fulogin');
                  }
              )
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.tv),
              subtitle: Text('plantillas blade, javascript, estructura css y compilacion'),
              title: Text('Frontend', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('plantillas blade'),
                  onTap: (){
                    Navigator.pushNamed(context, '/frblade');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('configuración regional'),
                  onTap: (){
                    Navigator.pushNamed(context, '/frconfiguracion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('javaScript y estructuración de CSS'),
                  onTap: (){
                    Navigator.pushNamed(context, '/frjscss');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('compilación de assets'),
                  onTap: (){
                    Navigator.pushNamed(context, '/frassets');
                  }
              )
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.userLock),
              subtitle: Text('autenticacion, autorizacion, verificacion y contraseña'),
              title: Text('Seguridad', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Autenticación'),
                  onTap: (){
                    Navigator.pushNamed(context, '/seautenticacion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Autenticación de API'),
                  onTap: (){
                    Navigator.pushNamed(context, '/seapi');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Autorización'),
                  onTap: (){
                    Navigator.pushNamed(context, '/seautorizacion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Verificación de correo electrónico'),
                  onTap: (){
                    Navigator.pushNamed(context, '/secorreo');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Cifrado'),
                  onTap: (){
                    Navigator.pushNamed(context, '/secifrado');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Hashing'),
                  onTap: (){
                    Navigator.pushNamed(context, '/sehashing');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Restablecimiento de contraseñas'),
                  onTap: (){
                    Navigator.pushNamed(context, '/secontrasenia');
                  }
              )
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.wrench),
              subtitle: Text('artisan, cache, eventos, helpers y notificaciones'),
              title: Text('Profundizando', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Consola artisan'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prconsola');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Broadcasting'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prbroadcasting');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Cache'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prcache');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Colecciones'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prcolecciones');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Eventos'),
                  onTap: (){
                    Navigator.pushNamed(context, '/preventos');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Almacenamiento de archivos'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prarchivos');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Helpers'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prhelpers');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Correos electrónicos'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prcorreos');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Notificaciones'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prnotificaciones');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Desarrollo de paquetes'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prpaquetes');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Colas de trabajo'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prcolas');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('Programación de tareas'),
                  onTap: (){
                    Navigator.pushNamed(context, '/prtareas');
                  }
              )
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.database),
              subtitle: Text('consultas, paginacion, migraciones y registros'),
              title: Text('Bases de datos', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('primeros pasos'),
                  onTap: (){
                    Navigator.pushNamed(context, '/bdprimeros');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('constructor de consultas'),
                  onTap: (){
                    Navigator.pushNamed(context, '/bdconsultas');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('paginación'),
                  onTap: (){
                    Navigator.pushNamed(context, '/bdpaginacion');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('migraciones'),
                  onTap: (){
                    Navigator.pushNamed(context, '/bdmigraciones');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('seeding'),
                  onTap: (){
                    Navigator.pushNamed(context, '/bdseeding');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('redis'),
                  onTap: (){
                    Navigator.pushNamed(context, '/bdredis');
                  }
              )
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.table),
              subtitle: Text('relaciones, colecciones, mutadores y api'),
              title: Text('ORM Eloquent', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('primeros pasos'),
                  onTap: (){
                    Navigator.pushNamed(context, '/orpasos');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('relaciones'),
                  onTap: (){
                    Navigator.pushNamed(context, '/orrelaciones');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('colecciones'),
                  onTap: (){
                    Navigator.pushNamed(context, '/orcolecciones');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('mutators'),
                  onTap: (){
                    Navigator.pushNamed(context, '/ormutators');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('recursos API'),
                  onTap: (){
                    Navigator.pushNamed(context, '/orapi');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('serialización'),
                  onTap: (){
                    Navigator.pushNamed(context, '/orserializacion');
                  }
              )
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.atlas),
              subtitle: Text('http, consola, dusk y mocking'),
              title: Text('Pruebas', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('primeros pasos'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pepasos');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('pruebas HTTP'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pehttp');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('pruebas de consola'),
                  onTap: (){
                    Navigator.pushNamed(context, '/peconsola');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel dusk'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pedusk');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('pruebas de base de datos'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pedatos');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('mocking'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pemocking');
                  }
              )
            ],
          ),
          ExpansionTile(
            title: ListTile(
              leading: Icon(FontAwesomeIcons.cubes),
              subtitle: Text('cashier, envoy, horizon, y passport'),
              title: Text('Paquetes oficiales', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            children: <Widget>[
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel cashier'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pqcashier');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel dusk'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pqdusk');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel envoy'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pqenvoy');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel horizon'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pqhorizon');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel passport'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pqpassport');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('scout para laravel'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pqscout');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel socialite'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pqsocialite');
                  }
              ),
              ListTile(
                  leading: Icon(FontAwesomeIcons.angleRight),
                  title: Text('laravel telescope'),
                  onTap: (){
                    Navigator.pushNamed(context, '/pqtelescope');
                  }
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.all(25),
          )
        ],
      ),
    );
  }
}

MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['laravel', 'documentacion offline php'],
  contentUrl: 'https://flutter.io',
  birthday: DateTime.now(),
  childDirected: false,
  designedForFamilies: false,
  gender: MobileAdGender.male, // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "ca-app-pub-5852042324891789/3064107845",
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);

InterstitialAd myInterstitial = InterstitialAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: "ca-app-pub-5852042324891789/2138873139",
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("InterstitialAd event is $event");
  },
);