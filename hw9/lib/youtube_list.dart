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
      "videos/LE SSERAFIM (르세라핌) 'ANTIFRAGILE' OFFICIAL M-V2.mp4",
      "HYBE LABELS",
      "LE SSERAFIM 'ANTIFRAGILE' OFFICIAL M/V",
      "images/ANTIFRAGILE.jpg"
    ],
    1: [
      "videos/LE SSERAFIM FEARLESS OFFICIAL M-V2.mp4",
      "HYBE LABELS",
      "LE SSERAFIM 'FEARLESS' OFFICIAL M/V",
      "images/FEARLESS.jpg"
    ],
    2: [
      "videos/NewJeans (뉴진스) Cookie Official MV2.mp4",
      "HYBE LABELS",
      "NewJeans 'OMG' Official MV (Performance ver.1)",
      "images/omg.jpg"
    ],
    3: [
      "videos/NewJeans (뉴진스) Ditto Official MV (side A)2.mp4",
      "HYBE LABELS",
      "NewJeans 'Ditto' Official MV (side A)",
      "images/ditto.jpg"
    ],
    4: [
      "videos/NewJeans (뉴진스) 'OMG' Official MV (Performance ver.1)2.mp4",
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
