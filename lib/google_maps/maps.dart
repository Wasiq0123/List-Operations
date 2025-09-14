import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FluttterMpsScreen extends StatelessWidget {
  FluttterMpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ///=======we are Adding marker on the mapp-----------////
    final List<Map<String, dynamic>> maps = [
      {
        'point': LatLng(51.509364, -0.128928),
        'name': "London city",
        'color': Colors.red
      },
      {
        'point': LatLng(51.5130, -0.1012),
        'name': "London Tower",
        'color': Colors.red
      },
    ];
    //----------This List is used for adding polyline in our map ------
    final List<LatLng> points = [
      LatLng(51.509364, -0.128928), // Start: London Bridge
      LatLng(51.5130, -0.1012), // Middle: Tower of London
      LatLng(51.4995, -0.1245), // End: Big Ben
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FlutterMap(
                options: MapOptions(
                    initialCenter: LatLng(51.509364, -0.128928),
                    initialZoom: 13.0),
                children: [
                  //---Tile layer is used for showing tha map ------
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),

                  /////////////-----------STep 3 : Adding Polyline on the map -----------////////////////////
                  //----Polyline is used for showing the route between two location ----
                  PolylineLayer(polylines: [
                    Polyline(
                      points: points,
                      strokeWidth: 4.0,
                      color: Colors.blue,
                    )
                  ]),
                  /////////////-----------STep 2 : Adding Marker on the map -----------////////////////////
                  //Addin the marker yin our map,First of All we need to list of marker in our map
                  //---List we define color ,point and location name -----
                  //So we drfeine the marker layer
                  MarkerLayer(markers: [
                    for (int i = 0; i < points.length; i++)
                      Marker(
                        width: 40.0,
                        height: 40.0,
                        point: points[i],
                        child: Icon(Icons.location_on,
                            color: i == 0 ? Colors.green : Colors.red,
                            size: 40),
                      )
                  ]),
                ]),
          )
        ],
      ),
    );
  }
}
