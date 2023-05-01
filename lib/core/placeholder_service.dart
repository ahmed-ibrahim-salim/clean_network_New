import 'package:clean_network/core/requests/repo_videos_for_chef.dart';
import 'package:clean_network/core/models/videos_for_chef.dart';
import 'package:clean_network/core/network/layers/network_executer.dart';

import 'network_helpers/network_error.dart';
import 'network_helpers/result.dart';

abstract class HomeRepo {
  Future<Result<VideosForChefModel, NetworkError>> videosForChef();
}

class JsonPlaceHolderService extends HomeRepo {
  Future<Result<VideosForChefModel, NetworkError>> videosForChef() async {
    return NetworkExecuter.execute<VideosForChefModel, VideosForChefModel>(
        route: VideosForChefClient.videosForChef(),
        responseType: VideosForChefModel());
  }
}
