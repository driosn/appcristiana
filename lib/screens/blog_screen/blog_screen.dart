import 'dart:async';

import 'package:app_cristiana/models/blog_model.dart';
import 'package:flutter/material.dart';

import 'package:app_cristiana/screens/homepage/home_page.dart';
import 'package:app_cristiana/screens/eventos_screen/widgets/card_item.dart';
import 'package:app_cristiana/screens/aboutBlogs_screen/aboutBlog_screen.dart';
import 'package:app_cristiana/screens/addScreens/add_blog.dart';

import 'package:firebase_database/firebase_database.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

final blogReference = FirebaseDatabase.instance.reference().child('blog');

class _BlogScreenState extends State<BlogScreen> {
  
  List<Blog> blogs;
  StreamSubscription<Event> _onBlogAddedSubscription;
 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogs = new List();
    _onBlogAddedSubscription = blogReference.onChildAdded.listen(_onBlogAdded);
  }
 
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _onBlogAddedSubscription.cancel();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eventos'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createNewBlog(context),
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ),
      drawer: HomePage.createDrawer(context),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Center(
                  child: ListView.builder(
                    itemCount: blogs.length,
                    itemBuilder: (context, position) {
                      return Column(
                        children: <Widget>[
                          CardItem('${blogs[position].urlImage}', '${eventos[position].titleEvent}', '${eventos[position].date}', AboutEventos('${eventos[position].titleEvent}', '${eventos[position].urlImage}', '${eventos[position].description}', '${eventos[position].information}')),
                          Divider(height: 10.0)
                        ],
                      );
                    }
          ),
        ),
      ),
    );
  }

  void _onBlogAdded(Event event) {
    setState(() {
      blogs.add(new Blog.fromSnapShot(event.snapshot));
    });
  }

  void _createNewBlog(BuildContext context) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddBlog(Blog(null, '', '', '')))
    );
  }

}