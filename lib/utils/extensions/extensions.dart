import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:story_app/global_bloc/app_bloc.dart';

/// for datetime
extension StringX on String {
  String parseToDateTime() {
    DateTime dateTime = DateTime.parse(this);
    return dateTime.parseToGeneral();
  }

  String parseToFull() {
    DateTime dateTime = DateTime.parse(this);
    return dateTime.parseToFull();
  }
}

/// for datetime
extension DateTimeX on DateTime {
  String parseToGeneral() {
    DateFormat dateFormat = DateFormat('dd MMM yyyy', localeText);
    return dateFormat.format(this);
  }

  String parseToFull() {
    DateFormat dateFormat = DateFormat('EEEE, dd MMMM yyyy', localeText);
    return dateFormat.format(this);
  }
}

/// for spacing
extension SpaceX on num {
  SizedBox get horizontalSpace => setHorizontalSpace(this);
  SizedBox get verticalSpace => setVerticalSpace(this);

  SizedBox setHorizontalSpace(num value) {
    return SizedBox(width: value.toDouble());
  }

  SizedBox setVerticalSpace(num value) {
    return SizedBox(height: value.toDouble());
  }
}

extension ExtGesture on Widget {
  Widget extTextButton({
    VoidCallback? onTap,
    bool transparentIfTapNull = true,
  }) {
    final button = CupertinoButton(
      minSize: 0,
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: this,
    );

    if (transparentIfTapNull && onTap == null) {
      return Opacity(
        opacity: 0.5,
        child: button,
      );
    }

    return button;
  }
}

/// for window location
extension LocationX on LatLng {}
