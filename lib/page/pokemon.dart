import 'package:flutter/material.dart';
import 'package:pokeapp/services/pokemon.dart';
import 'package:pokeapp/data/pokemon.dart';

class PokemonPage extends StatefulWidget {
  String url;
  PokemonPage({super.key, required this.url});

  @override
  State<PokemonPage> createState() => _PokemonPageState();
}

class _PokemonPageState extends State<PokemonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pokemon"),
        ),
        body: FutureBuilder(
            future: getPokemon(widget.url),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  final PokemonData? pokemon = snapshot.data;
                  if (pokemon == null) throw Error();
                  return PokemonDetails(data: pokemon);
              }
            }));
  }
}

class PokemonDetails extends StatelessWidget {
  final PokemonData data;
  const PokemonDetails({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name: ${data.name}",
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          Text("Height: ${data.height} cm",
              style: const TextStyle(fontSize: 18)),
          const SizedBox(
            height: 20,
          ),
          Text("ID: ${data.id}", style: const TextStyle(fontSize: 16)),
          Image.network(
            data.sprite,
            width: 300,
            height: 300,
            fit: BoxFit.fill,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text("Types",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Column(
            children: data.types
                .map((type) => Text(type, style: const TextStyle(fontSize: 16)))
                .toList(),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "Download frame",
              style: TextStyle(color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.yellow, // Pikachu's color for the button
              padding: EdgeInsets.all(16),
            ),
          )
        ],
      ),
    );
  }
}
