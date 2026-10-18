import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Perfil'), centerTitle: true),
        body: const Center(
          child: Column(
            children: [
              Icon(Icons.person, size: 100),
              Text('Nome: Lucas Henrique Albergaria'),
              Text('Idade: 25 anos'),
              Text('Profissão: Desenvolvedor Flutter'),
            ],
          ),
        ),
      ),
    );
  }
}
