// ignore_for_file: unused_field, prefer_const_constructors, unused_local_variable, avoid_print, unnecessary_null_comparison, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path_provider/path_provider.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImg;

  ImageInput(this.onSelectImg);

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
    // got local path
    final directory = await getApplicationDocumentsDirectory();
    print("this");
    print(directory.path);
    print(directory);
    print("this again");
    final filename = path.basename(_imageFileList!.path);
    //_imageFileList.copy(appDir.path);
    var devicepath = directory.path;
    var imagepath = _imageFileList!.path;

    print(filename);
    // got local file
    final file = File('$devicepath/$filename');
    print(file);
    final savedImage = file.writeAsString;
    widget.onSelectImg(_imageFileList);
    print(savedImage);

    setState(() {
      phonePath = appDir.toString();
    });
  }
  // differentiate how to save

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
