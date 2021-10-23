import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../colorsandfontsandwidgets.dart';

class MAppage extends StatefulWidget {
  const MAppage({Key? key}) : super(key: key);

  @override
  _MAppageState createState() => _MAppageState();
}

class _MAppageState extends State<MAppage> {
  @override
  Widget build(BuildContext context) {
    CameraPosition cameraPosition =
        CameraPosition(target: LatLng(10.1129646, 76.2573471), zoom: 13);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: cameraPosition,
          ),
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
