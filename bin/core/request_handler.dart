import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:shelf/src/request.dart';
import 'package:shelf/src/response.dart';

import 'http_method.dart';

abstract class RequestHandler {
  String get path;

  Future<Response> handle(Request request) async {
    try {
      switch (request.method) {
        case HttpMethod.GET:
          return get(request);
        case HttpMethod.POST:
          return post(request);
        case HttpMethod.PATCH:
          return patch(request);
        case HttpMethod.PUT:
          return put(request);
        case HttpMethod.DELETE:
          return delete(request);
        case HttpMethod.HEAD:
          return head(request);
        case HttpMethod.OPTIONS:
          return options(request);
        default:
          return _defaultResponse();
      }
    } catch (_) {
      return _defaultResponse();
    }
  }

  Future<Response> get(Request request) {
    return _defaultResponse();
  }

  Future<Response> post(Request request) {
    return _defaultResponse();
  }

  Future<Response> patch(Request request) {
    return _defaultResponse();
  }

  Future<Response> put(Request request) {
    return _defaultResponse();
  }

  Future<Response> delete(Request request) {
    return _defaultResponse();
  }

  Future<Response> head(Request request) {
    return _defaultResponse();
  }

  Future<Response> options(Request request) {
    return _defaultResponse();
  }

  Future<Response> _defaultResponse() async {
    return Response.badRequest();
  }

  Future<Response> jsonResponse(dynamic body) async {
    return Response(
      HttpStatus.ok,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      },
      body: jsonEncode(
        body is Future ? await body : body,
        toEncodable: (dynamic obj) {
          return obj.toJson();
        },
      ),
    );
  }
}
