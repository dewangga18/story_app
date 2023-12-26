import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:story_app/ui/pages/auth/views/components/login_section.dart';
import 'package:story_app/ui/pages/auth/views/components/register_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:story_app/ui/pages/dashboard/bloc/dashboard_bloc.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({
    super.key,
    required this.goToDashboard,
  });

  final Function goToDashboard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          final bloc = context.read<AuthBloc>();
          final local = AppLocalizations.of(context)!;
          if (state.showError) {
            bloc.add(
              SetVariableAuth(
                state.copyWith(showError: false),
              ),
            );
            showToast(
              local.error,
              context: context,
            );
          }
          if (state.showSuccess) {
            bloc.add(
              SetVariableAuth(
                state.copyWith(showSuccess: false),
              ),
            );
            showToast(
              local.registerSuccess,
              context: context,
            );
          }
          if (state.sholdMovePage) {
            context.read<DashboardBloc>().add(GetListDataEvent());
            goToDashboard();
          }
        },
        buildWhen: (previous, current) {
          return previous.isRegister != current.isRegister;
        },
        builder: (context, state) {
          final bloc = context.read<AuthBloc>();
    
          if (state.isRegister) {
            return RegisterSection(bloc: bloc);
          } else {
            return LoginSection(bloc: bloc);
          }
        },
      ),
    );
  }
}
