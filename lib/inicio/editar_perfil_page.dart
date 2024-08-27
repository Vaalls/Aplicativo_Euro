import 'package:flutter/material.dart';

class EditarPerfilPage extends StatelessWidget {
  final TextEditingController _nomeController;
  final TextEditingController _cargoController;
  final TextEditingController _emailController;
  final TextEditingController _telefoneController;
  final TextEditingController _enderecoController;
  final TextEditingController _cepController;

  EditarPerfilPage({
    required String nome,
    required String cargo,
    required String email,
    required String telefone,
    required String endereco,
    required String cep,
  })  : _nomeController = TextEditingController(text: nome),
        _cargoController = TextEditingController(text: cargo),
        _emailController = TextEditingController(text: email),
        _telefoneController = TextEditingController(text: telefone),
        _enderecoController = TextEditingController(text: endereco),
        _cepController = TextEditingController(text: cep);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome completo'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _cargoController,
                decoration: InputDecoration(labelText: 'Cargo'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _enderecoController,
                decoration: InputDecoration(labelText: 'Endereço'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _cepController,
                decoration: InputDecoration(labelText: 'CEP'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Retorna os dados atualizados ao sair da tela de edição
                  Navigator.pop(context, {
                    'nome': _nomeController.text,
                    'cargo': _cargoController.text,
                    'email': _emailController.text,
                    'telefone': _telefoneController.text,
                    'endereco': _enderecoController.text,
                    'cep': _cepController.text,
                  });
                },
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
