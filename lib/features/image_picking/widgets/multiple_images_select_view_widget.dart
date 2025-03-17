import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:provider/provider.dart';

class MultipleImagesSelectViewWidget extends StatelessWidget {
  const MultipleImagesSelectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MediaProvider>(
    
      builder: (context, provider,child){
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                provider.addingMultipleImages();
               
               
              },
              child: const Text("pick multiple photos"),
            ),
            if (provider.multipleImagesResult != null)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: provider.multipleImagesResult!.files.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.file(
                      File(provider.multipleImagesResult!.files[index].path!),
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