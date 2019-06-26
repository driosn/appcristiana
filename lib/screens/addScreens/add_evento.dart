
import 'package:app_cristiana/screens/addScreens/TextField/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';

import 'package:app_cristiana/models/event_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddEvento extends StatefulWidget {
 
  final MyEvent event;
  
  AddEvento(this.event);

  @override
  _AddEventoState createState() => _AddEventoState();
}

File image;
String filename;

final eventReference = FirebaseDatabase.instance.reference().child('event');

class _AddEventoState extends State<AddEvento> {
  
  List<MyEvent> eventos;
  
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  TextEditingController _informationController;
  TextEditingController _dateController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = new TextEditingController(text: widget.event.titleEvent);
    _descriptionController = new TextEditingController(text: widget.event.description);
    _informationController = new TextEditingController(text: widget.event.information);
    _dateController = new TextEditingController(text: widget.event.date);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Añadir un Evento'),
        backgroundColor: Colors.grey,
      ),
      body: Container(
        height: 570.0,
        padding: const EdgeInsets.all(20.0),
            child: Card(
              child: Center(
                child: ListView(
                 children:<Widget>[ 
                  Column(
                  children: <Widget>[
                    TextFieldForAdd(_titleController, Icons.title, 'Titulo del Evento'),
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
                    TextFieldForAdd(_descriptionController, Icons.description, 'Descripción'),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Divider(),
                    TextFieldForAdd(_informationController, Icons.perm_device_information, 'Información'),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Divider(),
                    TextFieldForAdd(_dateController, Icons.date_range, 'Fecha'),
                    Padding(padding: EdgeInsets.only(top: 8.0)),
                    Divider(),
                    FlatButton(onPressed: (){
                        eventReference.push().set({
                          'titleEvent' : _titleController.text,
                          'urlImage' : uploadImage(),
                          'description' : _descriptionController.text,
                          'information' : _informationController.text,
                          'date' : _dateController.text
                        }).then((_){
                          Navigator.pop(context);
                        });
                    })
                  ],
                ),
                 ]
                ),
              ),
            ),
          ),
    );
  }

  Future _getImage() async {
    var selectedImage = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = selectedImage;
      filename = basename(image.path);
    });
  }

  Widget imageArea() {
    return Image.file(
      image,
      width: 100.0,
      height: 100.0,
    );
  }

  Future<String> uploadImage() async {
    StorageReference ref = FirebaseStorage.instance.ref().child(filename);
    StorageUploadTask uploadTask = ref.putFile(image);

    var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    var url = downUrl.toString();

    return url;
  }
}


//Container(
        // height: 570.0,
        // padding: const EdgeInsets.all(20.0),
            // child: Card(
              // child: Center(
                              // child: Column(
                  // children: <Widget>[
                    // TextFieldForAdd(_titleController, Icons.title, 'Titulo del Evento'),
                    // Padding(padding: EdgeInsets.only(top: 8.0)),
                    // Divider(),
                    // Container(
                      // width: 100.0,
                      // height: 100.0,
                      // child: Center( child: image==null? Text('Seleccione una Imagen') : imageArea())
                    // ),
                    // Divider(height: 10.0),
                    // RaisedButton(
                      // onPressed: _getImage,
                      // textColor: Colors.white,
                      // color: Colors.black,
                    // ),
                    // Padding(padding: EdgeInsets.only(top: 8.0)),
                    // Divider(),
                    // TextFieldForAdd(_descriptionController, Icons.description, 'Descripción'),
                    // Padding(padding: EdgeInsets.only(top: 8.0)),
                    // Divider(),
                    // TextFieldForAdd(_informationController, Icons.perm_device_information, 'Información'),
                    // Padding(padding: EdgeInsets.only(top: 8.0)),
                    // Divider(),
                    // TextFieldForAdd(_dateController, Icons.date_range, 'Fecha')
                  // ],
                // ),
              // ),
            // ),
          // ),