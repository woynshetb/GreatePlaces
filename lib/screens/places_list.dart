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
                  builder: (context, greatplace, child) => greatplace
                              .items.length <=
                          0
                      ? Center(
                          child: Text("Got no places yet start adding some "),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 3 / 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20),
                          itemCount: greatplace.items.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              //  image detail
                              onTap: () {
                                print("hello");
                              },
                              child: Card(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                elevation: 8,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CircleAvatar(
                                      radius: 30,
                                      // backgroundImage: FileImage(File(_imageFileList!.path)),
                                      // backgroundImage: FileImage(File(greatplace.items[index].image.path)),
                                      backgroundImage: FileImage(File(
                                          greatplace.items[index].image!.path)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      greatplace.items[index].title,
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      greatplace.items[index].location.address,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                ),
        ));
  }
}
