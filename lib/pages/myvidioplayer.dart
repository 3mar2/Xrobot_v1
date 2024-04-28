import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class vidplay extends StatefulWidget {
  const vidplay({super.key});

  @override
  State<vidplay> createState() => _vidplayState();
}

class _vidplayState extends State<vidplay> {
  late FlickManager flickManager;
  @override
  void initState() {
    super.initState();
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.asset(""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("vidio player"),
        centerTitle: true,
      ),
      body: Center(
        child: AspectRatio(
            aspectRatio: 16/10,
            child: FlickVideoPlayer(flickManager: flickManager)),
      ),
    );
  }
}
