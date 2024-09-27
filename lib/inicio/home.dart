import 'package:flutter/material.dart';
import 'package:projeto_sprint/inicio/inserir_dados_page.dart';
import 'package:projeto_sprint/menu/logo.dart';
import 'duvidas_frequentes_page.dart';
import 'euroia_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EuroFarma App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final String nameUser;
  final int idUser;

  const HomePage( {super.key, required this.nameUser, required this.idUser });
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EuroFarma'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const LogoWidget(),
            const SizedBox(height: 25),
            Text(
              'Bem-vindo, $nameUser',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            const Text(
              'Escolha qual seção deseja iniciar:',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              text: 'Adicionar Dados',
              color: Colors.yellow,
              icon: Icons.add_circle_sharp,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InserirDadosPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              text: 'EuroIA',
              color: Colors.blue,
              icon: Icons.people_alt_sharp,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EuroIAPage()),
                );
              },
            ),
            const SizedBox(height: 20),
            _buildButton(
              context,
              text: 'Respostas',
              color: Colors.yellow,
              icon: Icons.question_answer_sharp,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DuvidasFrequentesPage(idUser: idUser)),
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
    return SizedBox(
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
                  const SizedBox(height: 5),
                  Text(
                    text,
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              )
            : Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
      ),
    );
  }
}
