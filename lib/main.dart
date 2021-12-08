import 'package:flutter/material.dart';
import 'package:greatplaces/screens/places_list.dart';

import 'Providers/greate_places.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: GreatePlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme:
            ThemeData(primarySwatch: Colors.brown, accentColor: Colors.orange),
        home: PlacesListScreen(),
      ),
    );
  }
}
