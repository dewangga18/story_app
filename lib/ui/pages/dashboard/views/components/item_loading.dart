import 'package:flutter/material.dart';
import 'package:story_app/ui/widgets/skeleton.dart';
import 'package:story_app/utils/extensions/extensions.dart';

class ItemLoading extends StatelessWidget {
  const ItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const SizedBox(
              width: double.infinity,
              height: 150,
              child: Skeleton(),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Skeleton(
                height: 25,
                width: MediaQuery.of(context).size.width * 0.45,
              ),
              const Spacer(),
              Skeleton(
                height: 20,
                width: MediaQuery.of(context).size.width * 0.2,
              ),
            ],
          ),
          5.verticalSpace,
          Skeleton(
            height: 20,
            width: MediaQuery.of(context).size.width * 0.55,
          ),
          5.verticalSpace,
        ],
      ),
    );
  }
}
