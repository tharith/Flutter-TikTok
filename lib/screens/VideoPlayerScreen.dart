import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController videoPlayerController;
  late Future<void> _initializeVideoPlayerFutrue;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.asset("videos/2.mp4");
    _initializeVideoPlayerFutrue = videoPlayerController.initialize();
    videoPlayerController.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Video Player"),
        backgroundColor: Colors.yellow,
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFutrue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: videoPlayerController.value.aspectRatio,
              child: VideoPlayer(videoPlayerController),
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (videoPlayerController.value.isPlaying) {
              videoPlayerController.pause();
            } else {
              videoPlayerController.play();
            }
          });
        },
        child: Icon(
            videoPlayerController.value.isPlaying ? Icons.pause : Icons.play_arrow
        ),
      ),
    );
  }
}
