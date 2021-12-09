// ignore_for_file: prefer_const_constructors, prefer_is_empty

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:greatplaces/Providers/greate_places.dart';
import 'package:greatplaces/screens/add_place.screen.dart';
import 'package:provider/provider.dart';

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
        body: FutureBuilder(
          future: Provider.of<GreatePlaces>(context, listen: false).placesss(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Consumer<GreatePlaces>(
                  builder: (context, greatplace, child) =>
                      greatplace.items.length <= 0
                          ? Center(
                              child:
                                  Text("Got no places yet start adding some "),
                            )
                          : ListView.builder(
                              itemCount: greatplace.items.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: () {},
                                    title: Text(greatplace.items[index].title),
                                    leading: CircleAvatar(
                                      // backgroundImage: FileImage(File(_imageFileList!.path)),
                                      // backgroundImage: FileImage(File(greatplace.items[index].image.path)),
                                      backgroundImage: FileImage(File(
                                          greatplace.items[index].image!.path)),
                                    ));
                              },
                            ),
                ),
        ));
  }
}
