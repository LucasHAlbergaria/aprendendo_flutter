import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaPokedex(),
  ));
}

// ==========================================
// 1. MODELO DE DADOS
// ==========================================
class Pokemon {
  final int id;
  final String nome;
  final String imagemUrl;

  Pokemon({
    required this.id,
    required this.nome,
    required this.imagemUrl,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json, int id) {
    return Pokemon(
      id: id,
      nome: json['name'] as String,
      imagemUrl:
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png',
    );
  }
}

// ==========================================
// 2. TELA E REQUISIÇÃO ASSÍNCRONA
// ==========================================
class TelaPokedex extends StatefulWidget {
  const TelaPokedex({super.key});

  @override
  State<TelaPokedex> createState() => _TelaPokedexState();
}

class _TelaPokedexState extends State<TelaPokedex> {

  Future<List<Pokemon>> _buscarPokemons() async {
    final url = Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=20');

    try {
      final response = await http.get(url);

      if (response.statusCode != 200) {
        throw Exception('Erro HTTP ${response.statusCode}');
      }

      final mapa = jsonDecode(response.body) as Map<String, dynamic>;
      final resultados = mapa['results'] as List<dynamic>;

      List<Pokemon> listaPokemons = [];

      for (int i = 0; i < resultados.length; i++) {
        int id = i + 1;
        listaPokemons.add(Pokemon.fromJson(resultados[i], id));
      }

      return listaPokemons;
    } catch (e) {
      throw Exception('Falha ao carregar Pokémon: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pokédex')),
      body: FutureBuilder<List<Pokemon>>(
        future: _buscarPokemons(), // ✅ Conectado aqui
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            final pokemons = snapshot.data!;

            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (context, index) {
                final pokemon = pokemons[index];
                return ListTile(
                  leading: Image.network(pokemon.imagemUrl),
                  title: Text(pokemon.nome.toUpperCase()),
                  subtitle: Text('#${pokemon.id}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => TelaDetalhes(pokemon: pokemon),
                      ),
                    ); // ✅ Ponto e vírgula adicionado
                  },
                );
              },
            );
          }

          return const Center(child: Text('Nenhum dado encontrado.'));
        },
      ),
    );
  }
} // ✅ Fechamento correto da classe _TelaPokedexState

// ==========================================
// 3. TELA DE DETALHES
// ==========================================
class TelaDetalhes extends StatelessWidget {
  final Pokemon pokemon;

  const TelaDetalhes({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.nome.toUpperCase())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(pokemon.imagemUrl, height: 200),
            Text(
              '#${pokemon.id}',
              style: const TextStyle(fontSize: 24, color: Colors.grey),
            ),
            Text(
              pokemon.nome.toUpperCase(),
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}