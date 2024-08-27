import 'package:flutter/material.dart';
import 'package:projeto_sprint/inicio/home.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    final email = _emailController.text;
    final password = _passwordController.text;

    // Simulação de uma verificação de credenciais.
    if (email == 'user@.com' && password == '123') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('E-mail ou senha incorretos!'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'LOGIN',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _emailController,
          style: TextStyle(color: Colors.black), // Cor do texto digitado
          decoration: InputDecoration(
            labelText: 'E-mail',
            labelStyle: TextStyle(color: Colors.black), // Cor do rótulo "E-mail"
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.yellow), // Cor da borda ao focar no campo
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          obscureText: true,
          style: TextStyle(color: Colors.black), // Cor do texto digitado
          decoration: InputDecoration(
            labelText: 'Senha',
            labelStyle: TextStyle(color: Colors.black), // Cor do rótulo "Senha"
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: Colors.yellow), // Cor da borda ao focar no campo
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _login,
          child: Text('Login',
           style: TextStyle(
            color: Colors.blue[900],
            fontSize: 20,
            ),
          ),
          style: ElevatedButton.styleFrom( 
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), backgroundColor: Colors.yellow, // Cor do botão
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
