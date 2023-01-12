import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../Theme/app_colors.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {

  final ImagePicker imgPicker = ImagePicker();
  List<XFile>? imageFiles;
  openImages() async {
    try {
      var pickedFiles = await imgPicker.pickMultiImage();
      //you can use ImageCourse.camera for Camera capture
      if (pickedFiles != null) {
        imageFiles = pickedFiles;
        setState(() {
        });
      } else {
        print("No image is selected.");
      }
    } catch (e) {
      print("error while picking file.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (imageFiles != null)
          Wrap(
            children: imageFiles!.map((imageOne) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: Container(
                    height: 94,
                    width: 103,
                    color: Colors.grey[300],
                    child: Image.file(
                      File(imageOne.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        InkWell(
          onTap: () {
            openImages();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Container(
              height: 94,
              width: 103,
              color: Colors.grey[300],
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      color: Secondary,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Text('Upload')
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
