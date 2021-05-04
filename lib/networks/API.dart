import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart' as Dotenv;

final String _baseURL = Dotenv.env['BASE_URL'];

class APIResponse {
  APIResponse({this.message, this.data, this.statusCode});

  final String message;
  final int statusCode;
  final dynamic data;
}

dynamic _response(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJSON = json.decode(response.body.toString());
      return APIResponse(
          data: responseJSON['data'],
          message: responseJSON['message'] ?? 'success',
          statusCode: 200);

    default:
      throw Exception(response.body.toString());
  }
}

Map<String, String> _getHeaders() {
  return {
    'Accept': 'application/json',
    'Content-Type': 'application/json; charset=UTF-8',
  };
}

class API {
  static Future get(
    String url,
  ) async {
    var headers = _getHeaders();
    var response = await http.get("$_baseURL/$url", headers: headers);
    return _response(response);
  }

  static Future post(String url, dynamic data) async {
    var headers = _getHeaders();
    var body = jsonEncode(data);
    var response =
        await http.post("$_baseURL/$url", headers: headers, body: body);
    return _response(response);
  }
}
