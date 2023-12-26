import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/global_bloc/app_bloc.dart';
import 'package:story_app/ui/pages/dashboard/bloc/dashboard_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({
    super.key,
    required this.checkUserData,
  });

  final Function checkUserData;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnimation;

  @override
  void initState() {
    super.initState();
    context.read<AppBloc>().add(const EventGetUserData());
    context.read<AppBloc>().add(const EventGetLocaleUser());

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeInAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: const Interval(0.0, 0.5)),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        widget.checkUserData();
        if (userData != null) {
          context.read<DashboardBloc>().add(GetListDataEvent());
        }
        localeText ??= Localizations.localeOf(context).languageCode;
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Opacity(
              opacity: _fadeInAnimation.value,
              child: Text(
                'Story App',
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
