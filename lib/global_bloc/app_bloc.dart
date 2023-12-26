import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/utils/hive/adapters/user.dart';
import 'package:story_app/utils/hive/services/user_hive_service.dart';

part 'app_state.dart';
part 'app_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialAppState()) {
    on<EventGetUserData>((event, emit) {
      final user = UserHiveService.getUserData();
      userData = user;
    });

    on<EventGetLocaleUser>((event, emit) {
      final lang = UserHiveService.getLocale();
      localeText = lang?.countryCode;
      if (lang != null) {
        emit(AppLocalizationsState(locale: lang));
      }
    });

    on<EventSetUserData>((event, emit) {
      userData = event.user;
      UserHiveService.setUserData(event.user);
    });

    on<EventChangeLocaleUser>((event, emit) {
      UserHiveService.setLocale(event.locale.languageCode);
      localeText = event.locale.languageCode;
      emit(AppLocalizationsState(locale: event.locale));
    });

    on<EventLogOutUser>((event, emit) {
      UserHiveService.deleteUser();
      emit(const AppLocalizationsState(locale: null));
    });
  }
}
