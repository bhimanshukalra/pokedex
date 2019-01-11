import 'package:flutter/material.dart';
import 'package:poke_app/pokemon.dart';

class DetailsPage extends StatelessWidget {
  final Pokemon pokemon;
  DetailsPage({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name),
        elevation: 0.0,
      ),
      backgroundColor: Colors.cyan,
      body: Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    pokemon.name,
                    style:
                        TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                  ),
                  Text("Height: ${pokemon.height}"),
                  Text("Weight: ${pokemon.weight}"),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((value) => RawChip(
                              label: Text(
                                value,
                              ),
                              backgroundColor: Colors.yellow,
                            ))
                        .toList(),
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weakness
                        .map((value) => RawChip(
                              label: Text(
                                value,
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ))
                        .toList(),
                  ),
                  pokemon.nextEvolution != null
                      ? Column(
                          children: <Widget>[
                            Text(
                              "Next Evolution",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: pokemon.nextEvolution
                                    .map((value) => RawChip(
                                          label: Text(
                                            value.name,
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          backgroundColor: Colors.green,
                                        ))
                                    .toList())
                          ],
                        )
                      : Column(),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.imageUrl,
              child: Image.network(
                pokemon.imageUrl,
                height: 200.0,
                width: 200.0,
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
    );
  }
}
