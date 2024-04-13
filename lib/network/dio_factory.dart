import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  Dio dio = Dio();
  DioFactory() {
    //  dio.interceptors
    //     .add(PrettyDioLogger(requestHeader: true, requestBody: true));
  }
}
