import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayer/audioplayer.dart';

class RadioScreen extends StatefulWidget {
  @override
  _RadioScreenState createState() => new _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {

  String url = "http://38.107.243.219:9006/;";

  final String radioImageLocation = "assets/images/cruzsur.png";

  final String warning = '''Para usar esta radio se necesitan Datos Móviles
  
El servicio de radio usará aproximadamente 1.0mb por minuto de reproducción''';
  
  AudioPlayer audioPlugin = new AudioPlayer();

  bool playing = false;

  @override
  Widget build(BuildContext context) {

    final radioTitle = Text(
      "Radio Cruz Del Sur",
      style: TextStyle(
        fontSize: 32.0,
        color: Colors.black,
        fontWeight: FontWeight.bold
      ),
    ); 

    final radioImage = Container(
      width: double.infinity,
      child: Image(
        image: AssetImage("assets/images/cruzsur.png"),
      )
    );

    final radioWarning = Text(
      warning,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.grey,
        fontWeight: FontWeight.normal
      ),
    );

    return Scaffold(
        appBar: new AppBar(
          title: const Text('Radio'),
          backgroundColor: Colors.grey,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: () {
            setState(() {
              if(audioPlugin.state == AudioPlayerState.PLAYING){
                audioPlugin.pause();
                playing = false;
              } else {
                audioPlugin.play(url);
                playing = true;
              }
            });
          },
          child: playing? new Icon(Icons.pause) : new Icon(Icons.play_arrow),
        ),
        body: Padding(
           padding: EdgeInsets.symmetric(horizontal: 30.0), 
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 radioTitle,
                 Divider(height: 20.0),
                 radioImage,
                 Divider(height: 20.0),
                 radioWarning
                ],
            ),
          ),
        ),
    );
  }
}


// FlatButton(
                // child: Icon(Icons.play_circle_filled),
                // onPressed: () => FlutterRadio.play(url: url),
              // ),
              // FlatButton(
                // child: Icon(Icons.pause_circle_filled),
                // onPressed: () => FlutterRadio.stop(),
              // )


            
          // if(_isPlaying()){
              // setState(() {
                // playing = false;
                // FlutterRadio.stop();W
              // });
            // } else {
              // setState(() {
                // playing = true;
                // FlutterRadio.play(url: url);
              // });
            // }