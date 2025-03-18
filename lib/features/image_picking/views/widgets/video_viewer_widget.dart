import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class VideoViewerWidget extends StatefulWidget {
  const VideoViewerWidget({
    super.key,
    this.height = 820,
    this.index = 0,
    required this.videocontroller,
    required this.scrollController,
  });

  final CachedVideoPlayerPlusController? videocontroller;
  final ScrollController scrollController;
  final int index;
  final double height;

  @override
  State<VideoViewerWidget> createState() => _VideoViewerWidgetState();
}

class _VideoViewerWidgetState extends State<VideoViewerWidget> {
  bool isplaying = false;
  VoidCallback? _listener;
  @override
  void initState() {
    print("object21 ${widget.index}");
    _listener = () {
      if (widget.scrollController.offset > widget.height * widget.index) {
       if(!isplaying){
        widget.videocontroller!.play();
        isplaying=true;

       }
      }
      if (widget.scrollController.offset > widget.height * (widget.index + 1)) {
        if(isplaying){

        widget.videocontroller!.pause();
        isplaying=false;
        }
      }
    };
    widget.videocontroller?.initialize();
    widget.scrollController.addListener(_listener!);
    super.initState();
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_listener!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height,
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
                  isplaying = !isplaying;
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
