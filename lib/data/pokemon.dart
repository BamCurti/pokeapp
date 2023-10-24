class ListablePokemon {
  final String name;
  final String url;

  ListablePokemon({
    required this.name,
    required this.url,
  });

  factory ListablePokemon.fromJson(Map<String, dynamic> json) {
    return ListablePokemon(name: json['name'], url: json['url']);
  }
}

class QueriedPokemon {
  final int count;
  final String? next;
  final String? previous;
  final List<ListablePokemon> results;

  QueriedPokemon(
      {required this.count, this.next, this.previous, required this.results});
}

class PokemonData {
  final String name;
  final int height;
  final int id;
  final String sprite;
  final List types;

  PokemonData(
      {required this.name,
      required this.height,
      required this.id,
      required this.sprite,
      required this.types});

  factory PokemonData.fromJson(Map<String, dynamic> json) {
    final String name = json["name"];
    final int height = json["height"];
    final int id = json["id"];
    final String sprite = json["sprites"]["front_default"];
    final List rawTypes = json["types"];
    print(rawTypes);
    final List<String> types =
        rawTypes.map((t) => t["type"]["name"].toString()).toList();

    return PokemonData(
      name: name,
      height: height,
      id: id,
      sprite: sprite,
      types: types,
    );
  }
}

class PokemonType {
  final String? name;
  final String? url;

  PokemonType({
    required this.name,
    required this.url,
  });
}
