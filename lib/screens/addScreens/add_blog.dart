
import 'package:app_cristiana/models/blog_model.dart';
import 'package:app_cristiana/models/iglesia_model.dart';
import 'package:app_cristiana/screens/addScreens/TextField/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

import 'package:app_cristiana/models/event_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddBlog extends StatefulWidget {
 
  final Blog blog;

  AddBlog(this.blog);

  @override
  _AddBlogState createState() => _AddBlogState();
}

final blogReference = FirebaseDatabase.instance.reference().child('blog');

class _AddBlogState extends State<AddBlog> {

  File image;
  String imageName;
  String linkImage;

  List<MyEvent> eventos;
  
  TextEditingController _titleController;
  TextEditingController _contentController;
  TextEditingController _autorController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = new TextEditingController(text: widget.blog.titleBlog);
    _contentController = new TextEditingController(text: widget.blog.contentBlog);
    _autorController = new TextEditingController(text: widget.blog.autor);
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
                 Container(
          height: 570.0,
          padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: ListView(
                   children:<Widget>[ 
                    Column(
                    children: <Widget>[
                      TextFieldForAdd(_titleController, Icons.title, 'Titulo del Blog'),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      Container(
                        width: 100.0,
                        height: 100.0,
                        child: Center( child: image==null? Text('Seleccione una Imagen') : imageArea())
                      ),
                      Divider(height: 10.0),
                      RaisedButton(
                        child: Text('Seleccionar Imagen'),
                        onPressed: _getImage,
                        textColor: Colors.white,
                        color: Colors.black,
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      TextFieldForAdd(_contentController, Icons.content_copy, 'Contenido del Blog'),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      TextFieldForAdd(_autorController, Icons.person, 'Autor'),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      FlatButton(onPressed: () async {
                          StorageReference ref = FirebaseStorage.instance.ref().child(basename(image.path));
                          StorageUploadTask uploadTask = ref.putFile(image);
        
                          var downurl = await (await uploadTask.onComplete).ref.getDownloadURL();

                          linkImage = downurl.toString();  
                          print("Download Url: $linkImage");
                          print('''
                          
                    
                          ''');
                          //var myUrl = uploadImage();
                          blogReference.push().set({
                            'titleBlog' : _titleController.text,
                            'urlImage' : linkImage,
                            'urlVideo' : null,
                            'content' : _contentController.text,
                            'autor' : _autorController.text,
                          }).then((_){
                            Navigator.pop(context);
                          });
                      },
                        child: Text('Añadir Blog', style: TextStyle(color: Colors.white),),
                        color: Colors.blueAccent,
                      ),
                      SizedBox(height: 400.0)
                    ],
                  ),
                   ]
                  ),
                ),
              ),
            ]
      ),
    );
  }

  Future _getImage() async {
    var selectedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
    });
  }

  Widget imageArea() {
    return Image.file(
      image,
      width: 100.0,
      height: 100.0,
    );
  }

}
