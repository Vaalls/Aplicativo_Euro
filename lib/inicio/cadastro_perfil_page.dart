import 'package:flutter/material.dart';
import 'package:projeto_sprint/inicio/perfil_page.dart';

class CadastroPage extends StatelessWidget {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _logradouroController = TextEditingController();
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _complementoController = TextEditingController();
  final TextEditingController _cidadeController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();
  String? _especialidadeSelecionada;
  String? _ufSelecionada;
  String? _sexoSelecionado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Perfil'),
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
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Especialidade'),
                items: ['Médico', 'Farmacêutico', 'Enfermeiro']
                    .map((especialidade) => DropdownMenuItem(
                          value: especialidade,
                          child: Text(especialidade),
                        ))
                    .toList(),
                onChanged: (value) {
                  _especialidadeSelecionada = value;
                },
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Sexo'),
                items: ['Masculino', 'Feminino']
                    .map((sexo) => DropdownMenuItem(
                          value: sexo,
                          child: Text(sexo),
                        ))
                    .toList(),
                onChanged: (value) {
                  _sexoSelecionado = value;
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _telefoneController,
                decoration: InputDecoration(labelText: 'Telefone ou celular'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _logradouroController,
                decoration: InputDecoration(labelText: 'Logradouro'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _numeroController,
                decoration: InputDecoration(labelText: 'Número'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _complementoController,
                decoration: InputDecoration(labelText: 'Complemento'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _cidadeController,
                decoration: InputDecoration(labelText: 'Cidade'),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'UF'),
                items: ['SP', 'RJ', 'MG', 'RS', 'PR', 'SC']
                    .map((uf) => DropdownMenuItem(
                          value: uf,
                          child: Text(uf),
                        ))
                    .toList(),
                onChanged: (value) {
                  _ufSelecionada = value;
                },
              ),
              SizedBox(height: 10),
              TextField(
                controller: _cepController,
                decoration: InputDecoration(labelText: 'CEP'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Verifica se todos os campos obrigatórios foram preenchidos
                  if (_nomeController.text.isNotEmpty &&
                      _especialidadeSelecionada != null &&
                      _emailController.text.isNotEmpty &&
                      _telefoneController.text.isNotEmpty &&
                      _logradouroController.text.isNotEmpty &&
                      _numeroController.text.isNotEmpty &&
                      _cidadeController.text.isNotEmpty &&
                      _ufSelecionada != null &&
                      _cepController.text.isNotEmpty) {
                    // Navega para a tela de perfil passando os dados inseridos
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PerfilPage(
                          nome: _nomeController.text,
                          cargo: _especialidadeSelecionada!,
                          email: _emailController.text,
                          telefone: _telefoneController.text,
                          endereco:
                              '${_logradouroController.text}, ${_numeroController.text}, ${_complementoController.text}, ${_cidadeController.text}/${_ufSelecionada}',
                          cep: _cepController.text,
                        ),
                      ),
                    );
                  } else {
                    // Exibe um alerta caso algum campo esteja vazio
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Campos incompletos'),
                          content: Text(
                              'Por favor, preencha todos os campos obrigatórios.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Concluir cadastro'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
