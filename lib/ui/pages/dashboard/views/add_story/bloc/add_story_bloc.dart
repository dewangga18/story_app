import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app/data/api/api_services.dart';
import 'package:image/image.dart' as img;
import 'package:story_app/data/models/payload/add_story_payload.dart';

part 'add_story_event.dart';
part 'add_story_state.dart';

class AddStoryBloc extends Bloc<AddStoryEvent, AddStoryState> {
  AddStoryBloc(ApiService api) : super(const AddStoryState()) {
    bool checkEnableFunction() {
      bool isValid = true;
      if ((state.desc?.isEmpty ?? true) ||
          state.file == null ||
          state.file?.path == '') {
        isValid = false;
      }
      return isValid;
    }

    on<PickCameraEvent>((event, emit) async {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.camera,
      );
      emit(state.copywith(file: pickedFile));
      bool isValid = checkEnableFunction();
      emit(state.copywith(enablePost: isValid));
    });

    on<PickGalleryEvent>((event, emit) async {
      final XFile? pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
      );
      emit(state.copywith(file: pickedFile));
      bool isValid = checkEnableFunction();
      emit(state.copywith(enablePost: isValid));
    });

    on<RemoveImageEvent>((event, emit) {
      emit(state.copywith(file: XFile('')));
      bool isValid = checkEnableFunction();
      emit(state.copywith(enablePost: isValid));
    });

    on<SetVariableFalse>((event, emit) {
      emit(state.copywith(
        isError: false,
        isSuccess: false,
      ));
    });

    on<RefreshVariable>((event, emit) {
      emit(const AddStoryState());
    });

    on<CheckEnablePostEvent>((event, emit) {
      emit(state.copywith(desc: event.description));
      bool isValid = checkEnableFunction();
      emit(state.copywith(enablePost: isValid));
    });

    on<DoAddStoryEvent>((event, emit) async {
      emit(state.copywith(
        isLoading: true,
      ));
      final response = await api.addStoryData(
        AddStoryPayload(
          description: event.description,
          fileName: state.file!.name,
          photo: (await compressImage(state.file!.path)).toList(),
        ),
      );
      if (response.error ?? false) {
        emit(state.copywith(
          isError: true,
          isLoading: false,
        ));
      } else {
        emit(state.copywith(
          isSuccess: true,
          isLoading: false,
        ));
      }
    });
  }

  Future<Uint8List> compressImage(String fileName) async {
    File file = File(fileName);
    List<int> bytes = await file.readAsBytes();
    Uint8List uint8List = Uint8List.fromList(bytes);
    int imageLength = bytes.length;
    if (imageLength < 1000000) return uint8List;
    final img.Image image = img.decodeImage(uint8List)!;
    int compressQuality = 100;
    int length = imageLength;
    Uint8List newByte;
    do {
      compressQuality -= 10;
      newByte = img.encodeJpg(
        image,
        quality: compressQuality,
      );
      length = newByte.length;
    } while (length > 1000000);
    return newByte;
  }
}
