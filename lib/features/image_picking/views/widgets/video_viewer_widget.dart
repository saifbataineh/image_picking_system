import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';

class VideoViewerWidget extends StatefulWidget {
  const VideoViewerWidget({
    super.key,
    required this.videocontroller,
  });

  final CachedVideoPlayerPlusController? videocontroller;

  @override
  State<VideoViewerWidget> createState() => _VideoViewerWidgetState();
}

class _VideoViewerWidgetState extends State<VideoViewerWidget> {
  bool isplaying = false;
  @override
  void initState() {
    widget.videocontroller?.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: AspectRatio(
          aspectRatio: widget.videocontroller!.value.aspectRatio,
          child: GestureDetector(
              onTap: () {
                if (isplaying) {
                  widget.videocontroller!.pause();

                } else {
                  widget.videocontroller!.play();
                }
                setState(() {
                  isplaying=!isplaying;
                });
              },
              child: Stack(
                children: [
                  CachedVideoPlayerPlus(
                    widget.videocontroller!,
                  ),
                  Icon(isplaying ? null : Icons.play_arrow)
                ],
              ))),
    );
  }
}
