part of 'add_story_bloc.dart';

class AddStoryState extends Equatable {
  final bool isLoading;
  final bool isError;
  final bool enablePost;
  final bool isSuccess;
  final XFile? file;
  final String? desc;
  final LatLng? loc;
  final String? locText;

  const AddStoryState({
    this.isLoading = false,
    this.isError = false,
    this.enablePost = false,
    this.isSuccess = false,
    this.file,
    this.desc,
    this.loc,
    this.locText,
  });

  AddStoryState copywith({
    bool? isLoading,
    bool? isError,
    bool? enablePost,
    bool? isSuccess,
    XFile? file,
    String? desc,
    LatLng? loc,
    String? locText,
  }) {
    return AddStoryState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      enablePost: enablePost ?? this.enablePost,
      file: file ?? this.file,
      desc: desc ?? this.desc,
      loc: loc ?? this.loc,
      locText: locText ?? this.locText,
    );
  }

  @override
  List<Object?> get props => [
        isError,
        isLoading,
        enablePost,
        isSuccess,
        file?.path,
        desc,
        loc,
        locText,
      ];
}
