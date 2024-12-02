import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lesson1/Secondpage.dart';
import 'package:lesson1/main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  runApp(const MyApp());
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _State();
}

class _State extends State<Homepage> {
  AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio() async {
    await _audioPlayer.play(AssetSource("music.mp3"));
    _audioPlayer.setVolume(10);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://live.staticflickr.com/65535/17123251389_80282733ce_z.jpg"),
                  fit: BoxFit.cover)),
          child: Center(
            child: InkWell(
              onTap: () {
                _playAudio();
                Navigator.pushReplacement(
                    context, CupertinoPageRoute(builder: (context) => Secondpage(),));
              },
              child: Container(
                height: 80,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(25),

                ),
                child: Center(
                    child: Text(
                  "Claim Major",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ));
  }
}
