import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Images_screen extends StatefulWidget {
  const Images_screen({Key? key}) : super(key: key);

  @override
  State<Images_screen> createState() => _Images_screenState();
}

class _Images_screenState extends State<Images_screen> {
  XFile? image_file;
  ImagePicker _imagePicker = ImagePicker();
  var url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IconButton(
            onPressed: ()async {
             _imagePicker.pickImage(
                  source: ImageSource.camera);
            //  url = File(image_file!.path);
               },
            icon: Icon(Icons.upload)),
      ),
    );
  }
}
