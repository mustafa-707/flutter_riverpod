import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_templete/provider/app_settings.dart';
import 'package:flutter_templete/services/apis/profile.dart';
import 'package:flutter_templete/utils/helpers/exceptions.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;

final backendProvider = Provider<BackendAPIService>((ref) {
  return BackendAPIService(ref: ref);
});

class BackendAPIService {
  final Ref ref;
  final String baseUrl;

  // services:
  late UsersAPIService users;

  BackendAPIService({
    this.baseUrl = "https://.staging.net", // TODO : staging
    required this.ref,
  }) {
    users = UsersAPIService(backend: this);
  }

  Future<ResponseType> request<ResponseType, JsonType>(
    String relativeUrl, {
    RequestMethod method = RequestMethod.get,
    Map<String, String>? queryParams,
    Map<String, dynamic>? jsonBody,
    Map<String, String>? extraHeaders,
    required ResponseType Function(JsonType) fromJson,
    bool isDataResponse = true,
    File? file,
  }) async {
    // create url
    final uri = Uri.parse("$baseUrl/$relativeUrl")
        .replace(queryParameters: queryParams);

    // create headers
    final requestHeaders = <String, String>{};
    if (extraHeaders != null) requestHeaders.addAll(extraHeaders);
    requestHeaders.putIfAbsent(
        "Accept-language", () => ref.read(currentLocaleProvider));
    if (jsonBody != null) {
      requestHeaders.putIfAbsent("Content-type", () => "application/json");
    }

    final encodedBody = jsonBody != null ? json.encode(jsonBody) : null;

    try {
      final response = await () async {
        switch (method) {
          case RequestMethod.get:
            assert(jsonBody == null);
            return http.get(uri, headers: requestHeaders);
          case RequestMethod.post:
            return http.post(uri, headers: requestHeaders, body: encodedBody);
          case RequestMethod.put:
            return http.put(uri, headers: requestHeaders, body: encodedBody);
          case RequestMethod.delete:
            return http.delete(uri, headers: requestHeaders, body: encodedBody);
        }
      }();
      final body = () {
        try {
          return json.decode(response.body);
        } catch (e) {
          return response.reasonPhrase;
        }
      }();

      log(
        "[${response.statusCode} ${response.reasonPhrase}] [$baseUrl/$relativeUrl]",
      );

      if (response.statusCode < 200 || response.statusCode >= 400) {
        String errorMessage;

        try {
          errorMessage = body["message"] as String;
        } catch (e) {
          log(
            "Api Error: [${response.statusCode} ${response.reasonPhrase}] [$e]",
          );
          throw UnknownException(message: "Api Error: $e ${body.toString()}");
        }

        throw ApplicationException(
            code: response.statusCode.toString(), text: errorMessage);
      }

      try {
        // log(body['data'].toString());
        return fromJson(isDataResponse ? body['data'] : body);
      } catch (e) {
        log(
          "Parse Error: [${response.statusCode} ${response.reasonPhrase}] [$e]",
        );
        throw UnknownException(
          message: "Parse Error: $e ${body.toString()}",
        );
      }
    } on SocketException {
      throw const ConnectionErrorException();
    } on TimeoutException {
      throw const ConnectionErrorException();
    }
  }
}

enum RequestMethod {
  get,
  post,
  put,
  delete,
}
