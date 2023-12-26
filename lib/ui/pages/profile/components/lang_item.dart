import 'package:flutter/material.dart';

class LangItem extends StatelessWidget {
  final String title;
  final String value;
  final String groupValue;
  final Function() onTap;

  const LangItem({
    super.key,
    required this.title,
    required this.value,
    required this.groupValue,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool selected = value == groupValue;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (selected)
            Container(
              height: 12,
              width: 12,
              margin: const EdgeInsets.all(7),
              decoration: const BoxDecoration(
                color: Colors.indigo,
                shape: BoxShape.circle,
              ),
            )
          else
            Container(
              height: 12,
              width: 12,
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black45, width: 2),
                shape: BoxShape.circle,
              ),
            ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: selected ? Colors.indigo : Colors.black),
          ),
        ],
      ),
    );
  }
}
