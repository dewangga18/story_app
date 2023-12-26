import 'package:flutter/material.dart';
import 'package:story_app/utils/extensions/extensions.dart';

class MessageDashboardWidget extends StatelessWidget {
  const MessageDashboardWidget({
    super.key,
    required this.message,
    required this.onTap,
    required this.textButton,
  });

  final String message;
  final VoidCallback onTap;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (MediaQuery.of(context).size.height * 0.4).verticalSpace,
        Center(
          child: Column(
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
              5.verticalSpace,
              ElevatedButton(
                onPressed: onTap,
                child: Text(textButton),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
