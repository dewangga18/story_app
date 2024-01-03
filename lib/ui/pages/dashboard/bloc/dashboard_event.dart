part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

final class GetListDataEvent extends DashboardEvent {}

final class LoadmoreEvent extends DashboardEvent {}

final class ViewLocationEvent extends DashboardEvent {
  final double lat;
  final double lon;
  final BuildContext context;

  const ViewLocationEvent({
    required this.lat,
    required this.lon,
    required this.context,
  });

  @override
  List<Object> get props => [lat, lon, context];
}
