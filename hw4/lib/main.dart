import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

void main() {
  runApp(MaterialApp(
    title: "My First App",
    home: MyHome(),
  ));
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 1, 1, 1),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 27, 29, 28),
          leading: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color.fromARGB(255, 226, 168, 168),
              )),
          title: const Center(
            child: Text(
              "Chiang Mai",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          actions: const [
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.ios_share,
                  color: Color.fromARGB(255, 226, 168, 168),
                )),
            IconButton(
                onPressed: null,
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                ))
          ],
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Column(
              children: [
                Container(
                    constraints: const BoxConstraints(
                        minHeight: 100,
                        minWidth: double.infinity,
                        maxHeight: 250),
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    width: MediaQuery.of(context).size.width,
                    child: ImageSlideshow(
                      onPageChanged: (value) {
                        print('Page changed: $value');
                      },
                      isLoop: false,
                      children: [
                        Image.asset(
                          "assets/shang.png",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/hotel1.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/hotel2.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/hotel3.jpg",
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          "assets/hotel4.jpg",
                          fit: BoxFit.cover,
                        ),
                      ],
                    )),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: const Text(
                    "UNESCO Sustainable Travel Pledge",
                    style: TextStyle(color: Color.fromARGB(255, 207, 207, 207)),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: const Text(
                    "Shangri-La Chiang Mai",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                    child: Row(
                      children: const [
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 139, 139, 139),
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 139, 139, 139),
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 139, 139, 139),
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 139, 139, 139),
                          size: 18,
                        ),
                        SizedBox(width: 3),
                        Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 139, 139, 139),
                          size: 18,
                        )
                      ],
                    )),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                  child: const Text(
                    "Luxury hotel with free water park, near Chiang Mai Night Bazaar",
                    style: TextStyle(
                        color: Color.fromARGB(255, 207, 207, 207),
                        fontSize: 22),
                  ),
                ),
                const SizedBox(height: 35),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: const Text(
                    "9.0/10 Superb",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: const Text(
                    "1000 verified Hotels.com guest reviews",
                    style: TextStyle(color: Color.fromARGB(255, 207, 207, 207)),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(9, 6, 0, 0),
                  child: const TextButton(
                      onPressed: null,
                      child: Text(
                        "See all 1,000 reviews   >",
                        style: TextStyle(
                            color: Color.fromARGB(255, 168, 207, 244)),
                      )),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: const Text(
                    "Popular amenities",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Row(children: const [
                      Icon(
                        Icons.wifi,
                        color: Color.fromARGB(255, 207, 207, 207),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Free WiFi",
                        style: TextStyle(
                            color: Color.fromARGB(255, 207, 207, 207),
                            fontSize: 18),
                      ),
                      SizedBox(width: 100),
                      Icon(
                        Icons.pool,
                        color: Color.fromARGB(255, 207, 207, 207),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Pool",
                        style: TextStyle(
                            color: Color.fromARGB(255, 207, 207, 207),
                            fontSize: 18),
                      ),
                    ])),
                const SizedBox(height: 5),
                Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Row(children: const [
                      Icon(
                        Icons.ac_unit,
                        color: Color.fromARGB(255, 207, 207, 207),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Air conditioning",
                        style: TextStyle(
                            color: Color.fromARGB(255, 207, 207, 207),
                            fontSize: 18),
                      ),
                      SizedBox(width: 50),
                      Icon(
                        Icons.directions_car,
                        color: Color.fromARGB(255, 207, 207, 207),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Free parking",
                        style: TextStyle(
                            color: Color.fromARGB(255, 207, 207, 207),
                            fontSize: 18),
                      ),
                    ])),
                const SizedBox(height: 5),
                Container(
                    padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Row(children: const [
                      Icon(
                        Icons.fitness_center,
                        color: Color.fromARGB(255, 207, 207, 207),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Gym",
                        style: TextStyle(
                            color: Color.fromARGB(255, 207, 207, 207),
                            fontSize: 18),
                      ),
                      SizedBox(width: 140),
                      Icon(
                        Icons.thermostat,
                        color: Color.fromARGB(255, 207, 207, 207),
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Refrigerator",
                        style: TextStyle(
                            color: Color.fromARGB(255, 207, 207, 207),
                            fontSize: 18),
                      ),
                    ])),
                const SizedBox(height: 40),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  constraints: const BoxConstraints(
                      minHeight: 100,
                      minWidth: double.infinity,
                      maxHeight: 250),
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/map.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: 100,
              height: 50,
              margin: const EdgeInsets.fromLTRB(340, 150, 0, 0),
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.8),
                  borderRadius: BorderRadius.circular(30)),
              child: Row(children: const [
                Icon(Icons.photo_library_outlined, color: Colors.white),
                Text(
                  '  61',
                  style: TextStyle(color: Colors.white),
                ),
              ]),
            ),
          ],
        )),
        floatingActionButton: InkWell(
          onTap: () {},
          child: Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width * 0.92,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(169, 207, 245, 1),
                borderRadius: BorderRadius.circular(30)),
            child: const Center(
              child: Text(
                'Select a room',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0,
                    color: Colors.black),
              ),
            ),
          ),
        ));
  }
}
