import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:provider/provider.dart';

class SingleImageSelectViewWidget extends StatelessWidget {
  const SingleImageSelectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                provider.addingSingleImage();
              },
              child: const Text("pickImage"),
            ),
            if (provider.singleImageResult != null)
              SizedBox(
                height: 200,
                child: Image.file(
                  File(provider.singleImageResult!.files.single.path!),
                ),
              ),
          ],
        );
      },
    );
  }
}
