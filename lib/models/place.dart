import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

class PlaceLocation {
  final double latitude;
  final double longtude;
  final String address;
  PlaceLocation(
      {required this.address, required this.latitude, required this.longtude});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final XFile? image;

  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
