import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/classes/pokemon.dart';
import 'package:pokedex/component/type_box.dart';
import 'package:pokedex/screens/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PokemonInfo(
              image: pokemon.photo,
              id: pokemon.id,
              name: pokemon.name,
            ),
          ),
        );
      },
      child: Container(
        width: 110,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(1),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(8),
                child: Image.network(pokemon.photo)),
            Text(pokemon.name),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: pokemon.types.map(
                (type) {
                  return TypeBox(type: type);
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
