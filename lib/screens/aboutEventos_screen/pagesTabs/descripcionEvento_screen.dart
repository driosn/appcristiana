import 'package:flutter/material.dart';

class DescripcionEvento extends StatelessWidget {

  final String _imageEvent;
  final String _titleEvent;
  final String _descriptionEvent;

  DescripcionEvento(this._imageEvent, this._titleEvent, this._descriptionEvent);

  @override
  Widget build(BuildContext context) {
    
    final imageEvent = Container(
      child: Image.network(
        _imageEvent
      ),
    );

    final titleEvent = Text(
     _titleEvent,
      style: TextStyle(
        color: Colors.black,
        fontSize: 32.0,
        fontWeight: FontWeight.bold
      ),
    );

    final descriptionEvent = Text(
      _descriptionEvent,
      style: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: 16.0
      ),
    );

    return Padding(
      padding: EdgeInsets.all(30.0),
      child: ListView(
        children: <Widget>[
          titleEvent,
          SizedBox(height: 30.0),
          imageEvent,      
          SizedBox(height: 30.0),
          descriptionEvent
        ],
      ),
    ); 
  }
}