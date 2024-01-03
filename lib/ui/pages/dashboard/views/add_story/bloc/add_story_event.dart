part of 'add_story_bloc.dart';

sealed class AddStoryEvent extends Equatable {
  const AddStoryEvent();

  @override
  List<Object> get props => [];
}

final class PickGalleryEvent extends AddStoryEvent {}

final class PickCameraEvent extends AddStoryEvent {}

final class RemoveImageEvent extends AddStoryEvent {}

final class SetVariableFalse extends AddStoryEvent {}

final class RefreshVariable extends AddStoryEvent {}

final class CheckEnablePostEvent extends AddStoryEvent {
  final String description;

  const CheckEnablePostEvent(this.description);
}

final class DoAddStoryEvent extends AddStoryEvent {
  final String description;

  const DoAddStoryEvent(this.description);
}

final class PickLocationEvent extends AddStoryEvent {
  final LatLng loc;

  const PickLocationEvent(this.loc);
}
