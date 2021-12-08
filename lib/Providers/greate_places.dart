// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import '../models/place.dart';

// change notifier is a mixin that  allows you to call notifyListeners that is used by provider package to update places
class GreatePlaces with ChangeNotifier {
  // to store
  List<Place> _items = [];

  //  a getter to displace
  List<Place> get items {
    return [..._items];
  }

  addPlace(String pickedTitle, XFile? pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: pickedTitle,
      location: PlaceLocation(address: "null", latitude: 1221, longtude: 1221),
    );
    _items.add(newPlace);
    notifyListeners();
  }
}
