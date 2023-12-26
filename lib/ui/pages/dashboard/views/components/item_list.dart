import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:story_app/ui/widgets/skeleton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_app/utils/extensions/extensions.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.creator,
    this.date,
    required this.onTap,
  });

  final String imgUrl;
  final String title;
  final String creator;
  final String? date;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: imgUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  imageBuilder: (context, imageProvider) {
                    return Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    );
                  },
                  placeholder: (context, url) {
                    return const Skeleton(
                      width: double.infinity,
                      height: 150,
                    );
                  },
                  errorWidget: (context, url, error) {
                    return Container(
                      width: double.infinity,
                      height: 150,
                      color: Colors.black45,
                      child: Text(
                        local.error,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),
            8.verticalSpace,
            const Divider(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    creator,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Text(
                  date == null ? '-' : date!.parseToDateTime(),
                  style: const TextStyle(color: Colors.indigo),
                ),
              ],
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: true,
            ),
            5.verticalSpace,
          ],
        ),
      ),
    );
  }
}
