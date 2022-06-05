// Copyright 2022 The Amphitheatre Authors.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'base_api_service.dart';
import '../app_exception.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future get(String path) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(baseUrl + path));
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return jsonResponse;
  }

  @override
  Future post(String path, Map<String, String> params) async {
    dynamic jsonResponse;
    try {
      final response = await http.post(Uri.parse(baseUrl + path), body: params);
      jsonResponse = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NotFountException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server'
            ' with status code: ${response.statusCode}');
    }
  }
}
