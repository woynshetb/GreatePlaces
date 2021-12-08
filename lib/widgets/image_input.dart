// ignore_for_file: unused_field, prefer_const_constructors, unused_local_variable, avoid_print, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;

class ImageInput extends StatefulWidget {
  const ImageInput({Key? key}) : super(key: key);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? storedImage;
  String? phonePath;

  XFile? _imageFileList;
  _imageFile(XFile value) async {
    _imageFileList = value == null ? null : value;
    // get correct path
    final appDir = syspath.getApplicationDocumentsDirectory();
    print("hello ************");

    final directory = await syspath.getApplicationDocumentsDirectory();
    print("this");
    print(directory);
    print("this again");
    path.basename(_imageFileList!.path);
    //_imageFileList.copy(appDir.path);

    var imagepath = _imageFileList!.path;
    final file = File('$directory/$imagepath');
    file.writeAsString;

    setState(() {
      phonePath = appDir.toString();
    });
  }

  Future<void> _takePicture() async {
    final imagePicker = ImagePicker();
    final image =
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    setState(() {
      _imageFile(image!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 150,
        height: 100,
        decoration:
            BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        child: _imageFileList == null
            ? Text(
                "no image is taken",
                textAlign: TextAlign.center,
              )
            : CircleAvatar(
                backgroundImage: FileImage(File(_imageFileList!.path)),
              ),
      ),
      // ignore: prefer_const_constructors
      SizedBox(
        width: 10,
      ),
      Expanded(
          child: ElevatedButton.icon(
              onPressed: () async {
                await _takePicture();
              },
              icon: Icon(Icons.camera),
              label: Text("Take a Picture")))
    ]);
  }
}
