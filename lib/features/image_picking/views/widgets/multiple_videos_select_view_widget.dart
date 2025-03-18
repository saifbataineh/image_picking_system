import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:image_picking_system/features/image_picking/views/widgets/video_viewer_widget.dart';
import 'package:provider/provider.dart';

class MultipleVideosSelectViewWidget extends StatefulWidget {
  const MultipleVideosSelectViewWidget({super.key});

  @override
  State<MultipleVideosSelectViewWidget> createState() =>
      _MultipleVideosSelectViewWidgetState();
}

class _MultipleVideosSelectViewWidgetState
    extends State<MultipleVideosSelectViewWidget> {
  ScrollController controller = ScrollController();
  @override
  void dispose() {
    context.read<MediaProvider>().videocontrollers!.forEach((videoController) {
      videoController!.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return Selector<MediaProvider, List<CachedVideoPlayerPlusController?>>(
      selector: (_, selector) {
        return selector.videocontrollers;
      },
      builder: (context, selector, child) {
        return SizedBox(
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (context.read<MediaProvider>().videocontrollers!.isEmpty)
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      context.read<MediaProvider>().addingMultipleVideos();
                    },
                    child: const Text("pick multiple videos"),
                  ),
                ),
              if (context.read<MediaProvider>().videocontrollers!.isNotEmpty)
                SizedBox(
                  height: height,
                  child: ListView.builder(
                    controller: controller,
                    itemCount:
                        context.read<MediaProvider>().videocontrollers!.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return VideoViewerWidget(
                        
                        height: height,
                        index:index,
                          scrollController: controller,
                          videocontroller: context
                              .read<MediaProvider>()
                              .videocontrollers![index]);
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
