import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import 'package:union_project/iPhone6781.dart';

void main() {
  runApp(MaterialApp(home: PlayPauseAnimation()));
}

class PlayPauseAnimation extends StatefulWidget {
  const PlayPauseAnimation({Key? key}) : super(key: key);

  @override
  _PlayPauseAnimationState createState() => _PlayPauseAnimationState();
}

class _PlayPauseAnimationState extends State<PlayPauseAnimation> {
  // Controller for playback
  late RiveAnimationController _controller;

  // Toggles between play and pause animation states
  // void _togglePlay() =>
  //     setState(() => _controller.isActive = !_controller.isActive);

  /// Tracks if the animation is playing by whether controller is running
  bool get isPlaying => _controller.isActive;

  @override
  void initState() {
    super.initState();
    _controller = SimpleAnimation('idle');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: RiveAnimation.asset('assets/unio.riv')),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //ここに押したら反応するコードを書く
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => iPhone6781(), // NextPage classに移動
            ),
          );
          print(result);
        },
        tooltip: isPlaying ? 'Pause' : 'Play',
      ),
    );
  }
}
