import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/core/services/picking_files_service.dart';

class MediaProvider extends ChangeNotifier {
  bool noSelected = false;
  FilePickerResult? multipleImageAndVideoResult;

  List<File?> mulitpleImageFile = [];
  File? singleImageFile;

  List<CachedVideoPlayerPlusController?> videocontrollers = [];
  CachedVideoPlayerPlusController? videocontroller;

  void addingMultipleImages() async {
    FilePickerResult? multipleImagesResult =
        await PickingFilesService.addingMultipleImages();
    if (multipleImagesResult == null) {
      noSelected = true;
    }
    multipleImagesResult!.files.forEach((image) {
      mulitpleImageFile.add(File(image.path ?? ''));
    });
    notifyListeners();
  }

  void addingMultipleVideos() async {
    FilePickerResult? multipleVideosResult =
        await PickingFilesService.addingMultipleVideos();
    if (multipleVideosResult != null) {
      multipleVideosResult.files.forEach(
        (singleVideo) {
          final controller =
              CachedVideoPlayerPlusController.file(File(singleVideo.path!));

          videocontrollers.add(controller);
        },
      );
    } else {
      noSelected = true;
    }
    notifyListeners();
  }

  void addingSingleVideo() async {
    FilePickerResult? singleVideoResult =
        await PickingFilesService.addingSingleVideo();
    if (singleVideoResult != null) {
      File? singleVideoFile = File(singleVideoResult.files.single.path!);
      videocontroller = CachedVideoPlayerPlusController.file(singleVideoFile);
    } else {
      noSelected = true;
    }
    notifyListeners();
  }

  void addingSingleImage() async {
    FilePickerResult? singleImageResult =
        await PickingFilesService.addingSingleImage();
    if (singleImageResult != null) {
      singleImageFile = File(singleImageResult.files.single.path!);
    } else {
      noSelected = true;
    }
    notifyListeners();
  }

  void addingMultipleImagesAndVideos() async {
    multipleImageAndVideoResult =
        await PickingFilesService.addingMultipleImagesAndVideos();
    if (multipleImageAndVideoResult != null) {
    } else {
      noSelected = true;
    }
    notifyListeners();
  }
}
