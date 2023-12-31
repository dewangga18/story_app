import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/data/models/story_data.dart';
import 'package:story_app/global_bloc/app_bloc.dart';
import 'package:story_app/styles/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_app/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:story_app/ui/pages/dashboard/views/components/item_list.dart';
import 'package:story_app/ui/pages/dashboard/views/components/item_loading.dart';
import 'package:story_app/ui/pages/dashboard/views/components/message_dashboard_widget.dart';
import 'package:story_app/utils/extensions/extensions.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({
    super.key,
    required this.goProfile,
    required this.onData,
    required this.goCreate,
  });

  final VoidCallback goProfile;
  final VoidCallback goCreate;
  final Function(StoryData) onData;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final bloc = context.read<DashboardBloc>();

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: const Color(0xfff5f5f5),
        title: Text(
          local.dashboard,
          style: indigo30w600,
        ),
        actions: [
          GestureDetector(
            onTap: goProfile,
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(right: 12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo,
              ),
              child: Center(
                child: Text(
                  userData?.name?[0] ?? 'X',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state.isError) {
                return MessageDashboardWidget(
                  message: local.error,
                  textButton: local.refresh,
                  onTap: () {
                    bloc.add(GetListDataEvent());
                  },
                );
              } else if (state.isLoading) {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: 5,
                    separatorBuilder: (_, i) => 15.verticalSpace,
                    itemBuilder: (_, i) {
                      return const ItemLoading();
                    },
                  ),
                );
              } else if (state.list.isEmpty) {
                return MessageDashboardWidget(
                  message: local.empty,
                  textButton: local.refresh,
                  onTap: () {
                    bloc.add(GetListDataEvent());
                  },
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: state.list.length,
                    separatorBuilder: (_, i) => 15.verticalSpace,
                    itemBuilder: (_, i) {
                      final data = state.list[i];
                      return ItemList(
                        imgUrl: data.photoUrl ?? '-',
                        title: data.description ?? '',
                        creator: data.name ?? '',
                        date: data.createdAt,
                        onTap: () {
                          onData(data);
                        },
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: goCreate,
        child: const Icon(
          Icons.add_photo_alternate_outlined,
        ),
      ),
    );
  }
}
