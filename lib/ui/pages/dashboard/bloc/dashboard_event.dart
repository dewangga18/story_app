part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

final class GetListDataEvent extends DashboardEvent {}

final class LoadmoreEvent extends DashboardEvent {}