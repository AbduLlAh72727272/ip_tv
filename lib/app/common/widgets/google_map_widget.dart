// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:get/get.dart';
// import 'package:jump_start_helper/features/Controllers/location_controller.dart';
// import 'package:jump_start_helper/utils/constraints/colors.dart';
// import 'package:http/http.dart' as http;
// //import 'package:jump_start/features/Controllers/location_controller.dart';

// class GoogleMapWidget extends StatefulWidget {
//   final String? pickUpAddress;
//   final String? dropAddress;
//   final bool? showPolyLine;
//   final Function()? onMapCreated;

//   const GoogleMapWidget(
//       {Key? key,
//       this.pickUpAddress,
//       this.dropAddress,
//       this.showPolyLine,
//       this.onMapCreated})
//       : super(key: key);

//   @override
//   _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
// }

// class _GoogleMapWidgetState extends State<GoogleMapWidget> {
//   final LocationController _controller = Get.find();
//   LatLng _markerPosition = const LatLng(33.6844, 73.0479);
//   final String apiKey = "AIzaSyDVaumY-BUzZPZ7Mrx6lc-_Par14VDcktM";
//   final Set<Polyline> _polylines = {};

//   Future<LatLng> getCoordinatesFromAddress(String address) async {
//     try {
//       List<Location> locations = await locationFromAddress(address);
//       if (locations.isNotEmpty) {
//         final location = locations.first;
//         return LatLng(location.latitude, location.longitude);
//       } else {
//         throw Exception('No locations found for the address');
//       }
//     } catch (e) {
//       throw Exception('Failed to get coordinates: $e');
//     }
//   }

//   void _onMapTapped(LatLng position) {
//     setState(() {
//       _markerPosition = position;
//     });

//     if (position.latitude != null && position.longitude != null) {
//       _updateLocationInfo(position.latitude, position.longitude);
//     } else {
//       print("Invalid coordinates");
//     }
//   }

//   Future<void> _updateLocationInfo(double latitude, double longitude) async {
//     try {
//       List<Placemark> placemarks =
//           await placemarkFromCoordinates(latitude, longitude);
//       if (placemarks.isNotEmpty) {
//         Placemark placemark = placemarks.first;
//         String address = _buildAddressString(placemark);
//         print('Location Info:');
//         print(address);
//         _controller.addresses.add(address);
//       } else {
//         print('No location information found.');
//       }
//     } catch (e) {
//       print("Error getting location info: $e");
//     }
//   }

//   Future<void> _getDirections(LatLng startPoint, LatLng endPoint) async {
//     final String url =
//         'https://maps.googleapis.com/maps/api/directions/json?origin=${startPoint.latitude},${startPoint.longitude}&destination=${endPoint.latitude},${endPoint.longitude}&key=$apiKey';
//     final response = await http.get(Uri.parse(url));
//     final json = jsonDecode(response.body);

//     if (json['status'] == 'OK') {
//       final points = json['routes'][0]['overview_polyline']['points'];
//       final polylineCoordinates = _decodePolyline(points);
//       setState(() {
//         _polylines.add(Polyline(
//           polylineId: PolylineId('route'),
//           points: polylineCoordinates,
//           width: 5,
//           color: VoidColors.primary,
//         ));
//       });
//     }
//   }

//   List<LatLng> _decodePolyline(String poly) {
//     List<LatLng> points = [];
//     int index = 0, len = poly.length;
//     int lat = 0, lng = 0;

//     while (index < len) {
//       int b, shift = 0, result = 0;
//       do {
//         b = poly.codeUnitAt(index++) - 63;
//         result |= (b & 0x1F) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
//       lat += dlat;

//       shift = 0;
//       result = 0;
//       do {
//         b = poly.codeUnitAt(index++) - 63;
//         result |= (b & 0x1F) << shift;
//         shift += 5;
//       } while (b >= 0x20);
//       int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
//       lng += dlng;

//       points.add(LatLng((lat / 1E5), (lng / 1E5)));
//     }

//     return points;
//   }

//   String _buildAddressString(Placemark placemark) {
//     return '${placemark.name ?? 'N/A'}, ${placemark.subLocality ?? 'N/A'}, ${placemark.locality ?? 'N/A'}, ${placemark.postalCode ?? 'N/A'}, ${placemark.country ?? 'N/A'}';
//   }

