import 'package:flutter/material.dart';
import 'package:pokedex/component/pokemon_card.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  bool isLightMode = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLightMode ? Colors.white : Colors.black,
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              "https://image.flaticon.com/icons/png/512/528/528101.png",
              width: 25,
              height: 25,
            ),
            Text('Pokédex'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Pokémons"),
              IconButton(
                onPressed: () {
                  setState(() {
                    isLightMode = !isLightMode;
                  });
                },
                icon: Icon(
                  Icons.dark_mode_outlined,
                ),
              )
            ],
          ),
          PokemonCard(
            name: "bubassauro",
            photo:
                "http://2.bp.blogspot.com/-IYIS_mwIUoY/URvCsPFFbkI/AAAAAAAAIZw/HslB515tC5I/s1600/Bulbasaur_by_Xous54.png",
            types: ['sdf', 'asd'],
          ),
        ],
      ),
    );
  }
}
