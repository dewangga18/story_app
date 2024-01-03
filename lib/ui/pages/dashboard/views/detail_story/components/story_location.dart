import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/utils/extensions/extensions.dart';
import 'package:geocoding/geocoding.dart' as geo;

class StoryLocation extends StatefulWidget {
  const StoryLocation({
    super.key,
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  @override
  State<StoryLocation> createState() => _StoryLocationState();
}

class _StoryLocationState extends State<StoryLocation> {
  late GoogleMapController mapController;
  late final Set<Marker> markers = {};
  late LatLng location;
  String text = '-';

  @override
  void initState() {
    super.initState();

    geo
        .placemarkFromCoordinates(
      widget.lat,
      widget.lon,
      localeIdentifier: 'id',
    )
        .then((value) {
      final place = value.first;
      final placeText = '${place.street}, ${place.administrativeArea}';
      setState(() {
        text = placeText;
      });
    });

    location = LatLng(widget.lat, widget.lon);

    final marker = Marker(
      markerId: const MarkerId("location"),
      position: location,
    );
    markers.add(marker);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.storyLocation,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            text,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          10.verticalSpace,
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      zoom: 18,
                      target: location,
                    ),
                    scrollGesturesEnabled: true,
                    markers: markers,
                    zoomControlsEnabled: true,
                    mapToolbarEnabled: true,
                    myLocationButtonEnabled: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
