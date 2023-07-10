import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  String locationMessage = 'Current location of the user';
  late String lat;
  late String long;
  //getting current location
  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('location service are disable');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('location permission are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'location permission are permanently denied, we cannot request');
    }

    return await Geolocator.getCurrentPosition();
  }

  //listen location
  void _liveLocation() {
    LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat = position.latitude.toString();
      long = position.longitude.toString();

      setState(() {
        locationMessage = 'latitude = $lat , longitude = $long';
      });
    });
  }

  //open current location in google maps
  Future<void> _openMap(String lat, String long) async {
    String googleURL =
        'https://www.google.com/maps/search/?api=1&quey=$lat,$long';
    await canLaunchUrl(Uri.parse(googleURL))
        ? await launchUrl(Uri.parse(googleURL))
        : throw 'could not launch $googleURL';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter user location'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              locationMessage,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _getCurrentLocation().then((value) {
                  lat = '${value.latitude}';
                  long = '${value.longitude}';
                  setState(() {
                    locationMessage = 'latitude = $lat , longitude = $long';
                  });
                  _liveLocation();
                });
              },
              child: Text('get current location'),
            ),
            //=======
            ElevatedButton(
              onPressed: () {
                _openMap(lat, long);
              },
              child: Text('Open Google Maps'),
            ),
          ],
        ),
      ),
    );
  }
}
