import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  XFile? image_file;
  ImagePicker _imagePicker = ImagePicker();
  var urlId;
  var urlYours;
  var url;

  Future<void> getImageFromGallaryYours() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.gallery);
    urlYours= File(image_file!.path);
    update();
  }
  Future<void> getImageFromGallaryId() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.gallery);
    urlId= File(image_file!.path);
    update();
  }

  Future<void> getImageFromGallary() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.gallery);
     url= File(image_file!.path);
    update();
  }

  Future<void> getImageFromCamera() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.camera);
     url= File(image_file!.path);
    update();
  }


}
