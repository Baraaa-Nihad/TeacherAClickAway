import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  XFile? image_file;
  ImagePicker _imagePicker = ImagePicker();
  File? profileImage;
  File? certificateImage;
  File? IdImage;
  File? unCrimeImage;

  Future<void> getImageFromGallaryYours() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.gallery);
    IdImage= File(image_file!.path);
    update();
  }
  Future<void> getImageFromGallaryCertificate() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.gallery);
    certificateImage= File(image_file!.path);
    update();
  }
  Future<void> getImageFromGallaryId() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.gallery);
    profileImage= File(image_file!.path);
    update();
  }

  Future<void> getImageFromGallary() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.gallery);
    unCrimeImage= File(image_file!.path);
    update();
  }



  Future<void> getImageFromCamera() async {
    image_file = await _imagePicker.pickImage(source: ImageSource.camera);
    unCrimeImage= File(image_file!.path);
    update();
  }


}
