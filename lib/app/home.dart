import 'package:clean_network/app/home.viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel homeViewModel;

  @override
  void initState() {
    // getting provider from context after initialised on RunApp
    homeViewModel = Provider.of<HomeViewModel>(context, listen: false);

    homeViewModel.fetchData();
    //
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
                // index = index % (model.urlsList.length);
                // auto play on start
                model.controller.play();

                return videoCard(model.controller);
              },
              onPageChanged: (index) {
                //
                print(index);
                model.changeVideo(index);
              },
            );
          },
          child: const Text("a"),
        ),
      ),
    );
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
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
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
