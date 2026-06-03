import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class HttpErrorLogger {
  static void logResponse(
    http.Response response, {
    required String operation,
    Iterable<int> successCodes = const [200],
  }) {
    if (successCodes.contains(response.statusCode)) {
      return;
    }

    debugPrint(
      '[HTTP ERROR] $operation '
      '${response.request?.method ?? 'REQUEST'} ${response.request?.url} '
      'status=${response.statusCode} body=${response.body}',
    );
  }

  static void logStreamedResponse(
    http.StreamedResponse response,
    String body, {
    required String operation,
    Iterable<int> successCodes = const [200],
  }) {
    if (successCodes.contains(response.statusCode)) {
      return;
    }

    debugPrint(
      '[HTTP ERROR] $operation '
      '${response.request?.method ?? 'REQUEST'} ${response.request?.url} '
      'status=${response.statusCode} body=$body',
    );
  }
}
