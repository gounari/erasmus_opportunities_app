import 'package:erasmusopportunitiesapp/models/opportunity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(47.658933, 16.181248);
  Set<Marker> markers = Set.from([]);

  Future<LatLng> getLatLong(String address) async {
    var addresses = await Geocoder.local.findAddressesFromQuery(address);
    return LatLng(addresses.first.coordinates.latitude, addresses.first.coordinates.longitude);
  }


  @override
  Widget build(BuildContext context) {

    final opportunities = Provider.of<List<Opportunity>>(context);

    void _onMapCreated(GoogleMapController controller) {
      mapController = controller;

    }

    setMarkers(List<Opportunity> opportunitiesList) async {
      List<Marker> markersList = [];
      for (var opp in opportunitiesList) {
        //print(opp.venueAddress);
        await getLatLong(opp.venueAddress)
        .then((value) {
          markersList.add(
            Marker(
              markerId: MarkerId(opp.oid),
              position: value,
              infoWindow: InfoWindow(title: opp.title),
            )
          );
          print(opp.venueAddress + " " + value.toString());
        })
        .catchError((error) => print('Get LatLong failed with $error')) ;
      }

      setState(() {
       markers = Set.from(markersList);
      });
    }

    Set<Marker> setMarkersWhenEmpty(List<Opportunity> opp) {
      setMarkers(opp);
      return markers;
    }

    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 5.0,
          ),
          markers: markers.isEmpty ? setMarkersWhenEmpty(opportunities) : markers,
        ),
      ),
    );
  }
}
