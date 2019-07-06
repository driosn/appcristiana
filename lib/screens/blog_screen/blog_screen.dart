import 'dart:async';

import 'package:app_cristiana/models/blog_model.dart';
import 'package:app_cristiana/screens/auth/loginpage.dart';
import 'package:app_cristiana/screens/auth/userdetails.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:app_cristiana/screens/homepage/home_page.dart';
import 'package:app_cristiana/screens/eventos_screen/widgets/card_item.dart';
import 'package:app_cristiana/screens/aboutBlogs_screen/aboutBlog_screen.dart';
import 'package:app_cristiana/screens/addScreens/add_blog.dart';

import 'package:firebase_database/firebase_database.dart';

class BlogScreen extends StatefulWidget {
  
  UserDetails details;

  BlogScreen(this.details);
  
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
    setState(() {
      
    });
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
        title: Text('Blogs'),
        backgroundColor: Colors.grey,
      ),
      floatingActionButton: widget.details.userName == 'ubbadmin@admin.com' ? FloatingActionButton(
        onPressed: () => _createNewBlog(context),
        backgroundColor: Colors.grey,
        child: Icon(Icons.add),
      ) : null,
      drawer: Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Expanded(child: SizedBox()),
                    widget.details.userName == null ? Text('${widget.details.userEmail}') : Text('${widget.details.userName}'),
                    SizedBox(height: 10.0),
                    CircleAvatar(
                      backgroundImage: widget.details.photoUser == null ? AssetImage('assets/images/smile.png') : NetworkImage('${widget.details.photoUser}'),
                      radius: 30.0,
                    ),
                    Expanded(child: SizedBox())
                  ],
                )
              ),
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            ListTile(
              title: Text('Inicio'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.of(context);
              },
            ),
            ListTile(
              title: Text('Cerrar Sesion'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                _signOut();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  ModalRoute.withName('/'),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Center(
                  child: ListView.builder(
                    itemCount: blogs.length,
                    itemBuilder: (context, position) {
                      return Column(
                        children: <Widget>[
                          Stack(
                            children: <Widget>[ 
                              CardItem('${blogs[position].urlImage}', '${blogs[position].titleBlog}', '${blogs[position].autor}', AboutBlogScreen('${blogs[position].titleBlog}', '${blogs[position].urlImage}', '${blogs[position].urlVideo}', '${blogs[position].contentBlog}', widget.details)),
                              Positioned(
                                left: 15.0,
                                top: 10.0,                 
                                child: widget.details.userName == 'ubbadmin@admin.com' ?
                                  InkWell(
                                    child: Icon(
                                              Icons.delete,
                                              size: 40.0,
                                              color: Colors.black,
                                    ),
                                    onTap: () =>  _deleteBlog(context, blogs[position], position),
                                   ) : SizedBox(),
                              )
                            ],
                          ),
                          Divider(height: 10.0)
                        ],
                      );
                    }
          ),
        ),
      ),
    );
  }

  void _signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }

  void _onBlogAdded(Event event) {
    setState(() {
      blogs.add(new Blog.fromSnapShot(event.snapshot));
    });
  }

  void _createNewBlog(BuildContext context) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => AddBlog(Blog(null, '', '', '', '', '')))
    );
  }

  void _deleteBlog(BuildContext context, Blog blog, int position) async {
    await blogReference.child(blog.id).remove().then((_) {
      setState(() {
        blogs.removeAt(position);
      });
    });
  }

}