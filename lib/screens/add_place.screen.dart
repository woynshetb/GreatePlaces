// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = "/add-place";
  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
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
                  ImageInput(),
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
              onPressed: () {},
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
