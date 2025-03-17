import 'dart:io';

import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picking_system/features/image_picking/controllers/providers/media_provider.dart';
import 'package:image_picking_system/features/image_picking/widgets/multiple_images_and_videos_views_weidget.dart';
import 'package:image_picking_system/features/image_picking/widgets/multiple_images_select_view_widget.dart';
import 'package:image_picking_system/features/image_picking/widgets/multiple_videos_select_view_widget.dart';
import 'package:image_picking_system/features/image_picking/widgets/single_image_select_view_widget.dart';
import 'package:image_picking_system/features/image_picking/widgets/single_video_select_view_widget.dart';
import 'package:image_picking_system/features/image_picking/widgets/video_viewer_widget.dart';
import 'package:provider/provider.dart';

class FilePickingPage extends StatelessWidget {
  const FilePickingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: SingleChildScrollView(
        child: ChangeNotifierProvider(
          create: (context) => MediaProvider(),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleImageSelectViewWidget(),
              MultipleImagesSelectViewWidget(),
              SingleVideoSelectViewWidget(),
              MultipleVideosSelectViewWidget(),
              MultipleImagesAndVideosViewsWeidget(),
            ],
          ),
        ),
      ),
    );
  }
}
