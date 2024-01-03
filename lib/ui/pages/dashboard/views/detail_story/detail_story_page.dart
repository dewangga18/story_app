import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/data/models/story_data.dart';
import 'package:story_app/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:story_app/ui/widgets/back_button.dart';
import 'package:story_app/utils/extensions/extensions.dart';

class DetailStoryPage extends StatelessWidget {
  const DetailStoryPage({
    super.key,
    required this.data,
    required this.back,
  });

  final StoryData data;
  final VoidCallback back;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<DashboardBloc>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: back,
          icon: const IconBack(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: data.photoUrl!,
              child: CachedNetworkImage(
                imageUrl: data.photoUrl!,
                imageBuilder: (context, imageProvider) {
                  return Image(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.name!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          data.createdAt == null
                              ? '-'
                              : data.createdAt!.parseToFull(),
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        20.verticalSpace,
                        Text(
                          '"${data.description}"',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  if (data.lat != null && data.lon != null)
                    IconButton(
                      onPressed: () {
                        bloc.add(ViewLocationEvent(
                          lat: data.lat!,
                          lon: data.lon!,
                          context: context,
                        ));
                      },
                      icon: const Icon(Icons.location_on),
                      color: Colors.indigo,
                    ),
                ],
              ),
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
