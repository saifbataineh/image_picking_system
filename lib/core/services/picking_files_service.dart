import 'package:file_picker/file_picker.dart';

class PickingFilesService {
 static Future<FilePickerResult?>  addingMultipleImagesAndVideos()async {
   FilePickerResult? pickedImagesAndVideos= await FilePicker.platform.pickFiles(
              type: FileType.media,
              allowMultiple: true,
            );
            return pickedImagesAndVideos;
  }
 static Future<FilePickerResult?>  addingMultipleImages()async {
   FilePickerResult? pickedImages= await FilePicker.platform.pickFiles(
              type: FileType.image,
              allowMultiple: true,
            );
            return pickedImages;
  }
 static Future<FilePickerResult?>  addingMultipleVideos()async {
   FilePickerResult? pickedImagesAndVideos= await FilePicker.platform.pickFiles(
              type: FileType.video,
              allowMultiple: true,
            );
            return pickedImagesAndVideos;
  }
 static Future<FilePickerResult?>  addingSingleImage()async {
   FilePickerResult? pickedImageResult= await FilePicker.platform.pickFiles(
              type: FileType.image,
            );
            return pickedImageResult;
  }
 static Future<FilePickerResult?>  addingSingleVideo()async {
   FilePickerResult? pickedVideoResult= await FilePicker.platform.pickFiles(
              type: FileType.video,
            );
            return pickedVideoResult;
  }
}