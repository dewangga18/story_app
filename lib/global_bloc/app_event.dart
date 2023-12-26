part of 'app_bloc.dart';

sealed class AppEvent {
  const AppEvent();
}

final class EventGetUserData extends AppEvent {
  const EventGetUserData();
}

final class EventGetLocaleUser extends AppEvent {
  const EventGetLocaleUser();
}

final class EventSetUserData extends AppEvent {
  final UserData user;

  const EventSetUserData(this.user);
}

final class EventChangeLocaleUser extends AppEvent {
  final Locale locale;
  
  const EventChangeLocaleUser(this.locale);
}

final class EventLogOutUser extends AppEvent {
  const EventLogOutUser();
}

