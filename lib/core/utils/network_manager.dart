import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../data/base_model.dart';

class NetworkManager {
  late Dio _dio;
  Dio get dio => _dio;

  static const url = "https://apimocha.com";
  static NetworkManager? _instance;
  static NetworkManager get instance {
    _instance ??= NetworkManager.init();
    return _instance!;
  }

  NetworkManager.init() {
    final BaseOptions baseOptions = BaseOptions(
        baseUrl: url,
        headers: {"Charset": "utf-8"},
        validateStatus: ((status) => true),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json);
    _dio = Dio(baseOptions);
  }

  Future get<T extends IBaseModel>({
    required String path,
    required T? model,
    Map<String, dynamic>? queryParameters,
    BuildContext? context,
  }) async {
    try {
      if (context != null) {
        //show loader
      }
      final response = await _dio.get(path, queryParameters: queryParameters);

      switch (response.statusCode) {
        case HttpStatus.ok:
          return _jsonBodyParser<T>(
            model!,
            response.data,
          );
        default:
          return _jsonBodyParser<T>(
            model!,
            response.data,
          );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      if (context != null) {
        //hide loader
      }
    }
  }

  Future post<T extends IBaseModel>({
    required String path,
    required T model,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    BuildContext? context,
  }) async {
    try {
      if (context != null) {
//show loader
      }
      final response = await _dio.post(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          return _jsonBodyParser<T>(
            model,
            response.data,
          );
        default:
          return _jsonBodyParser<T>(
            model,
            response.data,
          );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (context != null) {
        //hide loader
      }
    }
  }

  Future put<T extends IBaseModel>({
    required String path,
    required T model,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    BuildContext? context,
  }) async {
    try {
      if (context != null) {}
      final response = await _dio.put(
        path,
        queryParameters: queryParameters,
        data: data,
      );

      switch (response.statusCode) {
        case HttpStatus.ok:
          return _jsonBodyParser<T>(
            model,
            response.data,
          );
        default:
          return _jsonBodyParser<T>(
            model,
            response.data,
          );
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      if (context != null) {}
    }
  }

  Future delete<T extends IBaseModel>({
    required String path,
    required T model,
    Map<String, dynamic>? queryParameters,
    BuildContext? context,
  }) async {
    try {
      if (context != null) {
        //show loader
      }
      final response = await _dio.delete(path, queryParameters: queryParameters);

      switch (response.statusCode) {
        case HttpStatus.ok:
          return _jsonBodyParser<T>(
            model,
            response.data,
          );
        default:
          return _jsonBodyParser<T>(
            model,
            response.data,
          );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      if (context != null) {
        //hide loader
      }
    }
  }

  dynamic _jsonBodyParser<T>(
    IBaseModel model,
    data,
  ) async {
    try {
      if (data is List) {
        return data.map((e) => model.fromJson(e)).toList().cast<T>();
      } else if (data is Map) {
        return model.fromJson(data);
      } else {
        return data;
      }
    } catch (ex) {
      return data;
    }
  }
}
