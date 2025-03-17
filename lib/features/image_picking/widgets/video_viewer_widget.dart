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
  @override
  void dispose() {
    
    widget.videocontroller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: AspectRatio(
          aspectRatio: widget.videocontroller!.value.aspectRatio,
          child: GestureDetector(
              onTap: () async {
                await widget.videocontroller!.play();
              },
              child: CachedVideoPlayerPlus(
                widget.videocontroller!,
              ))),
    );
  }
}