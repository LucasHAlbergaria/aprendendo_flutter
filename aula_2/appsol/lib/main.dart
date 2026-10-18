import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage(title: 'Perfil'));
  }
}

class MyHomePage extends StatefulWidget {
  // O parâmetro required this.title precisa da variável final String title definida abaixo!
  const MyHomePage({super.key, required this.title});

  final String title; // <--- FALTAVA ESTA LINHA AQUI!

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool estado = true;

  void _estadotroggle() {
    setState(() {
      estado = !estado;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ), // Usa a propriedade title passada pelo widget
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const Icon(Icons.person, size: 100),
            const Text('Nome: Lucas Henrique Albergaria'),
            const Text('Idade: 25 anos'),
            const Text(
              'Profissão: Desenvolvedor Flutter',
            ), // Vírgula adicionada
            if (estado == false)
              const Icon(Icons.sunny, size: 100) // Vírgula adicionada
            else
              const Icon(Icons.nightlight_round, size: 100),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _estadotroggle,
            tooltip: 'Toggle State',
            child: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
    );
  }
}
