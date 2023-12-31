import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:story_app/data/api/api_services.dart';
import 'package:story_app/data/models/story_data.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(ApiService api) : super(const DashboardState(list: [])) {
    on<GetListDataEvent>((event, emit) async {
      emit(state.copywith(isLoading: true, isError: false));

      final response = await api.getStoryData();

      emit(state.copywith(
        isError: response.error ?? true,
        isLoading: false,
        list: response.listStory,
        enableScrollMore: response.listStory.isNotEmpty,
      ));
    });

    on<LoadmoreEvent>((event, emit) async {
      emit(state.copywith(
        loadingMore: true,
        page: state.page + 1,
      ));

      final response = await api.getStoryData(
        page: state.page,
      );

      if (response.listStory.isEmpty) {
        emit(state.copywith(
          loadingMore: false,
          enableScrollMore: false,
          page: state.page - 1,
        ));
      } else {
        List<StoryData> list = List.of(state.list);
        list.addAll(response.listStory);
        emit(DashboardState(
          list: list,
          enableScrollMore: true,
          page: state.page,
        ));
      }
    });
  }
}
