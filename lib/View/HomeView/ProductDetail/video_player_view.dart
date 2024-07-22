import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayer extends StatefulWidget {

  final String id;

  const VideoPlayer({
    super.key,

    required this.id
  });
  // YouTube Video Full URL : https://www.youtube.com/watch?v=egMWlD3fLJ8
  @override
  _VideoPlayerState createState() => _VideoPlayerState();

  }
  class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;
  bool isFullScreen = true;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(

      initialVideoId: widget.id,

      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
          hideThumbnail: true
      ),
    );
    _controller.addListener(() {
      if (_controller.value.isFullScreen != isFullScreen) {
        setState(() {
          isFullScreen = _controller.value.isFullScreen;
        });
      }
    });
  }
  void dispose() {
    // This pauses video while navigating to next page.
    super.dispose();
      _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        onEnterFullScreen: () {
      print('YOUTUBE_PLAYER: ON_ENTER_CALLED');
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
        SystemUiOverlay.top,
      ]);
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,

      ]);

      setState(() {
        isFullScreen = true;
      });
    },
    onExitFullScreen: () {
    print('YOUTUBE_PLAYER: ON_EXIT_CALLED');
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
    ]);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
    ]);
    },



       /// onExitFullScreen: () {
        // WidgetsFlutterBinding.ensureInitialized();

         /// SystemChrome.setPreferredOrientations(DeviceOrientation.values);
     /*

         },
         */
        player: YoutubePlayer(

          controller: _controller,
          liveUIColor: Colors.amber,
          showVideoProgressIndicator: true,

        ),
        builder: (context, player) =>
            Column (
            children: [
                Stack(
                  children: [
                    player,
                     Positioned(
                          left: 20,
                           bottom: 64,

                         child: Text("hello"))
                  ],
                )

            ],
          ),
        );
    //);
  }
}
