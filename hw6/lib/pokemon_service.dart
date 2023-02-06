import 'package:cs311hw06/pokemon_api.dart';
import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  late PokemonInfo pokemonInfo;
  int pokemonCount = 1;
  late String class_ = "";
  int colorValue = 0;
  
  //A function for comparing elements as color codes.
  MaterialColor changeTheme() {
    if (class_ == "normal") {
      colorValue = 0xFFA8A77A;
    } else if (class_ == "fire") {
      colorValue = 0xFFEE8130;
    } else if (class_ == "water") {
      colorValue = 0xFF6390F0;
    } else if (class_ == "electric") {
      colorValue = 0xFFF7D02C;
    } else if (class_ == "grass") {
      colorValue = 0xFF7AC74C;
    } else if (class_ == "ice") {
      colorValue = 0xFF96D9D6;
    } else if (class_ == "fighting") {
      colorValue = 0xFFC22E28;
    } else if (class_ == "poison") {
      colorValue = 0xFFA33EA1;
    } else if (class_ == "ground") {
      colorValue = 0xFFE2BF65;
    } else if (class_ == "flying") {
      colorValue = 0xFFA98FF3;
    } else if (class_ == "psychic") {
      colorValue = 0xFFF95587;
    } else if (class_ == "bug") {
      colorValue = 0xFFA6B91A;
    } else if (class_ == "rock") {
      colorValue = 0xFFB6A136;
    } else if (class_ == "ghost") {
      colorValue = 0xFF735797;
    } else if (class_ == "dragon") {
      colorValue = 0xFF6F35FC;
    } else if (class_ == "dark") {
      colorValue = 0xFF705746;
    } else if (class_ == "steel") {
      colorValue = 0xFFB7B7CE;
    } else if (class_ == "fairy") {
      colorValue = 0xFFD685AD;
    }
    MaterialColor color = MaterialColor(colorValue, const <int, Color>{
      50: Color.fromRGBO(238, 129, 48, .1),
      100: Color.fromRGBO(238, 129, 48, .2),
      200: Color.fromRGBO(238, 129, 48, .3),
      300: Color.fromRGBO(238, 129, 48, .4),
      400: Color.fromRGBO(238, 129, 48, .5),
      500: Color.fromRGBO(238, 129, 48, .6),
      600: Color.fromRGBO(238, 129, 48, .7),
      700: Color.fromRGBO(238, 129, 48, .8),
      800: Color.fromRGBO(238, 129, 48, .9),
      900: Color.fromRGBO(238, 129, 48, 1),
    });
    return color;
  }

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }
  
  //Function for checking element from pokemon ID
  void changeClass(int pokeId) async {
    pokemonInfo = await fetchPokemonInfo(pokeId);
    class_ = pokemonInfo.types[0];
    notifyListeners();
  }
}
