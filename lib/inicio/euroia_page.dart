import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class EuroIAPage extends StatefulWidget {
  const EuroIAPage({super.key});

  @override
  _EuroIAPageState createState() => _EuroIAPageState();
}

class _EuroIAPageState extends State<EuroIAPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  bool _isLoading = false;

  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('jwt');
  }

  Future<void> _sendMessage() async {
    String input = _controller.text.trim();
    if (input.isEmpty) return;

    setState(() {
      _messages.add('Você: $input');
      _controller.clear();
      _isLoading = true;
    });

    try {
      final token = await _getToken();
      final response = await http.post(
        Uri.parse('http://localhost:8080/ai/chat'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode({'message': input}),
      );

      if (response.statusCode == 200) {
        final regex = RegExp(r'"(.*?)"');
        var data = response.body;
        var definityAnswer = utf8.decode(data.codeUnits);

        definityAnswer = definityAnswer.replaceAll(RegExp(r'[\n\r]+'), ' ');

        final matches = regex.allMatches(definityAnswer).toList();

        var extractedText = matches.length >= 2
            ? matches[1].group(1)
            : 'Segundas aspas não encontradas';

        setState(() {
          _messages.add('Euro-IA: $extractedText.');
        });
      } else {
        setState(() {
          _messages.add('Erro: ${response.statusCode} ao conectar com a API.');
        });
      }
    } catch (e) {
      setState(() {
        _messages.add('Erro: Falha ao conectar com a API. Detalhes: $e');
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EuroIA Chat'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_messages[index]),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Digite sua mensagem...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _isLoading
                      ? null
                      : _sendMessage, // Desabilita o botão durante o carregamento
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
