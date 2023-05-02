import 'package:clean_network/app/view_models/loading.viewmodel.dart';
import 'package:flutter/foundation.dart';
import 'package:video_player/video_player.dart';

import '../core/models/videos_for_chef.dart';
import '../core/placeholder_service.dart';

class HomeViewModel extends LoadingViewModel {
  //1 injecting Home Network service
  final HomeRepo repo;

  HomeViewModel({
    required this.repo,
  });

  int prevVideo = 0;

//2) making getter & setter for returned Model

  // Default
  late VideosForChefModel videosForChefModel = VideosForChefModel();
  List<String> urlsList = [];

  // Network call
  Future<void> fetchData() async {
    await Future.delayed(Duration(milliseconds: 0));

    // start loading
    isLoading = true;

    // _homeModel = await repo.videosForChef();

    repo.videosForChef().then((data) {
      data.when(success: (videosForChef) {
        // Success
        if (kDebugMode) print(videosForChef.data!.first.chef!.name);

        videosForChefModel = videosForChef;

        // change ro local
        // _useLocalUrlsOrBackEndUrls(
        //     LocalUrlsOrBackEndUrls.backend, videosForChef.data!);

        // change ro local
        _useLocalUrlsOrBackEndUrls(LocalUrlsOrBackEndUrls.local, []);
        //
      }, failure: (networkError) {
        // Failed
        if (kDebugMode) print({networkError.localizedErrorMessage});

        // play from local
        urlsList = publicVideos;

        
        // changeVideo(0, url: urlsList[0]);
      });
    });

    isLoading = false;
    // notifyListeners();
  }

  VideoPlayerController? _controller = VideoPlayerController.network("");
  VideoPlayerController? get controller => _controller;
}

// MARK: - Player Helpers
extension VMPlayerHelpers on HomeViewModel {
  String getLinkWithIndex(int index) => urlsList[index];

  Future<VideoPlayerController> instantiateController(String url) async {
    VideoPlayerController controller = VideoPlayerController.network(url);
    await controller.initialize();
    controller.setLooping(true);
    return controller;
  }

  // Player controller
  changeVideo(index, {String url = "no url provided"}) async {
    // homeModel.data![index].url ?? ""

    // print(urlsList);
    isLoading = true;

    final urlString = url == "no url provided" ? urlsList[index] : url;

    print("chosen url after change video");
    print(urlString);

//https: //stackoverflow.com/questions/58955831/flutter-video-player-dispose

    // pause last video
    if (_controller != null) {
      await _controller!.pause();
      await _controller!.dispose();
    }
    //
    _controller = null;

    // .then((value) => _controller = VideoPlayerController.network(""));

    // to clear screen after removing player
    // notifyListeners();

    _controller = await instantiateController(urlString);

    isLoading = false;

    prevVideo = index;
  }
}

// MARK: - Network and Data Helpers
extension VMNetworkHelpers on HomeViewModel {
  _useLocalUrlsOrBackEndUrls(LocalUrlsOrBackEndUrls toUse, List<Datum> data) {
    switch (toUse) {
      case LocalUrlsOrBackEndUrls.backend:
        final urls = data
            .map((video) {
              if (video.url!.endsWith('.mp4')) return video.url;
            })
            // to clear null values
            .whereType<String>()
            .toList();
        //
        urlsList = urls;
        // changeVideo(0, url: urlsList[0]);

        break;
      case LocalUrlsOrBackEndUrls.local:
        final validPublicVideos = publicVideos
            .map((url) {
              if (_getValidUrlOnly(url)) return url;
            })
            // to clear null values
            .whereType<String>()
            .toList();

        urlsList = validPublicVideos;
        //
        break;
    }
    // to play video
    changeVideo(0, url: urlsList[0]);
  }

  //
  //
  bool _getValidUrlOnly(String url) {
    return url.endsWith('.mp4');
  }
}

enum LocalUrlsOrBackEndUrls {
  local,
  backend;
}

const publicVideos = [
  "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.jpg",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
];
