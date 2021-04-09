import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class MediaService {
  final ImagePicker _picker = ImagePicker();

  Future<File> getImage({bool fromGallery}) async {
    final _image = await _picker.getImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
    );
    return File(_image.path);
  }
}
