import 'dart:io';

import 'package:flutter/material.dart';

class IconBack extends StatelessWidget {
  const IconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
    );
  }
}
