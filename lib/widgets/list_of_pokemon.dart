import 'package:flutter/material.dart';
import 'package:pokeapp/services/pokemon.dart';
import 'package:pokeapp/page/pokemon.dart';

class ListOfPokemon extends StatefulWidget {
  const ListOfPokemon({super.key});

  @override
  _ListOfPokemonState createState() => _ListOfPokemonState();
}

class _ListOfPokemonState extends State<ListOfPokemon> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<dynamic>(
        future: getAllPokemon(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());
            default:
              final quieredPokemon = snapshot.data;
              return ListView.builder(
                  itemCount: quieredPokemon.count,
                  itemBuilder: (context, index) {
                    final pokemon = quieredPokemon.results[index];
                    return ListTile(
                      title: Text(pokemon.name),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PokemonPage(url: pokemon.url)));
                      },
                    );
                  });
          }
        });
  }
}
