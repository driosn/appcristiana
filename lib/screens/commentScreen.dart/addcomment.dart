import 'package:app_cristiana/models/comment_model.dart';
import 'package:app_cristiana/screens/addScreens/TextField/textfield.dart';
import 'package:app_cristiana/screens/auth/userdetails.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class AddComment extends StatefulWidget {

  final Comment comment;
  UserDetails details;

  AddComment(this.comment, this.details);

  @override
  _AddCommentState createState() => _AddCommentState();
}

final commentReference = FirebaseDatabase.instance.reference().child('comment');

class _AddCommentState extends State<AddComment> {
  
  TextEditingController _commentController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _commentController = new TextEditingController(text: widget.comment.finalComment);
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Añadir una Blog'),
        backgroundColor: Colors.grey,
      ),
      body: ListView(
              children:<Widget>[
              Column(
                children: <Widget>[
                  TextFieldForAdd(_commentController, Icons.comment, 'Escriba su comentario'),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                  FlatButton(
                    child: Text('Añadir Comentario'),
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {

                      commentReference.push().set({
                        'userComment' : widget.details.userName.toString(),
                        'finalComment' : _commentController.text,
                        'titleBlogComment' : widget.comment.titleBlogComment
                      }).then((_){
                        Navigator.pop(context);
                      }); 
                    },
                  )
                ],
              )
              ]
        )
   );              
  }
}