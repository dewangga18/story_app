import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:story_app/global_bloc/app_bloc.dart';

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
