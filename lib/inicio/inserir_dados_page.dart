import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class InserirDadosPage extends StatefulWidget {
  // final int idUser;

  const InserirDadosPage({super.key});

  @override
  _InserirDadosPageState createState() => _InserirDadosPageState();
}

class _InserirDadosPageState extends State<InserirDadosPage> {
  final TextEditingController _controller = TextEditingController();
  String _mensagem = '';

  Future<void> _enviarDados() async {
    final String novoDado = _controller.text.trim();

    if (novoDado.isEmpty) {
      setState(() {
        _mensagem = 'Por favor, insira um dado válido.';
      });
      return;
    }

    Future<String?> _getToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('jwt');
    }

    try {
      final token = await _getToken();
      final response = await http.post(
        Uri.parse('http://localhost:8080/ai/user/${widget}/add-data'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({"newData": novoDado}),
      );

      if (response.statusCode == 200) {
        setState(() {
          _mensagem = 'Dado inserido com sucesso!';
          _controller.clear();
        });
      } else {
        setState(() {
          _mensagem = 'Erro ao inserir o dado. Tente novamente.';
        });
      }
    } catch (e) {
      print(e);
      setState(() {
        _mensagem = 'Erro ao inserir o dado. Tente novamente.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inserir Novo Dado'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Insira o novo dado',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _enviarDados,
                child: const Text('Enviar'),
              ),
              const SizedBox(height: 16),
              Text(
                _mensagem,
                style: TextStyle(
                  color: _mensagem == 'Dado inserido com sucesso!'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
