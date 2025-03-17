import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MultipleImagesAndVideosViewsWeidget extends StatefulWidget {
  const MultipleImagesAndVideosViewsWeidget({super.key});

  @override
  State<MultipleImagesAndVideosViewsWeidget> createState() =>
      _MultipleImagesAndVideosViewsWeidgetState();
}

class _MultipleImagesAndVideosViewsWeidgetState
    extends State<MultipleImagesAndVideosViewsWeidget> {
  FilePickerResult? multipleImageAndVideoResult;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            multipleImageAndVideoResult = await FilePicker.platform.pickFiles(
              type: FileType.media,
              allowMultiple: true,
            );
            if (multipleImageAndVideoResult != null) {
              print(multipleImageAndVideoResult!.files);
              setState(() {});
            } else {
              // User canceled the picker
            }
          },
          child: const Text("pick videos and photos"),
        ),
      ],
    );
  }
}
