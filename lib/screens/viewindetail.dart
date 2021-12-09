import 'package:flutter/material.dart';
import 'package:greatplaces/Providers/greate_places.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class DetailDart extends StatefulWidget {
  final image;

  DetailDart(this.image);

  @override
  _DetailDartState createState() => _DetailDartState();
}

class _DetailDartState extends State<DetailDart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
      ),
      body: Column(
        children: [
          Container(
            width: 1000,
            height: 100,
            // decoration: BoxDecoration(
            //     image: DecorationImage(image: FileImage(File(widget.image)))),
            child: Image(image: FileImage(File(widget.image))),
          ),
          // CircleAvatar(
          //   backgroundImage: FileImage(File(widget.image)),
          // )
        ],
      ),
    );
  }
}
