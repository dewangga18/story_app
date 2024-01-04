import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:story_app/data/models/story_data.dart';
import 'package:story_app/global_bloc/app_bloc.dart';
import 'package:story_app/styles/styles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_app/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:story_app/ui/pages/dashboard/views/add_story/bloc/add_story_bloc.dart';
import 'package:story_app/ui/pages/dashboard/views/components/item_list.dart';
import 'package:story_app/ui/pages/dashboard/views/components/item_loading.dart';
import 'package:story_app/ui/pages/dashboard/views/components/message_dashboard_widget.dart';
import 'package:story_app/utils/extensions/extensions.dart';

class DashboardPage extends StatefulWidget {
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
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  DashboardBloc? bloc;
  final ScrollController scrollController = ScrollController();

  bool showScroll = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 10 &&
          showScroll) {
        bloc?.add(LoadmoreEvent());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc ??= context.read<DashboardBloc>();
    final addBloc = context.read<AddStoryBloc>();
    final local = AppLocalizations.of(context)!;

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
            onTap: widget.goProfile,
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
          BlocConsumer<DashboardBloc, DashboardState>(
            listener: (context, state) {
              setState(() {
                showScroll = state.enableScrollMore;
              });
            },
            listenWhen: (previous, current) {
              return previous.enableScrollMore != current.enableScrollMore;
            },
            buildWhen: (previous, current) {
              if (previous.isError != current.isError) {
                return true;
              }
              if (previous.isLoading != current.isLoading) {
                return true;
              }
              if (previous.list != current.list) {
                return true;
              }
              if (previous.enableScrollMore != current.enableScrollMore) {
                return true;
              }
              return false;
            },
            builder: (context, state) {
              if (state.isError) {
                return MessageDashboardWidget(
                  message: local.error,
                  textButton: local.refresh,
                  onTap: () {
                    bloc?.add(GetListDataEvent());
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
                    bloc?.add(GetListDataEvent());
                  },
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                    controller: scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: state.list.length + 1,
                    separatorBuilder: (_, i) => 15.verticalSpace,
                    itemBuilder: (_, i) {
                      if (state.list.length == i) {
                        if (state.enableScrollMore) {
                          return const Center(
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }

                        return const SizedBox();
                      }

                      final data = state.list[i];
                      return ItemList(
                        imgUrl: data.photoUrl ?? '-',
                        title: data.description ?? '',
                        creator: data.name ?? '',
                        date: data.createdAt,
                        onTap: () {
                          widget.onData(data);
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
        onPressed: () {
          addBloc.add(RefreshVariable());
          widget.goCreate();
        },
        child: const Icon(
          Icons.add_photo_alternate_outlined,
        ),
      ),
    );
  }
}
