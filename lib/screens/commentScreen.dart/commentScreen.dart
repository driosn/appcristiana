import 'dart:async';

import 'package:app_cristiana/models/comment_model.dart';
import 'package:app_cristiana/screens/auth/userdetails.dart';
import 'package:app_cristiana/screens/commentScreen.dart/widgets/commentItem.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'addcomment.dart';

class CommentScreen extends StatefulWidget {
  
  UserDetails details;
  String _blogTitle;
  int _quantityComments;

  CommentScreen(this.details, this._blogTitle, this._quantityComments);

  @override
  CommentScreenState createState() => CommentScreenState();
}

final commentReference = FirebaseDatabase.instance.reference().child('comment');

class CommentScreenState extends State<CommentScreen> {

  List<Comment> comments;
  StreamSubscription<Event> _onCommentAddedSubscription;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    comments = new List();
    _onCommentAddedSubscription = commentReference.onChildAdded.listen(_onCommentAdded);

  }

  @override
  Widget build(BuildContext context) {
    
    final addComentButton = MaterialButton(
      color: Colors.blue,
      child: Center(
        child: Text('Añadir Comentario', style: TextStyle( color: Colors.white , fontSize: 10.0),),
      ), onPressed: () => _createNewComment(context),
    );
    
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
              child: Stack(
          children: <Widget>[
            ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    comments[position].titleBlogComment == widget._blogTitle ? 
                    CommentItem(
                      comments[position]
                    ) : SizedBox(),
                    comments[position].titleBlogComment == widget._blogTitle ?
                    SizedBox(height: 10.0,) : SizedBox(),
                    position == comments.length-1 ? SizedBox(height: 500.0) : SizedBox()
                  ],
                );
              },
            ),
          Positioned(
            bottom: 0.0,
            child: addComentButton,
          )
          ],
        ),
      )
    );
  }

  void _onCommentAdded(Event event) {
    setState(() {
      comments.add(new Comment.fromSnapShot(event.snapshot));
    });
  }

  void _createNewComment(BuildContext context) async {
    await Navigator.push(context,
      MaterialPageRoute(builder: (context) => AddComment(new Comment(null, widget.details.userName, '', widget._blogTitle), widget.details))
    );
  }

  void _deleteBlog(BuildContext context, Comment comment, int position) async {
    await commentReference.child(comment.id).remove().then((_) {
      setState(() {
        comments.removeAt(position);
      });
    });
  }

}