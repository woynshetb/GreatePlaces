// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../models/place.dart';
import '../Helpers/db_helper.dart';

// change notifier is a mixin that  allows you to call notifyListeners that is used by provider package to update places
class GreatePlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(
    String pickedTitle,
    XFile? pickedImage,
  ) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location:
          PlaceLocation(address: "address", latitude: 1221, longtude: 1221),
    );
    _items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image!.path,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            title: item['title'],
            image: XFile(item['image']),
            location:
                PlaceLocation(address: "", latitude: 1221, longtude: 1221),
          ),
        )
        .toList();
    notifyListeners();
  }

  Future<void> placesss() async {
    final maps = await DBHelper.getData('user_places');

    _items = List.generate(maps.length, (i) {
      return Place(
        id: maps[i]['id'],
        title: maps[i]['title'],
        image: XFile(maps[i]['image']),
        location: PlaceLocation(address: "", latitude: 1221, longtude: 1221),
      );
    });

    notifyListeners();
  }
}
