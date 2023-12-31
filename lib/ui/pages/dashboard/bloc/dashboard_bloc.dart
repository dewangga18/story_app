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
      ));
    });
  }
}
