import 'package:flutter/material.dart';

class PokemonInfo extends StatefulWidget {
  final String image;
  const PokemonInfo({Key? key, required this.image}) : super(key: key);

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
            Text('Pokédex'),
          ],
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('Bulbassauro'),
          Text('Não sei'),
          Image.network(widget.image),
        ],
      ),
    );
  }
}
