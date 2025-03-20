import 'dart:async';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:provider/provider.dart';

class VideoViewerWidget extends StatefulWidget {
  const VideoViewerWidget({
    super.key,
    this.height = 820,
    this.index = 0,
  });

  final int index;
  final double height;

  @override
  State<VideoViewerWidget> createState() => _VideoViewerWidgetState();
}

class _VideoViewerWidgetState extends State<VideoViewerWidget> {
  bool isShown = false;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    isMuted = context.read<MediaProvider>().isMuted;
    context.read<MediaProvider>().videocontrollers[widget.index]?.initialize();

    context.read<MediaProvider>().videocontrollers[widget.index]
      ?..play()
      ..setLooping(true);
  }

  @override
  void dispose() {
    /* widget.scrollController.removeListener(_listener!); */
    context.read<MediaProvider>().videocontrollers[widget.index]?.dispose();
    super.dispose();
  }

  _volumeChange() async {
    if (isMuted) {
      context
          .read<MediaProvider>()
          .videocontrollers[widget.index]
          ?.setVolume(1);
    } else {
      context.read<MediaProvider>().isMuted = true;
      context
          .read<MediaProvider>()
          .videocontrollers[widget.index]
          ?.setVolume(0);
    }
    context.read<MediaProvider>().isMuted = !isMuted;

    setState(() {
      isMuted = !isMuted;
      isShown = true;
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isShown = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      height: height,
      child: AspectRatio(
          aspectRatio: context
              .read<MediaProvider>()
              .videocontrollers[widget.index]!
              .value
              .aspectRatio,
          child: GestureDetector(
              onLongPressStart: (longPressStarted) {
                context
                    .read<MediaProvider>()
                    .videocontrollers[widget.index]!
                    .pause();
              },
              onLongPressUp: () {
                context
                    .read<MediaProvider>()
                    .videocontrollers[widget.index]!
                    .play();
              },
              onTap: () {
                _volumeChange();
              },
              child: Stack(
                children: [
                  CachedVideoPlayerPlus(
                    context
                        .read<MediaProvider>()
                        .videocontrollers[widget.index]!,
                  ),
                  Center(
                    child: isShown
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              size: 50,
                              isMuted
                                  ? Icons.volume_off_rounded
                                  : Icons.volume_up,
                            ),
                          )
                        : SizedBox.shrink(),
                  ),

                  /*  isShown?Icon(Icons.volume_down):Icon(Icons.abc) */
                ],
              ))),
    );
  }
}
