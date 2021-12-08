// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_field

import 'package:flutter/material.dart';
import 'package:greatplaces/Providers/greate_places.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/image_input.dart';
import 'dart:io';

import 'package:provider/provider.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place";
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();

  XFile? _pickedimage;
  void _selectImg(XFile pickedimage) {
    _pickedimage = pickedimage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedimage == null) {
      return;
    }
    Provider.of<GreatePlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedimage!);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add a New Place"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  TextField(
                    controller: _titleController,
                    decoration: InputDecoration(label: Text("Title")),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ImageInput(_selectImg),
                  FlatButton(
                    onPressed: () {},
                    child: Text("addimage"),
                  )
                ],
              ),
            ),
          )),
          RaisedButton.icon(
              color: Theme.of(context).primaryColor,
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text(
                "Add Places",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
