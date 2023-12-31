part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final List<StoryData> list;
  final bool isLoading;
  final bool enableScrollMore;
  final bool isError;
  final int page;
  final bool loadingMore;

  const DashboardState({
    required this.list,
    this.isLoading = false,
    this.enableScrollMore = false,
    this.isError = false,
    this.page = 1,
    this.loadingMore = false,
  });

  DashboardState copywith({
    bool? isLoading,
    bool? isError,
    bool? enableScrollMore,
    int? page,
    List<StoryData>? list,
    bool? loadingMore,
  }) {
    return DashboardState(
      list: list ?? this.list,
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      enableScrollMore: enableScrollMore ?? this.enableScrollMore,
      page: page ?? this.page,
      loadingMore: loadingMore ?? this.loadingMore,
    );
  }

  @override
  String toString() {
    return 'Dashboard state\n'
        'isError => $isError '
        '\nisLoading => $isLoading'
        '\npage => $page'
        '\nloadingMore => $loadingMore'
        '\nenableScrollMore => $enableScrollMore';
  }

  @override
  List<Object> get props => [
        list,
        isError,
        isLoading,
        enableScrollMore,
        page,
        loadingMore,
      ];
}
