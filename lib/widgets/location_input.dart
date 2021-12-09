// ignore_for_file: unused_field

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:greatplaces/Helpers/location_helper.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectPlace;
  LocationInput(this.onSelectPlace);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  String? shortPlace;
  double? latitude;
  double? longtude;

  Future<void> _getCurrentUserLocation() async {
    // final locData = await Location().getLocation();
    // final staticMapImageUrl = LocationHelper.generateLocationPreviewImage(
    //     latitude: locData.latitude, longitude: locData.longitude);

    // setState(() {
    //   _previewImageUrl = staticMapImageUrl;
    // });
  }

  Future<void> _getLocationWithGeoLocator() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    LocationPermission permission = await Geolocator.checkPermission();

    // if (!serviceEnabled) {
    //   print("location services are disabled");
    // } else if (permission == LocationPermission.denied) {
    //   print("permission is denied");
    // }
    final localData = await Geolocator.getCurrentPosition();
    List<Placemark> placemarks =
        await placemarkFromCoordinates(localData.latitude, localData.longitude);
    Placemark placemark = placemarks[0];

    String completeAddress =
        '${placemark.subThoroughfare} ,${placemark.thoroughfare} ,${placemark.subLocality} ,${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea}, ${placemark.postalCode} , ${placemark.country}';
    print(completeAddress);
    String formattedAdd =
        '${placemark.thoroughfare} ,${placemark.subLocality} ,${placemark.locality}, ${placemark.country}';

    setState(() {
      _previewImageUrl = completeAddress;
      shortPlace = formattedAdd;
      latitude = localData.latitude;
      longtude = localData.longitude;
    });
    widget.onSelectPlace(latitude, longtude, shortPlace);
  }

  getUserLocation() async {
    Position location = await GeolocatorPlatform.instance.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            alignment: Alignment.center,
            height: 170,
            width: double.infinity,
            child: _previewImageUrl == null
                ? Text("No Location Chosen")
                : Text(shortPlace.toString())),
        Row(
          children: [
            TextButton.icon(
                onPressed: _getLocationWithGeoLocator,
                icon: Icon(Icons.location_on),
                label: Text("Current location")),
            TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.location_on),
                label: Text("Select on Map")),
          ],
        )
      ],
    );
  }
}
