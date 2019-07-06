import 'package:app_cristiana/models/comment_model.dart';
import 'package:flutter/material.dart';

class CommentItem extends StatefulWidget {

  Comment comment;

  CommentItem(this.comment);

  @override
  _CommentItemState createState() => _CommentItemState();
}



class _CommentItemState extends State<CommentItem> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[ Container(
        width: double.infinity,
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2.0,
            color: Colors.grey
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
             Text( widget.comment.userComment , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
             Text( widget.comment.finalComment )
           ]
          ),
      ),
    ]
    );
  }
}