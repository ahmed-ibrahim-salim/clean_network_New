import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:clean_network/core/network/interfaces/base_client_generator.dart';
part 'repo_videos_for_chef.freezed.dart';

// This is a request
@freezed
class VideosForChefClient extends BaseClientGenerator
    with _$VideosForChefClient {
  // ROTA TANIMLAMALARI
  const VideosForChefClient._() : super();

  const factory VideosForChefClient.videosForChef() = _VideosForChef;

  @override
  String get baseURL => "https://chefshub.site/api/v1/";

  @override
  Map<String, dynamic> get header => {
        "Content-Type": "application/json",
        "accept": "application/json",
        // "APP-LANG": "en",
        "CLIENT-TYPE": "ios",
        "CLIENT-VERSION": "1.0.0"
      };

  @override
  String get path {
    return this.when<String>(
      videosForChef: () => 'videos/random',
    );
  }

  @override
  RequestMethod get method {
    return this.maybeWhen<RequestMethod>(orElse: () {
      return RequestMethod.GET;
    } // Requests will be sent as GET unless otherwise specified.
        );
  }

  @override
  dynamic get body {
    return this.maybeWhen(
      orElse: () {
        // return {"by": "5"};

        return null; // AKSİ BELİRTİLMEDİKÇE BODY NULL GİDECEK.
      },
    );
  }

  @override
  Map<String, dynamic>? get queryParameters {
    return this.maybeWhen(
      orElse: () {
        // return {"by": "5"};
        return null;
        // return null; // AKSİ BELİRTİLMEDİKÇE QUERY NULL GİDECEK.
      },
    );
  }
}
