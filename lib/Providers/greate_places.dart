// ignore_for_file: prefer_final_fields, unused_field

import 'package:flutter/foundation.dart';
import '../models/place.dart';

// change notifier is a mixin that  allows you to call notifyListeners that is used by provider package to update places
class GreatePlaces with ChangeNotifier {
  // to store
  List<Place> _items = [];

  //  a getter to displace
  List<Place> get items {
    return [..._items];
  }
}
