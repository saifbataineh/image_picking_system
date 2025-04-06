import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/core/services/picking_files_service.dart';

class MediaProvider extends ChangeNotifier {
  bool nullFiles = false;
   FilePickerResult? multipleVideosResult;
  FilePickerResult? multipleImageAndVideoResult;
  List<CachedVideoPlayerPlusController?> videosInImageAndVideoscontrollers = [];
List<File?> mulitpleImageInIamgeAndVideosFiles = [];
  List<File?> mulitpleImageFiles = [];
  File? singleImageFile;

  List<CachedVideoPlayerPlusController?> videocontrollers = [];
  bool isMuted=false;
  CachedVideoPlayerPlusController? videocontroller;

  void addingMultipleImages() async {
    FilePickerResult? multipleImagesResult =
        await PickingFilesService.addingMultipleImages();
    if (multipleImagesResult == null) {
      nullFiles = true;
    } else {
      for (var image in multipleImagesResult.files) {
        mulitpleImageFiles = [...mulitpleImageFiles, File(image.path ?? '')];
      }
    }
    notifyListeners();
  }

  void addingMultipleVideos() async {
     multipleVideosResult =
        await PickingFilesService.addingMultipleVideos();
    if (multipleVideosResult != null) {
      for (var singleVideo in multipleVideosResult!.files) {
          final controller =
              CachedVideoPlayerPlusController.file(File(singleVideo.path!));
            
          videocontrollers = [...videocontrollers, controller];
        }
    } else {
      nullFiles = true;
    }
    notifyListeners();
  }
  CachedVideoPlayerPlusController getVideoController(int index,){
 final controller =
              CachedVideoPlayerPlusController.file(File(multipleVideosResult!.files[index].path!));
              return controller;
  }

  void addingSingleVideo() async {
    FilePickerResult? singleVideoResult =
        await PickingFilesService.addingSingleVideo();
    if (singleVideoResult != null) {
      File? singleVideoFile = File(singleVideoResult.files.single.path!);
      videocontroller = CachedVideoPlayerPlusController.file(singleVideoFile);
    } else {
      nullFiles = true;
    }
    notifyListeners();
  }

  void addingSingleImage() async {
    FilePickerResult? singleImageResult =
        await PickingFilesService.addingSingleImage();
    if (singleImageResult != null) {
      singleImageFile = File(singleImageResult.files.single.path!);
    } else {
      nullFiles = true;
    }
    notifyListeners();
  }

  void addingMultipleImagesAndVideos() async {
    multipleImageAndVideoResult =
        await PickingFilesService.addingMultipleImagesAndVideos();
    if (multipleImageAndVideoResult != null) {
      multipleImageAndVideoResult!.files.forEach((element) {
        if (element.path!.endsWith("mp4")) {
          print(element.path!);
          final controller =
              CachedVideoPlayerPlusController.file(File(element.path ?? ''));
          videosInImageAndVideoscontrollers = [
            ...videosInImageAndVideoscontrollers,
            controller
          ];
        } else {
          mulitpleImageInIamgeAndVideosFiles = [...mulitpleImageInIamgeAndVideosFiles, File(element.path ?? '')];
        }
      });
    } else {
      nullFiles = true;
    }
    notifyListeners();
  }
}
