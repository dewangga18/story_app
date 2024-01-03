import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:story_app/ui/pages/dashboard/views/add_story/bloc/add_story_bloc.dart';
import 'package:story_app/ui/widgets/back_button.dart';
import 'package:story_app/utils/extensions/extensions.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({
    super.key,
    required this.back,
  });

  final VoidCallback back;

  @override
  State<AddLocationPage> createState() => _AddLocationPageState();
}

class _AddLocationPageState extends State<AddLocationPage> {
  late LatLng currentLocation;
  bool isLoading = true;
  late GoogleMapController mapController;
  final Set<Marker> markers = {};
  String text = '-';

  @override
  void initState() {
    super.initState();

    Geolocator.getCurrentPosition().then((value) {
      setState(() {
        currentLocation = LatLng(value.latitude, value.longitude);
        isLoading = false;
      });
      setLocationText(currentLocation).then((value) {
        setState(() {
          text = value;
        });
      });

      changeMarkers(currentLocation);
    });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final bloc = context.read<AddStoryBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(local.addLocation),
        leading: IconButton(
          onPressed: widget.back,
          icon: const IconBack(),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.storyLocation,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        text,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Text(local.add).extTextButton(
                  onTap: isLoading
                      ? null
                      : () {
                          bloc.add(PickLocationEvent(currentLocation));
                          widget.back();
                        },
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  GoogleMap(
                    onMapCreated: (controller) {
                      mapController = controller;
                    },
                    initialCameraPosition: CameraPosition(
                      zoom: 18,
                      target: currentLocation,
                    ),
                    scrollGesturesEnabled: true,
                    markers: markers,
                    zoomControlsEnabled: true,
                    mapToolbarEnabled: true,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    onLongPress: (loc) async {
                      changeMarkers(loc);
                      final value = await setLocationText(loc);
                      setState(() {
                        text = value;
                      });
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void changeMarkers(LatLng loc) {
    markers.clear();
    final marker = Marker(
      markerId: const MarkerId("location"),
      position: loc,
    );
    setState(() {
      currentLocation = loc;
      markers.add(marker);
    });
  }

  Future<String> setLocationText(LatLng loc) async {
    final data = await placemarkFromCoordinates(loc.latitude, loc.longitude);
    final place = data.first;
    return '${place.street}, ${place.administrativeArea}';
  }
}
