import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  bool isSelected = false;
  int chosen = 1;
  @override
  Widget build(BuildContext context) {
    BoxDecoration? myBox() {
      if (isSelected) {
        return BoxDecoration(
            border: Border.all(
          width: 3, //                   <--- border width here
        ));
      } else {
        return null;
      }
    }

    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    isSelected = true;
                    chosen = index + 1;
                    pokemonService.changeClass(index + 1);
                  });
                },
                child: (chosen == index + 1
                    ? Container(
                        decoration: myBox(),
                        child: Image.network(genPokemonImageUrl(index + 1)),
                      )
                    : Image.network(genPokemonImageUrl(index + 1))));
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}
