import 'dart:io';

import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vendor/src/models/networking/request_method.dart';
import 'package:vendor/src/models/networking/results.dart';

/// A singleton class for handling network requests using Dio.
class Networking {
  static Networking? _self;

  // ignore: constant_identifier_names
  static const String BASE_URL = "https://api.waspha.com/vendor";

  static BaseOptions options = BaseOptions(
    baseUrl: BASE_URL,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  final _dio = Dio(options);

  /// Private constructor for singleton pattern.
  Networking._() {
    _self = this;
    prepareJar();
  }

  /// Gets the singleton instance of the [Networking] class.
  static Networking _instance() {
    _self ??= Networking._();
    return _self!;
  }

  /// Initializes a cookie jar for managing cookies during network requests.
  Future<void> prepareJar() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final jar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    );
    _dio.interceptors.add(CookieManager(jar));
  }

  /// Makes a generic HTTP request with the specified [url], [requestMethod], and optional [data].
  ///
  /// Returns a [Result] containing either a [Response] on success or an [Exception] on failure.
  static Future<Result<Response<T>, Exception>> call<T>(
      url, RequestMethod requestMethod,
      {Object? data}) async {
    try {
      final Response<T> response = await _instance()._dio.fetch(
            RequestOptions(
              baseUrl: BASE_URL + url,
              method: "$requestMethod",
              data: data,
            ),
          );

      return Success(response);
    } on DioException catch (e) {
      print(e);
      return Failure(e);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  /// Makes a POST request with the specified [url] and [data].
  static Future<Result<Response<T>, Exception>> post<T>(
      String url, dynamic data) async {
    return call(url, RequestMethod.POST, data: data);
  }

  /// Makes a GET request with the specified [url] and optional [data].
  static Future<Result<Response<T>, Exception>> get<T>(
      String url, dynamic data) async {
    return call(url, RequestMethod.GET, data: data);
  }

  /// Makes a DELETE request with the specified [url] and optional [data].
  static Future<Result<Response<T>, Exception>> delete<T>(
      String url, dynamic data) async {
    return call(url, RequestMethod.DELETE, data: data);
  }
}