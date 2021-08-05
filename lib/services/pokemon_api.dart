import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/classes/pokemon.dart';

class PokemonApi {
  static Future<Pokemon> getPokemon() async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/1');
    var response = await http.get(url);
    var data = jsonDecode(response.body);
    var pokemon = Pokemon.fromJson(data);
    return pokemon;
  }
}
