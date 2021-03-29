import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class MapTracker extends StatefulWidget{
  final String providerAddress;
  LatLng providerLatLng;

  MapTracker({this.providerAddress, this.providerLatLng}) : super();

  @override
  MapTrackerState createState() => MapTrackerState(providerAddress, providerLatLng);
}


class MapTrackerState extends State<MapTracker>{
  String mapProviderAddress; 
  String searchAddress;

  MapTrackerState(String initMapProviderAddress, LatLng initCenter){
    this.mapProviderAddress = initMapProviderAddress;
    _center = initCenter;
  }

  // Completer<GoogleMapController> _controller = Completer();
  GoogleMapController _mapController;
  // static LatLng _center = LatLng(5.4145728, 100.3297271);
  static LatLng _center;
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;


  _onMapCreated(GoogleMapController controller){
    // _controller.complete(controller);
    this._mapController = controller;
  }

  _onCameraMove(CameraPosition position){
    _lastMapPosition = position.target;
  }

  _onMapTypeButtonPressed(){
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  _onAddMarkerButtonPressed(){
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: InfoWindow(
            title: 'This is a title',
            snippet: 'This is a snippet',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }


  Future _getProviderLatLng(providerAddress) async {
    List<Location> locations = await locationFromAddress(providerAddress);
    print('_getProviderLatLng has run');

    _center = LatLng(locations[0].latitude, locations[0].longitude);
  }


  Widget button(Function function, IconData icon){
    return FloatingActionButton(
      onPressed:  function,
      materialTapTargetSize:  MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: Icon(
        icon,
        size:36.0,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
            children: <Widget> [

              GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition:  CameraPosition(
                  target: _center,
                  zoom: 15.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove:  _onCameraMove,
                zoomControlsEnabled: false,
              ),

              Positioned(
                top: 30.0,
                right: 15.0,
                left: 15.0,
                child: Container(
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    decoration:  InputDecoration(
                        hintText: 'Enter Address',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left:15.0),
                      suffixIcon: IconButton(
                        onPressed: (){
                        },
                        icon: Icon(Icons.search),
                        iconSize: 30.0,
                      ),
                    ),
                    onChanged: (val) {
                      setState((){
                        this.searchAddress = val;
                      });
                    },
                  ),
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                ),
              ),


              Padding(
                  padding: EdgeInsets.only(top: 90.0, right: 16.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                          children: <Widget> [
                            button(_onMapTypeButtonPressed, Icons.map),
                            SizedBox(height: 11.0),
                          ]
                      )
                  )
              ),


              Padding(
                padding: EdgeInsets.only(top: 500),
                child: Container(
                    color: Colors.teal[200].withOpacity(0.7),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget> [

                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget> [

                              Row(
                                children: [
                                  Text(
                                    'Home',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Text(
                                    'Stop 1',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Text(
                                    'Stop 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Text(
                                    'Est. Time',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                        ),


                        Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget> [

                              Row(
                                children: [
                                  Text(
                                    'home',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Text(
                                    mapProviderAddress,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Text(
                                    "Grace's soup kitchen",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Text(
                                    '23 mins',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ],
                    )
                ),
              )
            ]
        ),

    );
  }
}