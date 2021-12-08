import 'dart:io';

import 'package:flutter/foundation.dart';

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
  final File image;

  Place(
      {required this.id,
      required this.title,
      required this.location,
      required this.image});
}
