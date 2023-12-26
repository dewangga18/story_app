part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final List<StoryData> list;
  final bool isLoading;
  final bool isError;

  const DashboardState({
    required this.list,
    this.isLoading = false,
    this.isError = false,
  });

  DashboardState copywith({
    bool? isLoading,
    bool? isError,
    List<StoryData>? list,
  }) {
    return DashboardState(
      list: list ?? this.list,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [list, isError, isLoading];
}
