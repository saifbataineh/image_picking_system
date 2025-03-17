import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:provider/provider.dart';

class SingleImageSelectViewWidget extends StatelessWidget {
  const SingleImageSelectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<MediaProvider,File?>(
      selector: (p0, p1) {
        return p1.singleImageFile;
      },
      builder: (context, selector, child) {
      
        
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                context.read<MediaProvider>().addingSingleImage();
                
              },
              child: const Text("pickImage"),
            ),
            if (context.read<MediaProvider>().singleImageFile!=null)
              SizedBox(
                height: 200,
                child: Image.file(
                  context.read<MediaProvider>().singleImageFile!,
                ),
              ),
          ],
        );
      },
    );
  }
}
