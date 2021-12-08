// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:greatplaces/screens/add_place.screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Check in palces"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPlaceScreen.routeName);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
