import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';


class AboutBlogScreen extends StatefulWidget {
  
  final String _blogTitle;
  final String _blogImage;
  final String _blogVideo;
  final String _blogDescription;
  

  AboutBlogScreen(this._blogTitle, this._blogImage, this._blogVideo, this._blogDescription);

  @override
  _AboutBlogScreenState createState() => _AboutBlogScreenState();
}

class _AboutBlogScreenState extends State<AboutBlogScreen> {

  ChewieController _chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget._blogTitle);
    if(widget._blogVideo == null) print('NULOOOOO');
    print(widget._blogVideo);
    print(widget._blogImage);
    if(widget._blogVideo != null){
      _chewieController = ChewieController(
        videoPlayerController: VideoPlayerController.network(
          widget._blogVideo
        ),
        aspectRatio: 16 / 9, 
        autoInitialize: true,

        errorBuilder: (context, errorMessage) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(5.0),
                child: Text(
                "No existe video relacionado a este blog", 
                style: TextStyle(color: Colors.white),
              ),
            ),
          );
        }
      );
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0) 
                ),
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0, top: 30.0),
                child: blogInformation(widget._blogTitle, widget._blogImage, widget._blogDescription),
              ),
              Positioned(
                left: 15.0,
                top: 15.0,
                child: arrowAppbar(context),
              )
              ],
            )
              ),
          ),
    );
  }

  Widget blogInformation(String blogTitle, String blogScreen, String blogContent) {

    final title = Text(
      blogTitle,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24.0
      ),
    );

    final blogImage = Container(
      child: Image.network(blogScreen),
    );

    final blogVideo = (widget._blogVideo != null) ?
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget> [
            SizedBox(height: 10.0),
            Text('Video', style: TextStyle(fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Chewie(
              controller: _chewieController,
            ),
         ]
      )
      :
      Container();


    final content = Text(
      blogContent,
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 16.0
      ),
    );

    return ListView(
      children: <Widget>[
        title,
        SizedBox(height: 20.0),
        blogImage,
        (widget._blogVideo != null)? blogVideo : SizedBox(),
        SizedBox(height: 20.0),
        content
      ],
    );
  }

  Widget arrowAppbar(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Icon(
        Icons.arrow_back,
        color: Colors.black,  
        size: 32.0,
      ),
    );
  }
}
