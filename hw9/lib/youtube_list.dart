import 'package:flutter/material.dart';
import 'package:hw9/video_player.dart';

class YoutubeList extends StatefulWidget {
  const YoutubeList({super.key});

  @override
  State<YoutubeList> createState() => _YoutubeListState();
}

class _YoutubeListState extends State<YoutubeList> {
  var videoList = {
    0: [
      "https://www.youtube.com/watch?v=pyf8cbqyfPs",
      "HYBE LABELS",
      "LE SSERAFIM 'ANTIFRAGILE' OFFICIAL M/V",
      "images/ANTIFRAGILE.jpg"
    ],
    1: [
      "https://www.youtube.com/watch?v=4vbDFu0PUew",
      "HYBE LABELS",
      "LE SSERAFIM 'FEARLESS' OFFICIAL M/V",
      "images/FEARLESS.jpg"
    ],
    2: [
      "https://www.youtube.com/watch?v=sVTy_wmn5SU",
      "HYBE LABELS",
      "NewJeans 'OMG' Official MV (Performance ver.1)",
      "images/omg.jpg"
    ],
    3: [
      "https://www.youtube.com/watch?v=pSUydWEqKwE",
      "HYBE LABELS",
      "NewJeans 'Ditto' Official MV (side A)",
      "images/ditto.jpg"
    ],
    4: [
      "https://www.youtube.com/watch?v=VOmIplFAGeg",
      "HYBE LABELS",
      "NewJeans 'Cookie' Official MV",
      "images/Cookie.jpg"
    ],
  };

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: videoList.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => VideoPlayerScreen(
                          link: videoList[index]!,
                        )));
          },
          child: Column(
            children: [
              Image.asset(videoList[index]![3]),
              Center(
                child: Row(
                  children: [
                    const Icon(Icons.account_circle_sharp),
                    Column(
                      children: [
                        Text(
                            "${videoList[index]![2]}.mp4\n${videoList[index]![1]} 6 hours ago"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    ));
  }
}
