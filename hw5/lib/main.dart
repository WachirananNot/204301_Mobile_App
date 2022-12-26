import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  List<String> items = List<String>.generate(
      150,
      (i) =>
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png');
  List<bool> isFavorite = List<bool>.generate(150, (i) => false);
  var countFav;
  void setFav(int i) {
    setState(() {
      if (isFavorite[i]) {
        isFavorite[i] = false;
      } else {
        isFavorite[i] = true;
      }
      countFav = isFavorite.where((v) => v == true).length;
    });
  }

  @override
  Widget build(BuildContext context) {
    var title;
    if (countFav == null || countFav == 0) {
      title = "Pokemon List";
    } else {
      title = "Pokemon List ($countFav)";
    }
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text(title)),
        ),
        body: ListView.builder(
          itemCount: items.length ~/
              3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(
                    child: Stack(
                  // Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(items[index * 3]),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            setFav(index * 3);
                          });
                        },
                        icon: isFavorite[index * 3]
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 50,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 50,
                              ))
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(items[index * 3 + 1]),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            setFav(index * 3 + 1);
                          });
                        },
                        icon: isFavorite[index * 3 + 1]
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 50,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 50,
                              ))
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(items[index * 3 + 2]),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            setFav(index * 3 + 2);
                          });
                        },
                        icon: isFavorite[index * 3 + 2]
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 50,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.black,
                                size: 50,
                              ))
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}


