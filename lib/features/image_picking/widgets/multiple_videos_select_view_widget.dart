import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/widgets/video_viewer_widget.dart';

class MultipleVideosSelectViewWidget extends StatefulWidget {
  const MultipleVideosSelectViewWidget({super.key});

  @override
  State<MultipleVideosSelectViewWidget> createState() =>
      _MultipleVideosSelectViewWidgetState();
}

class _MultipleVideosSelectViewWidgetState
    extends State<MultipleVideosSelectViewWidget> {
  FilePickerResult? multipleVideoResult;

  List<CachedVideoPlayerPlusController?> videocontrollers = [];
  @override
  void dispose() {
    videocontrollers.forEach((videoController) {
      videoController?.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            multipleVideoResult = await FilePicker.platform
                .pickFiles(type: FileType.video, allowMultiple: true);
            if (multipleVideoResult != null) {
              multipleVideoResult!.files.forEach(
                (element) {
                  final controller =
                      CachedVideoPlayerPlusController.file(File(element.path!))
                        ..initialize().then((value) {
                          setState(() {});
                        });

                  videocontrollers.add(controller);
                },
              );
              setState(() {});
            } else {
              // User canceled the picker
            }
          },
          child: const Text("pick multiple videos"),
        ),
        if (videocontrollers.isNotEmpty)
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: multipleVideoResult!.files.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return VideoViewerWidget(
                    videocontroller: videocontrollers[index]);
              },
            ),
          ),
      ],
    );
  }
}
