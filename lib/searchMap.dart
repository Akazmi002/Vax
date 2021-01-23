// import 'package:flutter/material.dart';
// import 'dart:collection';
// import 'dart:async';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';


// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Map data = {};

//   final Set<Marker> _markers = HashSet<Marker>();
//   // final Set<Polygon> _polygons = HashSet<Polygon>();
//   // final Set<Polyline> _polylines = HashSet<Polyline>();
//   final Set<Circle> _circles = HashSet<Circle>();

//   GoogleMapController _mapController;
//   BitmapDescriptor _markerIcon;

//   @override
//   void initState() {
//     super.initState();
//     _setMarkerIcon();
//     // _setPolygons();
//     // _setPolylines();
//     _setCircles();
//   }

//   void _setMarkerIcon() async {
//     _markerIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(), 'assets/logo.png');
//   }

//   void _setMapStyle() async {
//     String style = await DefaultAssetBundle.of(context)
//         .loadString('assets/map_style.json');
//     _mapController.setMapStyle(style);
//   }

//   // void _setPolygons() {
//   //   List<LatLng> polygonLatLongs = List<LatLng>();
//   //   polygonLatLongs.add(LatLng(37.78493, -122.42932));
//   //   polygonLatLongs.add(LatLng(37.78693, -122.41942));
//   //   polygonLatLongs.add(LatLng(37.78923, -122.41542));
//   //   polygonLatLongs.add(LatLng(37.78923, -122.42582));

//   //   _polygons.add(
//   //     Polygon(
//   //       polygonId: PolygonId("0"),
//   //       points: polygonLatLongs,
//   //       fillColor: Colors.white,
//   //       strokeWidth: 1,
//   //     ),
//   //   );
//   // }

//   // void _setPolylines() {
//   //   List<LatLng> polylineLatLongs = List<LatLng>();
//   //   polylineLatLongs.add(LatLng(37.74493, -122.42932));
//   //   polylineLatLongs.add(LatLng(37.74693, -122.41942));
//   //   polylineLatLongs.add(LatLng(37.74923, -122.41542));
//   //   polylineLatLongs.add(LatLng(37.74923, -122.42582));
//   //   polylineLatLongs.add(LatLng(37.74493, -122.42932));

//   //   _polylines.add(
//   //     Polyline(
//   //       polylineId: PolylineId("0"),
//   //       points: polylineLatLongs,
//   //       color: Colors.purple,
//   //       width: 1,
//   //     ),
//   //   );
//   // }

//   void _setCircles() {
//     _circles.add(
//       Circle(
//           circleId: CircleId("0"),
//           center: LatLng(32.7767000, -96.7970000),
//           radius: 1000,
//           strokeWidth: 2,
//           fillColor: Color.fromRGBO(102, 51, 153, .5)),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     _mapController = controller;

//     setState(() {
//       _markers.add(
//         Marker(
//           markerId: MarkerId("0"),
//           position: LatLng(32.7767000, -96.7970000),
//           infoWindow: InfoWindow(
//             title: "Ayman",
//             snippet: "an interesting city",
//           ),
//           icon:
//               _markerIcon, //the defualt marker is a red arrow, this changes from defailt to icon
//         ),
//       );
//     });
//     _setMapStyle();
//   }
//   String searchAddr;
//   @override
//   Widget build(BuildContext context) {
//     //data = ModalRoute.of(context).settings.arguments;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         centerTitle: true,
//         title: Text('map'),
//       ),
//       body: Stack(
//         children: <Widget>[
//           GoogleMap(
//             onMapCreated: _onMapCreated,
//             initialCameraPosition: CameraPosition(
//               target: LatLng(32.7767000, -96.7970000),
//               zoom: 12,
//             ),
//             markers: _markers,
//             // polygons: _polygons,
//             // polylines: _polylines,
//             circles: _circles,
//             //myLocationEnabled: true, on andriod you need to request location permission explicitly. I recommend using 'location' pkg form pub.dev
//           ),
//           Positioned(
//             top: 30.0,
//             right: 15.0,
//             left: 15.0,
//             child: Container(
//               height: 50.0,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10.0), color: Colors.white),
//               child: TextField(
//                 decoration: InputDecoration(
//                     hintText: 'Enter Address',
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
//                     suffixIcon: IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: searchandNavigate,
//                         iconSize: 30.0)),
//                 onChanged: (val) {
//                   setState(() {
//                     searchAddr = val;
//                   });
//                 },
//               ),
//             ),
//           ),
//           Container(
//               alignment: Alignment.bottomCenter,
//               padding: EdgeInsets.fromLTRB(0, 0, 0, 32),
//               child: Text(
//                 'VacStat',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.deepPurple,
//                 ),
//               ))
//         ],
//       ),
//     );
//   }

//   searchandNavigate() {
//     Geolocator().placemarkFromAddress(searchAddr).then((result) {
//       _mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
//           target:
//               LatLng(result[0].position.latitude, result[0].position.longitude),
//           zoom: 10.0)));
//     });
//   }

// }
