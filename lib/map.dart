import 'package:flutter/material.dart';
import 'dart:collection';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  final Set<Marker> _markers = HashSet<Marker>();
  final Set<Circle> _circles = HashSet<Circle>();

  GoogleMapController _mapController;
  BitmapDescriptor _markerIcon;

  @override
  void initState() {
    super.initState();
    // _setMarkerIcon();
    // _setPolygons();
    // _setPolylines();
    _setCircles();
  }

  // void _setMarkerIcon() async {
  //   _markerIcon = await BitmapDescriptor.fromAssetImage(
  //       ImageConfiguration(), 'assets/logo.png');
  // }

  void _setMapStyle() async {
    String style = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _mapController.setMapStyle(style);
  }

  // void _setPolygons() {
  //   List<LatLng> polygonLatLongs = List<LatLng>();
  //   polygonLatLongs.add(LatLng(37.78493, -122.42932));
  //   polygonLatLongs.add(LatLng(37.78693, -122.41942));
  //   polygonLatLongs.add(LatLng(37.78923, -122.41542));
  //   polygonLatLongs.add(LatLng(37.78923, -122.42582));

  //   _polygons.add(
  //     Polygon(
  //       polygonId: PolygonId("0"),
  //       points: polygonLatLongs,
  //       fillColor: Colors.white,
  //       strokeWidth: 1,
  //     ),
  //   );
  // }

  // void _setPolylines() {
  //   List<LatLng> polylineLatLongs = List<LatLng>();
  //   polylineLatLongs.add(LatLng(37.74493, -122.42932));
  //   polylineLatLongs.add(LatLng(37.74693, -122.41942));
  //   polylineLatLongs.add(LatLng(37.74923, -122.41542));
  //   polylineLatLongs.add(LatLng(37.74923, -122.42582));
  //   polylineLatLongs.add(LatLng(37.74493, -122.42932));

  //   _polylines.add(
  //     Polyline(
  //       polylineId: PolylineId("0"),
  //       points: polylineLatLongs,
  //       color: Colors.purple,
  //       width: 1,
  //     ),
  //   );
  // }

  void _setCircles() {
    _circles.add(
      Circle(
          circleId: CircleId("0"),
          center: LatLng(32.779167, -96.808891),
          radius: 500,
          strokeWidth: 2,
          fillColor: Color.fromRGBO(102, 51, 153, .5)),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId("0"),
          position: LatLng(32.779167, -96.808891),
          onTap: () => _onButtonPressed(),
          // infoWindow: InfoWindow(
          //   title: '${data['county']}, ${data['state']}',
          //   snippet: "Vaccinated : ${data['vaccine']}, Total Population: ${data['population']}, Percent Vaccinated: 0.5",
          // ),
          // icon:
          // _markerIcon, //the defualt marker is a red arrow, this changes from defailt to icon
        ),
      );
    });
    _setMapStyle();
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text('map'),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: LatLng(32.779167, -96.808891),
              zoom: 13,
            ),
            markers: _markers,
            // polygons: _polygons,
            // polylines: _polylines,
            circles: _circles,
            //myLocationEnabled: true, on andriod you need to request location permission explicitly. I recommend using 'location' pkg form pub.dev
          ),
          Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
              child: Text(
                'VaxStat',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ))
        ],
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        backgroundColor: Colors.grey[850],
        context: context,
        builder: (context) {
          return Column(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_upward),
                onPressed: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(
                  Icons.medical_services,
                  color: Colors.red[900],
                ),
                title: Text(
                  "Administered vaccinations: ${data['vaccine']}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.family_restroom,
                  color: Colors.red[900],
                ),
                title: Text(
                  "Total Population: ${data['population']}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.coronavirus,
                  color: Colors.red[900],
                ),
                title: Text(
                  "Percent of Population Vaccinated: 0.05%",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              )
            ],
          );
        });
  }
}
