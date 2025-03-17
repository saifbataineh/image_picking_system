import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:provider/provider.dart';

class MultipleImagesSelectViewWidget extends StatelessWidget {
  const MultipleImagesSelectViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<MediaProvider,List<File?>>(
    selector: (p0, p1) {
      return p1.mulitpleImageFile;
    },
      builder: (context, selector,child){
        return Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                context.read<MediaProvider>().addingMultipleImages();
               
               
              },
              child: const Text("pick multiple photos"),
            ),
            if (context.read<MediaProvider>().mulitpleImageFile.isNotEmpty)
              SizedBox(
                height: 200,
                child: ListView.builder(
                  itemCount: context.read<MediaProvider>().mulitpleImageFile.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.file(
                      context.read<MediaProvider>().mulitpleImageFile[index]!,
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