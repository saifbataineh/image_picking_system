import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class SingleImageSelectViewWidget extends StatefulWidget {
  const SingleImageSelectViewWidget({super.key});

  @override
  State<SingleImageSelectViewWidget> createState() =>
      _SingleImageSelectViewWidgetState();
}

class _SingleImageSelectViewWidgetState
    extends State<SingleImageSelectViewWidget> {
  FilePickerResult? singleImageResult;
 

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () async {
            singleImageResult =
                await FilePicker.platform.pickFiles(type: FileType.image);
            if (singleImageResult != null) {
              setState(() {});
            } else {
              // User canceled the picker
            }
          },
          child: const Text("pickImage"),
        ),
        if (singleImageResult != null)
          SizedBox(
            height: 200,
            child: Image.file(
              File(singleImageResult!.files.single.path!),
            ),
          ),
      ],
    );
  }
}
