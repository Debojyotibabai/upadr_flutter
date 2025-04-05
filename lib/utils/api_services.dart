// ignore_for_file: avoid_print

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// import 'package:shared_preferences/shared_preferences.dart';

enum DioMethod { post, get, put, patch, delete }

enum ContentType { json, formUrlEncoded, multiPartFormData }

class APIService {
  APIService._singletons();

  static final APIService instance = APIService._singletons();

  String get baseUrl {
    if (kDebugMode) {
      return 'https://dev-api.upadr.com/';
    }

    return 'https://dev-api.upadr.com/';
  }

  String getContentType(ContentType type) {
    switch (type) {
      case ContentType.json:
        return Headers.jsonContentType;
      case ContentType.formUrlEncoded:
        return Headers.formUrlEncodedContentType;
      case ContentType.multiPartFormData:
        return Headers.multipartFormDataContentType;
    }
  }

  Future<Response> request(
    String endpoint,
    DioMethod method, {
    Map<String, dynamic>? param,
    ContentType contentType = ContentType.formUrlEncoded,
    formData,
  }) async {
    try {
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // final token = prefs.getString("token");

      final dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          contentType: getContentType(contentType),
          // headers: {
          //   'authorization': 'Bearer $token',
          // },
        ),
      );

      switch (method) {
        case DioMethod.post:
          return await dio.post(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.get:
          return await dio.get(
            endpoint,
            queryParameters: param,
          );
        case DioMethod.put:
          return await dio.put(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.delete:
          return await dio.delete(
            endpoint,
            data: param ?? formData,
          );
        case DioMethod.patch:
          return await dio.patch(
            endpoint,
            data: param ?? formData,
          );
      }
    } on DioException catch (e) {
      print(e);
      throw e.response!.data;
    } catch (e) {
      print(e);
      throw e.toString();
    }
  }
}
