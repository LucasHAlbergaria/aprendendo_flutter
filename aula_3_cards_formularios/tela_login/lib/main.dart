import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Ponto de Atenção: Declare uma variável String _email = '' no estado
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'), // AppBar com título "Entrar"
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícone grande no centro
            const Icon(Icons.lock, size: 100, color: Colors.blue),
            const SizedBox(height: 30),

            // TextField de e-mail usando onChanged + setState
            TextField(
              onChanged: (valor) {
                setState(() {
                  _email = valor; // Ponto de Atenção: Use onChanged: (v) => setState(() => _email = v)
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 16),

            // TextField de senha com obscureText: true
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
            const SizedBox(height: 20),

            // Ponto de Atenção: O Text abaixo lê _email directamente em tempo real
            Text(
              _email.isEmpty ? 'Digite seu e-mail...' : 'E-mail: $_email',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // ElevatedButton com SnackBar de boas-vindas
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Ponto de Atenção: ScaffoldMessenger.of(context).showSnackBar(...)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Seja bem-vindo, $_email!')),
                  );
                },
                child: const Text('Entrar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
