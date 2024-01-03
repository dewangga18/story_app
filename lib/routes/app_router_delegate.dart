import 'package:flutter/material.dart';
import 'package:story_app/data/models/story_data.dart';
import 'package:story_app/global_bloc/app_bloc.dart';
import 'package:story_app/ui/pages/auth/views/auth_page.dart';
import 'package:story_app/ui/pages/dashboard/views/add_story/add_location_page.dart';
import 'package:story_app/ui/pages/dashboard/views/add_story/add_story_page.dart';
import 'package:story_app/ui/pages/dashboard/views/dashboard_page.dart';
import 'package:story_app/ui/pages/dashboard/views/detail_story/detail_story_page.dart';
import 'package:story_app/ui/pages/profile/views/profile_page.dart';
import 'package:story_app/ui/pages/splash/splash_page.dart';

class AppRouterDelegate extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;
  bool isSplash;
  bool isAuth;
  bool isDashboard;
  bool isProfile;
  bool isCreate;
  StoryData? selectedStory;
  bool isLocationPicker;

  AppRouterDelegate()
      : _navigatorKey = GlobalKey<NavigatorState>(),
        isSplash = true,
        isAuth = false,
        isDashboard = false,
        isCreate = false,
        isProfile = false,
        isLocationPicker = false;

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        if (isSplash)
          MaterialPage(
            key: const ValueKey('Splash'),
            child: SplashPage(
              checkUserData: () {
                if (userData == null) {
                  isSplash = false;
                  isAuth = true;
                  notifyListeners();
                } else {
                  isSplash = false;
                  isDashboard = true;
                  notifyListeners();
                }
              },
            ),
          ),
        if (isAuth)
          MaterialPage(
            key: const ValueKey('Auth'),
            child: AuthPage(
              goToDashboard: () {
                isAuth = false;
                isDashboard = true;
                notifyListeners();
              },
            ),
          ),
        if (isDashboard)
          MaterialPage(
            key: const ValueKey('Dashboard'),
            child: DashboardPage(
              goProfile: () {
                isProfile = true;
                notifyListeners();
              },
              onData: (StoryData? value) {
                selectedStory = value;
                notifyListeners();
              },
              goCreate: () {
                isCreate = true;
                notifyListeners();
              },
            ),
          ),
        if (isProfile)
          MaterialPage(
            key: const ValueKey('Profile'),
            child: ProfilePage(
              back: () {
                isProfile = false;
                notifyListeners();
              },
              logout: () async {
                isProfile = false;
                isDashboard = false;
                isAuth = true;
                notifyListeners();
              },
            ),
          ),
        if (selectedStory != null)
          MaterialPage(
            key: ValueKey(selectedStory!.id),
            child: DetailStoryPage(
              data: selectedStory!,
              back: () {
                selectedStory = null;
                notifyListeners();
              },
            ),
          ),
        if (isCreate)
          MaterialPage(
            key: const ValueKey('Create'),
            child: AddStoryPage(
              back: () {
                isCreate = false;
                notifyListeners();
              },
              toLocationPicker: () {
                isLocationPicker = true;
                notifyListeners();
              },
            ),
          ),
        if (isLocationPicker)
          MaterialPage(
            key: const ValueKey('Location'),
            child: AddLocationPage(
              back: () {
                isLocationPicker = false;
                notifyListeners();
              },
            ),
          ),
      ],
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        isProfile = false;
        selectedStory = null;
        if (isLocationPicker) {
          isLocationPicker = false;
        } else {
          isCreate = false;
        }
        notifyListeners();

        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(configuration) {
    throw UnimplementedError();
  }
}
