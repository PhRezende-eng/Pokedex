import 'package:flutter/material.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/component/pokemon_card.dart';
import 'package:pokedex/services/pokemon_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  PokemonListState createState() => PokemonListState();
}

class PokemonListState extends State<PokemonList> {
  bool isLightMode = true;
  List<Pokemon> pokemons = [];

  @override
  void initState() {
    setPokemonList();
    super.initState();
  }

  void setPokemonList() async {
    for (int i = 1; i <= 150; i++) {
      var newPokemon = await PokemonApi.getPokemon(i);
      setState(() {
        pokemons.add(newPokemon);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLightMode ? Colors.white : Colors.grey.shade800,
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
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Pokémons",
                      style: TextStyle(
                          color: !isLightMode
                              ? Colors.white
                              : Colors.grey.shade900),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLightMode = !isLightMode;
                      });
                    },
                    icon: isLightMode
                        ? Icon(
                            Icons.dark_mode_outlined,
                          )
                        : Icon(
                            Icons.light_mode_outlined,
                            color: Colors.white,
                          ),
                  )
                ],
              ),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: pokemons
                    .map(
                      (pokemon) => PokemonCard(
                        pokemon: pokemon,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
