import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/widgets/video_viewer_widget.dart';

class SingleVideoSelectViewWidget extends StatefulWidget {
  const SingleVideoSelectViewWidget({super.key});

  @override
  State<SingleVideoSelectViewWidget> createState() =>
      _SingleVideoSelectViewWidgetState();
}

class _SingleVideoSelectViewWidgetState
    extends State<SingleVideoSelectViewWidget> {
  FilePickerResult? singleVideoResult;
  CachedVideoPlayerPlusController? videocontroller;

  @override
  void dispose() {
   videocontroller?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            singleVideoResult = await FilePicker.platform.pickFiles(
              type: FileType.video,
            );
            if (singleVideoResult != null) {
              videocontroller = CachedVideoPlayerPlusController.file(
                  File(singleVideoResult!.files.single.path!))
                ..initialize().then((value) {
                  videocontroller!.play();
                  setState(() {});
                });
              setState(() {});
            } else {
              // User canceled the picker
            }
          },
          child: const Text("pickVideo"),
        ),
        if (videocontroller != null)
          VideoViewerWidget(videocontroller: videocontroller),
      ],
    );
  }
}
