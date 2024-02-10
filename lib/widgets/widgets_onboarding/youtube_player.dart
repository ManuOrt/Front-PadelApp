import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoYoutubePlayerWidget extends StatefulWidget {
  const VideoYoutubePlayerWidget({Key? key, required this.videoId})
      : super(key: key);
  final String videoId;

  @override
  State<VideoYoutubePlayerWidget> createState() =>
      _VideoYoutubePlayerWidgetState();
}

class _VideoYoutubePlayerWidgetState extends State<VideoYoutubePlayerWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(_onPlayerStateChanged);
  }

  void _onPlayerStateChanged() {
    if (_controller.value.playerState == PlayerState.playing) {}
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}