import 'package:clean_network/app/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../service_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    //
    homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    homeViewModel.fetchData();
    // service.videosForChef().then((data) {
    //   setState(() {
    //     videosForChef = data;
    //   });
    //   data.when(success: (videosForChef) {
    //     // Success
    //     if (kDebugMode) print(videosForChef.data!.first.chef!.name);
    //   }, failure: (networkError) {
    //     // Failed
    //     if (kDebugMode) print({networkError.localizedErrorMessage});
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text("Tiktok")),
      body: Center(
        child: Consumer<HomeViewModel>(
          builder: (context, model, child) {
            // YOUR WIDGET
            //
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: model.urlsList.length,
              controller: PageController(
                initialPage: 0,
                viewportFraction: 1,
              ),
              itemBuilder: (context, index) {
                index = index % (model.urlsList.length);
                //
                return checkVideoControllerAndGetWidget(model);
              },
              onPageChanged: (index) {
                // if (model.newIndexIsAvailable(index))
                model.changeVideo(index);
                //
              },
            );
          },
          child: Text("a"),
        ),
      ),
    );
  }
}

Widget checkVideoControllerAndGetWidget(HomeViewModel viewModel) {
  if (viewModel.controller == null) {
    // while null reloading
    return Center(
      child: CircularProgressIndicator(),
    );
  } else {
    // auto play on start
    viewModel.controller!.play();

    return videoCard(viewModel.controller!);
  }
}

//MARK: - Video Cell
Widget videoCard(VideoPlayerController controller) {
  return Consumer<HomeViewModel>(
    builder: (context, model, child) {
      return !model.isLoading
          ? GestureDetector(
              onTap: () {
                controller.value.isPlaying
                    ? controller.pause()
                    : controller.play();
              },
              child: SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: controller.value.size.width,
                    height: controller.value.size.height,
                    child: VideoPlayer(controller),
                  ),
                ),
              ),
            )
          : Container(
              color: Colors.white,
              child: Center(
                child: Text("Loading"),
              ),
            );
    },
    child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("description is here")
                // VideoDescription(video.user, video.videoTitle, video.songName),
                // ActionsToolbar(video.likes, video.comments,
                //     "https://www.andersonsobelcosmetic.com/wp-content/uploads/2018/09/chin-implant-vs-fillers-best-for-improving-profile-bellevue-washington-chin-surgery.jpg"),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ],
    ),
  );
}
