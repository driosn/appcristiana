
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

class AddIglesia extends StatefulWidget {
 
  final Iglesia iglesia;

  AddIglesia(this.iglesia);

  @override
  _AddIglesiaState createState() => _AddIglesiaState();
}

final iglesiaReference = FirebaseDatabase.instance.reference().child('iglesia');

class _AddIglesiaState extends State<AddIglesia> {

  File image;
  String imageName;
  String linkImage;
  DateTime selected;

  List<MyEvent> eventos;
  
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  TextEditingController _horariosController;
  TextEditingController _zonaController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = new TextEditingController(text: widget.iglesia.titleIglesia);
    _descriptionController = new TextEditingController(text: widget.iglesia.description);
    _horariosController = new TextEditingController(text: widget.iglesia.horarios);
    _zonaController = new TextEditingController(text: widget.iglesia.zona);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Añadir una Iglesia'),
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
                      TextFieldForAdd(_titleController, Icons.title, 'Titulo de la Iglesia'),
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
                      TextFieldForAdd(_horariosController, Icons.perm_device_information, 'Horarios'),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      TextFieldForAdd(_zonaController, Icons.date_range, 'Zona'),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      FlatButton(onPressed: () async {
                          StorageReference ref = FirebaseStorage.instance.ref().child('myimage');
                          StorageUploadTask uploadTask = ref.putFile(image);

                          var downurl = await (await uploadTask.onComplete).ref.getDownloadURL();

                          linkImage = downurl.toString();  
                          print("Download Url: $linkImage");
                          print('''
                          
                    
                          ''');
                          //var myUrl = uploadImage();
                          iglesiaReference.push().set({
                            'titleIglesia' : _titleController.text,
                            'urlImage' : linkImage,
                            'description' : _descriptionController.text,
                            'horarios' : _horariosController.text,
                            'zona' : _zonaController.text
                          }).then((_){
                            Navigator.pop(context);
                          });
                      },
                        child: Text('Añadir Iglesia', style: TextStyle(color: Colors.white),),
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
