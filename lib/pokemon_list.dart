import 'package:flutter/material.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/component/pokemon_card.dart';
import 'package:pokedex/component/search_pokemon_card.dart';
import 'package:pokedex/services/pokemon_api.dart';
import 'package:provider/provider.dart';

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

  Future<void> setPokemonList() async {
    for (int i = 1; i <= 150; i++) {
      var newPokemon = await PokemonApi.getPokemon(i);
      setState(() {
        pokemons.add(newPokemon);
      });
    }
  }

  Future<void> refreshScreen() async {
    await Future.delayed(Duration(seconds: 3));
    pokemons.clear();
    await Future.delayed(Duration(seconds: 1));
    setPokemonList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isLightMode ? Colors.white : Colors.grey.shade800,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(104),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(8))),
          title: Row(
            children: [
              Image.network(
                "https://image.flaticon.com/icons/png/512/528/528101.png",
                width: 24,
                height: 24,
              ),
              SizedBox(width: 8),
              Text('Pokédex'),
            ],
          ),
          flexibleSpace: Padding(
            padding: EdgeInsets.fromLTRB(8, 72, 8, 0),
            child: SearchPokemonCard('Pesquisar pokémon'),
          ),
          centerTitle: true,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return refreshScreen();
        },
        child: Scrollbar(
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
      ),
    );
  }
}