//   Set<Marker> _markers = {};
//   LatLng? _pickUpPosition;
//   LatLng? _dropOffPosition;
//   late GoogleMapController mapController;
//   LatLng _defaultPosition = LatLng(37.7749, -122.4194);

//   Future<void> _initializeMarkers() async {
//     try {
//       LatLngBounds bounds;
//       if (widget.pickUpAddress!.isNotEmpty) {
//         _pickUpPosition =
//             await getCoordinatesFromAddress(widget.pickUpAddress!);
//         _markers.add(Marker(
//           markerId: MarkerId('pick_up_marker'),
//           position: _pickUpPosition!,
//           infoWindow: InfoWindow(
//             title: 'Pick Up Location',
//             snippet:
//                 'Latitude: ${_pickUpPosition!.latitude}, Longitude: ${_pickUpPosition!.longitude}',
//           ),
//         ));
//       }

//       if (widget.dropAddress!.isNotEmpty) {
//         _dropOffPosition = await getCoordinatesFromAddress(widget.dropAddress!);
//         _markers.add(Marker(
//           markerId: MarkerId('drop_off_marker'),
//           position: _dropOffPosition!,
//           infoWindow: InfoWindow(
//             title: 'Drop Off Location',
//             snippet:
//                 'Latitude: ${_dropOffPosition!.latitude}, Longitude: ${_dropOffPosition!.longitude}',
//           ),
//         ));
//       }

//       setState(() {
//         // Define bounds if both positions are available
//         if (_pickUpPosition != null && _dropOffPosition != null) {
//           bounds = LatLngBounds(
//             southwest: LatLng(
//               _pickUpPosition!.latitude < _dropOffPosition!.latitude
//                   ? _pickUpPosition!.latitude
//                   : _dropOffPosition!.latitude,
//               _pickUpPosition!.longitude < _dropOffPosition!.longitude
//                   ? _pickUpPosition!.longitude
//                   : _dropOffPosition!.longitude,
//             ),
//             northeast: LatLng(
//               _pickUpPosition!.latitude > _dropOffPosition!.latitude
//                   ? _pickUpPosition!.latitude
//                   : _dropOffPosition!.latitude,
//               _pickUpPosition!.longitude > _dropOffPosition!.longitude
//                   ? _pickUpPosition!.longitude
//                   : _dropOffPosition!.longitude,
//             ),
//           );
//         } else if (_pickUpPosition != null) {
//           bounds = LatLngBounds(
//             southwest: _pickUpPosition!,
//             northeast: _pickUpPosition!,
//           );
//         } else if (_dropOffPosition != null) {
//           bounds = LatLngBounds(
//             southwest: _dropOffPosition!,
//             northeast: _dropOffPosition!,
//           );
//         } else {
//           bounds = LatLngBounds(
//             southwest: _defaultPosition,
//             northeast: _defaultPosition,
//           );
//         }

//         mapController.animateCamera(
//           CameraUpdate.newLatLngBounds(bounds, 50),
//         );
//       });
//       if (widget.showPolyLine!) {
//         await _getDirections(_pickUpPosition!, _dropOffPosition!);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }

//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//     _initializeMarkers();

//     if (widget.onMapCreated != null) {
//       widget.onMapCreated!();
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     print(widget.dropAddress);
//     print(widget.pickUpAddress);
//     if (_pickUpPosition != null) {
//       print(
//           "Pick Up Position: ${_pickUpPosition!.latitude}, ${_pickUpPosition!.longitude}");
//     }
//     if (_dropOffPosition != null) {
//       print(
//           "Drop Off Position: ${_dropOffPosition!.latitude}, ${_dropOffPosition!.longitude}");
//     }

//     return SizedBox(
//       height: 300,
//       child: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: _pickUpPosition ?? _defaultPosition,
//           zoom: 15.0,
//         ),
//         polylines: widget.showPolyLine! ? _polylines : {},
//         markers: _markers.length != 0
//             ? _markers
//             : {
//                 Marker(
//                   markerId: MarkerId('drop_off_marker'),
//                   position: _defaultPosition!,
//                   infoWindow: InfoWindow(
//                     title: 'Drop Off Location',
//                     snippet:
//                         'Latitude: ${_defaultPosition!.latitude}, Longitude: ${_defaultPosition!.longitude}',
//                   ),
//                 )
//               },
//         // onTap: _onMapTapped,
//         onMapCreated: _onMapCreated,
//       ),
//     );
//   }
// }
