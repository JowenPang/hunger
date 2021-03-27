import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapTracker extends StatefulWidget{
  MapTracker() : super();

  final String title = "Maps Tracker";

  @override
  MapTrackerState createState() => MapTrackerState();
}


class MapTrackerState extends State<MapTracker>{

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(42.131, -122.2342);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.blue,
        ),

        body: Stack(
            children: <Widget> [

              GoogleMap(
                onMapCreated:  _onMapCreated,
                initialCameraPosition:  CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                mapType: _currentMapType,
                markers: _markers,
                onCameraMove:  _onCameraMove,
              ),

              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                          children: <Widget> [
                            button(_onMapTypeButtonPressed, Icons.map),
                            SizedBox(height: 11.0),
                            button(_onAddMarkerButtonPressed, Icons.add_location),
                          ]
                      )
                  )
              ),

              Container(
                  margin: EdgeInsets.fromLTRB(0,450,0,0),
                  color: Colors.teal[700],
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
                                  'Galaxy condominiums',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                )
                              ],
                            ),

                            Row(
                              children: [
                                Text(
                                  'Restaurant Shangrila',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Text(
                                  'Blueberry flats',
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
              )
            ]
        ),
      ),
    );
  }
}