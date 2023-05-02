//
//
//

////
//
////
//
//
//

// Models must implement toJson
abstract class BaseNetworkModel<T> {
  T fromJson(Map<String, dynamic> json);
}

abstract class BaseClientGenerator {
  const BaseClientGenerator();
  String get path;
  RequestMethod get method;
  String get baseURL;
  dynamic get body;
  Map<String, dynamic>? get queryParameters;
  Map<String, dynamic> get header;
  Duration? get sendTimeout => Duration(milliseconds: 30000);
  Duration? get receiveTimeOut => Duration(milliseconds: 30000);
}

enum RequestMethod {
  GET("GET"),
  POST("POST");

  const RequestMethod(this.rawValue);
  final String rawValue;
}
