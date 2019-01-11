class Pokedex {
  List<Pokemon> pokemon;
  Pokedex({this.pokemon});
  Pokedex.fromJson(Map<String, dynamic> json) {
    if (json['pokemon'] != null) {
      pokemon = new List<Pokemon>();
      json['pokemon'].forEach((value) {
        pokemon.add(Pokemon.fromJson(value));
      });
    }
  }
}

class Pokemon {
  String name, imageUrl, height, weight;
  List<String> type, weakness;
  List<NextEvolution> nextEvolution;
  Pokemon({this.name, this.imageUrl});
  Pokemon.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['img'];
    height = json['height'];
    weight = json['weight'];
    type = json['type'].cast<String>();
    weakness = json['weaknesses']?.cast<String>();
    if (json['next_evolution'] != null) {
      nextEvolution = new List<NextEvolution>();
      json['next_evolution'].forEach((value) {
        nextEvolution.add(NextEvolution.fromJson(value));
      });
    }
  }
}

class NextEvolution {
  String name, num;
  NextEvolution({this.name, this.num});
  NextEvolution.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    num = json['num'];
  }
}
