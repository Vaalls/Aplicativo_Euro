import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DuvidasFrequentesPage extends StatefulWidget {
  final int idUser;

  const DuvidasFrequentesPage({super.key, required this.idUser});

  @override
  _DuvidasFrequentesPageState createState() => _DuvidasFrequentesPageState();
}

class _DuvidasFrequentesPageState extends State<DuvidasFrequentesPage> {
  List<Map<String, String>> faqs = [];

  @override
  void initState() {
    super.initState();
    _fetchFaqs();
  }

  Future<void> _fetchFaqs() async {
    Future<String?> _getToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('jwt');
    }

    try {
      final token = await _getToken();
      final response = await http.get(
        Uri.parse('http://localhost:8080/ai/user/${widget.idUser}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        if (data.containsKey('answers') && data['answers'] != null) {
          final List<dynamic> answersList = data['answers'];

          setState(() {
            faqs = answersList.map((item) {
              return {
                "question": utf8.decode(item["question"].codeUnits),
                "answer": utf8.decode(item["answer"].codeUnits)
              };
            }).toList();
          });
        } else {
          setState(() {
            faqs = [];
          });
        }
      }
    } catch (e) {
      print(e);
      setState(() {
        faqs = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Respostas Anteriores'),
      ),
      body:
           ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: faqs.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  child: ExpansionTile(
                    title: Text(
                      faqs[index]["question"]!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          faqs[index]["answer"]!,
                          style: const TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
