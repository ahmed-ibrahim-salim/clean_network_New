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
                if (model.controller != null) {
                  //
                  // model.controller!.play();

                  //
                  final link = model.getLinkWithIndex(index);

                  print(link);
                  print("now now");

                  return VideoCardPlayer(link, UniqueKey());
                  //

                  // videoCard(model.controller!);
                } else {
                  //
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                }
              },
              onPageChanged: (index) {
                // print(link);
                // _onControllerChange(link, model.controller);
                // model.changeVideo(index);
              },
            );
          },
          child: const Text("a"),
        ),
      ),
    );
  }
}

class VideoCardPlayer extends StatefulWidget {
  final String videoLink;
  final UniqueKey newKey;

  VideoCardPlayer(this.videoLink, this.newKey) : super(key: newKey);

  @override
  _VideoCardPlayerState createState() => _VideoCardPlayerState();
}

class _VideoCardPlayerState extends State<VideoCardPlayer> {
  //
  late VideoPlayerController _controller;

  @override
  void initState() {
    //
    _controller = VideoPlayerController.network(widget.videoLink);

    _controller.setLooping(true);
    _controller.initialize();
    // //
    setState(() {
      _controller.play();
    });
    //
    super.initState();
  }

  @override
  void dispose() {
    if (_controller.value.isPlaying) _controller.pause();
    _controller.dispose();
    //
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          },
          child: Container(
            // padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  // ClosedCaption(text: _controller.value.caption.text),
                  // _ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
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
}
