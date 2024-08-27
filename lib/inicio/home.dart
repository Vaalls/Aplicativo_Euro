import 'package:flutter/material.dart';
import 'package:projeto_sprint/inicio/perfil_page.dart';
import 'package:projeto_sprint/menu/logo.dart';
import 'duvidas_frequentes_page.dart';
import 'cadastro_perfil_page.dart';
import 'euroia_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EuroFarma App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  get cargo => '';
  
  get email => '';
  
  get telefone => '';
  
  get endereco => '';
  
  get nome => '';

  get cep => key!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EuroFarma'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(),
            SizedBox(height: 25),
            Text(
              'Bem-vindo, Usuário98',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              'Escolha qual seção deseja iniciar:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            _buildButton(
              context,
              text: 'Dúvidas Frequentes',
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DuvidasFrequentesPage()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildButton(
              context,
              text: 'Perfil',
              color: Colors.yellow,
              icon: Icons.person,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PerfilPage()),
                );
              },
            ),
            SizedBox(height: 20),
            _buildButton(
              context,
              text: 'EuroIA',
              color: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EuroIAPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context,
      {required String text,
      required Color color,
      IconData? icon,
      required VoidCallback onPressed}) {
    return Container(
      width: 200, // Largura fixa para todos os botões
      height: 80, // Altura fixa para todos os botões
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: icon != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, size: 30),
                  SizedBox(height: 5),
                  Text(
                    text,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )
            : Text(
                text,
                style: TextStyle(fontSize: 18),
              ),
      ),
    );
  }
}
