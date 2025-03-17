import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/core/services/picking_files_service.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:provider/provider.dart';

class MultipleImagesAndVideosViewsWeidget extends StatelessWidget {
  const MultipleImagesAndVideosViewsWeidget({super.key});

 @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                provider.addingMultipleImagesAndVideos();
              },
              child: const Text("pick videos and photos"),
            ),
          ],
        );
      },
    );
  }
}
