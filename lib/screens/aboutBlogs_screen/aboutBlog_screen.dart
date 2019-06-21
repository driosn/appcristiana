import 'package:flutter/material.dart';

class AboutBlogScreen extends StatelessWidget {
  
  final String _blogTitle;
  final String _blogImage;
  final String _blogDescription;

  AboutBlogScreen(this._blogTitle, this._blogImage, this._blogDescription);

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
                child: blogInformation(_blogTitle, _blogImage, _blogDescription),
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
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(blogScreen)
        )
      ),
    );

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
