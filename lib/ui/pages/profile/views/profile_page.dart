import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/global_bloc/app_bloc.dart';
import 'package:story_app/styles/styles.dart';
import 'package:story_app/ui/pages/profile/components/lang_item.dart';
import 'package:story_app/ui/widgets/back_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_app/utils/extensions/extensions.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
    required this.back,
    required this.logout,
  });

  final Function() back;
  final Future Function() logout;

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AppBloc>();
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: Text(
          local.profile,
        ),
        leading: IconButton(
          onPressed: back,
          icon: const IconBack(),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await logout();
              bloc.add(const EventLogOutUser());
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            30.verticalSpace,
            Center(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.indigo,
                    ),
                    child: Text(
                      userData?.name?[0] ?? '',
                      style: white45w600,
                    ),
                  ),
                  15.verticalSpace,
                  Text(
                    userData?.name?? '',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            40.verticalSpace,
            Text(
              local.language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            BlocBuilder<AppBloc, AppState>(
              buildWhen: (previous, current) {
                if (previous is AppLocalizationsState &&
                    current is AppLocalizationsState) {
                  return previous.locale != current.locale;
                }
                return false;
              },
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: supportedLocales.length,
                  itemBuilder: (context, i) {
                    Locale? selectedLocale;
                    if (state is AppLocalizationsState) {
                      selectedLocale = state.locale;
                    }
                    if (selectedLocale == null) {
                      selectedLocale == Localizations.localeOf(context);
                    }
                    return LangItem(
                      title: i == 0 ? local.id : local.en,
                      value: supportedLocales[i].languageCode,
                      groupValue: selectedLocale?.languageCode ?? '-',
                      onTap: () {
                        bloc.add(EventChangeLocaleUser(supportedLocales[i]));
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
