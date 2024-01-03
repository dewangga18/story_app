import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:story_app/data/models/general_model.dart';
import 'package:story_app/data/models/login_response.dart';
import 'package:story_app/data/models/payload/add_story_payload.dart';
import 'package:story_app/data/models/payload/login_payload.dart';
import 'package:story_app/data/models/payload/register_payload.dart';
import 'package:story_app/data/models/story_response.dart';
import 'package:story_app/global_bloc/app_bloc.dart';

class ApiService {
  static const String _baseUrl = 'https://story-api.dicoding.dev/v1';

  Map<String, String> headers({bool isPost = false}) {
    return {
      'Authorization': 'Bearer ${userData?.token}',
      if (isPost) 'Content-type': 'multipart/form-data',
    };
  }

  Future<StoryResponse> getStoryData({
    int page = 1,
    int size = 10,
    int location = 1,
  }) async {
    try {
      final url = Uri.parse(
        '$_baseUrl/stories?page=$page&size=$size&location=$location',
      );
      log(url.toString(), name: 'GET');
      final response = await http.get(
        url,
        headers: headers(),
      );
      log(response.body, name: 'RESULT');
      return StoryResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      return StoryResponse(error: true);
    }
  }

  Future<GeneralResponse> addStoryData(AddStoryPayload data) async {
    try {
      final uri = Uri.parse('$_baseUrl/stories');
      log(uri.toString(), name: 'POST');
      var request = http.MultipartRequest('POST', uri);

      final multiPartFile = http.MultipartFile.fromBytes(
        "photo",
        data.photo,
        filename: data.fileName,
      );
      final Map<String, String> fields = {
        "description": data.description,
        if (data.lat != null) "lat": '${data.lat}',
        if (data.lon != null) "lon": '${data.lon}',
      };

      request.files.add(multiPartFile);
      request.fields.addAll(fields);
      request.headers.addAll(headers(isPost: true));

      final http.StreamedResponse streamedResponse = await request.send();
      final int statusCode = streamedResponse.statusCode;
      final Uint8List responseList = await streamedResponse.stream.toBytes();
      final String responseData = String.fromCharCodes(responseList);

      log(responseData, name: 'RESULT');

      if (statusCode == 201) {
        return GeneralResponse.fromJson(jsonDecode(responseData));
      }
      return const GeneralResponse(error: true);
    } catch (error) {
      return const GeneralResponse(error: true);
    }
  }

  Future<GeneralResponse> doRegister(RegisterPayload data) async {
    try {
      final url = Uri.parse('$_baseUrl/register');
      log(url.toString(), name: 'POST');
      final response = await http.post(
        url,
        body: data.toJson(),
      );
      log(response.body, name: 'RESULT');
      return GeneralResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      return const GeneralResponse(error: true);
    }
  }

  Future<LoginResponse> doLogin(LoginPayload data) async {
    try {
      final url = Uri.parse('$_baseUrl/login');
      log(url.toString(), name: 'POST');
      final response = await http.post(
        url,
        body: data.toJson(),
      );
      log(response.body, name: 'RESULT');
      return LoginResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      return const LoginResponse(error: true);
    }
  }
}
