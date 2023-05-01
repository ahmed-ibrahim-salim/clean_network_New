import 'package:clean_network/core/network/layers/network_options.dart';
import 'package:flutter/foundation.dart';
import '../../network_helpers/network_error.dart';
import '../../network_helpers/result.dart';
import 'network_decoder.dart';
import 'package:dio/dio.dart';
import 'network_creator.dart';
import '../interfaces/base_client_generator.dart';

// import 'package:connectivity_plus/connectivity_plus.dart';

// class NetworkConnectivity {
//   static Future<bool> get status async {
//     var connectivityResult = await (Connectivity().checkConnectivity());
//     if (connectivityResult == ConnectivityResult.none) {
//       return false;
//     } else {
//       return true;
//     }
//   }
// }

// excuter
class NetworkExecuter {
  // static bool debugMode = true;

  static Future<Result<K, NetworkError>> execute<T extends BaseNetworkModel, K>(
      {required BaseClientGenerator route,
      required T responseType,
      NetworkOptions? options}) async {
    // if (debugMode) print(route.header);

    // Check Network Connectivity
    // if (await NetworkConnectivity.status) {
    try {
      var response =
          await NetworkCreator.shared.request(route: route, options: options);
      // if (debugMode) print(response);

      var decodedData = NetworkDecoder.shared
          .decode<T, K>(response: response, responseType: responseType);
      return Result.success(decodedData);

      // NETWORK ERROR
    } on DioError catch (diorError) {
      if (kDebugMode)
        print("$route => ${NetworkError.request(error: diorError)}");
      // MARK: - Print Response error
      print(diorError.response);

      return Result.failure(NetworkError.request(error: diorError));

      // TYPE ERROR
    } on TypeError catch (e) {
      if (kDebugMode)
        print("$route => ${NetworkError.type(error: e.toString())}");
      return Result.failure(NetworkError.type(error: e.toString()));
    }

    // No Internet Connection
    // } else {
    //   if (kDebugMode)
    //     print(NetworkError.connectivity(message: 'No Internet Connection'));
    //   return Result.failure(
    //       NetworkError.connectivity(message: 'No Internet Connection'));
    // }
  }
}
