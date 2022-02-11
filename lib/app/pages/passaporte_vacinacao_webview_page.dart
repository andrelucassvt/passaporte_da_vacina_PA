import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class PassaporteVacinacaoWebViewPage extends StatefulWidget {
  const PassaporteVacinacaoWebViewPage({ Key? key }) : super(key: key);

  @override
  _PassaporteVacinacaoWebViewPageState createState() => _PassaporteVacinacaoWebViewPageState();
}

class _PassaporteVacinacaoWebViewPageState extends State<PassaporteVacinacaoWebViewPage> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  double loadingValue = 0.0;
  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onProgressChanged.listen((event) { 
      setState(() {
        loadingValue = event;
      });
    });
  }
  @override
  void dispose() {
    flutterWebViewPlugin.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      key: widget.key,
      url: 'https://conectesus-paciente.saude.gov.br/menu/home-default',
      withZoom: true,
      withLocalStorage: true,
      mediaPlaybackRequiresUserGesture: false,
      debuggingEnabled: false,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                flutterWebViewPlugin.goBack();
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () {
                flutterWebViewPlugin.goForward();
              },
            ),
            IconButton(
              icon: const Icon(Icons.autorenew),
              onPressed: () {
                flutterWebViewPlugin.reload();
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const AutoSizeText(
          'Emitir passaporte de vacinação',
          maxLines: 1,
          style: TextStyle(
            fontSize: 20
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: LinearProgressIndicator(
            value: loadingValue
          ),
        ),
      ),
    );
  }
}