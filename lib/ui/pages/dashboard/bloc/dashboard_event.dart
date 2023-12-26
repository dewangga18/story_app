part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();
}

final class GetListDataEvent extends DashboardEvent {
  @override
  List<Object> get props => [];
}
