
import 'package:app_cristiana/screens/addScreens/TextField/textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:intl/intl.dart';

import 'package:app_cristiana/models/event_model.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddEvento extends StatefulWidget {
 
  final MyEvent event;
  
  AddEvento(this.event);

  @override
  _AddEventoState createState() => _AddEventoState();
}

final eventReference = FirebaseDatabase.instance.reference().child('event');

class _AddEventoState extends State<AddEvento> {

  File image;
  String imageName;
  String linkImage;
  DateTime selected;
  String date;

  List<MyEvent> eventos;
  
  TextEditingController _titleController;
  TextEditingController _descriptionController;
  TextEditingController _informationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController = new TextEditingController(text: widget.event.titleEvent);
    _descriptionController = new TextEditingController(text: widget.event.description);
    _informationController = new TextEditingController(text: widget.event.information);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Añadir un Evento'),
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
                      // TextFieldForAdd(_dateController, Icons.date_range, 'Fecha'),
                      // Padding(padding: EdgeInsets.only(top: 8.0)),
                      // Divider(),
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 3.0,
                            style: BorderStyle.solid
                          )
                        ),
                         child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.calendar_today, color: Colors.grey),
                              SizedBox(width: 20.0),
                              selected == null?
                                Text(
                                  'Elija la fecha del evento',
                                  style: TextStyle(
                                   color: Colors.grey,
                                   fontSize: 17.0
                                  ),
                                ):
                                Text(
                                    DateFormat('dd-MMMM.yyyy').format(selected),
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 17.0
                                    )
                                )
                            ],
                          ),
                        ),
                        onTap: () => _showDateTimePicker(),
                      ),
                      Padding(padding: EdgeInsets.only(top: 8.0)),
                      Divider(),
                      FlatButton(onPressed: () async {
                        
                        if(image != null){
                          StorageReference ref = FirebaseStorage.instance.ref().child(basename(image.path));
                          StorageUploadTask uploadTask = ref.putFile(image);

                          var downurl = await (await uploadTask.onComplete).ref.getDownloadURL();

                          linkImage = downurl.toString();  
                          print("Download Url: $linkImage");
                          print('''
                          
                    
                          ''');
                        }
                          //var myUrl = uploadImage();
                          eventReference.push().set({
                            'titleEvent' : _titleController.text,
                            'urlImage' : linkImage != null ? linkImage : "https://semantic-ui.com/images/wireframe/image.png",
                            'description' : _descriptionController.text,
                            'information' : _informationController.text,
                            'date' : date
                          }).then((_){
                            Navigator.pop(context);
                          });
                      },
                        child: Text('Añadir Evento', style: TextStyle(color: Colors.white),),
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

  _showDateTimePicker() async {
    selected = await showDatePicker(
     context: this.context,
     initialDate: new DateTime.now(),
     firstDate: new DateTime(1960),
     lastDate: new DateTime(2050)
    );
    setState(() {
      date = "${selected.day}/${selected.month}/${selected.year}";
    });
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