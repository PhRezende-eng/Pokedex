import 'package:flutter/material.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/component/pokemon_card.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  bool isLightMode = true;
  List pokemons = <Pokemon>[];

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
          Row(
              children: pokemons
                  .map(
                    (pokemon) => PokemonCard(
                      pokemon: pokemon,
                    ),
                  )
                  .toList())
        ],
      ),
    );
  }
}
