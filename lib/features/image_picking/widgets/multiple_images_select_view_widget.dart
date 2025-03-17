import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MultipleImagesSelectViewWidget extends StatefulWidget {
  const MultipleImagesSelectViewWidget({super.key});

  @override
  State<MultipleImagesSelectViewWidget> createState() =>
      _MultipleImagesSelectViewWidgetState();
}

class _MultipleImagesSelectViewWidgetState
    extends State<MultipleImagesSelectViewWidget> {
  FilePickerResult? multipleImageResult;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          ElevatedButton(
            onPressed: () async {
              multipleImageResult = await FilePicker.platform
                  .pickFiles(type: FileType.image, allowMultiple: true);
              if (multipleImageResult != null) {
                setState(() {});
              } else {
                // User canceled the picker
              }
            },
            child: const Text("pick multiple photos"),
          ),
        if (multipleImageResult != null)
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: multipleImageResult!.files.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
              height: 200,
              width: 200,
              child: Image.file(
                File(multipleImageResult!.files[index].path!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
