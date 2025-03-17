import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/core/services/picking_files_service.dart';

class MediaProvider extends ChangeNotifier {
  FilePickerResult? multipleImageAndVideoResult;
  FilePickerResult? multipleImagesResult;
  FilePickerResult? multipleVideosResult;
  FilePickerResult? singleImageResult;
  FilePickerResult? singleVideoResult;

  List<CachedVideoPlayerPlusController?> videocontrollers = [];
  CachedVideoPlayerPlusController? videocontroller;
  void addingMultipleImagesAndVideos() async {
    multipleImageAndVideoResult =
        await PickingFilesService.addingMultipleImagesAndVideos();
    if (multipleImageAndVideoResult != null) {
      print('object3${multipleImageAndVideoResult!.files}');

      notifyListeners();
    } else {
      print(" user didn't pick anything");
      // User canceled the picker
    }
  }

  void addingMultipleImages() async {
    multipleImagesResult = await PickingFilesService.addingMultipleImages();
    if (multipleImagesResult != null) {
      notifyListeners();
    } else {
      print(" user didn't pick anything");
    }
  }

  void addingMultipleVideos() async {
    multipleVideosResult = await PickingFilesService.addingMultipleVideos();
    if (multipleVideosResult != null) {
      multipleVideosResult!.files.forEach(
        (element) {
          final controller =
              CachedVideoPlayerPlusController.file(File(element.path!))
                ..initialize();

          videocontrollers.add(controller);
        },
      );

      notifyListeners();
    } else {
      print(" user didn't pick anything");
    }
  }

  void addingSingleVideo() async {
    singleVideoResult = await PickingFilesService.addingSingleVideo();
    if (singleVideoResult != null) {
      videocontroller = CachedVideoPlayerPlusController.file(
          File(singleVideoResult!.files.single.path!))
        ..initialize().then((value) {
          videocontroller!.play();
        });
      notifyListeners();
    } else {
      // User canceled the picker
    }
  }

  void addingSingleImage() async {
    singleImageResult = await PickingFilesService.addingSingleImage();
    if (singleImageResult != null) {
      notifyListeners();
    } else {
      print(" user didn't pick anything");
    }
  }
}
