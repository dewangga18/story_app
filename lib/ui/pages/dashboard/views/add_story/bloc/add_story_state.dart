part of 'add_story_bloc.dart';

class AddStoryState extends Equatable {
  final bool isLoading;
  final bool isError;
  final bool enablePost;
  final bool isSuccess;
  final XFile? file;
  final String? desc;

  const AddStoryState({
    this.isLoading = false,
    this.isError = false,
    this.enablePost = false,
    this.isSuccess = false,
    this.file,
    this.desc,
  });

  AddStoryState copywith({
    bool? isLoading,
    bool? isError,
    bool? enablePost,
    bool? isSuccess,
    XFile? file,
    String? desc,
  }) {
    return AddStoryState(
      isError: isError ?? this.isError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      enablePost: enablePost ?? this.enablePost,
      file: file ?? this.file,
      desc: desc ?? this.desc,
    );
  }

  @override
  List<Object> get props => [
        isError,
        isLoading,
        enablePost,
        isSuccess,
        file?.path ?? '',
        desc ?? '',
      ];
}
