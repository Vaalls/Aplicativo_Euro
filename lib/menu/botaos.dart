// Classe separada para os botões de redes sociais
import 'package:flutter/material.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.facebook),
          onPressed: () {},
          color: Colors.blue[700],
          iconSize: 40,
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.email),
          onPressed: () {},
          color: Colors.red,
          iconSize: 40,
        ),
        const SizedBox(width: 20),
        IconButton(
          icon: const Icon(Icons.apple),
          onPressed: () {},
          color: Colors.black,
          iconSize: 40,
        ),
      ],
    );
  }
}
