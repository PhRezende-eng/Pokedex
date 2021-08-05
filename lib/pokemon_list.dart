import 'package:flutter/material.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/component/pokemon_card.dart';
import 'package:pokedex/services/pokemon_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  bool isLightMode = true;
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    setPokemonList();
    super.initState();
  }

  void setPokemonList() async {
    for (int i = 1; i <= 150; i++) {
      var newPokemon = await PokemonApi.getPokemon();
      setState(() {
        pokemons.add(newPokemon);
      });
    }
  }

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
