import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/core/services/picking_files_service.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:image_picking_system/features/image_picking/views/widgets/video_viewer_widget.dart';
import 'package:provider/provider.dart';

class MultipleImagesAndVideosViewsWeidget extends StatelessWidget {
  const MultipleImagesAndVideosViewsWeidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<MediaProvider, dynamic>(
      selector: (_, selector) {
        return (selector.multipleImageAndVideoResult);
      },
      builder: (context, provider, child) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                context.read<MediaProvider>().addingMultipleImagesAndVideos();
              },
              child: const Text("pick videos and photos"),
            ),
            Text("videos"),
            if (context
                .read<MediaProvider>()
                .videosInImageAndVideoscontrollers!
                .isNotEmpty)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: context
                      .read<MediaProvider>()
                      .videosInImageAndVideoscontrollers!
                      .length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return VideoViewerWidget(
                      scrollController: ScrollController(),
                        videocontroller: context
                            .read<MediaProvider>()
                            .videosInImageAndVideoscontrollers![index]);
                  },
                ),
              ),
            Text("images"),
            if (context
                .read<MediaProvider>()
                .mulitpleImageInIamgeAndVideosFiles
                .isNotEmpty)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: context
                      .read<MediaProvider>()
                      .mulitpleImageInIamgeAndVideosFiles
                      .length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.file(
                      context
                          .read<MediaProvider>()
                          .mulitpleImageInIamgeAndVideosFiles![index]!,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
