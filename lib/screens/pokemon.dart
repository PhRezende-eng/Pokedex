import 'package:flutter/material.dart';
import 'package:pokedex/component/type_box.dart';

class PokemonInfo extends StatefulWidget {
  final String image;
  final String name;
  final int id;
  final List<String> types;
  const PokemonInfo(
      {Key? key,
      required this.image,
      required this.name,
      required this.types,
      required this.id})
      : super(key: key);

  @override
  _PokemonInfoState createState() => _PokemonInfoState();
}

class _PokemonInfoState extends State<PokemonInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              "https://image.flaticon.com/icons/png/512/528/528101.png",
              width: 25,
              height: 25,
            ),
            SizedBox(
              width: 16,
            ),
            Text('Pokédex'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text(widget.name),
          Text('${widget.id}'),
          Image.network(widget.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: widget.types
                .map(
                  (type) => TypeBox(type: type),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
