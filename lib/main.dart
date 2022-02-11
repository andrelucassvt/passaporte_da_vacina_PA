import 'package:flutter/material.dart';
import 'package:passaporte_vacina_pa/app/pages/home_page.dart';
import 'package:passaporte_vacina_pa/app/pages/passaporte_vacinacao_webview_page.dart';
import 'package:passaporte_vacina_pa/app/pages/validar_qr_code_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Governo do Pará',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.blue[800],
          size: 37
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.black
          )
        )
      ),
      routes: {
        '/': (BuildContext context) => const HomePage(),
        '/emitirPassaport': (BuildContext context) => const PassaporteVacinacaoWebViewPage(),
        '/validarQrCode': (BuildContext context) => const ValidarQrCodePage(),
      },
    );
  }
}
