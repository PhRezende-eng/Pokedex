import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_list.dart';
// import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// bool darkMode(BuildContext context) {
//   final darkMode = Provider.of<PokemonListState>(context).isLightMode;
//   return darkMode;
// }

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex!',
      // theme: darkMode(context) ? ThemeData.dark() : ThemeData.light(),
      // theme: ThemeData.dark(),
      // theme: ThemeData.light(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: PokemonList(),
    );
  }
}
