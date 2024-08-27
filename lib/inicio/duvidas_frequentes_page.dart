import 'package:flutter/material.dart';

class DuvidasFrequentesPage extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {
      "question": "Como faço para entrar em contato com o suporte ao cliente?",
      "answer":
          "Você pode entrar em contato com o suporte ao cliente através da seção 'Contato' no aplicativo ou pelo nosso site oficial."
    },
    {
      "question": "Como posso atualizar minhas informações pessoais?",
      "answer":
          "Para atualizar suas informações pessoais, vá para a seção 'Perfil' e edite as informações desejadas."
    },
    {
      "question": "Como posso recuperar minha senha?",
      "answer":
          "Você pode recuperar sua senha clicando em 'Esqueci minha senha' na tela de login."
    },
    {
      "question": "Quais são os principais recursos do aplicativo?",
      "answer":
          "Nosso aplicativo oferece recursos como gestão de perfil, suporte ao cliente, e acesso a conteúdos exclusivos."
    },
    {
      "question": "Preciso criar uma conta para usar o aplicativo?",
      "answer":
          "Sim, é necessário criar uma conta para acessar todas as funcionalidades do aplicativo."
    },
    {
      "question": "Como faço para baixar e instalar o aplicativo?",
      "answer":
          "Você pode baixar e instalar o aplicativo diretamente da Play Store ou App Store, dependendo do seu dispositivo."
    },
    {
      "question": "Posso usar o aplicativo offline?",
      "answer":
          "Algumas funcionalidades do aplicativo estão disponíveis offline, mas para acessar todos os recursos, é necessário estar conectado à internet."
    },
    {
      "question": "Como posso fornecer feedback sobre o aplicativo?",
      "answer":
          "Você pode fornecer feedback através da seção 'Feedback' no menu principal do aplicativo."
    },
    {
      "question":
          "O que devo fazer se o aplicativo travar ou não funcionar corretamente?",
      "answer":
          "Reinicie o aplicativo e, se o problema persistir, entre em contato com o suporte ao cliente."
    },
    {
      "question":
          "Como posso atualizar o aplicativo para a versão mais recente?",
      "answer":
          "Você pode atualizar o aplicativo através da Play Store ou App Store. Se houver uma atualização disponível, você será notificado."
    },
    {
      "question": "O aplicativo está disponível em quais idiomas?",
      "answer":
          "Atualmente, o aplicativo está disponível em português, inglês e espanhol."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dúvidas Frequentes'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: faqs.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ExpansionTile(
              title: Text(
                faqs[index]["question"]!,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    faqs[index]["answer"]!,
                    style: TextStyle(fontSize: 14),
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
