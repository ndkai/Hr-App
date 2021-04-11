import 'dart:async';
import 'dart:collection';
import 'dart:core';

import 'package:fai_kul/core/utils/permission_helper.dart';
import 'package:fai_kul/main/nar_drawer/home_page.dart';
import 'package:fai_kul/main/nar_drawer/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


//Maps
Set<Marker> _markers = HashSet<Marker>();
Set<Polygon> _polygons = HashSet<Polygon>();
Set<Circle> _circles = HashSet<Circle>();
List<LatLng> _polygonLatngs = List<LatLng>();
double radius = 10.0;
//ids
int _polygonIdCounter = 1;
int _circleCounter = 1;
int _markerIdCounter = 1;
// Type Controller
bool _isMarker = false;
bool _isPolygon = true;
bool _isCircle = false;

class LocationPage extends StatefulWidget {
  static const String routeName = '/locationpage';
  @override
  State<LocationPage> createState() => LocationPageState();
}

class LocationPageState extends State<LocationPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(10.756120, 106.693049),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
    // bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      // tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    checkLocationpermission();
    return new Scaffold(
      appBar: AppBar(
        title: Text("Location Tracking"),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage(key: textGlobalKey)),
            );
          },
        ),
      ),
      drawer: NavigationDrawer(),
      body:Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            markers: _markers,
            circles: _circles,
            polygons: _polygons,
            myLocationEnabled: true,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            onTap: (point){
              if(_isPolygon){
                setState(() {
                  _polygonLatngs.add(point);
                  _setPolygon();
                });
              } else if(_isMarker) {
                setState(() {
                  // _markers.clear();
                  _setMarkers(point);
                });
              } else if(_isCircle){
                setState(() {
                  _circles.clear();
                  _setCircle(point);
                });
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: <Widget>[
                RaisedButton(
                    color: Colors.black54,
                    onPressed: () {
                      _isPolygon = true;
                      _isMarker = false;
                      _isCircle = false;
                    },
                    child: Text(
                      'Polygon',
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                    )),
                RaisedButton(
                    color: Colors.black54,
                    onPressed: () {
                      _isPolygon = false;
                      _isMarker = true;
                      _isCircle = false;
                    },
                    child: Text('Marker',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
                RaisedButton(
                    color: Colors.black54,
                    onPressed: () {
                      _isPolygon = false;
                      _isMarker = false;
                      _isCircle = true;
                      radius = 50;
                      // return showDialog(
                      //     context: context,
                      //     child: AlertDialog(
                      //       backgroundColor: Colors.grey[900],
                      //       title: Text(
                      //         'Choose the radius (m)',
                      //         style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                      //       ),
                      //       content: Padding(
                      //           padding: EdgeInsets.all(8),
                      //           child: Material(
                      //             color: Colors.black,
                      //             child: TextField(
                      //               style: TextStyle(fontSize: 16, color: Colors.white),
                      //               decoration: InputDecoration(
                      //                 icon: Icon(Icons.zoom_out_map),
                      //                 hintText: 'Ex: 100',
                      //                 suffixText: 'meters',
                      //               ),
                      //               keyboardType:
                      //               TextInputType.numberWithOptions(),
                      //               onChanged: (input) {
                      //                 setState(() {
                      //                   radius = double.parse(input);
                      //                 });
                      //               },
                      //             ),
                      //           )),
                      //       actions: <Widget>[
                      //         FlatButton(
                      //             onPressed: () => Navigator.pop(context),
                      //             child: Text(
                      //               'Ok',
                      //               style: TextStyle(
                      //                 fontWeight: FontWeight.bold,),
                      //             )),
                      //       ],
                      //     ));
                    },
                    child: Text('Circle',
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)))
              ],
            ),
          )
        ],
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void _setMarkers(LatLng point) {
    final String markerIdVal = "marker id $_markerIdCounter";
    _markerIdCounter++;
    setState(() {
      print(
          'Marker| Latitude: ${point.latitude} Longtitude: ${point.longitude}');
      _markers.add(
        Marker(markerId: MarkerId(markerIdVal), position: point),
      );
    });
  }

  void _setCircle(LatLng point) {
    final String circleIdVal = 'circle_id$_circleCounter';
    _circleCounter++;
    print(
        'Circle| latitude: ${point.latitude} longtitude${point.longitude} radius $radius');
    _circles.add(Circle(
      circleId: CircleId(circleIdVal),
      center: point,
      radius: radius,
      fillColor: Colors.yellowAccent,
      strokeWidth: 3,
    ));
  }

  void _setPolygon(){
    final String polygonIdVal = 'polygon_id$_polygonIdCounter';
    // _polygonIdCounter++;
    _polygons.add(Polygon(
      polygonId: PolygonId(polygonIdVal),
      points: _polygonLatngs,
      strokeColor: Colors.yellowAccent,
      strokeWidth: 3,
      fillColor: Colors.yellowAccent.withOpacity(0.15),
    ));
  }
}
