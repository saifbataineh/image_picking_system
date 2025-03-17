import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:image_picking_system/features/image_picking/widgets/video_viewer_widget.dart';
import 'package:provider/provider.dart';

class MultipleVideosSelectViewWidget extends StatelessWidget {
  const MultipleVideosSelectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
    
      builder: (context, provider,child) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
               provider.addingMultipleVideos();
               
              },
              child: const Text("pick multiple videos"),
            ),
            if (provider.videocontrollers.isNotEmpty)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: provider.videocontrollers.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return VideoViewerWidget(
                        videocontroller: provider.videocontrollers[index]);
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}