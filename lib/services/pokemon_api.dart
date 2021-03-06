import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokedex/classes/pokemon.dart';

class PokemonApi {
  static Future<Pokemon> getPokemon(int? pokemonNumber) async {
    var url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokemonNumber');
    var response = await http.get(url);
    var data =
        jsonDecode(response.body); // -> transforma o body em json com o decode
    var pokemon = Pokemon.fromJson(data);
    return pokemon;
  }
}
