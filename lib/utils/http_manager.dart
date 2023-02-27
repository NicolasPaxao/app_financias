import 'package:dio/dio.dart';

class HttpManager {
  Future<Map> request({
    required String url,
    required String method,
  }) async {
    Dio dio = Dio();
    try {
      final result = await dio.request(
        url,
        options: Options(
          method: method,
        ),
      );

      return result.data['results'];
    } on DioError catch (error) {
      return error.response?.data ?? {};
    } catch (e) {
      return {"error": e};
    }
  }
}
