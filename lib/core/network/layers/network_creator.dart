import 'dart:io';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../interfaces/base_client_generator.dart';
import 'network_options.dart';

class NetworkCreator {
  static var shared = NetworkCreator();
  //
  //
  //
  //
  // added Dio pretty logger
  Dio _client = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));

  Future<Response> request(
      {required BaseClientGenerator route, NetworkOptions? options}) {
    //
    //
    // MARK - Forming request
    final requestOptions = RequestOptions(
        // request creation for dio
        baseUrl: route.baseURL,
        path: route.path,
        queryParameters: route.queryParameters,
        headers: route.header,
        method: route.method.rawValue,
        // Body params
        data: route.body,
        // timeout
        sendTimeout: route.sendTimeout,
        receiveTimeout: route.sendTimeout,
        // NetworkOptions
        onReceiveProgress: options?.onReceiveProgress,
        validateStatus: (statusCode) => (statusCode! >= HttpStatus.ok &&
            statusCode <= HttpStatus.multipleChoices));

    return _client.fetch(requestOptions);
  }
}
