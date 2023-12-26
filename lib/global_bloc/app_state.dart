part of 'app_bloc.dart';

List<Locale> supportedLocales = const [
  Locale('id', ''),
  Locale('en', ''),
];

UserData? userData;

String? localeText;

sealed class AppState extends Equatable {
  const AppState();
}

final class InitialAppState extends AppState {
  @override
  List<Object?> get props => [];
}

final class AppLocalizationsState extends AppState {
  final Locale? locale;

  const AppLocalizationsState({
    this.locale,
  });

  @override
  List<Object?> get props => [locale];
}
