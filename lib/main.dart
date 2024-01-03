import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:story_app/app.dart';
import 'package:story_app/data/api/api_services.dart';
import 'package:story_app/global_bloc/app_bloc.dart';
import 'package:story_app/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:story_app/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:story_app/ui/pages/dashboard/views/add_story/bloc/add_story_bloc.dart';
import 'package:story_app/utils/hive/adapters/user.dart';
import 'package:story_app/utils/hive/adapters/user_locale.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UserDataImplAdapter());
  Hive.registerAdapter(UserLocaleImplAdapter());
  await Hive.openBox('user');
  await Hive.openBox('locale-user');
  await Permission.location.request();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final apiService = ApiService();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppBloc(),
        ),
        BlocProvider(
          create: (ctx) => AuthBloc(
            api: apiService,
            context: ctx,
          ),
        ),
        BlocProvider(
          create: (_) => DashboardBloc(apiService),
        ),
        BlocProvider(
          create: (_) => AddStoryBloc(apiService),
        ),
      ],
      child: const App(),
    );
  }
}
