import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_app/styles/styles.dart';
import 'package:story_app/ui/pages/auth/bloc/auth_bloc.dart';
import 'package:story_app/ui/pages/auth/views/components/auth_text_field.dart';
import 'package:story_app/ui/widgets/loading_child.dart';
import 'package:story_app/utils/extensions/extensions.dart';
import 'package:story_app/utils/functions/actions.dart';

class RegisterSection extends StatelessWidget {
  RegisterSection({
    super.key,
    required this.bloc,
  });

  final AuthBloc bloc;

  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    void onChanged(String? value) {
      bloc.add(ValidateRegisterEvent(
        email: emailCtrl.text,
        password: passCtrl.text,
        name: nameCtrl.text,
      ));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (MediaQuery.of(context).size.height * 0.1).verticalSpace,
          Text(
            local.registerPage,
            style: indigo30w600,
          ),
          30.verticalSpace,
          Text(
            local.name,
            style: black20w500,
          ),
          5.verticalSpace,
          AuthTextField(
            controller: nameCtrl,
            onChanged: onChanged,
            inputAction: TextInputAction.next,
            hintText: local.hintName,
          ),
          15.verticalSpace,
          Text(
            local.email,
            style: black20w500,
          ),
          5.verticalSpace,
          AuthTextField(
            controller: emailCtrl,
            onChanged: onChanged,
            inputAction: TextInputAction.next,
            hintText: local.hintEmail,
          ),
          15.verticalSpace,
          Text(
            local.password,
            style: black20w500,
          ),
          5.verticalSpace,
          AuthTextField(
            controller: passCtrl,
            onChanged: onChanged,
            inputAction: TextInputAction.done,
            obscure: true,
            hintText: local.hintPassword,
          ),
          20.verticalSpace,
          BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) {
              if (previous.validateRegister != current.validateRegister) {
                return true;
              }

              if (previous.isLoading != current.isLoading) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 35),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                ),
                onPressed: state.validateRegister
                    ? () {
                        closeKeyboard();
                        bloc.add(DoRegisterEvent(
                          name: nameCtrl.text,
                          email: emailCtrl.text,
                          password: passCtrl.text,
                        ));
                      }
                    : null,
                child: state.isLoading
                    ? const LoadingChild(size: 28)
                    : Text(
                        local.register,
                        style: text20w600,
                      ),
              );
            },
          ),
          10.verticalSpace,
          TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: const Size(double.infinity, 35),
              padding: const EdgeInsets.symmetric(vertical: 5),
            ),
            onPressed: () {
              bloc.add(const AuthIsLoginEvent());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  local.login,
                  style: text20w600,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
