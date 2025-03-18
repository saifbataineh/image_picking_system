import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:image_picking_system/features/image_picking/views/widgets/video_viewer_widget.dart';
import 'package:provider/provider.dart';

class SingleVideoSelectViewWidget extends StatefulWidget {
  const SingleVideoSelectViewWidget({super.key});

  @override
  State<SingleVideoSelectViewWidget> createState() =>
      _SingleVideoSelectViewWidgetState();
}

class _SingleVideoSelectViewWidgetState
    extends State<SingleVideoSelectViewWidget> {
  @override
  void dispose() {
    context.read<MediaProvider>().videocontroller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<MediaProvider, CachedVideoPlayerPlusController?>(
      selector: (_, selector) => selector.videocontroller,
      builder: (context, selector, child) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                context.read<MediaProvider>().addingSingleVideo();
              },
              child: const Text("pickVideo"),
            ),
            if (context.read<MediaProvider>().videocontroller != null)
              VideoViewerWidget(
                  scrollController: ScrollController(),
                  videocontroller:
                      context.read<MediaProvider>().videocontroller),
          ],
        );
      },
    );
  }
}
