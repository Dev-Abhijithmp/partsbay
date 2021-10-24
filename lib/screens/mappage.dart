import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:partsbay/fetchdata/enablepermission.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/somethingwentwrong.dart';

import '../colorsandfontsandwidgets.dart';

class MAppage extends StatefulWidget {
  const MAppage({Key? key}) : super(key: key);

  @override
  _MAppageState createState() => _MAppageState();
}

class _MAppageState extends State<MAppage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder<Position>(
              future: determinePosition(),
              builder: (context, snapshot) {
                if (snapshot.hasData == true) {
                  CameraPosition cameraPosition = CameraPosition(
                      target: LatLng(
                          snapshot.data!.latitude, snapshot.data!.longitude),
                      zoom: 13);

                  return GoogleMap(
                    initialCameraPosition: cameraPosition,
                    mapType: MapType.normal,
                    mapToolbarEnabled: true,
                    myLocationEnabled: true,
                  );
                } else if (snapshot.hasError == true) {
                  return SOmethingwentwrong();
                } else {
                  return Loadingpage();
                }
              }),
          Positioned(
            left: 20,
            top: 30,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.shade300),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: pink,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
