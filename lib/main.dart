import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:poke_app/detailsPage.dart';
import 'package:poke_app/pokemon.dart';

void main() => runApp(MaterialApp(
      home: HomePage(),
      theme: ThemeData(primaryColor: Colors.cyan),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Pokedex pokedex;

  Future<void> fetchPokeData() async {
    var response = await http.get(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
    var decodedResponse = jsonDecode(response.body);
    pokedex = Pokedex.fromJson(decodedResponse);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchPokeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Pokedex"),),
        body: pokedex != null
            ? GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: pokedex.pokemon.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Card(
                      margin: EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Hero(
                            tag: pokedex.pokemon[index].imageUrl,
                            child:
                                Image.network(pokedex.pokemon[index].imageUrl),
                          ),
                          Text(pokedex.pokemon[index].name),
                        ],
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => DetailsPage(
                              pokemon: pokedex.pokemon[index],
                            ))),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }
}
