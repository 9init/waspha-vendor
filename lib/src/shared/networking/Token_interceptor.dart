import 'package:dio/dio.dart';
import 'package:vendor/src/shared/networking/Networking.dart';

class TokenInterceptor extends Interceptor {
  final Dio _dio;
  TokenInterceptor(this._dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Check if the error is due to unauthorized access
    if (err.response?.statusCode == 401) {
      // Token is in the cookies
      await Networking.post("resume-access-token", {});
      return handler.resolve(await _dio.fetch(err.requestOptions));
    }

    return handler.next(err);
  }
}
