import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'Videos.dart';
// import 'package:better_player/better_player.dart';

class Player extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: <Widget>[
      Videos(
        videoPlayerController: VideoPlayerController.asset(
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        ),
        looping: true,
      ),
      Videos(
        videoPlayerController: VideoPlayerController.network(
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
        ),
      ),
      // Center(
      //   child: BetterPlayer.network(
      //     'https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
      //     betterPlayerConfiguration: BetterPlayerConfiguration(
      //       aspectRatio: 16 / 9,
      //     ),
      //   ),
      // ),
    ]));
  }
}
