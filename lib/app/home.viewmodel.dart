import 'package:clean_network/app/view_models/loading.viewmodel.dart';
import 'package:flutter/foundation.dart';

import '../core/models/videos_for_chef.dart';
import '../core/placeholder_service.dart';

import 'package:video_player/video_player.dart';

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

class HomeViewModel extends LoadingViewModel {
  //1 injecting Home Network service
  final HomeRepo repo;

  HomeViewModel({
    required this.repo,
  });

  int prevVideo = 0;

//2) making getter & setter for returned Model

  // Default
  late VideosForChefModel _homeModel = VideosForChefModel();
  List<String> urlsList = [];
  // Getter
  VideosForChefModel get homeModel => _homeModel;

  // setter
  set homeModel(VideosForChefModel homeModel) {
    _homeModel = homeModel;

    // notifyListeners();
  }

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
        homeModel = videosForChef;

        if (false) {
          // play first video
          final urls = homeModel.data!
              .map((video) {
                if (video.url!.endsWith('.mp4')) return video.url;

                // .toList();
              })
              .whereType<String>()
              .toList();
          //
          urlsList = urls;
        } else {
          //
          urlsList = publicVideos;
          changeVideo(0, url: urlsList[0]);
        }
        //
      }, failure: (networkError) {
        // Failed
        if (kDebugMode) print({networkError.localizedErrorMessage});
      });
    });

    isLoading = false;
    // notifyListeners();
  }

  VideoPlayerController? _controller;
  VideoPlayerController? get controller => _controller;

  Future<VideoPlayerController> _instantiateController(String url) async {
    VideoPlayerController controller = VideoPlayerController.network(url);
    await controller.initialize();
    controller.setLooping(true);
    return controller;
  }

  bool newIndexIsAvailable(int index) {
    final listOfIndices = List.generate(urlsList.length, (i) => i);

    if (listOfIndices.contains(index)) {
      print("index chosn");
      print(index);
      return true;
    }

    return false;
  }

  // Player controller
  changeVideo(index, {String url = "no url provided"}) async {
    // homeModel.data![index].url ?? ""
    final urlString = url == "no url provided" ? urlsList[index] : url;

    print("chosen url after change video");
    print(urlString);

    // pause last video
    if (_controller != null) _controller!.pause();

    // start controller with new video
    // if (_controller != null) {
    // _controller!.removeListener(() {});
    _controller = null;

    // to clear screen after removing player
    notifyListeners();

    _controller = await _instantiateController(urlString);
    // }

    _controller!.play();

    prevVideo = index;

    notifyListeners();
  }
}
