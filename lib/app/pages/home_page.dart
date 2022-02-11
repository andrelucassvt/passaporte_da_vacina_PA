import 'package:flutter/material.dart';
import 'package:passaporte_vacina_pa/app/widget/navigator_container_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4.0,
        title: const Text('Passaporte da Vacina'),
        leading: Image.asset('assets/governo_pa.jpeg'),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context, 
              builder: (context) => const SimpleDialog(
                title: Text('Dev: André Salvador'),
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      minRadius: 200,
                      foregroundImage: AssetImage('assets/dev.jpeg'),
                    ),
                  )
                ],
              )
            ),
            icon: const Icon(Icons.info_outline),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 25
        ),
        children: [
          Card(
            elevation: 15.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.circular(15)
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.info_outline,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 13,
                  ),
                  Expanded(
                    child: Text(
                      'As informações deste aplicativo são fornecidas pelo ConecteSUS, a plataforma oficial do Governo Federal.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const NavigatorContainerView(
            icon: Icon(
              Icons.badge_outlined,
            ),
            title: 'Emitir passaporte da vacinação',
            actionTitle: 'Clique aqui para emitir',
            routNavigatorName: '/emitirPassaport',
          ),
          const NavigatorContainerView(
            icon: Icon(
              Icons.verified_outlined,
            ),
            title: 'Validar passaporte da vacinação',
            actionTitle: 'Clique aqui para validar',
            routNavigatorName: '/validarQrCode',
          ),
        ],
      ),
    );
  }
}