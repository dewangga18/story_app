import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:story_app/data/models/general_model.dart';
import 'package:story_app/data/models/login_response.dart';
import 'package:story_app/data/models/payload/add_story_payload.dart';
import 'package:story_app/data/models/payload/auth_payload.dart';
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

  Future<StoryResponse> getStoryData() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/stories'),
        headers: headers(),
      );
      log(response.request?.url.toString() ?? '-', name: 'GET');
      log(response.body, name: 'RESULT');
      return StoryResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      return StoryResponse(error: true);
    }
  }

  Future<GeneralResponse> addStoryData(AddStoryPayload data) async {
    try {
      final uri = Uri.parse('$_baseUrl/stories');
      var request = http.MultipartRequest('POST', uri);

      final multiPartFile = http.MultipartFile.fromBytes(
        "photo",
        data.photo,
        filename: data.fileName,
      );
      final Map<String, String> fields = {
        "description": data.description,
      };

      request.files.add(multiPartFile);
      request.fields.addAll(fields);
      request.headers.addAll(headers(isPost: true));

      final http.StreamedResponse streamedResponse = await request.send();
      final int statusCode = streamedResponse.statusCode;
      final Uint8List responseList = await streamedResponse.stream.toBytes();
      final String responseData = String.fromCharCodes(responseList);

      log(request.url.toString(), name: 'POST');
      log(responseData, name: 'RESULT');

      if (statusCode == 201) {
        return GeneralResponse.fromJson(jsonDecode(responseData));
      }
      return GeneralResponse(error: true);
    } catch (error) {
      return GeneralResponse(error: true);
    }
  }

  Future<GeneralResponse> doRegister(AuthPayload data) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/register'),
        body: data.toJson(),
      );
      log(response.request?.url.toString() ?? '-', name: 'POST');
      log(response.body, name: 'RESULT');
      return GeneralResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      return GeneralResponse(error: true);
    }
  }

  Future<LoginResponse> doLogin(AuthPayload data) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/login'),
        body: data.toJson(),
      );
      log(response.request?.url.toString() ?? '-', name: 'POST');
      log(response.body, name: 'RESULT');
      return LoginResponse.fromJson(jsonDecode(response.body));
    } catch (error) {
      return LoginResponse(error: true);
    }
  }
}
