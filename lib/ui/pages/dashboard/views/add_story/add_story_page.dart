import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:story_app/styles/styles.dart';
import 'package:story_app/ui/pages/dashboard/bloc/dashboard_bloc.dart';
import 'package:story_app/ui/pages/dashboard/views/add_story/bloc/add_story_bloc.dart';
import 'package:story_app/ui/widgets/back_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:story_app/ui/widgets/loading_child.dart';
import 'package:story_app/utils/extensions/extensions.dart';
import 'package:story_app/utils/functions/actions.dart';

class AddStoryPage extends StatelessWidget {
  AddStoryPage({super.key, required this.back});

  final VoidCallback back;
  final TextEditingController txtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final bloc = context.read<AddStoryBloc>();
    final dashboardBloc = context.read<DashboardBloc>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: Text(
          local.add,
        ),
        leading: IconButton(
          onPressed: back,
          icon: const IconBack(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<AddStoryBloc, AddStoryState>(
          listener: (context, state) {
            if (state.isError) {
              bloc.add(SetVariableFalse());
              showToast(
                local.error,
                context: context,
              );
            }
            if (state.isSuccess) {
              bloc.add(SetVariableFalse());
              back();
              dashboardBloc.add(GetListDataEvent());
              showToast(
                local.add,
                context: context,
              );
            }
          },
          buildWhen: (previous, current) {
            if (previous.enablePost != current.enablePost) {
              return true;
            }

            if (previous.isLoading != current.isLoading) {
              return true;
            }

            if (previous.file?.path != current.file?.path) {
              return true;
            }

            return false;
          },
          builder: (context, state) {
            return Column(
              children: [
                25.verticalSpace,
                if (state.file == null || state.file?.path == '') ...[
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.image,
                      size: 100,
                      color: Colors.grey,
                    ),
                  ),
                ] else ...[
                  Stack(
                    children: [
                      Image.file(
                        File(state.file!.path),
                      ),
                      Positioned.fill(
                        child: Container(
                          color: Colors.black.withOpacity(0.35),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: IconButton(
                          splashRadius: 50,
                          onPressed: () {
                            bloc.add(RemoveImageEvent());
                          },
                          icon: const Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                          iconSize: 50,
                        ),
                      ),
                    ],
                  ),
                ],
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        bloc.add(PickCameraEvent());
                      },
                      icon: const Icon(Icons.add_a_photo_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        bloc.add(PickGalleryEvent());
                      },
                      icon: const Icon(Icons.add_photo_alternate_outlined),
                    ),
                  ],
                ),
                15.verticalSpace,
                TextField(
                  onChanged: (value) {
                    bloc.add(CheckEnablePostEvent(value));
                  },
                  minLines: 4,
                  maxLines: null,
                  controller: txtController,
                  style: Theme.of(context).textTheme.bodySmall,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15),
                    hintText: local.desc,
                    hintStyle: Theme.of(context).textTheme.bodySmall,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black38),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                20.verticalSpace,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 35),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                  ),
                  onPressed: state.enablePost
                      ? () {
                          closeKeyboard();
                          bloc.add(DoAddStoryEvent(txtController.text));
                        }
                      : null,
                  child: state.isLoading
                      ? const LoadingChild(size: 28)
                      : Text(
                          local.add,
                          style: text20w600,
                        ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
