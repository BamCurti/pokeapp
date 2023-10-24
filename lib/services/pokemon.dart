import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pokeapp/data/pokemon.dart';

const String GET_ALL_POKEMON =
    "https://pokeapi.co/api/v2/pokemon?offset=0&limit=151";

Future<QueriedPokemon> getAllPokemon() async {
  final response = await http.get(Uri.parse(GET_ALL_POKEMON));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final count = data['count'];
    final pokemonList = (data['results'] as List)
        .map((item) => ListablePokemon.fromJson(item))
        .toList();
    return QueriedPokemon(count: count, results: pokemonList);
  }
  return QueriedPokemon(count: 0, results: []);
}

Future<PokemonData> getPokemon(String url) async {
  final response = await http.get(Uri.parse(url));

  if (response.statusCode != 200) {
    throw Error();
  }

  final data = json.decode(response.body);
  return PokemonData.fromJson(data);
}
