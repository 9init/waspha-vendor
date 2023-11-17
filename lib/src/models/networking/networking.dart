import 'dart:io';

import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vendor/src/models/networking/request_method.dart';
import 'package:vendor/src/models/networking/results.dart';

class Networking {
  static Networking? _self;
  // ignore: constant_identifier_names
  static const String BASE_URL = "https://api.waspha.com/";

  static BaseOptions options = BaseOptions(
    baseUrl: BASE_URL,
    responseType: ResponseType.json,
    receiveDataWhenStatusError: true,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  final _dio = Dio(options);

  static Networking instance() {
    _self ??= Networking._();
    return _self!;
  }

  Networking._() {
    _self = this;
    prepareJar();
  }

  Future<void> prepareJar() async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final String appDocPath = appDocDir.path;
    final jar = PersistCookieJar(
      ignoreExpires: true,
      storage: FileStorage("$appDocPath/.cookies/"),
    );
    _dio.interceptors.add(CookieManager(jar));
  }

  static Future<Result<Response, Exception>> call(
      url, RequestMethod requestMethod,
      {Object? data}) async {
    try {
      Response response = await instance()
          ._dio
          .fetch(RequestOptions(method: "$requestMethod", data: data));
      return Success(response);
    } on DioException catch (e) {
      return Failure(e);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  static Future<Result<Response, Exception>> post(
      String url, dynamic data) async {
    return call(url, RequestMethod.POST, data: data);
  }

  static Future<Result<Response, Exception>> get(
      String url, dynamic data) async {
    return call(url, RequestMethod.GET, data: data);
  }

  static Future<Result<Response, Exception>> delete(
      String url, dynamic data) async {
    return call(url, RequestMethod.DELETE, data: data);
  }
}
