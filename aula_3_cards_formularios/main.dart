/*import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _senha = TextEditingController();
  bool obscureText = true;

  void logar() {
    if (_form.currentState?.validate() ?? false) {
      if (_email.text == 'cotemig@cotemig.com')
        exibeMensagem('Seja bem vindo! ${_email.text}');
      else
        exibeMensagem('Usuário inválido');
    }
  }

  void exibeMensagem(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
            child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.password,
                size: 150,
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: _email,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Preencha o campo';
                  if (!value.contains('@')) return 'Email inválido';
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'E-mail'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _senha,
                obscureText: obscureText,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Preencha o campo';
                  if (value.length < 6)
                    return 'A senha requer no mínimo 6 caracteres';
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Senha',
                    suffixIcon: TextButton(
                        onPressed: () => {
                              setState(() {
                                obscureText = !obscureText;
                              })
                            },
                        child: Icon(Icons.remove_red_eye))),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                  onPressed: () => logar(),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(child: Text('Entrar')),
                  ))
            ],
          ),
        )),
      ),
    );
  }
} */
