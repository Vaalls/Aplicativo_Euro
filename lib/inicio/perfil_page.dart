import 'package:flutter/material.dart';
import 'package:projeto_sprint/inicio/cadastro_perfil_page.dart';
import 'package:projeto_sprint/inicio/editar_perfil_page.dart';
import 'package:projeto_sprint/inicio/home.dart';

class PerfilPage extends StatefulWidget {
  final String? nome;
  final String? cargo;
  final String? email;
  final String? telefone;
  final String? endereco;
  final String? cep;

  PerfilPage({
    this.nome,
    this.cargo,
    this.email,
    this.telefone,
    this.endereco,
    this.cep,
  });

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  bool _perfilAtivo = true;

  @override
  Widget build(BuildContext context) {
    // Verifica se o perfil está cadastrado
    bool perfilCadastrado = widget.nome != null &&
        widget.cargo != null &&
        widget.email != null &&
        widget.telefone != null &&
        widget.endereco != null &&
        widget.cep != null;

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil do Usuário'),
      ),
      body: perfilCadastrado
          ? _perfilAtivo
              ? _buildPerfilView()
              : _buildPerfilDesativadoView()
          : _buildCadastrarPerfilCard(),
    );
  }

  Widget _buildPerfilView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.nome!,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            widget.cargo!,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(height: 10),
          Text(widget.email!),
          Text(widget.telefone!),
          SizedBox(height: 10),
          Text(widget.endereco!),
          Text('CEP: ${widget.cep!}'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarPerfilPage(
                        nome: widget.nome!,
                        cargo: widget.cargo!,
                        email: widget.email!,
                        telefone: widget.telefone!,
                        endereco: widget.endereco!,
                        cep: widget.cep!,
                      ),
                    ),
                  );
                },
                child: Text('Editar'),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: _desativarPerfil,
                child: Text('Desativar perfil'),
              ),
            ],
          ),
          SizedBox(height: 40),
           Center(
            child: ElevatedButton(
              onPressed: () {
                // Volta ao menu principal
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text('Voltar ao Menu Principal'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerfilDesativadoView() {
    return CadastroPage();
  }

  Widget _buildCadastrarPerfilCard() {
    return Center(
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Nenhum perfil cadastrado',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CadastroPage(),
                    ),
                  );
                },
                child: Text('Cadastrar Perfil'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _desativarPerfil() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Desativar Perfil'),
          content: Text('Tem certeza que deseja desativar o seu perfil?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _perfilAtivo = false;
                });
                Navigator.of(context).pop();
              },
              child: Text('Desativar'),
            ),
          ],
        );
      },
    );
  }
}
